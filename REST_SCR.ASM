; Restores the screen image saved in a buffer
;       Pass: DX = offset of buffer
;       Return: nothing
;-------------------------------------------
Rest_Scr:
                push ax                         ; save registers
                push es
                push di
                push si
                push cx
                pushf
                mov ax, Screen_Seg w            ; load screen segment
                mov es, ax
                mov di, 0
                mov si, dx
                mov cx, 2000
                cld
                rep movsw
                popf                            ; restore registers
                pop cx
                pop si
                pop di
                pop es
                pop ax
                ret

