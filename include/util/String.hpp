#pragma once

#include <stdint.h>
#include "algo.hpp"
#include "smart_ptr.hpp"

namespace levitator{

//TODO: Fancy optimizations like COW, especially where immutable data could be detected
template<typename T = char>
class String{
    
    const size_t m_len;
    const util::unique_ptr<T> m_buf;    
    
public:
    using pointer_type = T *;
    using reference_type = T &;
    
    String(const pointer_type data):
        m_len(algo::arraylen(data)),
        m_buf(new T[m_len]){        
    }
    
    inline size_t length() const{
        return m_len;
    }
    
    inline size_t size() const{
        return length();
    }
    
    inline const reference_type operator[](size_t pos) const{
        return m_buf[pos];
    }
        
};
    
}