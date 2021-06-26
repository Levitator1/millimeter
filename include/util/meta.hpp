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
    
template<typename TypeList1, typename TypeList2>
struct append_type_lists;

template< typename... Types1, template<typename...> class List1, typename... Types2, template<typename...> class List2 >
struct append_type_lists< List1<Types1...>, List2<Types2...> >{
    using type = List1<Types1..., Types2...>;
};

namespace impl{
    
    template<typename T, int N, typename... Types>
    struct fill_type_list_impl{
        using type = typename fill_type_list_impl<T, N-1, Types..., T>::type;
    };
    
    template<typename T, typename... Types>
    struct fill_type_list_impl<T, 0, Types...>{
        using type = types< Types... >;
    };
}

//Fill types<> with N instances of type T, good for populating parameter lists
template<typename T, int N>
struct fill_type_list{
    using type = typename impl::fill_type_list_impl<T, N>::type;
};

template<typename T, int N, class TypeList>
struct type_list_append_T_x_N{
    using type = typename append_type_lists< TypeList, typename fill_type_list<T, N>::type >::type;
};

template<typename TypeList>
struct pop_types_head;

template<typename Head, typename... T>
struct pop_types_head< types<Head, T...> >{
    using head_type = Head;
    using result_type = types<T...>;
};

template<>
struct pop_types_head< types<> >{    
    using result_type = types<>;
};

namespace impl{

    template<class ListL, class ListR, int Remain>
    struct split_type_list_impl;

    template<typename... LeftTypes, template<typename...> class ListL, typename... RightTypes, template<typename...> class ListR, int Remain >
    struct split_type_list_impl<ListL<LeftTypes...>, ListR<RightTypes...>, Remain >{    
        using pop_type = pop_types_head< types<RightTypes...> >;
        using result = typename split_type_list_impl< ListL<LeftTypes..., typename pop_type::head_type>, typename pop_type::result_type, Remain-1  >::result;
    };

    template<typename... LeftTypes, template<typename...> class ListL, typename... RightTypes, template<typename...> class ListR>
    struct split_type_list_impl<ListL<LeftTypes...>, ListR<RightTypes...>, 0 >{
        struct result{
            using left_list = ListL<LeftTypes...>;
            using right_list = ListR< RightTypes... >;
        };
    };
}

//Split a list at index I so that the left result is [I0,I) and the right result is [I, In)
template<typename TypeList, int I>
using split_type_list = typename impl::split_type_list_impl<types<>, TypeList, I>::result;


//Return a type list containing the last N elements
template<typename TypeList, int N>
using last_N_types = typename split_type_list<TypeList, TypeList::size - N>::right_list;

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
    static constexpr size_t size = sizeof...(V);
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
    
    template<typename T, T I, T End, T... Values>
    struct integer_sequence_impl{
        using type = typename integer_sequence_impl<T, I+1, End, I, Values...>::type;
    };
    
    template<typename T, T End, T... Values>
    struct integer_sequence_impl<T, End, End, Values...>{
        using type = values<T, Values...>;
    };
}

template<typename T, T Begin, T End>
struct integer_sequence:public impl::integer_sequence_impl<T, Begin, End>{
    static constexpr T begin = Begin;
    static constexpr T end = End;    
};

}
}

