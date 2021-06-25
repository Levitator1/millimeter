#pragma once

//Decide what VCC voltage and system clock to assume in the code
//The 3.3V typically runs at 8MHz, while the 5V model is usually 16MHz

#define ARDUINO_PRO_MINI3_3V 1

#if defined( ARDUINO_PRO_MINI3_3V )
#   ifndef VCC
#       define VCC (3.3)
#   endif
#   ifndef F_CPU
#       define F_CPU (8 * 1000000)
#   endif
#elif defined( ARDUINO_PRO_MINI5V )
#   ifndef VCC
#       define VCC (5d)
#   endif
#   ifndef F_CPU
#       define F_CPU (16 * 1000000)
#   endif
#endif

namespace levitator{
namespace arduino{

struct Config{
    static constexpr double vcc = VCC;
    static constexpr unsigned long system_clock = F_CPU;
};    

}
}