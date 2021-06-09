#pragma once
#include <stddef.h>

#define stringize(s) #s

namespace levitator {
namespace util {


template<typename T>
struct remove_reference{
    using type = T;
};

template<typename T>
struct remove_reference<T &>{
    using type = T;
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

#undef max
#undef min
#undef abs

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

namespace impl{
    
    template<typename T, typename... Types>
    struct is_among_impl;

    template<typename T, typename U, typename... Types>
    struct is_among_impl<T, U, Types...>{
        static constexpr bool value = is_among_impl<T, Types...>::value;
    };

    template<typename T, typename... Types>
    struct is_among_impl<T, T, Types...>{
        static constexpr bool value = true;
    };

    template<typename T>
    struct is_among_impl<T>{
        static constexpr bool value = false;
    };

}

//Is true if T is among Types
template<typename T, typename... Types>
struct is_among : public ic<bool, impl::is_among_impl<T, Types...>::value>{};

template<typename... Args>
using void_t = void;

//Simplest/emptiest/most-NOP type possible
struct null_type{};


/*
 * Maps any number of Tag types to corresponding Mapping definitions which are
 * optional and can be omitted. They are fulfilled by defining a specialization.
 */
/*
template<typename Tag>
struct optional_def_base{
    using tag_type = Tag;
    using missing_type = null_type;
};

template<typename Tag>
struct optional_def:public optional_def_base<Tag>{
    using type = typename optional_def_base<Tag>::missing_type;
};

#define FULFILL_OPTIONAL_DEF(Tag, Mapping) \
    namespace levitator{ namespace util{ \
        template<> \
        struct optional_def<Tag>:public optional_def_base<Tag>{ \
            using type = Mapping; \
        }; \
    }}
*/

}
}
