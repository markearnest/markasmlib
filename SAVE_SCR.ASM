; Saves the current screen image to a buffer
;       Pass: DX = offset of buffer
;       Return: nothing
;-------------------------------------------
Save_Scr:
                push ax                         ; save registers
                push es
                push ds
                push di
                push si
                push cx
                pushf
                mov si, 0
                mov di, dx
                mov ax, screen_seg w
                mov ds, ax
                mov cx, 2000
                cld
                rep movsw
                popf                            ; restore registers
                pop cx
                pop si
                pop di
                pop ds
                pop es
                pop ax
                ret
