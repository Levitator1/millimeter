#pragma once

#include <util/atomic.h>
#include "../util/cplusplus.hpp"
#include "../util/util.hpp"
#include "../util/meta.hpp"
#include "../util/ref.hpp"

namespace levitator{
namespace avr{

inline void memory_fence(){
    //This what the AVR libraries use as a memory fence
    __asm__ volatile ("" ::: "memory");
}

//Assumes it's being used in a non-ISR context and interrupts should always
//come on on exit
struct atomic_guard{
    atomic_guard();
    ~atomic_guard();
};

//Same as atomic_guard, but restores the interrupt status on exit
class atomic_guard_restore{
    bool m_was_on;
public:
    atomic_guard_restore();
    ~atomic_guard_restore();
};

struct atomic_guard_tag{
    using type = atomic_guard;
};

struct atomic_guard_restore_tag{
    using type = atomic_guard_restore;
};

namespace impl {
    
    /*
    template<typename T>
    struct accessor_base{
        using dest_type = T;
        using value_type = typename util::decay<T>::type;        
    };
    
    template<typename T>
    struct simple_accessor:public accessor_base<T>{
        using value_type = typename accessor_base<T>::value_type;
        using dest_type = typename accessor_base<T>::dest_type;
        static inline value_type get(const dest_type &v){
            return v;
        }
        
        static inline void set(dest_type &dest, const value_type &v){
            dest = v;
        }        
    };
               
    template<typename T, class Guard = atomic_guard>
    struct no_interrupt_accessor : public accessor_base<T>{
        using value_type = typename accessor_base<T>::value_type;
        using dest_type = typename accessor_base<T>::dest_type;
        using guard_type = Guard;
                
        static inline value_type get(const dest_type &obj){
            value_type result;

            {
                guard_type atomic_guard;
                result = obj;
            }
            return result;
        }
        
        static inline void set( dest_type &obj, const value_type &v ){            
            guard_type atomic_guard;
            obj = v;    
        }        
    };
     //template<typename T, class Guard>
    //using atomic_ref_impl_type = typename util::conditional< (sizeof( typename util::decay<T>::type ) > 1), impl::no_interrupt_accessor<T, Guard>, impl::simple_accessor<T> >::type;
         
    template<typename T, class Guard>
    using atomic_ref_accessor_type = typename util::conditional< util::is_among<typename util::decay<T>::type, char, unsigned char, uint8_t>::value, simple_accessor<T>, no_interrupt_accessor<T, Guard>>::type;
    
    template<typename T, class Guard>
    using atomic_ref_impl_type = atomic_ref_impl<T, atomic_ref_accessor_type<T,Guard>>;
    */        
    
    template<typename T, class Guard>
    class atomic_ref_impl{
        T &m_obj;

    public:    
        using dest_type = T;
        using value_type = typename cpp::decay<T>::type;        
        using guard_type = Guard;

        atomic_ref_impl( dest_type &obj ):
            m_obj(obj){}

        inline const value_type get() const{
            guard_type guard;
            return m_obj;
        }
        
        inline value_type get(){
            guard_type guard;
            return m_obj;
        }

        inline void set(const value_type &v){
            guard_type guard;
            m_obj = v;
        }

        inline operator value_type() const{
            return get();
        }

        inline atomic_ref_impl &operator=( const value_type &v){
            set(v);
        }
        
        inline atomic_ref_impl &operator|=( const value_type &v ){
            guard_type guard;
            m_obj |= v;
            return *this;
        }
        
        inline atomic_ref_impl &operator&=( const value_type &v ){
            guard_type guard;
            m_obj &= v;
            return *this;
        }        
    };        
    
    template<typename T, class Guard>
    using atomic_guard_type = typename cpp::conditional< 
        meta::is_among<typename cpp::decay<T>::type, char, unsigned char, uint8_t, int8_t>::value, util::null_type, Guard>::type;
    
    template<typename T, class Guard>
    using atomic_ref_impl_type = impl::atomic_ref_impl<T, impl::atomic_guard_type<T, Guard>>;
    
}

/*
//We assume that chars and single-byte integers are inherently atomic, and other stuff needs interrupts turned off
//The guard parameter is ignored if interrupts are not shut off
template<typename T, class Guard = atomic_guard_restore>
class atomic_ref:public impl::atomic_ref_impl_type<T, Guard>{
public:
    using impl::atomic_ref_impl_type<T, Guard>::atomic_ref_impl_type;
};
*/

template<typename T, class Guard = atomic_guard_restore>
class atomic_ref:public impl::atomic_ref_impl_type<T, Guard>{
    using impl_type = impl::atomic_ref_impl_type<T, Guard>;
public:
    using impl_type::impl_type;
    using value_type = typename impl_type::value_type;
    
    atomic_ref &operator=( const value_type &v ){
        this->set(v);
        return *this;
    }
    
};

template<typename T, class guard_tag>
atomic_ref<T, typename guard_tag::type> make_atomic(T &v, const guard_tag &){
    return {v};
}

}
}
