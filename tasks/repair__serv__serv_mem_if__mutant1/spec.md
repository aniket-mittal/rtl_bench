# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Load Data Alignment and Write-Back Select Unit**

Design a Verilog module named `dut` that handles data alignment for a load operation in a serial/word-sliced processor datapath.

**Parameters**
- `WITH_CSR` (1-bit, default 1)
- `W` (default 1): data slice width
- `B` (default `W - 1`): index of the top bit of the data slice

**Ports**
| Name | Direction | Width |
|---|---|---|
| `i_clk` | input | 1 |
| `i_bytecnt` | input | 2 |
| `i_lsb` | input | 2 |
| `o_misalign` | output | 1 |
| `i_signed` | input | 1 |
| `i_word` | input | 1 |
| `i_half` | input | 1 |
| `i_mdu_op` | input | 1 |
| `i_bufreg2_q` | input | `B+1` (`[B:0]`) |
| `o_rd` | output | `B+1` (`[B:0]`) |
| `o_wb_sel` | output | 4 |

**Required behavior**

1. *Data valid condition (combinational):* The current data slice is "valid" when `i_bytecnt[1]` is 0 and at least one of the following holds: `i_mdu_op`, `i_word`, `i_half`, or `i_bytecnt` equals 0.

2. *Sign tracking:* Maintain one bit of state that, on each rising edge of `i_clk`, captures the most significant bit of `i_bufreg2_q` only when the data is valid; otherwise it holds its value. There is no reset, and the initial value is unspecified.

3. *Read data `o_rd`:* When valid, `o_rd` passes `i_bufreg2_q` through unchanged. Otherwise every bit of `o_rd` equals `i_signed` AND the stored sign bit (sign extension).

4. *Write-back byte select `o_wb_sel` (combinational):*
   - Bit 0 is high when `i_lsb == 0`.
   - Bit 1 is high when `i_lsb == 1`, or `i_word`, or (`i_half` and `i_lsb[1]` is 0).
   - Bit 2 is high when `i_lsb == 2` or `i_word`.
   - Bit 3 is high when `i_lsb == 3`, or `i_word`, or (`i_half` and `i_lsb[1]` is 1).

5. *Misalignment `o_misalign` (combinational):* Asserted only if `WITH_CSR` is 1 (otherwise always 0). It is high for a word access when `i_lsb` is nonzero, or for a halfword access when `i_lsb[0]` is 1. Byte accesses are never misaligned. Note that `i_word` takes priority over `i_half` only in the sense that the conditions are ORed; both flags set together follows from that rule.

Output only the module; the module must match the names and widths above exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `i_clk` | in | 1 | clock, rising edge |
| `i_bytecnt` | in | 2 |  |
| `i_lsb` | in | 2 |  |
| `i_signed` | in | 1 |  |
| `i_word` | in | 1 |  |
| `i_half` | in | 1 |  |
| `i_mdu_op` | in | 1 |  |
| `i_bufreg2_q` | in | 1 |  |
| `o_misalign` | out | 1 | |
| `o_rd` | out | 1 | |
| `o_wb_sel` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
