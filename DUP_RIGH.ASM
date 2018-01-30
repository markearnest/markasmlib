; Copy a section from the right of the string
;       Pass: si = source
;             cx = number  
;             di = destination          
Dup_Right:
                push ax                         ; save registers
                push di
                push si
                push cx
                add si, cx
Right_Loop:     mov al, [si]b
                cmp al, 00
                je done_Right
                mov [di]b, al
                inc si
                inc di
                jmp Right_Loop
Done_Right:     mov [di] b, 00
                pop cx                          ; restore registers
                pop si                          
                pop di
                pop ax
                ret

