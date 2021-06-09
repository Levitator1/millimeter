#pragma once

#include <Arduino.h>
#include "util/util.hpp"
#include "LevSerial.hpp"

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

class Console : public Stream {

    bool m_echo;
    HardwareSerial *m_port = nullptr;
    int m_last_in = -1, m_current_in = -1;
    String m_linebuf, m_control_buf;
    unsigned int m_linepos = 0;
    ControlState m_control;

    void port(HardwareSerial *port);
    void character_in(int ch);
    bool handle_left_bracket_code(const String &ctrl);
    bool handle_control_sequence(const String &ctrl);

public:    
    Console( HardwareSerial *serport = nullptr, bool echo = true );    

    size_t write(uint8_t) override;
    int available() override;
    int read() override;
    int peek() override;
    void flush() override;

    void setTimeout(unsigned long timeout);

    String read_line(bool *avail = nullptr);
};

extern Console console;

}
}