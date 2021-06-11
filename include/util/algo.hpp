#pragma once
// Reimplementation of some basic algorithms since C++ Standard Library is 
// absent for Arduino

namespace levitator {
namespace algo {

//Returns a zero-like value of T. For characters and numbers, this is plain old zero,
// aka, the null carachter or C-string terminator.
//For pointers, it is nullptr
//For everything else it is T{0}, if that is defined
    
template<typename T>
struct nullval{
    using type = T;
    static inline constexpr T value(){
        return T{0};
    }
};

template<typename T>
struct nullval<T *>{
    using type = T;
    static inline constexpr T *value(){
        return nullptr;
    }
};
    
/*
template<typename T>
constexpr T nullval(){
    return T{0};
}

template<typename T>
constexpr T *nullval<T *>(){
    return nullptr;
}
*/
    
//Sort of like strlen, but for any type
namespace impl{        
    template<typename T, T Term>
    size_t arraylen_impl(const T *array){
        auto p = array;
        while(*p != Term){
            ++p;
        }
        return p - array;
    }            
}

template<typename T, T Term = nullval<T>::value()>
size_t arraylen(const T *array){
    return impl::arraylen_impl<T, Term>(array);
}

//Copy left-to-right, keeping in mind for overlapping ranges
template<typename ItI, typename ItO>
void copy(ItI begin, ItI end, ItO out){

    while(begin != end)
        *(out++) = *(begin++);    
}

template<typename ItI, typename ItO>
void copy_backward(ItI begin, ItI end, ItO out){

    while(begin != end)
        *(--out) = *(--end);
}

}
}
