; Puts cursor on screen
;       Pass: nothing
;----------------------
Show_Cursor:
                push ax                         ; save registers
                push bx
                push cx
                push dx
                mov ah,1
                mov ch,6
                mov cl,7
                int 10h
                pop dx                          ; restore registers
                pop cx
                pop bx
                pop ax
                ret
