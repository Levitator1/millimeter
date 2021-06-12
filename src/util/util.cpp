#include <limits.h>
#include "util/util.hpp"

using namespace levitator::util;

unsigned long levitator::util::time_diff( unsigned long lhs, unsigned long rhs ){
    return mod_diff(lhs, rhs, ULONG_MAX);
}
