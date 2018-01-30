; Converts a word into a string (decimal version)  
;       Pass: dx = Number
;             si = String  
;-------------------------------------------------
word_str:     
                push ax                         ;Save registers used here
                push cx   
                push dx    
                push si   
                push di
                mov ax,dx     
                mov di,10                       ;Will divide by 10 using SI
                xor cx,cx                       ;Count of digits placed on stack
non_zero:
                xor dx,dx                       ;Set upper word of N to 0
                div di                          ;Calculate N/10 and (N mod 10)
                push dx                         ;Push one digit onto the stack
                inc cx                          ;One more digit added
                or ax,ax                        ;N = 0 yet?
                jne non_zero                    ;Nope, continue
write_digit_loop:
                pop dx                          ;Get the digits in reverse order
                add dl,48
                mov b[si],dl
                inc si
                mov b[si],00
                loop write_digit_loop   
end_decimal:
                pop di
                pop si    
                pop dx    
                pop cx    
                pop ax    
                ret

