#pragma once

namespace levitator{

//Reference wrapper
template<typename T>
class ref{
public:
    using type = T;
    using ref_type = T&;
    using const_ref_type = const ref_type;
    //using pointer_type = type *;

private:
    ref_type m_ref;

public:
    ref(type &r):
        m_ref(r){
    }

    operator ref_type(){
        return m_ref;
    }

    operator const_ref_type() const{
        return m_ref;
    }

    ref_type get(){
        return *this;
    }

    const_ref_type get() const{
        return *this;
    }

};

}

