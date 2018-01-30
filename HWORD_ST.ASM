; Converts a byte to a string
;       Pass: ax = word to convert
;             si = string  
;---------------------------------
HWord_Str:
                push ax                         ; save registers
                push bx
                push cx
                push dx
                push si
                push di
                mov cx,ax                       ; save a copy in cx
                xchg ah,al                      ; swap bytes
                call HByte_Str                  ; convert
                add si,2                        ; make si point to next char
                mov ax,cx                       ; reload ax
                call HByte_Str                  ; comvert
                pop di                          ; restore registers
                pop si
                pop dx
                pop cx
                pop bx
                pop ax
                ret
