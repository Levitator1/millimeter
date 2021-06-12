#pragma once
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

struct dynamic_storage_tag{};
struct static_storage_tag{};

template<typename DestType, typename ValueType,  typename StorageType = dynamic_storage_tag>
struct storage;

template<typename DestType, typename ValueType>
struct storage<DestType, ValueType, dynamic_storage_tag>{
    using dest_type = DestType;
    using value_type = ValueType;
    
    dest_type value;
    
    inline storage(const value_type &v):
        value(v){}
    
    inline storage(value_type &&v):
        value(cpp::move(v)){}
    
    inline dest_type &get(){
        return value;
    }
    
    inline const dest_type &get() const{
        return value;
    }
    
    inline operator dest_type &(){
        return get();
    }
    
    inline operator const dest_type &(){
        return get();
    }   
};

template<typename DestType, typename ValueType>
struct storage<DestType, ValueType, static_storage_tag>{
    using dest_type = DestType;
    using value_type = ValueType;
    
    static dest_type value;                
    
    inline dest_type &get(){
        return value;
    }
    
    inline const dest_type &get() const{
        return value;
    }
    
    inline operator dest_type &(){
        return get();
    }
    
    inline operator const dest_type &(){
        return get();
    }   
};

}
}
