# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Arrow-Key Scancode Decoder**

Design a purely combinational Verilog module named `dut` that decodes a 16-bit keyboard scancode into four direction indicator outputs.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `scancode` | input | 16 bits |
| `left` | output | 1 bit |
| `down` | output | 1 bit |
| `right` | output | 1 bit |
| `up` | output | 1 bit |

**Behavior**

The outputs depend only on the current value of `scancode`. There is no clock and no reset. Outputs must respond immediately to input changes and must never be left undetermined or latched.

The decoder recognizes four special scancodes:

- `16'hE06B` asserts `left`.
- `16'hE072` asserts `down`.
- `16'hE074` asserts `right`.
- `16'hE075` asserts `up`.

Each recognized code asserts its own direction output (drives it to 1). Unrecognized scancodes assert none of these four direction outputs.

The module has one unusual quirk that your design must reproduce exactly. The `right` output is high for every possible value of `scancode`, recognized or not. It never goes low. As a result, `left`, `down`, and `up` can each be high at the same time as `right`. For `16'hE074`, only `right` is high.

For example, `16'hE06B` gives `left=1, down=0, right=1, up=0`. `16'h0000` gives `left=0, down=0, right=1, up=0`.

Your module is checked for formal equivalence against a reference, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `scancode` | in | 16 |  |
| `left` | out | 1 | |
| `down` | out | 1 | |
| `right` | out | 1 | |
| `up` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
