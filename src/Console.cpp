#include <limits.h>
#include "Console.hpp"
#include "types.hpp"

using namespace levitator;
using namespace levitator::consolens;

Console levitator::consolens::console = {};

ControlState::Status ControlState::status() const{
    return m_status;
}

const String &ControlState::buffer() const{
    return m_buf;
}

bool ControlState::parse(int ch){
    return parse((char)ch);
}

void ControlState::parse_left_bracket_code(){
    if(m_buf.length() < 3)
        return;
    
    switch( m_buf[2] ){
        
        //Right arrow
        case 'C':                                
        case 'D':
            m_status = complete;
            break;
        
        //Don't recognize any others, so just echo em back and otherwise NOP
        default:
            m_status = cancel;
            break;
    }
    
}

void ControlState::parse_chx(){
    
    switch( m_buf[1] ){
        
        case '[':
            parse_left_bracket_code();
            break;
            
        default:
            m_status = cancel;
            break;
    }    
}

String ControlState::do_cancel(){
    auto result = m_buf;
    m_buf = {""};
    m_status = empty;
    return result;
}

bool ControlState::parse(char ch){
    
    //If reading past the end of a completed control code, then reset the parser
    //state and start fresh searching for the next code
    if(m_status == complete)
        do_cancel();
    
    if(!m_buf.length()){
        if(ch == '\e'){
            m_buf = "\e";
            m_status = pending;
        }
        else
            m_status = empty;                    
    }
    else{
        m_buf = m_buf + ch;
        parse_chx();        
    }
    
    return m_status != empty;
}

Console::Console( file_type *in, file_type *out, bool echo ):    
    m_in(in),
    m_out(out),
    m_echo(echo){ 
}

size_t Console::write(uint8_t ch){
    return cputc(ch);
}

int Console::available(){
    return m_in ? m_in->available() : -1;    
}

int Console::read(){
    return cgetc();
}

/*
int Console::read(){
    if(m_port){
        auto ch = m_port->read();
        if(m_echo && ch > -1)
            m_port->write(ch);
        
        m_last_in = m_current_in;
        return m_current_in = ch;                
    }
    else
        return -1;
}
*/


bool Console::handle_control_sequence(const String &buf){
    switch( buf[1] ){
        case '[':
            return handle_left_bracket_code(buf);
            break;
            
        default:
            return false;
            break;
            //TODO: Log a warning or something?
    }
}

bool Console::handle_left_bracket_code(const String &buf){
    
    switch( buf[2] ){
    //VT102, ANSI, etc l/r arrow keys
    case 'C': //right arrow                        
        //End of line?
        if(m_linepos < m_linebuf.length()){ //no
            m_linepos++;           
            cputs( buf.c_str() ); //echo back the code so that the cursor will move
        }
        else //yes -- NOP, because we would go off the end
            return true;
        break;

    case 'D': //left arrow
        if(m_linepos >= 1){
            --m_linepos;
            cputs(buf.c_str());
        }
        return true;
        break;

    default:        
        break;
    }
    return false;
}


void Console::character_in(int ch ){
        
    m_control.parse(ch);
        
    switch(m_control.status()){

        //Control sequence parser did not grab control, so fall through
        case ControlState::empty:
            break;
        
        //Nothing to left to do if processing a control sequence
        case ControlState::pending:
            return;
            break;

        //Failed interpreting a control sequence, so echo it back and reset the control parser
        case ControlState::cancel:        
            puts( m_control.buffer().c_str());
            //print( "BLAH2?");
            return;
            break;

        case ControlState::complete:            
            handle_control_sequence(m_control.buffer());
            return;
            break;
    }        
    
    String tmp;
    switch(ch){
        
        //backspace
        case '\b':
            
            //Nothing to do if already at the start of the line
            if(m_linepos < 1)
                break;
            
            tmp = m_linebuf;
            m_linebuf = m_linebuf.substr(0, m_linepos-1) + m_linebuf.substr(m_linepos);             
            --m_linepos;
            
            //backspace is already echoing back, so space over the deleted character
            //and backspace again to push the cursor one net character left

            //Echo back the backspace to move the cursor back one
            //rewrite the end of the line and append a space to erase the previous last character on the line
            if(m_out){
                cputc('\b');
                resend_line_end();                
            }                                    
            break;       
            
        default:
            //buf += (char)ch;
            String tmp = cpp::move(m_linebuf);
            m_linebuf = tmp.substr(0, m_linepos) + (char)ch;            
            
            if(m_linepos < tmp.length())
                m_linebuf = m_linebuf + tmp.substr(m_linepos);
            
            ++m_linepos;
            
            if(m_echo && m_out){
                cputc((char)ch);
                resend_line_end();
            }
            
            break;
    }
    
}

void Console::resend_line_end(){
    if(m_out){
        String tmp = m_linebuf.substr(m_linepos);        
        cputs(tmp.c_str());
        cputc(' '); //In case the line shortened as in backspace, the extra space erases the end character from the terminal
        
        //Back up the cursor to where it started
        for(size_t i = 0; i <= tmp.length();++i){
            cputs("\e[D");
        }
    }
}

static bool is_eol(int ch){
    return ch == '\n' || ch == '\r';
}

String Console::read_line(bool *avail){
    
    auto ct = console.available();    
    if(ct > 0){
        m_linebuf = "";
        m_linepos = 0;
        m_control = {};
        auto ch = console.read();
        
        if(is_eol(ch)){
            *avail = false;
            return m_linebuf;
        }
                              
        character_in(ch);
        while(true){
            if((ch = console.read()) >= 0){                    
                if( !is_eol(ch))
                    character_in(ch);
                else
                    break;
            }                    
        }

        console.cputs("\r\n");

        if(avail)
            *avail = true;

        return m_linebuf;        
    }
    if(avail)
        *avail = false;
    return m_linebuf;    
}

/*
int Console::peek(){
    if(m_port)
        return m_port->peek();
    else
        return 0;
}

void Console::flush(){
    if(m_port)
        m_port->flush();
}

void Console::setTimeout(unsigned long to){
    Stream::setTimeout(to);
    if(m_port)
        m_port->setTimeout(to);
}
*/

Console::file_type *Console::stream_in(){
    return m_in;
}

Console::file_type *Console::stream_out(){
    return m_out;
}

struct va_guard{
    va_list &list;
    
    va_guard(va_list &vl):
        list(vl){}
    
    ~va_guard(){ va_end(list); }
};

int Console::cprintf(const char *format, ...){
    if(!m_out)
        return EOF;
    
    va_list args;
    va_start(args, format);
    va_guard guard = { args };
    return vfprintf(m_out, format, args);    
}

#   pragma GCC diagnostic push
#   pragma GCC diagnostic ignored "-Wnonnull" 
int Console::cputs(const char *str){
    return m_out ? fputs(str, m_out) : EOF;
}

int Console::cgetc(){
    return m_in ? fgetc(m_in) : -1;
}

int Console::cputc(int ch){
    return m_out ? fputc(ch, m_out) : -1;
}

#   pragma GCC diagnostic pop   