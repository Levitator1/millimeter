#pragma once

#define IS_ARDUINO_PRO_MINI defined( ARDUINO_PRO_MINI3_3V ) || defined( ARDUINO_PRO_MINI5V )

#if IS_ARDUINO_PRO_MINI
#   include "arduino_pro_mini/BoardConfig.hpp"
#endif

