; Writes a string to the screen
;       Pass: ds:dx = address of string
;--------------------------------------
Write_Str:      
                push ax                         ; save registers                        
                push dx
                push si
                pushf
                cld                             ; set direction for inc
                mov si,dx                       ; place address into si
String_Loop:
                lodsb                           ; get char into al
                or al,al                        ; have I found 0 yet?
                jz End_Of_String                ; yes? then I'm done
                cmp al, 0d
                jne >s1
                lodsb
                or al,al                        ; have I found 0 yet?
                jz End_Of_String                ; yes? then I'm done
                cmp al, 0a               
                jne >s1
                call send_crlf
                jmp String_Loop
S1:             mov dl,al                       ; no? then write the char.
                call Write_Char
                jmp String_Loop
End_Of_String:
                popf                            ; restore registers
                pop si
                pop dx
                pop ax
                ret

