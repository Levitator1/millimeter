#include <limits.h>
#include "include/Console.hpp"

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
    m_buf = "";
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
        m_buf += ch;
        parse_chx();        
    }
    
    return m_status != empty;
}

Console::Console( HardwareSerial *serport, bool echo ):
    m_echo(echo){    
    port(serport);
    
    setTimeout(ULONG_MAX);
}

void Console::port( HardwareSerial *serport ){
    m_port = serport;
    if(m_port){
         //Initialize serial and wait for port to open:
         m_port->begin(9600);
         while (!*m_port) {
           ; // wait for serial port to connect. Needed for Leonardo only
         }
    }
}

size_t Console::write(uint8_t ch){
    if(m_port)
        return m_port->write(ch);
    else
        return 0;
}

int Console::available(){
    if(m_port)
        return m_port->available();
    else
        return 0;
}

int Console::read(){
    return m_port->read();
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
            print( buf ); //echo back the code so that the cursor will move            
        }
        else //yes -- NOP, because we would go off the end
            return true;
        break;

    case 'D': //left arrow
        if(m_linepos >= 1){
            --m_linepos;
            print(buf);
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
            print( m_control.buffer() );
            //print( "BLAH2?");
            return;
            break;

        case ControlState::complete:            
            handle_control_sequence(m_control.buffer());
            return;
            break;
    }        
    
    switch(ch){
        
        //backspace
        case '\b':
            m_linebuf = m_linebuf.substring(0, m_linebuf.length()-1);
            
            //backspace is already echoing back, so space over the deleted character
            //and backspace again to push the cursor one net character left
            print(" \b");            
            break;       
            
        default:
            //buf += (char)ch;
            m_linebuf = m_linebuf.substring(0, m_linepos) + (char)ch + m_linebuf.substring(m_linepos+1);
            m_linepos+=1;
            if(m_echo)
                m_port->print((char)ch);
            break;
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
            avail = false;
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

        console.print("\r\n");

        if(avail)
            *avail = true;

        return m_linebuf;        
    }
    if(avail)
        *avail = false;
    return m_linebuf;    
}

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