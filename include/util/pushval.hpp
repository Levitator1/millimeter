#pragma once

#include "cplusplus.hpp"
#include "util.hpp"

// Push a value onto the stack and restore it on destruction
namespace levitator{
namespace util{

namespace impl{
    template<typename T>
    struct pushval_traits{
        using value_type = T;
        using dest_type = T;
    };        
}
    
template<typename T>
class pushval{
public:
    using traits_type = impl::pushval_traits<  typename cpp::remove_reference<T>::type >;
    using value_type = typename traits_type::value_type;
    using dest_type = typename traits_type::dest_type;

private:
    dest_type &m_target;
    const value_type m_old;

public:
    pushval(dest_type &v):
        m_target(v),
        m_old(v){}

    pushval(dest_type &v, const value_type &newval):
        m_target(v),
        m_old(v){
        m_target = newval;
    }

    ~pushval(){
        m_target = m_old;
    }
};

template<typename T>
pushval<T> make_pushval(T &v){
    return pushval<T>{v};
}

}
}