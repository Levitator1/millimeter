#pragma once

#include <stdint.h>
#include "algo.hpp"
#include "smart_ptr.hpp"

namespace levitator{
namespace util{

namespace impl{
    
    //Doesn't contain the buffer pointer because it might need to be handled
    //seperately depending on COW status
    template<typename T>
    struct String_state{
        bool immutable_data;
        size_t length;        
    };
}
    
//TODO: Fancy optimizations like COW, especially where immutable data could be detected
template<typename T = char>
class String{
public:
    using char_type = T;
    using pointer_type = T *;
    using const_pointer_type = const T *;
    using reference_type = T &;
    using const_reference_type = const T &;
    
private:
    impl::String_state<T> m_state;
    const_pointer_type m_buf;
            
protected:     
    static inline T *alloc(size_t n){
        return new T[n+1]; //+1 for trailing null
    }
    
    inline void freebuf(){
        if(!immutable_data())
            delete m_buf;
    }
    
    static inline T *cp(const String &rhs){
        return cp(rhs.m_buf, rhs.length());
    }
    
    //Copies p to a newly allocated array of newlength+1 size, and assigns
    //the null at newlength (not length). So, if you are using this to append strings,
    //you still need to append the second substring
    static T *cp(const_pointer_type p, size_t length, size_t newlength){
        auto newp = alloc(newlength);
        algo::copy(p, p + length, newp);
        newp[newlength] = algo::nullval<T>::value();
        return newp;
    }
    
    static T *cp(const_pointer_type p, size_t length){
        return cp(p, length, length);
    }
    
    inline bool immutable_data() const{
        return m_state.immutable_data;
    }
            
protected:
    struct adopt_tag{}; //Means to adopt a provided buffer without copying
    String(const_pointer_type p, size_t len, bool immutable, adopt_tag):
        m_state{immutable, len},
        m_buf(p){        
    }
    
    //Mysteriously fails to link, so we make it non-constexpr
    static char_type empty_string[1];
        
public:            
    String():
        String(empty_string, 0, true, adopt_tag{}){            
    }
    
    void init(const_pointer_type p, size_t len){
        m_state.length = len;
        if(m_state.length == 0){
            m_buf = empty_string;
            m_state.immutable_data = true;
        }
        else{
            m_state.immutable_data = false;
            m_buf = cp(p, m_state.length);
        }
    }
    
    void init(const_pointer_type p){
        init(p, algo::arraylen(p));
    }
    
    String(const_pointer_type p){
        init(p);
    }
    
    String(const_pointer_type p, size_t len){
        init(p, len);
    }
    
    String(const String &rhs):
        m_state(rhs.m_state),        
        m_buf( immutable_data() ? rhs.m_buf : cp(rhs) ){}
        
    String(String &&rhs):
        m_state(rhs.m_state),
        m_buf(rhs.m_buf){
        rhs.m_buf = nullptr;
    }
    
    inline ~String(){        
        freebuf();
    }
    
    inline const_pointer_type c_str() const{
        return m_buf;
    }
    
    inline size_t length() const{
        return m_state.length;
    }
    
    inline size_t size() const{
        return length();
    }
    
    inline const_reference_type operator[](size_t pos) const{
        return m_buf[pos];
    }        
    
    inline String substr(size_t start, size_t count) const{
        return { m_buf + start, count };
    }
    
    inline String substr(size_t start) const{
        return { m_buf + start, length() - start };
    }
    
    inline String &operator=(String &&rhs){
        if( this == &rhs )
            return *this;
        
        freebuf();
        m_state = rhs.m_state;
        m_buf = rhs.m_buf;
        rhs.m_buf = nullptr;
        return *this;
    }
    
    inline String operator+( const String &rhs ){
        if(rhs.length() == 0)
            return *this;
        
        auto newlen = length() + rhs.length();
        auto newbuf = cp(m_buf, length(), newlen);
        algo::copy(rhs.m_buf, rhs.m_buf + rhs.length(), newbuf + length());
        return String{newbuf, newlen, false, adopt_tag{}};
    }
    
    inline String operator+( const char_type *p ){
        String tmp = { p, algo::arraylen(p), true, adopt_tag{} }; //Temporary no-copy String
        return operator+( tmp ); 
    }
    
    inline String operator+( char_type ch ){
        char_type buf[2] = {ch, algo::nullval<char_type>::value()};
        return operator+( buf );
    }
    
};

template<typename T>
typename String<T>::char_type String<T>::empty_string[1] = { algo::nullval<typename String<T>::char_type>::value() };


}
}