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

# Bytes, Bits and Nibbles

- Pixels are represented by one or more **bits** (1|0) stored in system memory.
- **Bytes** (8-bits) can represent: `[ 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 ]` = 0-255
    - which pixels are on/off in a tile pattern
    - (x, y) coordinate of sprites
    - contain flags in the bits
- **Nibbles** are two-halves of a byte (2 nibbles) representing:
    - 0-3
    - 4-7
        -> which can contain 0-15 OR 0-F (hex)

## Bit Tests

```asm
lda #%00000001  ; load with binary value `00000001`
bit $05         ; check bits at byte $05
```

Zero flag raised if bit `0` in byte `$05` is true (1) as is the case in `A`.

# Logic Operators
> Directly manipulate bits in register A or memory location.

## AND
1. Compare all bits from A to memory/value.
2. Simple `&&`

## XOR
1. Compare all bits from A to memory/value.
2. Simple `||` not counting positive 1-1

## ORA
> OR

1. Compare all bits from A to memory/value.
2. Simple `||`

# Shift Operations
> Fast x2 Multiplication/Division

## ASL
> Arithmetic Shift Left

Shift all bits to the left (and 7th bit to carry flag). 0 always placed in 0th bit.

## LSR
> Logical Shift Right
Shift all bits to the right (and 0th bit to carry flag). 0 always placed in 7th bit.

## ROL
> Rotate Left

Same as ASL, but carry flag is placed in 0th bit.

## ROR
> Rotate Right

Same as LSR, but carry flag is placed in 7th bit.

# Utilizing Stack

- `pha` - Push A into stack.
- `php` - Push P into stack.
- `pla` - Pop top item into A.
- `plp` - Pop top item into P.

For example:

```asm
lda #20 ; load 20 into A
pha     ; push 20 on stack
lda #10 ; load 10 into A
adc $80 ; add 80 to A
sta $81 : store 80+10 at $81: 90
pla     : top on stack is 20, which is popped now into A
```

# Additional Resources

- [Further Understanding Of 'Zero-Page Indirect Address Indexed by Y' Actions](https://stackoverflow.com/questions/77661945/struggling-to-understand-zero-page-indirect-address-indexed-by-y-for-the-6502?noredirect=1#comment136915304_77661945)