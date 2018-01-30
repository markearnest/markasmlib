; Writes a character to the screen 
;       Pass: dl = character
;             dh = < ff (right), ff (down) 
;----------------------------------
Write_Char:
                push ax                         ; save registers
                push bx
                push dx
                push es
                mov ax,Screen_Seg               ; get segment for screen memory
                mov es,ax                       ; point es to screen
                mov bx,Screen_ptr               ; pointer to char. in memory 
                push dx
                mov dh,Color_Attr               ; load attr
                mov es:[bx],dx                  ; write to screen
                pop dx
                cmp dh, 0ff                     ; does it go down?
                je down                         ; yes? call down proc
                call Cursor_Right               ; move to next pos
                jmp finis                       ; leave
down:
                call Cursor_Down                ; write down
finis:                
                pop es                          ; restore registers
                pop dx
                pop bx
                pop ax
                ret

