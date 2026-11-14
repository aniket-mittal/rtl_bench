# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Masked Register Stage**

Design a Verilog module named `dut` that implements a single-stage, clock-synchronous 8-bit register with a fixed masking behavior on its input.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `d` | input | 8 |
| `q` | output | 8 |

**Required behavior**

- The module is purely synchronous to the rising edge of `clk`. The output `q` must be registered, so it only changes immediately after a rising clock edge and holds its value between edges. There is no combinational path from `d` to `q`.
- On each rising edge of `clk`, the module captures the value of `d` and presents a modified version of it on `q`. The modification is that the most significant bit of the captured value is forced to 0. The remaining seven lower-order bits of `q` equal the corresponding lower seven bits of `d`. The most significant bit of `d` is therefore ignored entirely.
- Consequently, `q[7]` is always 0 after the first clock edge, and `q[6:0]` follows `d[6:0]` with one cycle of latency.
- There is no reset input. Instead, `q` must start at the value 0 (all eight bits zero) at the beginning of simulation, before any clock edge has occurred.
- There are no enable signals or other control inputs. The register captures a new value on every rising edge of `clk`.

**Example**

| Rising edge | `d` | `q` after edge |
|-------------|-----|----------------|
| initial | n/a | `8'h00` |
| 1 | `8'hFF` | `8'h7F` |
| 2 | `8'h80` | `8'h00` |
| 3 | `8'hA5` | `8'h25` |
| 4 | `8'h5A` | `8'h5A` |

Your module will be checked for formal equivalence against a reference implementation, so port names, directions, widths, initial value, and timing must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
