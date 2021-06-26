#include "meta.hpp"

namespace levitator::util{

namespace impl{

    template<typename T, int Ordinal>
    struct tuple_storage{
        T value;
    };

    template< class TypeList, class Ordinals = typename meta::integer_sequence<int, 0, TypeList::size + 1 >::type >
    struct tuple_impl;
    
    template< typename... Types, int... Ordinals>
    struct tuple_impl< meta::types<Types...> , meta::values<int, Ordinals...>> : public tuple_storage<Types, Ordinals>... {
        using value_types = meta::types<Types...>;
        using ordinals_type = meta::values<int, Ordinals...>;

        tuple_impl(Types... v):
            tuple_storage<Types, Ordinals>(v)...
            {}

        template<int I>
        inline auto get(){
            return tuple_storage< meta::type_i<value_types, I>, I>::value;
        }

        template<int I>
        inline auto get() const{
            return tuple_storage< meta::type_i<value_types, I>, I>::value;
        }
    };
}

template<typename... Types>
struct tuple : public impl::tuple_impl<Types...>{
private:
    using base_type = impl::tuple_impl<Types...>;

public:
    using base_type::base_type;
};

}
