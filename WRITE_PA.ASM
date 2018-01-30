Write_Pattern:
                push ax                         ; save registers
                push cx
                push dx
                push si
                pushf
                cld                             ; direction flag >
                mov si,dx                       ; move string to si
Pattern_Loop:
                lodsb                           ; read data
                or al,al                        ; is it 0?
                jz Done_Pattern                 ; exit
                mov dl,al                       ; load char
                lodsb                           ; read data
                mov cl,al                       ; move count to al
                xor ch,ch                       ; wipe ch
                lodsb                           ; read data
                mov dh,al                       ; load direction
                call Repeat_Char                ; write chars
                jmp Pattern_Loop
Done_Pattern:
                popf                            ; restore registers
                pop si
                pop dx
                pop cx
                pop ax
                ret

