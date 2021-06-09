#pragma once

#include "util/util.hpp"

namespace levitator{
namespace containers{

template<typename T>
class dynamic_buffer{
    T *m_buf;
    const size_t m_size;

public:
    using type = T;
    using pointer_type = T *;
    using const_pointer_type = const T *;

    dynamic_buffer(size_t sz):
        m_buf(new T[sz]),
        m_size(sz){
    }

    ~dynamic_buffer(){
        delete m_buf;
    }

    pointer_type buf(){
        return m_buf;
    }

    const pointer_type buf() const{
        return m_buf;
    }

    size_t size() const{
        return m_size;
    }
};

template<typename T, size_t Size>
class static_buffer{
    T m_buf[Size];    

public:
    using type = T;
    using pointer_type = T *;
    using const_pointer_type = const T *;
    
    pointer_type buf(){
        return m_buf;
    }

    const pointer_type buf() const{
        return m_buf;
    }

    constexpr size_t size() const{
        return Size;
    }
};

namespace impl{

    template<typename T, class BufferT>
    class ringbuffer_impl{
    public:
        class iterator{
            friend class ringbuffer_impl;
            ringbuffer_impl &m_buf;
            T *m_ptr;

        protected:
            iterator(ringbuffer_impl &buf, T *pos):
                m_buf(buf),
                m_ptr(pos){}

        public:
            iterator &operator++(){
                ++m_ptr;
                if(m_ptr == m_buf.array_end())
                    m_ptr = m_buf.array();

                return *this;
            }

            iterator operator+(size_t offs) const{
                auto newptr = m_ptr + offs;
                if(newptr >= array_end())
                    newptr -= array_len();
                return {m_buf, newptr};
            }           

            bool operator==( const iterator &rhs ) const{
                return m_ptr == rhs.m_ptr;
            }

            bool operator!=(const iterator &rhs) const{
                return m_ptr != rhs.m_ptr;
            }

            T &operator*(){
                return *m_ptr;
            }

            T &operator[](size_t pos){
                return *(*this + pos);
            }

        };

    private:
        size_t m_size;
        BufferT m_buffer;
        iterator m_head, m_tail;

    protected:
        inline T *array_end(){
            return array() + array_len();
        }

        inline size_t array_len() const{
            return m_buffer.size();
        }    

    public:
        using type = T;

        T *array(){
            return m_buffer.buf();
        }

        ringbuffer_impl( BufferT &&buf ):                    
            m_size(0),
            m_buffer(cpp::move(buf)), //One extra so that there is a position to represent "full"
            m_head(*this, array()),
            m_tail(*this, array()){
        }

        size_t size() const{
            return m_size;
        }

        size_t capacity() const{
            return m_buffer.size() - 1;
        }

        iterator begin(){
            return m_head;
        }

        iterator end(){
            return m_tail;
        }

        void push_back(const T &v){        
            *m_tail = v;            //update tail contents
            ++m_tail;               //and position

            if(m_tail == m_head) //if tail has wrapped to head
                ++m_head;         //buffer is full and discard one
            else
                ++m_size;       //otherwise bump size by 1
        }

        void pop_front(){
            ++m_head;
            --m_size;
        }

    };
};

template<typename T>
class dynamic_ringbuffer:public impl::ringbuffer_impl<T, dynamic_buffer<T>>{
public:
    dynamic_ringbuffer( size_t cap ):
        impl::ringbuffer_impl<T, dynamic_buffer<T>>( dynamic_buffer<T>(cap) ){
    }
};

template<typename T, size_t Cap>
class static_ringbuffer:public impl::ringbuffer_impl<T, static_buffer<T, Cap>>{
public:
    static_ringbuffer():
        impl::ringbuffer_impl<T, static_buffer<T, Cap>>( static_buffer<T, Cap>() ){
    }
};

}
}

