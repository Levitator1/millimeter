#include "types.hpp"
#include "Config.hpp"

namespace levitator{
namespace ardmeter{
    
struct Time{

    //Convert CPU cycles to milliseconds
    //Aside from speed, this is inline so that it can pick up a preceding
    //Config inclusion
    inline static real cycles2s(time_type t){
        return (real)t / Config::system_clock;
    }
    
    inline static real cycles2ms(time_type t){
        return (real)t * 1000 / Config::system_clock;
    }
    
    //Convert a period in cycles to Hz
    inline static real cycles2Hz(time_type t){
        return (real)Config::system_clock / t;
    }
    
};

}
}