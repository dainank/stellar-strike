# Demo Implementation
> Start console, place text and objects, move a ball and bat around the screen.

# Files

- `example.cfg` - NES Configuration
- `example.s` - Contains 6502 Source Code
- `example.bat` - script to compile source code into NES ROM
- `example.chr` - Patterns for characters & sprites

# NES Game Cartridge

- `ROM` - **Read**-Only (saves on power off)
- `RAM` - **Read**/**Write**

NES Console Memory ('k-of-bytes'):
- Program ROM
    - 16k ROM Bank 0 (Lower) [`$8000 - $bfff`]
    - 16k ROM Bank 1 (Upper) [`$c000 - $ffff`]
- Pattern ROM - 8k ROM
- Console RAM
    - 2k RAM
    - 8k RAM (optional)

The `.segment <name>` command places the associated code into the defined sector of NES console memory.

# Memory Configuration

A configuration file maps **segment names** to locations in NES console memory:
```cfg
MEMORY {
    ZP:     start = $00,    size = $0100, type = rw, file = "";
    OAM:    start = $0200,  size = $0100, type = rw, file = "";
    RAM:    start = $0300,  size = $0500, type = rw, file = "";
    HDR:    start = $0000,  size = $0010, type = ro, file = %O, fill = yes, fillval = $00;
    PRG:    start = $8000,  size = $8000, type = ro, file = %O, fill = yes, fillval = $00;
    CHR:    start = $0000,  size = $2000, type = ro, file = %O, fill = yes, fillval = $00;
}
```
- ZP: Zero Page Memory (Fast)
- OAM: Var Sprite Data
- RAM: Remainder RAM for Vars
- HDR: Added as header on NES ROM file, triggering cartridge features
- PRG: Program SRC Code
- CHR: Pre-defined pattern tables that can be referenced by video memory through NES.
```cfg
SEGMENTS {
    ZEROPAGE: load = ZP,  type = zp;
    OAM:      load = OAM, type = bss, align = $100;
    BSS:      load = RAM, type = bss;
    HEADER:   load = HDR, type = ro;
    CODE:     load = PRG, type = ro,  start = $8000;
    RODATA:   load = PRG, type = ro;
    VECTORS:  load = PRG, type = ro,  start = $FFFA;
    TILES:    load = CHR, type = ro;
}
```
Defined in code:
- `load` - points to MEMORY section
- `type` - zp=zeropage, bss=RAM, ro=readonly
- `align` - alignment of memory segment (on mem_seg that is multiple of value)
- `start` - ensures segment starts on exact location
