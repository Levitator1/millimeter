#pragma once
// Reimplementation of some basic algorithms since C++ Standard Library is 
// absent for Arduino

namespace levitator {
namespace algo {

//Sort of like strlen, but for any type
namespace impl{
    
    template<typename T>
    struct arraylen_traits{
        static constexpr T term = T{0};
    };
    
    template<typename T, T Term>
    size_t arraylen_impl(const T *array){
        auto p = array;
        while(*p != Term){
            ++p;
        }
        return p - array;
    }    
    
    template<>
    struct arraylen_traits<unsigned char>{
        static constexpr unsigned char term = '\0';
    };
    
    template<>
    struct arraylen_traits<signed char>{
        static constexpr signed char term = '\0';
    };
    
    template<typename P>
    struct arraylen_traits<P *>{
        static constexpr P *term = nullptr;
    };    
}

template<typename T, T Term = impl::arraylen_traits<T>::term>
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
