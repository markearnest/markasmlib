; Returns the length of a string
;       Pass: si = offset of string
;       Return: cx = Length of string
;-------------------------------------
Length_Str:
                push si                         ; save original address 
                push si
LS_Label:       cmp b[si], 00                   ; is current byte 0?
                je Str_L_Done                   ; yes? leave
                inc si                          ; increase address
                jmp LS_Label                    ; repeat loop
Str_L_Done:     pop cx                          ; retrive address
                sub si, cx                      ; get length
                mov cx, si
                pop si
                ret
