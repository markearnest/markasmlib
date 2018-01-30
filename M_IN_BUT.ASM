; Checks if the mouse cursor is within certin boundries 
;       Pass: si = Address of block set up like this:
;               DB 'upper left row'  
;               DB 'upper left column'
;               DB 'lower right row'
;               DB 'lower right column'
;       Return: dl = 1 if in, 0 if not
;------------------------------------------------------
Mouse_In_Button:
                call Get_Mouse_Loc              ; get current location
                cmp [si], dl                    ; compare ul row
                jb Not_In                       ; leave if less
                inc si                          ; next variable
                cmp [si], dh                    ; compare ul col
                jb Not_In                       ; leave if less
                inc si                          ; next variable
                cmp [si], dl                    ; compare lr row
                ja Not_In                       ; leave if greater
                inc si                          ; next variable
                cmp [si], dh                    ; compare lr col
                ja Not_In                       ; leave if greater
                xor dx,dx                       ; clear dx
                mov dl,1                        ; return 1
                jmp MIB_Done                    ; leave
Not_In:         xor dx,dx                       ; return 0
MIB_Done:       ret        
