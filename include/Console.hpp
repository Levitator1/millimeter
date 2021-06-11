#pragma once

#include <stdarg.h>
#include <stdio.h>
#include "types.hpp"
#include "util/util.hpp"
#include "util/String.hpp"
#include "avr/file.hpp"

namespace levitator{
namespace consolens{

class ControlState{

public:
    enum Status {
        empty,
        pending,
        complete,
        cancel
    };

private:
    Status m_status = empty;
    String m_buf;    
    
    void parse_chx(); //Parse characters following the escape code
    void parse_left_bracket_code(); //Parse a code of the form: ESC [ ...    

public:    
    Status status() const;
    const String &buffer() const;
    bool parse(char ch);
    bool parse(int ch);
    String do_cancel();
};

class Console {
public:
    using file_type = avr::FILE_EX; //Must use FILE_EX to poll for input availability

    file_type *m_in, *m_out;
    bool m_echo;    
    int m_last_in = -1, m_current_in = -1;
    String m_linebuf, m_control_buf;
    unsigned int m_linepos = 0;
    ControlState m_control;
    
    void character_in(int ch);
    bool handle_left_bracket_code(const String &ctrl);
    bool handle_control_sequence(const String &ctrl);

public:    
    Console( file_type *in=nullptr, file_type *out=nullptr, bool echo = true );    

    file_type *stream_in();
    void stream_in( file_type * );
    file_type *stream_out();
    void stream_out(file_type * );        
    size_t write(uint8_t);
    int available();
    int read();        
    String read_line(bool *avail = nullptr);
    
    //stdio primitives for convenience and because it puts obnoxious warning pragmas in one place
    //They have a prefix because some of these symbols are, archaically enough, preprocessor macros
    int cprintf(const char *format, ...);
    int cputs(const char *str);
    int cputc( int ch );
    int cgetc();
};
 
extern Console console;

}
}