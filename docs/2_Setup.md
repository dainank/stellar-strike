# Setup
> Development Setup

## Emulation
> Software-based

Main Options:
- [Mesen](https://www.mesen.ca/docs/index.html) - **RECOMMENDED**
- [FCEUX](https://fceux.com/web/download.html) - Best option for `MAC OSX`
- [iNES](http://fms.komkon.org/iNES/#Downloads) - Alternative to _Mesen_

Additional Options:
- [Nestopia UE](http://0ldsk00l.ca/nestopia/)
- [JNES](http://jabosoft.com/categories/1)
- [BizHawk](https://github.com/TASEmulators/BizHawk)
- [VirtualNES](http://virtuanes.s1.xrea.com/)
- [RetroArch](https://www.retroarch.com/index.php)
- [Higan](https://higan.readthedocs.io/en/stable/)

**Disclaimer: Emulators usually function fine for 8-bit graphics, but struggle at times with sound. Test any public releases on real hardware first. _EverDrive N8 cartridges are an example of what could be used for this purpose_.**

## Assembler

Text instructions need to be converted into actual machine code for the NES console to understand. The **assembler** handles this. The most popular homebrew assembler options include:

- [cc65](https://cc65.github.io/) - **RECOMMENDED**
- [NESASM](https://github.com/camsaul/nesasm) - Alternative to _cc65_
- [ASM6](https://github.com/parasyte/asm6)  - Minimal

## Graphics Creation

`8x8` tiles and `8x8` sprites are the patterns which derive from tilesets known as **CHR** sets. Tile hackers such as _Tile Editor Pro_, _YY-CHR_, _Tile Layer Pro_, _Nestile_ are great for changing _CHRs_, but tough to use for development itself. Options for development include:

- [NES Tileset Editor](https://www.electricadventures.net/Pages/Category/34) - Simplistic Author's Tool
- [NEXXT](https://frankengraphics.itch.io/nexxt) - Complex Tile Creation
- [NES Assets Workshop (NAW)](https://nesrocks.itch.io/naw) - Modern Tool
- [NES CHR Editor](https://www.ninjasftw.com/squirrel/nes_chr/) - `MAC OSX` Option

## Sound Creation

Sound requires tooling to create and an engine to play. **Note that you will need the  _CA65 sound engine_ as well.**

Options include:
- [FamiTracker](https://famitracker.org/) - Complex but comprehensive
- [FamiStudio](https://famistudio.org/) - Simple for beginners