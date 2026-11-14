# Implement `TopModule` (verilog-eval: Prob144_conwaylife)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  clk
 - input  load
 - input  data (256 bits)
 - output q (256 bits)

The module should implemement a "game" played on a two-dimensional grid
of cells, where each cell is either 1 (alive) or 0 (dead). At each time
step, each cell changes state depending on how many neighbours it has:

  (1) 0-1 neighbour: Cell becomes 0.
  (2) 2 neighbours: Cell state does not change.
  (3) 3 neighbours: Cell becomes 1.
  (4) 4+ neighbours: Cell becomes 0.

The game is formulated for an infinite grid. In this circuit, we will use
a 16x16 grid. To make things more interesting, we will use a 16x16
toroid, where the sides wrap around to the other side of the grid. For
example, the corner cell (0,0) has 8 neighbours: (15,1), (15,0), (15,15),
(0,1), (0,15), (1,1), (1,0), and (1,15). The 16x16 grid is represented by
a length 256 vector, where each row of 16 cells is represented by a
sub-vector: q[15:0] is row 0, q[31:16] is row 1, etc.

  (1) load: Loads data into q at the next clock edge, for loading initial
       state. Active high synchronous.
  (2) q: The 16x16 current state of the game, updated every clock cycle.

The game state should advance by one timestep every clock cycle. Assume
all sequential logic is triggered on the positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `data` | in | 256 |  |
| `q` | out | 256 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
