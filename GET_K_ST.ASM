; Returns if there's a key in the buffer
;       Pass: nothing
;       Return: AX = FFFF if key is waiting
;----------------------------------------
Get_Key_Stat:
                xor ax,ax                       ; clear ax
                mov ah,01                       ; get buffer status
                int 16h                         ; call bios
                jz done
                mov ax,0ffff                    ; set if true
Done:   
                ret
