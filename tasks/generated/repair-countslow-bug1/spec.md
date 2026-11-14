# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Gated Decade-Plus Counter**

Design a synchronous 4-bit counter with an enable that lets it advance only on selected clock cycles.

**Module name:** `dut`

**Ports:**
- `clk` : input, 1 bit. All state changes occur on the rising edge of this clock.
- `slowena` : input, 1 bit. Count-enable.
- `reset` : input, 1 bit. Synchronous, active-high reset.
- `q` : output, 4 bits. The current count value, driven directly from a register.

**Behavior:**

On each rising edge of `clk`:

1. If `reset` is high, `q` is set to 0. Reset takes priority over everything else, including `slowena`.
2. Otherwise, if `slowena` is high, the counter advances:
   - If `q` currently holds 10, it wraps around to 0 on the next edge.
   - Otherwise, `q` increases by 1.
3. Otherwise (`slowena` low and `reset` low), `q` holds its value.

**Notes:**
- The counting sequence is therefore 0, 1, 2, ..., 9, 10, 0, 1, ... for a total of 11 distinct values per cycle. Note that 10 is a valid, reachable value, not skipped.
- Reset is synchronous only; there is no asynchronous reset behavior.
- There is no defined initial value for `q` before the first reset; the design should not need to specify one.
- Behavior for values 11 through 15 is not specially handled: if `q` is ever in that range with `slowena` high, it simply increments by 1 in the normal way (15 rolls over to 0 through 4-bit arithmetic).
- `q` must be registered: it changes only after a rising clock edge, never combinationally in response to `slowena` or `reset`.

Implement the module so that it matches this behavior exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `slowena` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
