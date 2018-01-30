; Sends a CRLF to goto the next line
;       Pass: nothing
;-----------------------------------
Send_CRLF:
                push ax
                push dx
                mov ah,2
                mov dl,13
                int 21h
                mov dl,10
                int 21h
                call Update_Virtual_Cursor
                pop dx
                pop ax
                ret
