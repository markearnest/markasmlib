; Creates a file
;       Pass: DX = offset of file name
;             CX = attributes  
;       Return: AX = if BX = FFFF (error code)
;                    if BX = 0000 (file handle)
;-----------------------------------------
Make_File:
                mov ah, 3ch
                mov bx, 0000
                int 21h
                if c mov bx, ffffh
                ret
