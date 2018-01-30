; initalize video memory
;       Pass: nothing
;       Return: nothing
;-------------------------
Vid_Ini:
                jmp offset start

Screen_Seg      dw 0B800h
Screen_ptr      dw 0
Screen_X        db 0
Screen_Y        db 0
Color_Attr      db 7

start:          push ax                         ; save registers
                push bx
                push cx
                push dx
                mov bx,0B800h                   ; set for color
                int 11h                         ; get equipment list
                and al,30h                      ; keep display type
                cmp al,30h                      ; is it mono?
                jne Set_Base                    ; no? use b800
                mov bx,0B000h                   ; yes? use b000
Set_Base:
                mov Screen_Seg,bx               ; save screen segment
                call update_virtual_cursor      ; set current cursor location
                pop dx                          ; restore registers 
                pop cx
                pop bx                          
                pop ax
                ret

