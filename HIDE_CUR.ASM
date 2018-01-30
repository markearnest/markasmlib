; Removes cursor from screen
;       Pass: nothing
;---------------------------
Hide_Cursor:
                push ax                         ; save registers
                push bx
                push cx
                push dx
                mov ah,1
                mov ch,0fh
                mov cl,0
                int 10h
                pop dx                          ; restore registers
                pop cx
                pop bx
                pop ax
                ret
