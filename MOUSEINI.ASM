; Checks for presence of mouse 
;       Pass: nothing
;       Return: ax = 0 no mouse, >0 num of buttons
;----------------------------------
mouse_ini:     
                jmp mouse_ini2
mouse_vis       db 0
mouse_ini2:     push es                         ; save registers
                push bx
                mov ax,3533h                    ; get current int33 vector
                int 21h                         ; call dos
                mov ax,es                       ; put segment into ax
                or ax,ax                        ; anything in there?
                jz no_int_33                    ; no? then return 0
                or bx,bx                        ; anything there?
                jz no_int_33                    ; no? then return 0               
                mov ax,0                        ; reset mouse
                int 33h                         ; call mouse
                mov ax,bx                       ; but buttons in ax
                jmp done_with_33                ; exit
no_int_33:      xor ax,ax                       ; clear ax
done_with_33:   pop bx                          ; restore registers
                pop es
                ret
