; Clear entire screen
;       Pass: nothing
;---------------------------
Clear_Screen:
                push ax                         ; save registers
                push bx
                push cx
                push dx
                xor al,al                       ; entire window
                xor cx,cx                       ; upper left corner
                mov dh,24                       ; bottom line
                mov dl,79                       ; right line
                mov bh,Color_Attr               ; load attr
                mov ah,6                        ; scroll up
                int 10h                         ; call video
                pop dx                          ; restore registers
                pop cx 
                pop bx
                pop ax
                ret
