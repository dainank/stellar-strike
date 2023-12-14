; Addition In 6502 ASM
; Omitted comments mean prior example in file explains line.

;***************************************************************************
; Add Direct Value
;***************************************************************************

clc         ; clear carry flag
lda #$01    ; load $01 into register A
adc #$05    ; add $05 to register A ($01 + $05 = $06)

;***************************************************************************
; Add Value From Absolute Memory Address
;***************************************************************************

lda #$10    ; load $10 into register A
sta $0300   ; store $10 (A) at memory address $0300
clc         
lda #$20    ; load $20 into register A
adc $0300   ; add to register A, value at memory $0300 -> $30

;***************************************************************************
; Absolute Address Index With X/Y
;***************************************************************************

lda #$12    ; load $12 into register A
sta $08     ; store $12 (A) at memory address $08
clc
lda #$10    ; load $10 into register A
ldx #$02    ; load $02 into register X
ADC $06,x   ; $10 (A) + $12 ($06 + $02 [x] = $08 -> contains val $12) = $22

;***************************************************************************
; Zero-Page Indirect Address Indexed by X or Y
;***************************************************************************

lda #$00   ; Load the accumulator (A register) with the immediate value 0x00
sta $02    ; Store the value in the accumulator into memory address $02

lda #$03   ; Load the accumulator with the immediate value 0x03
sta $03    ; Store the value in the accumulator into memory address $03

lda #$14   ; Load the accumulator with the immediate value 0x14
sta $0302  ; Store the value in the accumulator into memory address $0302

clc        ; Clear the carry flag (CLC instruction)
lda #$10   ; Load the accumulator with the immediate value 0x10
ldy #$02   ; Load the Y register with the immediate value 0x02
adc ($02),y

; The code initializes some memory addresses ($02 AND $03) with values that 
; specify an address ($0300).

; Then, it stores a value ($14) in memory address $0302.

; Finally, it retrieves the value at the calculated address ($0302) AND adds
; it to the value in the accumulator ($10), resulting in $24 stored in the 
; accumulator.