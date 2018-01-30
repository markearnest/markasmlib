; Find a sub-string in a string
;       Pass: si = sub-string
;             di = string  
;       Return: al = position of sub-string (0 if not found)
;-----------------------------------------------------------
Find_str:
                jmp Find_Str2
Start_Pos       db 0        
Found_Flag      db 0                
Find_Str2:      push bx                         ; save registers
                push cx
                push dx
                push si
                push di
                xor ax,ax                       ; wipe out ax
                xor bp,bp
                xor bx,bx                       ; wipe out bx
Find_Str_Loop:  mov dl, [di+bx]                 ; load string
                cmp [si+bp]b, dl                ; compare bytes
                je Found_one                    ; jump if equal
                cmp [di+bx]b, 00                ; is it the end of the string
                je Found_String                 ; if so, exit
                cmp [si+bp]b, 0                 ; end of string
                je Found_String                 ; if so, exit
                mov Found_Flag, 0               ; reset flag
                mov Start_Pos, 0                ; reset starting pos
                xor bp,bp                       ; clear any sub-string offset
                inc bx                          ; next place in string
                jmp Find_Str_Loop               ; loop

Found_one:      inc bx
                cmp Found_Flag, 0               ; is this the first match?
                if e mov Start_Pos, bx          ; if so, save starting place
                mov Found_Flag, 1               ; set flag 
                cmp [si+bp]b, 00                ; last byte?
                je Found_String                 ; is so, exit
                inc bp                          ; next sub-str pos
                inc bx                          ; next str pos
                jmp Find_Str_Loop               ; loop

Found_String:   mov al, Start_Pos               ; return information
                pop di
                pop si
                pop dx
                pop cx
                pop bx
                ret
