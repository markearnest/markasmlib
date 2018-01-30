; Writes a character X times
;       Pass: dl = character
;             dh = < ff (right), ff (down)
;             cx = # of times  
;----------------------------
Repeat_Char:
                push cx                         ; save cx
R_Again:
                call Write_Char                 ; write character
                loop R_Again                    ; loop
                pop cx                          ; restore cx
                ret
