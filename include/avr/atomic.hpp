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

//Assumes it's being used in a non-ISR or non-recursive context and interrupts should always
//come on on exit. This is good for code that is not intended to ever run in an ISR.
//It's not recursive. An inner one may override an outer one's state on exit.
struct atomic_guard{
    static constexpr bool recursive = false;
    atomic_guard();
    ~atomic_guard();
};

//Same as atomic_guard, but restores the interrupt status on exit
//This is for code which could be called from either inside or outside an ISR.
//Or where guards are nested.
//Note that the interrupt flag read/update operations need not be atomic because
//if initial value is false, it's not going to change by itself. If it's true, then it should
//be restored back to true before the current sequence of instructions is able to proceed.
//If you had an ISR return without re-enabling interrupts, it's then that you would have a problem.
class atomic_guard_restore{
    bool m_was_on;
public:
    static constexpr bool recursive = true;
    atomic_guard_restore();
    ~atomic_guard_restore();
};

namespace impl{
    template<class G, typename Foo=void>
    struct guard_traits_recursive_impl{ static constexpr bool recursive = false; };
    
    template<class G>
    struct guard_traits_recursive_impl<G, cpp::void_t<decltype(G::recursive)>>{ static constexpr bool result = G::recursive; };
    
    
    //null_type serves as a recursive guard, because it is no-op and you can nest nothing all day without ill effects
    template<>
    struct guard_traits_recursive_impl<util::null_type, void>{ static constexpr bool result = true; };
}

template<class G>
struct guard_traits{
    static constexpr bool recursive = impl::guard_traits_recursive_impl<G>::result;
};


struct atomic_guard_tag{
    using type = atomic_guard;
};

struct atomic_guard_restore_tag{
    using type = atomic_guard_restore;
};

struct address_tag{};

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
    
    public:    
        using dest_type = T;
        using dest_pointer = typename cpp::remove_reference<T>::type *;
        using value_type = typename cpp::decay<T>::type;        
        using guard_type = Guard;
        
        //When constructing a reference from an integer address, the compiler seems
        //to quietly record a reference to the 0 address somtimes, but not in all cases.
        //Probably a compiler bug? Anyway, we'll use a pointer instead of a reference.
        //T &m_obj;
        dest_pointer m_obj;

    public:
        
        auto debug_pointer(){
            return m_obj;
        }
        
        /*
        atomic_ref_impl( dest_type &obj ):
            m_obj(&obj){}       
        
        atomic_ref_impl( size_t address, address_tag ):
            m_obj( reinterpret_cast< dest_pointer >(address) ){}
         */
        
        atomic_ref_impl() = delete;
        
        atomic_ref_impl( dest_pointer obj ):
            m_obj(obj){}
                        
        inline const value_type get() const{
            guard_type guard;
            return *m_obj;
        }
        
        inline value_type get(){
            guard_type guard;
            return *m_obj;
        }

        inline void set(const value_type &v){
            guard_type guard;
            *m_obj = v;
        }

        /*
        inline operator value_type() const{
            return get();
        }
        */

        inline value_type operator&(const value_type &rhs) const{
            return get() & rhs;
        }
        
        inline value_type operator|(const value_type &rhs) const{
            return get() | rhs;
        }
        
        inline value_type operator~() const{
            return ~get();
        }
        
        inline atomic_ref_impl &operator=( const value_type &v){
            set(v);
        }
        
        inline atomic_ref_impl &operator|=( const value_type &v ){
            guard_type guard;
            *m_obj |= v;
            return *this;
        }
        
        inline atomic_ref_impl &operator&=( const value_type &v ){
            guard_type guard;
            *m_obj &= v;
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
    
    atomic_ref() = delete;
    
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
