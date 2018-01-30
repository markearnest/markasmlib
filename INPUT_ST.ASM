; Inputs a string from the keyboard and saves it (Enter exits)
; Interperts control codes
;       Pass: DI = offset of string (ini to 200 bytes)
;             BL = number of bytes allowed
;             BH = 0 (no output), 1 (output), 2 (*)
;       Return: ASCIIZ string at DX offset
;--------------------------------------------------------------
Input_Str:
                jmp Real_Input
ICode   db 0
ISCount db 0
Addr    dw 0
Real_Input:
                push ax                         ; save registers
                push bx
                push cx
                push di
                pushf
                cld                             ; clear direction flag
                mov addr, di                    ; save address
                mov Icode, bh                   ; save output code
                mov ISCount, bl                 ; save byte count
GetS_L:         call Get_Key_Stat               ; find if key
                cmp ax, 0ffff                   ; compare information
                jne GetS_L                      ; loop if not
                call Get_Key                    ; get key
                call KHandeler                  ; process key
                cmp al, 01                      ; valid?
                je GetS_L                       ; no? continue loop
                mov byte ptr [di], al           ; move key to string
                inc di                          ; move string location
                cmp al, 00                      ; was enter pressed?
                jne GetS_L                      ; no? keep going
                popf                            ; restore registers
                pop di                           
                pop cx
                pop bx
                pop ax
                ret

; Interperates key
;       Pass: AX = Key info 
;       Return: AL = 1 if no memory change
;----------------------------------------------
KHandeler:
                push dx                         ; save dx
                cmp al, 8                       ; is key back space
                je Back_Space                   ; yes? move back
                cmp al, 13                      ; is key enter
                je KHEnter                      ; yes? stop input
                cmp al, 32                      ; is it less than 32
                jb KHBDone                      ; yes? i'm done
                mov dx,di                       ; load count
                sub dx, addr                    ; find out how many chars
                cmp ISCount, dl                 ; as opposed to amount allowed
                je KHBDone                      ; if over restart
                cmp ICode, 2                    ; secret?
                je HSecret                      ; yes? secret
                cmp ICode, 0                    ; no output?
                je KHDone                       ; yes? don't output
                mov dl,al                       ; load key
                mov dh, 00                      ; right
                call Write_Char                 ; write the character
                call update_real_cursor         ; what do you think?        
                jmp KHDone                      ; finish
Back_Space:
                cmp Addr, di                    ; are we at original addr
                je KHBDone                      ; yes? leave
                dec di                          ; back up in memory
                cmp Icode, 0                    ; are writing?
                je KHBDone                      ; no? leave
                dec Screen_X b                  ; move back on screen
                call Update_Real_Cursor         ; self explainatory
                xor dx,dx                       ; clear dx
                call Write_Char                 ; write a space
                dec Screen_X b                  ; move back again
                call Update_Real_Cursor         ; figure it out
                jmp KHBDone
KHEnter:
                mov al, 00                      ; save nul byte
                jmp KHDone                      ; leave
HSecret:                                        
                mov dl, "*"                     ; load secret character
                mov dh, 00                      ; right
                call Write_Char                 ; write it
                call Update_Real_Cursor         ; figure it out
                jmp KHDone                      ; leave
KHBDone:
                mov al,01                       ; don't write
KHDone:
                pop dx                          ; restore dx
                ret

