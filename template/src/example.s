;*****************************************************************
; See '5_Demo.md' under ~/docs for further explanation.
;*****************************************************************

; Define PPU Registers
PPU_CONTROL = $2000         ; write
PPU_MASK = $2001            ; write
PPU_STATUS = $2002          ; write
PPU_SPRRAM_ADDRESS = $2003  ; write
PPU_SPRRAM_IO = $2004       ; write
PPU_VRAM_ADDRESS1 = $2005   ; write
PPU_VRAM_ADDRESS2 = $2006   ; write
PPU_VRAM_IO = $2007         ; read/write
SPRITE_DMA = $4014
 
; Define APU Registers
APU_DM_CONTROL = $4010      ; write
APU_CLOCK = $4015           ; read/write
 
; Joystick/Controller values
JOYPAD1 = $4016             ; read/write
JOYPAD2 = $4017             ; read/write
 
; Gamepad bit values
PAD_A      = $01
PAD_B      = $02
PAD_SELECT = $04
PAD_START  = $08
PAD_U      = $10
PAD_D      = $20
PAD_L      = $40
PAD_R      = $80

.segment "HEADER"
INES_MAPPER = 0     ; NROM
INES_MIRROR = 0     ; horizontal mirror
INES_SRAM   = 0     ; no battery-backed SRAM
 
.byte 'N', 'E', 'S', $1A ; ID 
.byte $02           ; 16k PRG bank count    (2 x 16k bank counts)
.byte $01           ; 8k CHR bank count     (1 x 8k ROM banks)
.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
.byte (INES_MAPPER & %11110000)
.byte $0, $0, $0, $0, $0, $0, $0, $0    ; padding?

.segment "VECTORS"
.word nmi
.word reset
.word irq

;*****************************************************************
; 6502 Zero Page Memory (256 bytes)
;*****************************************************************
 
.segment "ZEROPAGE"
nmi_ready:        .res 1
gamepad:        .res 1
d_x:            .res 1
d_y:            .res 1

;*****************************************************************
; Sprite OAM Data area - copied to VRAM in NMI routine
;*****************************************************************
 
.segment "OAM"
oam: .res 256