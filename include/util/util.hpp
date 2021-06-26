#pragma once
#include <avr/pgmspace.h>
#include <stddef.h>
#include "cplusplus.hpp"

#define stringize(s) #s

/*
 * 
 * Various random utilities, and lots of stuff to ease the lack of or to
 * re-implement missing C++ features
 * 
 */
namespace levitator {
namespace util {

#undef max
#undef min
#undef abs

//Difference between two values of some cyclic modulus unit which is presumed to be moving forward,
//like for calculating the difference between values of a clock that overflows.
//If rhs is more than lhs, then lhs is assumed to represent a greater value in the next cycle.
//Modulus is expressed minus one so that the max range of T can be represented with T.
template<typename T>
T mod_diff(T lhs, T rhs, T modminus1){
    
    //Maybe better to use conditionals than division
    if(rhs > lhs)
        return modminus1 - rhs + lhs + 1;
    else
        return lhs - rhs;
}

extern unsigned long time_diff( unsigned long lhs, unsigned long rhs );

//Simplest/emptiest/most-NOP type possible
struct null_type{};

//Generic empty no-op function
template<typename... Args>
void null_function( Args... args ){}

//Generalization over integral_constant so that you have a type whose instances
//always map to the same statically allocated or constant value
template<typename T, T Value>
struct constant{
    using value_type = T;
    static constexpr value_type value = Value;
    
    inline value_type get() const{
        return value;
    }
    
    inline operator value_type() const{
        return get();
    }    
};

//Give this thing dynamic storage (initialized and stored per instance)
struct dynamic_storage_tag{};

//Give this this static storage (initialized once on startup to init_value, and stored globally)
template<typename T, T init_value>
struct static_const_storage_tag{};

template<typename T, typename StorageType = dynamic_storage_tag>
struct storage;

template<typename T>
struct storage<T, dynamic_storage_tag>{
    using value_type = T;
    //using value_type = typename cpp::decay<T>::type;
    
    value_type value;

    static const storage instance;

    //Maybe generate an error for initialized, for now 
    storage() = delete;
    
    inline storage(value_type v):
        value(v){}
    
    inline value_type &get(){
        return value;
    }
    
    inline const value_type &get() const{
        return value;
    }
    
    inline operator value_type &(){
        return get();
    }
    
    inline operator const value_type &(){
        return get();
    }   
};

template<typename T, typename InitType, InitType InitVal>
struct storage<T, static_const_storage_tag<InitType, InitVal>>{
    
    using value_type = T;
    using init_type = InitType;
    static constexpr init_type value = InitVal;               

    
    //storage(){
        ////static_assert( is_static_storage<storage>::value, "Default initialization is probably an error for non-static storage"  );
    //}

    //static void bullshit();
    //extern static const storage<T, static_const_storage_tag<InitType, InitVal>> instance;

    static inline constexpr value_type get(){
        return value;
    }        
    
    inline constexpr operator value_type () const{
        return get();
    } 
    
    /*
    //Calculate new static storage class
    template<typename RhsT, typename InitType2, InitType2 value2>
    inline constexpr auto bitwise_or(const storage<RhsT, static_const_storage_tag<InitType2,value2> > &){
        return storage<T, static_const_storage_tag<T, value | value2>>{};
    }

    inline constexpr auto bitwise_or(value_type v){        
        return storage<T, static_const_storage_tag<T, value | v>>{};
    } 
    */
};

//template<typename T, typename InitType, InitType InitVal>
//const storage<T, static_const_storage_tag<InitType, InitVal>> storage<T, static_const_storage_tag<InitType, InitVal>>::instance = {};


//template<typename T, typename StorageType>
//const storage<T, StorageType> storage<T, StorageType>::instance = {};

/*
template<typename T, typename InitType, InitType InitVal>
void storage<T, static_const_storage_tag<InitType, InitVal>>::bullshit(){
    storage<T, static_const_storage_tag<InitType, InitVal>> whatevs;
    util::null_function(whatevs);
}
*/

template<typename T>
struct is_static_storage : public cpp::false_type{
};

template<typename T, typename InitType, InitType InitVal>
struct is_static_storage<storage< T, static_const_storage_tag<InitType, InitVal> >> : public cpp::true_type{
};

template<typename TL, typename InitTypeL, InitTypeL InitValL, typename TR, typename InitTypeR, InitTypeR InitValR>
inline constexpr auto bitwise_or_storage( const storage<TL, static_const_storage_tag<InitTypeL, InitValL>> &lhs, const storage<TR, static_const_storage_tag<InitTypeR, InitValR>> &rhs){
    constexpr auto result = InitValL | InitValR;
    using result_type = decltype(result);
    return storage<result_type, static_const_storage_tag<result_type, result>>();
}

//Converts something to an integer value without assuming what kind of integer it represents.
namespace impl{    
    template<typename T>
    inline T integer_value_impl(const T& v){ return v; }
}

inline auto integer_value(unsigned char v){ return impl::integer_value_impl(v); }
inline auto integer_value(signed char v){ return impl::integer_value_impl(v); }
inline auto integer_value(int v){ return impl::integer_value_impl(v); }
inline auto integer_value(unsigned int v){ return impl::integer_value_impl(v); }
inline auto integer_value(long v){ return impl::integer_value_impl(v); }
inline auto integer_value(unsigned long v){ return impl::integer_value_impl(v); }
inline auto integer_value(long long v){ return impl::integer_value_impl(v); }
inline auto integer_value(unsigned long long v){ return impl::integer_value_impl(v); }

template<typename T>
using integer_typeof = decltype( integer_value( cpp::declval<T>() ) );

}
}

#define assert_string(expr, file, line) "ASSERT FAILED: " #expr ": " #file ": " #line "\n"

//Always assert, whether debugging or not.
//TODO: The message strings implicitly generated could add up to a lot of resource usage
//so, PROGMEM might help. We use __FUNCTION__ instead of __FILE__, as function names
//will tend to be shorter than full paths.
#define aassert(x) { if(!x) puts(assert_string(x, __FUNCTION__, __LINE_NUMBER__)); }

#ifndef NDEBUG
#define assert(x) aassert(x)
#else
#define assert(x)
#endif

