# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Misaligned Instruction Bus Adapter**

Design a Verilog module named `dut` that sits between a CPU instruction bus and a 32-bit Wishbone-style instruction bus, allowing 32-bit fetches at addresses that are only 16-bit aligned (address bit 1 may be set; bit 0 is not used for any decision).

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

A fetch whose address has bit 1 set straddles two aligned words and is performed as two consecutive bus transactions. The module tracks, with a single state bit, whether it is in the second transaction of such a fetch. This state is cleared by synchronous active-high `rst` and is otherwise toggled on a rising `clk` edge whenever `i_wb_ibus_ack` is high and `i_ibus_adr[1]` is high.

- `o_wb_ibus_cyc` simply follows `i_ibus_cyc`.
- `o_wb_ibus_adr` equals `i_ibus_adr` in the first transaction, and `i_ibus_adr + 4` (32-bit wraparound) during the second.
- The module also remembers the lower 16 bits of `i_wb_ibus_rdt`, captured on each rising clock edge where `i_wb_ibus_ack` is high (no reset on this storage).
- `o_ibus_rdt` is `i_wb_ibus_rdt` in the first transaction. In the second, it is the current `i_wb_ibus_rdt[15:0]` as the upper half and the remembered 16 bits as the lower half.
- `o_ibus_ack` is `i_wb_ibus_ack`, except it is suppressed (forced low) during the first transaction of a straddling fetch (`i_ibus_adr[1]` high and not yet in the second transaction). Aligned fetches (bit 1 low) are acknowledged normally.

All outputs other than the registered state are combinational functions of the inputs and the stored state.

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
