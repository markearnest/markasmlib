; Returns mouse coordinates
;       Pass: nothing
;       Return: dl = horizontal pos
;               dh = vertical pos
;----------------------------------
Get_mouse_loc:
                push ax                         ; save ax
                push cx
                push bx
                mov ax,3                        ; get mouse position
                int 33h                         ; call mouse
                shr cx,1                        ; divide by 8 to get chr pos
                shr cx,1
                shr cx,1
                shr dx,1
                shr dx,1
                shr dx,1
                mov dh,cl
                pop bx
                pop cx
                pop ax                          ; restore ax
                ret

