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