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

# Additional Resources

- [Further Understanding Of 'Zero-Page Indirect Address Indexed by Y' Actions](https://stackoverflow.com/questions/77661945/struggling-to-understand-zero-page-indirect-address-indexed-by-y-for-the-6502?noredirect=1#comment136915304_77661945)