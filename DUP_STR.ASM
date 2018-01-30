; forms a string by duplicating a character
;       Pass: di = offset of string 
;             al = character to duplicate  
;             cx = number of times  
;------------------------------------------
dup_str:
                push di                         ; save registers
Dup_str2:       mov [di], al                    ; move value into string
                inc di                          ; next string pos
                loop dup_str2                   ; loop in cx > 0
                mov [di]b, 00                   ; end string
                pop di                          ; retrive registers
                ret

