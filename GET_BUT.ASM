; Gets button info
;       Pass: nothing
;       Return: bl = 1 left, 2 right, 3 both
;---------------------------------------------------
Get_button:
                push ax                         ; save registers
                push cx
                push dx
                mov ax,3                        ; get button
                int 33h                         ; call mouse
                pop dx                          ; restore registers
                pop cx
                pop ax
                ret
