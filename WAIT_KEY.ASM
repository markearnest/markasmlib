; wait for a key to be pressed          
;       Pass: nothing
;       Return: AH = Scan code  
;               AL = ASCII code
;-------------------------------
Wait_Key:       call Get_Key_Stat               ; find if key
                cmp ax, 0ffff                   ; compare information
                jne Wait_Key                    ; loop if not
                call Get_Key                    ; get key
                ret
