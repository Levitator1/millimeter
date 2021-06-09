//Find the ordinal of the next instance of end_val in a term-terminated array
template< typename T >
size_t elempos( T *array, const T &end_val, const T &term){
    size_t i;

    if(array == NULL)
        return 0;

    for(i=0;array[i]!=end_val && array[i] !=term;++i ){
    }
    return i;
}

//Find the length of an array having a specified terminator
template<typename T>
size_t ptr_array_len( T **array ){
    return elempos(array, NULL, NULL);
}

template<typename T>
struct default_deleter{
    void operator()(T *ptr){
        delete ptr;
    }
};

namespace impl{

    template<typename T, typename Del>
    struct unique_ptr_state{
        T *ptr;
        Del deleter;
    };
}

template<typename T, typename Del = default_deleter<T>>
class unique_ptr{
public:
    using pointer_type = T *;
    using value_type = T;
    using deleter_type = Del;

private:
    impl::unique_ptr_state<T, Del> m_state;

    void cleanup(){
        m_state.deleter();
    }

public:
    unique_ptr( pointer_type ptr = nullptr, const deleter_type &del = {} ):
        m_state{ ptr, del }{
    }

    ~unique_ptr(){
        cleanup();
    }

    unique_ptr( const unique_ptr & ) = delete;
    unique_ptr &operator=( const unique_ptr & ) = delete;

    unique_ptr( unique_ptr &&rhs ){
        m_state = rhs.m_state;
        rhs.m_state.ptr = nullptr;
    }

    unique_ptr &operator=( unique_ptr &&rhs ){
        if( this != &rhs ){
            cleanup();
            m_state = rhs.m_state;
            rhs.m_state.ptr = nullptr;
        }
        return *this;
    }

};
