; draws a box on the screen
;       Pass: ah = top left row
;             al = top loft column  
;             bh = bottom right row             
;             bl = bottom right column  
;-------------------------------------
Draw_Box:  
                jmp offset Real_Box
Draw_Box1       db 201,1,1
                db 205
Length1         db 0,1
                db 187,1,0ff
                db 186
Width1          db 0,0ff
                db 188,1,1,0
Draw_Box2       db 201,1,0ff
                db 186
Width2          db 0,0ff
                db 200,1,1
                db 205
Length2         db 0,1,0
Real_X          db ?
Real_Y          db ?
Root_X          db ?
Root_Y          db ?
Bottom          db ?
Right           db ?
Counter         db ?
White_space     db " "                
IC              db 00, 1,00

Real_Box:
                push ax                         ; save registers
                push bx
                push cx
                push dx
                push si
                pushf
                mov Bottom,bh
                mov Right,bl
                mov Root_Y,al                   ; save starting pos        
                mov Root_X,ah
                sub bh,ah                       ; find how big box is
                sub bl,al
                mov Width1,bh                   ; put width into string
                mov Width2,bh
                mov Length1,bl                  ; put length into string
                mov Length2,bl
                mov ch,Screen_X                 ; load real pos
                mov cl,Screen_Y
                mov Real_X,ch                   ; save real pos
                mov Real_Y,cl
                mov dh,Root_X                   ; load starting pos
                mov dl,Root_Y
                call GoTo_XY                    ; goto starting place
                mov dx,offset Draw_Box1         ; load 1st string
                call Write_Pattern              ; draw string
                mov dh,Root_X                   ; load starting pos
                mov dl,Root_Y                   
                call GoTo_XY                    ; goto starting place
                mov dx,offset Draw_Box2         ; load 2nd string
                call Write_Pattern              ; draw string
                mov bh,Bottom
                inc bh                          ; next row
                inc bh
                inc al                          ; next two cols
                inc al
                mov dh,bh                       ; load and exec goto_xy        
                mov dl,al
                call GoTo_XY
                xor cx,cx                       ; wipe cx
                mov dl, 08                      ; shadow
                mov cl,Length1                  ; length of shadow
                inc cl
                inc cl
                call Write_Attr                 ; draw shadow
                
                mov dl, Right                   ; load right col
                inc dl                          ; add 2
                inc dl
                inc ah                          ; down a row
                mov dh,ah                       ; load row
                call GoTo_XY                    ; goto pos
                mov bh, Width1                  ; load width   
                inc bh                          ; add 2
                inc bh
                mov counter,bh                  ; move to counter
                xor cx,cx                       ; wipe cx
                mov cl,2                        ; 2 shadow chars
Shadow_Loop:
                push dx                         ; save location
                mov dl,08                       ; shadow
                call Write_Attr                 ; write shadow
                pop dx                          ; restore location
                dec counter                     ; subtract 1 from count
                cmp counter,0                   ; is counter 0
                je Done_Shadow                  ; yes? then i'm done
                inc dh                          ; next row
                call GoTo_XY                    ; move cursor
                jmp Shadow_Loop                 ; repeat
Done_Shadow:
                xor ax,ax                       ; clear ax
                mov al,length1                  ; Get length
                mov IC, al                      ; create string for write_pat
                mov counter, 00                 ; reset counter
                xor ax,ax                       ; wipe ax
                mov al, width1                  ; get width
                mov counter, al                 ; load count

                xor dx,dx                       ; wipe dx
                mov dh, root_X                  ; get starting row
                mov dl, root_Y                  ; get starting col
                inc dh                          ; account for borders
                inc dl
                mov al,dl                       ; save col
Another_Loop:   call GoTo_XY                    ; set location
                push dx                         ; save coordinates
                mov dx, offset white_space      ; load filler
                call Write_Pattern
                pop dx                          ; restore coordinates
                dec counter                     ; dec counter :)
                cmp counter,0                   ; is it 0 yet?
                je another_done                 ; yes? then get out
                inc dh                          ; next line
                mov dl, al                      ; restore col
                jmp another_loop                ; loop
Another_Done:
                mov dh, Real_Y                  ; restore location
                mov dl, Real_X
                call GoTo_XY
                popf
                pop si
                pop dx                          ; restore registers
                pop cx
                pop bx
                pop ax
                ret
