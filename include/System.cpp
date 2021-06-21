#include "System.hpp"

using namespace levitator::avr;

bit_property<System::mcucr_type, System::pud_bit_type> System::pullup_disable_bit = {};
bit_property<System::prr_type, System::pradc_type> System::adc_power_reduction_bit = {};

