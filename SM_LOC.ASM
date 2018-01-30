; Sets the location of the mouse
;       Pass: dl = horizontal pos
;             dh = vertical pos
;--------------------------------
Set_mouse_loc:
                push ax                         ; save ax
                push cx
                mov ax,4                        ; set mouse
                xor cx,cx
                mov cl,dh
                xor dh,dh
                shl cx,1                        ; multiply by 8 for pixel
                shl cx,1
                shl cx,1
                shl dx,1
                shl dx,1
                shl dx,1
                int 33h                         ; call mouse
                pop cx
                pop ax                          ; restore ax
                ret
