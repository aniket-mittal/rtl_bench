**Dual-Output Two-Input Logic Block**

Design a purely combinational Verilog module named `dut` that takes two single-bit inputs and produces two single-bit outputs, each computed by a different logic function of the inputs.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `a` | input | 1 bit |
| `b` | input | 1 bit |
| `out_assign` | output | 1 bit |
| `out_alwaysblock` | output | 1 bit (declared as a variable type, i.e. `output reg`, driven from procedural code) |

**Required behavior**

- `out_assign` must be 1 only when both `a` and `b` are 1; otherwise it must be 0.
- `out_alwaysblock` must be 1 only when `a` and `b` have different values; otherwise it must be 0.

**Truth table**

| a | b | out_assign | out_alwaysblock |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |

**Constraints**

- There is no clock and no reset. Both outputs must respond immediately to any change on either input, with no storage elements or latches.
- Use a continuous assignment for one output and a combinational procedural block for the other, so that `out_alwaysblock` is declared as `output reg`.
- The port names, directions, and widths must match the table exactly, since your design will be checked by formal equivalence against a reference.

Write the complete module.
