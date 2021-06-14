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
            
    static inline constexpr const value_type &get(){
        return value;
    }        
    
    inline constexpr operator const value_type &() const{
        return get();
    }   
};


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
