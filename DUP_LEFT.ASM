; Copy a section from the left of the string
;       Pass: si = source
;             cx = number  
;             di = destination          
;-------------------------------------------
Dup_Left:
                push ax                         ; save ax
                push cx
                push di
                push si
Left_Loop:      mov al, [si]b
                mov [di]b, al
                inc si
                inc di
                loop Left_Loop
                mov [di] b, 00
                pop si                          ; restore ax
                pop di
                pop cx
                pop ax
                ret
