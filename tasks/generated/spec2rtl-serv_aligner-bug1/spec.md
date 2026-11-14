# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Misaligned Instruction Bus Adapter**

Design a Verilog module named `dut` that sits between a CPU instruction bus (which may issue requests at 16-bit-aligned addresses) and a Wishbone-style memory bus that only returns 32-bit words aligned on 4 bytes. When a request has address bit 1 set, the adapter must assemble the 32-bit instruction from the upper half of one memory word and the lower half of the next.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `rst` | input | 1 |
| `i_ibus_adr` | input | 32 |
| `i_ibus_cyc` | input | 1 |
| `o_ibus_rdt` | output | 32 |
| `o_ibus_ack` | output | 1 |
| `o_wb_ibus_adr` | output | 32 |
| `o_wb_ibus_cyc` | output | 1 |
| `i_wb_ibus_rdt` | input | 32 |
| `i_wb_ibus_ack` | input | 1 |

**Behavior**

- The circuit has a one-bit phase state that is cleared by synchronous active-high `rst` and is 0 after reset. On each rising `clk` edge (when not in reset), the phase toggles if the memory acknowledges (`i_wb_ibus_ack`) while `i_ibus_adr[1]` is 1; otherwise it holds.
- Each rising `clk` edge on which `i_wb_ibus_ack` is high, the upper 16 bits of `i_wb_ibus_rdt` are captured and retained until the next such edge. This storage is not affected by `rst`, and its initial value is unspecified.
- `o_wb_ibus_cyc` simply follows `i_ibus_cyc`.
- `o_wb_ibus_adr` equals `i_ibus_adr` while the phase is 0, and `i_ibus_adr + 2` (32-bit wrap-around) while the phase is 1.
- `o_ibus_rdt` equals `i_wb_ibus_rdt` while the phase is 0. While the phase is 1, it is the lower 16 bits of `i_wb_ibus_rdt` as the upper half, concatenated with the captured 16 bits as the lower half.
- `o_ibus_ack` equals `i_wb_ibus_ack`, except it is suppressed (forced to 0) when `i_ibus_adr[1]` is 1 and the phase is 0, since the first fetch of a misaligned access is not yet complete.

All outputs are combinational functions of the inputs and the stored state; only the phase and the captured halfword are registered.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `i_ibus_adr` | in | 32 |  |
| `i_ibus_cyc` | in | 1 |  |
| `i_wb_ibus_rdt` | in | 32 |  |
| `i_wb_ibus_ack` | in | 1 |  |
| `o_ibus_rdt` | out | 32 | |
| `o_ibus_ack` | out | 1 | |
| `o_wb_ibus_adr` | out | 32 | |
| `o_wb_ibus_cyc` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
