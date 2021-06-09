#pragma once
// Reimplementation of some basic algorithms since C++ Standard Library is 
// absent for Arduino

namspace levitator {
namespace algo {

//Copy left-to-right, keeping in mind for overlapping ranges
template<typename ItI, typename ItO>
void copy(ItI begin, ItI end, ItO out){

    while(begin != end)
        *(out++) = *(begin++);    
}

template<typename ItI, typename ItO>
void copy_backward(ItI begin, ItI end, ItO out){

    while(begin != end)
        *(--out) = *(--end);
}

}
}
