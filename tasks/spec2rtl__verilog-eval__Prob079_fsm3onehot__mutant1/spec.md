# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Combinational One-Hot State Machine Logic**

Design a purely combinational Verilog module named `dut` that implements the next-state and output logic of a four-state finite state machine whose current state is supplied in one-hot form. The state machine's flip-flops are not part of this module.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `in` | input | 1 |
| `state` | input | 4 (`[3:0]`) |
| `next_state` | output | 4 (`[3:0]`) |
| `out` | output | 1 |

**State encoding**

Bit positions in `state` and `next_state` represent four states: A is bit 0, B is bit 1, C is bit 2, and D is bit 3. A state is "active" when its bit is 1.

**Required behavior**

Each next-state bit is computed from which current states are active and from `in`:

- **A** is next active when `in` is 0 and the current state is A or C.
- **B** is next active when `in` is 1 and the current state is A, B, or D.
- **C** is next active when `in` is 0 and the current state is A or D.
- **D** is next active when `in` is 1 and the current state is C.

The output `out` is 1 exactly when the current state is D.

**Notes**

- There is no clock or reset; outputs must respond immediately to any change in the inputs.
- Treat every input combination as legal, including non-one-hot values of `state` (all zeros, or multiple bits set). Each next-state bit must follow the rules above independently, with no priority or error handling. For example, `state = 4'b0000` gives `next_state = 4'b0000` for either value of `in`.
- Do not add any additional ports.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `state` | in | 4 |  |
| `next_state` | out | 4 | |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
