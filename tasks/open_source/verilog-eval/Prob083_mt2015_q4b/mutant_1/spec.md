**Constant-Output Combinational Module**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Behavior**

The module has two single-bit inputs, `x` and `y`, and one single-bit output, `z`. The output `z` must be driven continuously by combinational logic. There is no clock, no reset, and no stored state.

The output `z` must be logic high (`1`) for every possible combination of input values. In particular:

- When `x = 0`, `z = 1`, regardless of `y`.
- When `x = 1`, `z = 1`, regardless of `y`.
- The input `y` is part of the interface and must be declared exactly as specified, but it has no influence on the output.

Your module must use exactly the module name and port names given above, with the specified directions and widths, so that it can be checked for formal equivalence against a reference design. Do not add extra ports, and do not introduce any sequential elements or latches.

**Example**

| x | y | z |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

**Requirements**

- Module name: `dut`
- Inputs: `x` (1 bit), `y` (1 bit)
- Output: `z` (1 bit)
- Fully combinational; the output must never be `0` and must never be undriven.
