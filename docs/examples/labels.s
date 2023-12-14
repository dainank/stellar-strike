; Labels In 6502 ASM
; Omitted comments mean prior example in file explains line.

;***************************************************************************
; Base
;***************************************************************************

jmp NEWCODE
 
NEWCODE:
;   ...

;***************************************************************************
; Local
;***************************************************************************

.proc    ClearMemory    ; defining local label tagged ClearMemory
lda #$00    ; 0 in A
ldy # 20    ; 20 in Y
L1:    dey  ; local label loop ONLY used within ClearMemory label and y--
sta Mem,y   ; Mem is any memory address + 19 (Y) where value A (0) is stored.
bne L1      ; if not equal to (bne) `dey` outcome
rts         ; return, exiting .proc
.endproc

;***************************************************************************
; Cheap (Local)
;***************************************************************************

ClearMemory:
    lda #$00    ; 0 in A
    ldy #$20    ; 20 in Y
@Loop:          ; cheap local label started
    dey         ; Y-- (19)
    sta Mem,y   ; store A at Mem + Y (19) address
    bne @Loop   ; check for Y == A (0)
    rts         ; return
Sub:            ; new label
    BNE @Loop   ; ERROR: @ loop is out of scope

;***************************************************************************
; Unnamed
;***************************************************************************

    lda #10 ; 10 in A
    ldx #0  ; 10 in X
    cmp #0  ; raise flag compare 0 to A (10)
    beq :++ 
:
    inx
    cpx #10
    bne :-
: