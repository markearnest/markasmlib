; Clears screen to end of line
;       Pass: nothing
;------------------------------
Clear_To_End_Of_Line:
                push ax                         ; save registers
                push bx
                push cx
                push dx
                mov dl,Screen_X
                mov dh,Screen_Y
                mov ah,6                        ; clear to end of line
                xor al,al                       ; clear window 
                mov ch,dh                       ; all on same line
                mov cl,dl                       ; start at cursor pos
                mov dl,79                       ; stop at end of line
                mov bh,Color_Attr               ; load attr
                int 10h                         ; call video
                pop dx                          ; restore registers
                pop cx
                pop bx
                pop ax
                ret
