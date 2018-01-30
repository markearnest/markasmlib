; Moves cursor down on space
;       Pass: nothing
;---------------------------
Cursor_Down:
                inc Screen_Y b                  ; move v. cursor to next line
                cmp Screen_Y b,25               ; is it on the last line?
                jbe ok2                         ; no? then leave
                dec Screen_Y b                  ; yes? then move back
ok2:                
                call update_real_cursor         ; move real cursor 
                ret
