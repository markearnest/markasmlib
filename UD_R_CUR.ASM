; Updates real cursor position
;       Pass: nothing
;-----------------------------
Update_Real_Cursor:
                push dx                         ; save register
                mov dl,Screen_X                 ; get pos. of virtual cursor 
                mov dh,Screen_Y                 
                call GoTo_XY                    ; move real cursor to this
                pop dx
                ret
