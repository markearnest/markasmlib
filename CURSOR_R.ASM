; Moves cursor right one space
;       Pass: nothing
;-----------------------------
Cursor_Right:   
                inc screen_ptr w                ; move to next char. pos.           
                inc screen_ptr w
                inc screen_X b                  ; move to next column
                cmp screen_X b,79               ; make sure column <= 79
                jbe ok                          ; jump if good
                call Send_CRLF                  ; go to next line
ok:             
                ret
