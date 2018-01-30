; Updates virtual cursor position
;       Pass: nothing
;--------------------------------
Update_Virtual_Cursor:
                push ax                         ; save resisters
                push bx
                push cx
                push dx
                mov ah,3                        ; get cursor pos
                xor bh,bh                       ; on page 0
                int 10h                         ; call video
                call GoTo_XY                    ; move cursor to this pos
                pop dx                          ; restore registers
                pop cx
                pop bx 
                pop ax
                ret

