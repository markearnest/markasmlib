; Move cursor
;       Pass: dh = Row(Y)
;             dl = Column(X)
;----------------------------
GoTo_XY:
                push ax                         ; save registers
                push bx                         
                mov bh,0                        ; page 0
                mov ah,2                        ; set cursor pos
                int 10h                         ; call video

                mov al,dh                       ; get row
                mov bl,80                       ; multiply by 80
                mul bl                          ; ax = row * 80
                add al,dl                       ; add column                       
                adc ah,0                        ; ax = row * 80 + column
                shl ax,1                        ; convert to a byte offset
                mov Screen_ptr,ax               ; save cursor offset
                mov Screen_X,dl                 ; save cursor position         
                mov Screen_Y,dh                 
                pop bx                          ; restore registers
                pop ax
                ret
