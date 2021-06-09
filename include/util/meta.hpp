#pragma once

/*
 *
 * Meta-programming stuff, code generation, type-calculation, algorithms
 * that run at compile-time, etc.
 * 
 */

namespace levitator{
namespace meta{

// is_among<>
// Returns whether T is the same type as any member of an arbitrary list
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
struct is_among : public cpp::ic<bool, impl::is_among_impl<T, Types...>::value>{};



}
}
