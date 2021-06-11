#pragma once

/*
 *
 * Approximations and reimplementations of standard C++ stuff which
 * is otherwise unavailable at least under avr-specific gcc
 *
 */
#include <stddef.h>
#include <stdlib.h>
#undef abs
#undef max
#undef min

//Global operators new and delete

inline void *operator new( size_t sz ){
    return ::malloc(sz);
}

inline void *operator new[](size_t sz){
    return operator new(sz);
}

inline void operator delete(void *p){
    ::free(p);
}

inline void operator delete(void *p, size_t){
    return operator delete(p);
}

namespace levitator{
namespace cpp{

template<typename T>
T max(const T &x, const T &y){
    return x >= y ? x : y;
}

template<typename T>
T min(const T &x, const T &y){
    return x <= y ? x : y;
}

//Generalized and not optimized abs()
template<typename T>
T abs(T x){
    constexpr T minus_one = --T(0);
    return x < 0 ? x * minus_one : x;
}


template<typename T>
struct remove_reference{
    using type = T;
};

template<typename T>
struct remove_reference<volatile T &>{
    using type = volatile T;
};

template<typename T>
struct remove_reference<const T &>{
    using type = const T;
};

template<typename T>
struct remove_reference<const volatile T &>{
    using type = const volatile T;
};

//
// std::forward() implementation borrowed from the GNU standard library
// since the standard C+++ library is missing under AVR GCC
//
template<typename _Tp>
constexpr _Tp&&
forward(typename remove_reference<_Tp>::type& __t) noexcept
{ return static_cast<_Tp&&>(__t); }

template<typename _Tp>
constexpr _Tp&&
forward(typename remove_reference<_Tp>::type&& __t) noexcept
{
    //Omitted -JAB
    // static_assert(!std::is_lvalue_reference<_Tp>::value, "template argument"
    //               " substituting _Tp is an lvalue reference type");
  return static_cast<_Tp&&>(__t);
}

template<typename _Tp>
constexpr typename remove_reference<_Tp>::type&&
move(_Tp&& __t) noexcept
{ return static_cast<typename remove_reference<_Tp>::type&&>(__t); }
    
template<typename T, T v>
struct integral_constant{
    using type = T;
    static constexpr T value = v;
};

template<typename T, T v>
using ic = integral_constant<T, v>;

using false_type = ic<bool, false>;
using true_type = ic<bool, true>;

template<bool v, typename T, typename U>
struct conditional{
    using type = T;
};

template<typename T, typename U>
struct conditional<false, T, U>{
    using type = U;
};

template<typename T>
struct is_array:public false_type{
};

template<typename T, size_t sz>
struct is_array<T[sz]>:public true_type{
};

template<typename T>
struct remove_extent{
    using type = T;
};

template<typename T, size_t sz>
struct remove_extent<T[sz]>{
    using type = T;
};

template<typename F>
struct is_function : public false_type{
};

template< typename R, typename... Args >
struct is_function< R (Args...) > : public true_type{
};

template<typename T>
struct remove_const{
    using type = T;
};

template<typename T>
struct remove_const<const T>{
    using type = T;
};

template<typename T>
struct remove_volatile{
    using type = T;
};

template<typename T>
struct remove_volatile<volatile T>{
    using type = T;
};

template<typename T>
struct remove_cv{
    using type = typename remove_const<typename remove_volatile<T>::type>::type;
};

template<typename T>
struct add_pointer{
    using type = T *;
};

template< class T >
struct decay {
private:
    using U = typename remove_reference<T>::type;

public:
    using type = typename conditional<is_array<U>::value,
        typename add_pointer<typename remove_extent<U>::type>::type,
        typename conditional<is_function<U>::value,
            U *,
            typename remove_cv<U>::type
        >::type
    >::type;
};

template<typename T, typename U>
struct is_same:public false_type{};

template<typename T>
struct is_same<T, T>:public true_type{};
    
template<typename... Args>
using void_t = void;

// Don't have declval in AVR gcc. However, this hack should accomplish the same thing
// and might even be compliant C++
template<typename T>
T *declptr(){
    return nullptr;
}


}
}

//shorthand way to obtain the return type of a member of a class, where the member can be any function call
#define MEMBER_RETURN(Class, Member) decltype( levitator::cpp::declptr<Class>()->Member )

