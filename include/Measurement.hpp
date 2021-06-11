#pragma once
#include "util/util.hpp"
#include "ringbuffer.hpp"

// Algorithms for collecting and processing measurements

namespace levitator{
namespace measurement{

//An average over a sliding window of samples
//BufT must be a ringbuffer
template<typename T, class BufT>
class sliding_average{
public:
    using buffer_type = BufT;

private:
    buffer_type m_buf;
    T m_sum;

public:

    using iterator = typename BufT::iterator;

    sliding_average(buffer_type &&buf):
        m_buf( cpp::move(buf) ),
        m_sum(0){
    }

    void push_back(T v){
        if(m_buf.size() >= m_buf.capacity()){
            auto to_forget = *m_buf.begin();
            m_sum -= to_forget;
        }
        m_buf.push_back(v);
        m_sum += v;
    }

    T average() const{
        return m_sum / m_buf.size();
    }

    //Average of all values excluding the value at pos
    T average_except(iterator it){
        return (m_sum - *it) / (m_buf.size()-1);
    }

    size_t capacity() const{
        return m_buf.capacity();
    }

    iterator begin(){
        return m_buf.begin();
    }

    iterator end(){
        return m_buf.end();
    }

};

//
// Take a reading until the maximum deviation settles within a specified 
// difference from an average of the last X samples or give up after Y samples.
template<class BufT, class SampleF, typename T = typename BufT::type>
class settle{
        
public:
    using value_type = T;
    using buffer_type = BufT;
    using sample_function = SampleF;

private:
    using averager_type = sliding_average<T, BufT>;
    averager_type m_avg;
    sample_function m_sample_f;

public:
    settle(buffer_type &&buf, const sample_function &f):
        m_avg(cpp::move(buf)),
        m_sample_f(f){
    }

    T max_avg_diff(){
        T maxdiff=0, diff;

        for( auto it = m_avg.begin(); it != m_avg.end(); ++it){
            diff = cpp::abs( m_avg.average_except(it) - *it  );
            if(diff > maxdiff)
                maxdiff = diff;
        }

        return maxdiff;
    }
    
    //Returns the average reading and updates actualMaxD with the maximum absolute variation from average
    T do_settle(T maxD, size_t min_samples, size_t max_samples, T &actualMaxD){

        size_t ct = 0;
    
        //Read minimum samples
        for(size_t i=0; i < min_samples; ++i){
            m_avg.push_back( m_sample_f() );
        }
        ct = min_samples;

        auto diff = max_avg_diff();

        //Read more samples until maxD is satisfied
        while( diff > maxD && ct < max_samples){
            m_avg.push_back( m_sample_f() );
            ++ct;
        }
        actualMaxD = diff;
        return m_avg.average();
    }
};

//C++17
//template<typename T, class BufT, class SampleF> settle(BufT &&buf, const SampleF &f) -> settle<BufT, SampleF, typename BufT::type>;

template<typename BufT, typename SampleF>
settle<BufT, SampleF> make_settle( BufT &&buf, const SampleF &f){
    return { cpp::move(buf), f };
}

}
}
