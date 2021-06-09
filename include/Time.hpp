#include "types.hpp"
#include "Config.hpp"

namespace levitator{
namespace ardmeter{
    
struct Time{

    //Convert CPU cycles to milliseconds
    //Aside from speed, this is inline so that it can pick up a preceding
    //Config inclusion
    inline static real cycles2ms(time_type t){
        return (real)t / Config::system_clock;
    }
    
};

}
}