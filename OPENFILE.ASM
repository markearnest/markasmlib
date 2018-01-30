; Opens a file
;       Pass: DX = Filename
;             AL = Open mode  
;       Return: AX = if BX = FFFF (error code)
;                    if BX = 0000 (file handle)
;----------------------------------------------
Open_File:                
                mov ah, 3dh
                mov bx, 0000
                int 21h
                if c mov bx, ffffh
                ret

