; Returns key in keyboard buffer
;       Pass: nothing
;       Return: AH = Scan code  
;               AL = ASCII code
;---------------------------------
Get_Key:
                xor ax,ax                       ; clear ax
                int 16h                         ; call bios
                ret

