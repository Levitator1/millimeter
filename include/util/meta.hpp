#pragma once

/*
 *
 * Meta-programming stuff, code generation, type-calculation, algorithms
 * that run at compile-time, etc.
 * 
 */

#include "cplusplus.hpp"

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

//A mostly empty type that serves as a reference to another type
//So that a type can be passed to a function by value, without wasting
//resources, since the type is empty
template<typename T>
struct type_ref{
    using type = T;
};

//Is true if T is among Types
template<typename T, typename... Types>
struct is_among : public cpp::ic<bool, impl::is_among_impl<T, Types...>::value>{};

//An arbitrary list of types, though it takes some effort to enumerate
template<typename... Args>
struct types{
    static constexpr int size = sizeof...(Args);
};

template<class T, size_t sz>
struct assert_size_field{
    static_assert( T::size == sz, "T::size != sz: size field does not match" );
};

namespace impl{
    
    template<int Remain, typename Head, typename... Types>
    struct type_i_impl{        
        using result = typename type_i_impl<Remain-1, Types...>::result;
    };
    
    template<typename Head, typename... Types>
    struct type_i_impl<0, Head, Types...>{
        using result = Head;
    };
    
    template<int Index, class List>
    struct type_i_impl2;
    
    template<int Index, class... Types>
    struct type_i_impl2<Index, types<Types...> >{
        using result = typename impl::type_i_impl<Index, Types...>::result;
    };    
}

//Retrieve the type from types<...> at the specified index
template<typename TypeList, int Index>
using type_i = typename impl::type_i_impl2<Index, TypeList>::result;
    

/*
template<typename TypeList, int Index>
struct type_i;

template<int Index, typename...Items>
struct type_i<types<Items...>, Index>{
    using type = typename impl::type_i_impl<Index, Items...>::result;
};
*/

//A type which represents a collection of constants
template<typename T, T... V>
struct values{
    using value_type = T;
};

namespace impl{
    
    template<typename T, int Remain, T Head, T... Values>
    struct value_i_impl{
        static constexpr T result = value_i_impl<T, Remain-1, Values...>::result;
    };
    
    template<typename T, T Head, T... Values>
    struct value_i_impl<T, 0, Head, Values...>{
        static constexpr T result = Head;
    };    
}

//Retrieve the value from values<T, T...> at the specified index
template<typename ValueList, int Index>
struct value_i;

template<typename T, int Index, T... Values>
struct value_i<values<T, Values...>, Index>{
    static constexpr T value = impl::value_i_impl<T, Index, Values...>::result;
};

template<typename F>
struct function_traits;

template<typename R, typename Class, typename... Args>
struct function_traits<R Class::*(Args...)>{
    using return_type = R;
    using class_type = Class;
    using args = types<Args...>;
};

template<typename R, typename... Args>
struct function_traits<R (Args...)>{
    using return_type = R;
    using class_type = void;
    using args = types<Args...>;
};

template<typename R, typename... Args>
struct function_traits<R (&)(Args...)>:public function_traits<R (Args...)>{
};

template<typename R, typename... Args>
struct function_traits<R (*)(Args...)>:public function_traits<R (Args...)>{
};

template<typename F>
struct return_type{
    using type = typename function_traits<F>::return_type;  
};

namespace impl{
    
    template<typename T, T I, T End, class Accum>
    struct integer_sequence_impl;
    
    template<typename T, T I, T End, class... Args>
    struct integer_sequence_impl<T, I, End, types<Args...>>{
        using type = typename integer_sequence_impl<T, I+1, End, types<Args..., cpp::ic<T, I>>>::type;
    };
    
    template<typename T, T End, class... Args>
    struct integer_sequence_impl<T, End, End, types<Args...>>{
        using type = types<Args...>;
    };
    
}

template<typename T, T Begin, T End>
struct integer_sequence:public impl::integer_sequence_impl<T, Begin, End, types<>>{
    static constexpr T begin = Begin;
    static constexpr T end = End;    
};
    
}
}

