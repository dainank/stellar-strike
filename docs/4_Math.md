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

# Additional Resources

- [Further Understanding Of 'Zero-Page Indirect Address Indexed by Y' Actions](https://stackoverflow.com/questions/77661945/struggling-to-understand-zero-page-indirect-address-indexed-by-y-for-the-6502?noredirect=1#comment136915304_77661945)