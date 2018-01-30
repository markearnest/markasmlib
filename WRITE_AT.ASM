; Writes an attribute many times
;       Pass: cx = Repeats
;             dl = new attr  
;-------------------------------
Write_Attr:
                push ax                         ; save registers
                push cx
                push di
                push es
                mov ax,Screen_Seg               ; set es to screen segment
                mov es,ax
                mov di,Screen_Ptr               ; Character under cursor
                inc di                          ; point to attr
                mov al,dl                       ; put attr into al
Attr_Loop:      
                stosb                           ; save 1 attr
                inc di                          ; move to next attr
                inc Screen_X b                  ; move to next column
                loop Attr_Loop                  ; write # attr
                dec di                          ; point to start of next char
                mov Screen_Ptr w,di             ; remember where i am
                pop es                          ; restore registers 
                pop di
                pop cx
                pop ax
                ret

