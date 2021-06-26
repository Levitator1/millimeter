#define PASTE(x, y) x##y
#define PASTE2(x, y) PASTE(x, y)
#define STRINGIZE(x) #x
#define STRINGIZE2(x) STRINGIZE(x)
#define STRINGIZE3(x) STRINGIZE2(x)

#define MCU_SPECIFIC_HEADER(suffix) STRINGIZE2(PASTE2(__AVR_DEVICE_NAME__, _##suffix))
