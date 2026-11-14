**Modulo-1000 Counter with Synchronous Conditional Reset**

Design a Verilog module named `dut` that implements a free-running 10-bit counter with an unusual reset condition.

**Ports**

| Name    | Direction | Width  | Description                         |
|---------|-----------|--------|-------------------------------------|
| `clk`   | input     | 1 bit  | Clock; all state changes occur on its rising edge |
| `reset` | input     | 1 bit  | Synchronous control input           |
| `q`     | output    | 10 bits | Current counter value (registered output) |

**Behavior**

The output `q` is a registered value that updates only on the rising edge of `clk`. On each rising edge:

- If `reset` is asserted **and** the current value of `q` is exactly 999, the counter wraps and `q` becomes 0.
- In every other case, `q` increases by 1. This includes when `reset` is asserted but `q` is not 999, and when `reset` is deasserted, regardless of the value of `q`.

Note that `reset` does **not** clear the counter in the usual sense: asserting it at any value other than 999 has no effect on counting. Likewise, if `reset` is low when `q` is 999, the counter does not wrap at 1000 but continues counting upward as a plain 10-bit value, and it rolls over naturally from 1023 to 0 due to the 10-bit width.

There is no initial value specified for `q`; do not add any asynchronous behavior or extra outputs. The circuit must be purely synchronous to `clk`, with no combinational path from `reset` to `q`.

**Example**

- `q = 998`, `reset = 0` → next `q = 999`
- `q = 999`, `reset = 1` → next `q = 0`
- `q = 999`, `reset = 0` → next `q = 1000`
- `q = 500`, `reset = 1` → next `q = 501`
- `q = 1023`, `reset = 0` → next `q = 0`

Implement the module with the exact name and port list given above.
