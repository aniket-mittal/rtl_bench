# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Load Data Alignment Unit (Sign/Zero Extension, Byte Select, Misalignment Detect)**

Design a Verilog module named `dut` that handles the write-back side of a processor's load path. It processes data one chunk at a time (serial/word-slice style) and extends the result according to the load width.

**Parameters**
- `WITH_CSR` (1-bit, default 1)
- `W` (default 1): data slice width
- `B` (default `W-1`): index of the top bit of a slice

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
| `i_bufreg2_q` | input | `W` (`[B:0]`) |
| `o_rd` | output | `W` (`[B:0]`) |
| `o_wb_sel` | output | 4 |

**Required behavior**

1. *Data-valid condition:* A chunk is "valid" if any of the following hold: `i_mdu_op` is set; `i_word` is set; `i_bytecnt` is 0; or `i_half` is set and the upper bit of `i_bytecnt` is 0.

2. *Output data (`o_rd`, combinational):* When the chunk is valid, `o_rd` equals `i_bufreg2_q`. Otherwise, every bit of `o_rd` equals `i_signed` AND a stored sign bit.

3. *Sign storage:* On each rising edge of `i_clk`, if the chunk is valid, the stored sign bit captures the most significant bit of `i_bufreg2_q`; otherwise it holds its value. It has no reset and no specified initial value.

4. *Write-back byte select (`o_wb_sel`, combinational):*
   - bit 0 is high only when `i_lsb == 0`.
   - bit 1 is high when `i_lsb == 1`, or `i_word`, or (`i_half` and `i_lsb[1]` is 0).
   - bit 2 is high when `i_lsb == 2` or `i_word`.
   - bit 3 is high when `i_lsb == 3`, or `i_word`, or (`i_half` and `i_lsb[1]` is 1).

5. *Misalignment (`o_misalign`, combinational):* Asserted only when `WITH_CSR` is 1, and either `i_lsb[0]` is set with (`i_word` or `i_half`), or `i_lsb[1]` is set with `i_half`. Otherwise 0.

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
