**Nibble-Swap Register with Asynchronous Reset**

Design a Verilog module named `dut` that registers an 8-bit input after exchanging its two 4-bit halves.

**Ports**

| Name   | Direction | Width | Description                         |
|--------|-----------|-------|-------------------------------------|
| `clk`    | input     | 1     | Clock signal                        |
| `d`      | input     | 8     | Data input                          |
| `areset` | input     | 1     | Active-high asynchronous reset      |
| `q`      | output    | 8     | Registered output                   |

**Behavior**

- The output `q` must be driven by flip-flops that update on the **rising edge** of `clk`.
- On each rising clock edge (when reset is not asserted), `q` captures the value of `d` with its upper nibble (bits 7:4) and lower nibble (bits 3:0) swapped. That is, the upper four bits of `q` receive the lower four bits of `d`, and the lower four bits of `q` receive the upper four bits of `d`. The bit order inside each nibble is preserved.
- When `areset` is asserted (goes high), `q` must immediately be cleared to all zeros, regardless of the clock. This reset is **asynchronous**: it takes effect as soon as `areset` rises, not on the next clock edge.
- While `areset` remains high, `q` stays at zero and clock edges have no effect on it.
- When `areset` is deasserted, normal operation resumes on the next rising clock edge. Deassertion itself does not change `q`.
- There is no enable signal; the register loads on every rising clock edge outside of reset.

**Requirements**

- The output must be registered (not combinational): changes in `d` between clock edges must not affect `q`.
- Use the exact module name and port names/widths given above.

**Example**

If `d = 8'hA5` at a rising clock edge with `areset = 0`, then after that edge `q = 8'h5A`.
If `d = 8'h12` at the next rising edge, `q = 8'h21`.
If `areset` then goes high, `q = 8'h00` immediately.
