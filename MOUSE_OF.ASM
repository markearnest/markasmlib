; Makes the mouse invisible
;       Pass: nothing
;--------------------------
Mouse_off:
                cmp mouse_vis b,0               ; is mouse off
                je off_done                     ; yes? skip this
                mov mouse_vis b,0               ; turn off mouse flag
                push ax                         ; save ax
                mov ax,2                        ; turn off mouse
                int 33h                         ; call mouse
                pop ax                          ; restore ax
off_done:       ret

