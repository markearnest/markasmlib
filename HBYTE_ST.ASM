; Converts a byte to a string
;       Pass: al = Byte
;             si = String offset  
;-------------------------------
HByte_Str:
                jmp offset keep_going
digits          db "0123456789ABCDEF"
keep_going:     push ax                         ; save registers
                push bx
                push cx
                push dx
                push si
                push di
                mov di,ax                       ; dup byte in di
                and di,000fh                    ; knock out high bytes
                mov bx,offset digits            ; load digits
                mov ah,byte ptr [bx+di]         ; load digit into ah
                mov [si+1],ah                   ; and store digit in string
                xor ah,ah                       ; wipe ah
                mov di,ax                       ; move byte to di
                shr di,1                        ; shift high nybble to low
                shr di,1                        
                shr di,1                        
                shr di,1                        
                mov ah,byte ptr [bx+di]         ; load digit to ax
                mov [si],ah                     ; store in string
                pop di                          ; restore registers
                pop si
                pop dx
                pop cx
                pop bx
                pop ax
                ret

