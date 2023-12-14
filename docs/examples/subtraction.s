; Subtraction In 6502 ASM
; Omitted comments mean prior example in file explains line.

;***************************************************************************
; Subtract Direct Value
;***************************************************************************

sec         ; set the carry flag
lda #$06    ; load A with $06
sbc #$05    ; subtract $05 from 'A' = $01

;***************************************************************************
; Subtract Direct Address
;***************************************************************************

lda #$02    ; load A with $02
sta $0300   ; store $0300 with $02
sec
lda #$08    ; load A with $08
sbc $0300   ; subtract $02 from 'A' = $06

;***************************************************************************
; Subtract Zero-Page Address Indexed With X or Y
;***************************************************************************

lda #$02    ; load A with $02
sta $08     ; store $08 with $02
ldx #$02    ; load X with $02
sec
lda #$10    ; load A with $10
sbc $06,x   ; $10 - $02 = $0e

; OR

lda #$04    ; load A with $04
sta $0302   ; store $0302 with $04
ldx #$02    ; load X with $02
sec
lda #$16    ; load A with $16
sbc $0300,x ; $0300 + $02 (X) = $0302 = $04 -> $16 - $04 = $12

;***************************************************************************
; Subtract Zero-Page Indirect Address Indexed by Y or X
;***************************************************************************

lda #$00    ; load A with $00
sta $02     ; store $02 with $00
lda #$03    ; load A with $03
sta $03     ; store $03 with $03
 
lda #$04    ; load A with $04
sta $0302   ; store $0302 with $04
 
ldy #$02    ; load Y with $02
sec
lda #$14    ; load A with $14
sbc ($02),y ; $02 (Y) points to {$03$02}$01 -> $0300 which + $02 = $0302
    ; $14 - $04 = $10 

    ; OR

lda #$00    ; load A with $00
sta $02     ; store $02 with $00
lda #$03    ; load A with $03
sta $03     ; store $03 with $03
 
lda #$12    ; load A with $12
sta $0300   ; store $0300 with $12
 
sec
lda #$20    ; load A with $20
ldx #$01    ; load X with $01
sbc ($01,x) ; $20 - $12 = $0e