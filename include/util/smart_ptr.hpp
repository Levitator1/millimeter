#pragma once

#include "cplusplus.hpp"

namespace levitator{
namespace util{

template<typename T>
class smart_ptr_base{
public:
    using value_type = T;
    using pointer_type = T *;
    using reference_type = T &;
  
private:
    pointer_type m_ptr;
    
public:
    smart_ptr_base(pointer_type ptr):
        m_ptr(ptr){}
        
    inline pointer_type get() const{
        return m_ptr;
    }
    
    inline reference_type operator[](size_t i) const{
        return get()[i];
    }
    
    inline pointer_type operator->() const{
        return get();
    }
    
    inline reference_type operator*() const{
        return *get();
    }
    
};

template<typename T>
struct default_delete{
    void operator()(const T *p){
        delete p;
    }
};

template<typename T, class Deleter = default_delete<T>>
class unique_ptr:public smart_ptr_base<T>{
    using base_type = smart_ptr_base<T>;
    
public:
    using deleter_type = Deleter;
    using pointer_type = typename base_type::pointer_type;
    
private:
    deleter_type m_deleter;
    
    inline void do_move(unique_ptr &&rhs){
        this->base_type::operator=(rhs);
        m_deleter = rhs.m_deleter;
        rhs.m_ptr = nullptr;
    }
    
public:           
    unique_ptr(pointer_type ptr = nullptr, deleter_type del = {}):
        base_type(ptr),
        m_deleter(del){}
    
    unique_ptr(const unique_ptr &) = delete;
    
    inline unique_ptr(unique_ptr &&rhs){
        do_move(rhs);
    }
    
    unique_ptr &operator=( const unique_ptr & ) = delete;
    
    inline unique_ptr &operator=( unique_ptr &&rhs ){
        if( this == &rhs )
            return;
        do_move(rhs);        
    }
    
    inline ~unique_ptr(){
        m_deleter(this->get());
    }    
};
    
}
}