; Makes the mouse visible
;       Pass: nothing
;------------------------
Mouse_on:
                cmp mouse_vis b,1               ; is mouse already on
                je on_done                      ; yes? then skip this
                mov mouse_vis b,1               ; turn on mouse flag
                push ax                         ; save ax
                mov ax,1                        ; turn on mouse
                int 33h                         ; call mouse
                pop ax                          ; restore ax
on_done:        ret
