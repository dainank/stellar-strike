# Addition

Utilizing `A` register with command `ADC`:

```asm
clc
adc <source>
```

`<source>` could be:
    - `adc #$05` -> the value of `5`
    - `sta $0300    adc $0300` -> the value of `$1234`
    - `<register>` -> the value of 10

See [the addition source code examples](./examples/addition.s) for greater clarity.

# Subtraction

Utilizing `A` register with command `ADC`:

```asm
sec             ; set carry flag
sbc <source>
```

See [the subtraction source code examples](./examples/subtraction.s) for greater clarity.

# Incrementing & Decrementing

See [the incrementation source code examples](./examples/incrementation.s) for greater clarity. You can also directly increment/decrement registers:
- `inx`
- `iny`
- `dex`
- `dey`

Furthermore, you can decrement addresses too:
```asm
dec $05     ; zero-page address
dec $0300

ldx #$02
dec $05,X
```

# Conditions
> Special register P stores these flags.

| Bit | Symbol | Name              | Description                          |
|-----|--------|-------------------|--------------------------------------|
| 7   | N      | Negative          | Less Than                            |
| 6   | V      | Overflow          | More Than                            |
| 5   | -      | Unused            | Always Set                           |
| 4   | B      | Break             | Interrupt Request                    |
| 3   | D      | Decimal           | No Effect                            |
| 2   | I      | Interrupt Disable | Interrupt Requests Disabled When Set |
| 1   | Z      | Zero              | Equal To                             |
| 0   | C      | Carry             | Math & Rotate Operations             |

```asm
lda #$79
cmp #$80    ; use cmp operator would result in A - $80 -> 'negative' `N` flag
```

# Jumps
> Can be done in ROM or RAM.

For example, `jmp $8100` goes to code at address `$8100` although labels are a better way to do this. The assembler can then work out the 'appropriate' address.

# Branches
> Jumping based on outcomes of conditions (`IF, THEN, ELSE`).

Note that you can only jump 129 bytes forward or 126 bytes backwards:
- `bpl` - *Branch on PLus*: Negative Flag (0)
- `bmi` - *Branch on MInus*: Negative Flag (1)
- `bvc` - *Branch on oVerflow Clear*: Overflow Flag (0)
- `bvs` - *Branch on oVerflow Set*: Overflow Flag (1)
- `bcc` - *Branch on Carry Clear (Unsigned lower)*: Carry Flag (0)
- `bcs` - *Branch on Carry Set (Unsigned higher or same)*: Carry Flag (1)
- `bne` - *Branch on Not Equal*: Zero Flag (0)
- `beq` - *Branch on EQual*: Zero Flag (1)

Usage example:
```asm
...
   lda #05      ; load register A with $05
   cmp #05      ; compare and raise flag ZERO (1)
   beq SKIPCODE ; if ZERO flag raised, jump to SKIPCODE
   lda #06      ; jumped over
SKIPCODE:       ; jumped to
```

# Subroutine
> Essentially functions that cost some performance.

*Readability is favored, however, optimize where needed if necessary*.

- `jsr` - **jump** into subroutine
- `rts ` - **return** from subroutine
- `rti` - **break** from interrupt

When `jsr` is called, address of next instruction pushed onto *stack*. Program counter adjusted to execute at start of this address until `RTS`/`RTI` is reached. Make sure that all items pushed onto stack after `jsr` are pushed back off once returning/breaking out. Example follows below:

```asm
lda #5
jsr FUNCTION
jsr FUNCTION

FUNCTION:
    clc     ; initiate addition
    adc #5  ; add 5 to A
    rts     ; return from subroutine
```

# Labels
> Assembler works out the address of jumps for you.

```asm
jmp NEWCODE
 
NEWCODE:
    ...
```

See [the labels source code examples](./examples/labels.s) for greater clarity.



# Additional Resources

- [Further Understanding Of 'Zero-Page Indirect Address Indexed by Y' Actions](https://stackoverflow.com/questions/77661945/struggling-to-understand-zero-page-indirect-address-indexed-by-y-for-the-6502?noredirect=1#comment136915304_77661945)