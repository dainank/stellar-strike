; Incrementation In 6502 ASM
; Omitted comments mean prior example in file explains line.

;***************************************************************************
; Increment Zero-Page Address
;***************************************************************************

lda #$10    ; load A with $10
sta $05     ; store $05 with $10
inc $05     ; increment $05 value -> $10++ = $11

;***************************************************************************
; Increment Zero-Page Address Indexed by X or Y
;***************************************************************************

lda #$05    ; load A with $05
sta $07     ; store $07 with $05
ldx #$02    ; load X with $02
inc $05,x   ; $05 + $02 = $07 -> $05 + A = $05 + $05 = $10


