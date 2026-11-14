# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Misaligned Instruction Bus Adapter**

Design a Verilog module named `dut` that sits between a CPU instruction bus and a Wishbone-style memory bus whose reads return 32-bit words. It lets the CPU fetch a 32-bit instruction at a halfword-aligned address (address bit 0 is ignored) that may straddle two word-aligned memory reads.

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

The module keeps a one-bit phase state, cleared to 0 by synchronous active-high `rst` (it has no other initialization). It also remembers the upper 16 bits of the most recent word returned by the memory bus; this value is captured on each rising clock edge where `i_wb_ibus_ack` is high, and is not reset.

- **Phase flip:** On a rising clock edge, if `i_wb_ibus_ack` is high and `i_ibus_adr[1]` is high, the phase toggles. Otherwise it holds. Reset takes priority.
- **Memory address:** `o_wb_ibus_adr` equals `i_ibus_adr` in phase 0, and `i_ibus_adr + 4` in phase 1 (32-bit wraparound). `o_wb_ibus_cyc` simply follows `i_ibus_cyc`.
- **Read data:** In phase 0, `o_ibus_rdt` is `i_wb_ibus_rdt` directly. In phase 1, it is the lower 16 bits of `i_wb_ibus_rdt` in the upper half, and the remembered upper 16 bits in the lower half.
- **Acknowledge:** `o_ibus_ack` is high only when `i_wb_ibus_ack` is high, `i_ibus_adr[1]` is high, and the phase is 0. Thus, for a misaligned fetch, the CPU is acknowledged only after the second memory read completes. Wait: it is the phase-0 condition that gates ack, so match this exactly as stated.

All outputs are combinational functions of the inputs and current state, except through the two registered items above.

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
