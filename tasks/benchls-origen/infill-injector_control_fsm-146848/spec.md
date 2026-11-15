# Fill in the masked region of `origen_146848`

The file `origen_146848.v` holds a Verilog design whose top module is `origen_146848` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_146848`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_146848.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_146848` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_146848.v`. Only these files are graded.

## Interface of `origen_146848`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `InjectorArmFinishMovement_eI` | in | 1 |  |
| `EmergencyStopChanged_eI` | in | 1 |  |
| `CanisterPressureChanged_eI` | in | 1 |  |
| `FillContentsAvailableChanged_eI` | in | 1 |  |
| `LasersChanged_eI` | in | 1 |  |
| `DoorOverride_eI` | in | 1 |  |
| `VacuumTimerElapsed_eI` | in | 1 |  |
| `EmergencyStop_I` | in | 1 |  |
| `CanisterPressure_I` | in | 8 |  |
| `FillContentsAvailable_I` | in | 8 |  |
| `DoorSiteLaser_I` | in | 1 |  |
| `InjectSiteLaser_I` | in | 1 |  |
| `RejectSiteLaser_I` | in | 1 |  |
| `RejectBinLaser_I` | in | 1 |  |
| `AcceptBinLaser_I` | in | 1 |  |
| `DoorReleaseCanister_eO` | out | 1 | |
| `ConveyorChanged_eO` | out | 1 | |
| `InjectorPositionChanged_eO` | out | 1 | |
| `InjectorControlsChanged_eO` | out | 1 | |
| `FillContentsChanged_eO` | out | 1 | |
| `StartVacuumTimer_eO` | out | 1 | |
| `GoRejectArm_eO` | out | 1 | |
| `CanisterCountChanged_eO` | out | 1 | |
| `InjectDone_eO` | out | 1 | |
| `ConveyorSpeed_O` | out | 8 | |
| `InjectorPosition_O` | out | 8 | |
| `InjectorContentsValveOpen_O` | out | 1 | |
| `InjectorVacuumRun_O` | out | 1 | |
| `InjectorPressurePumpRun_O` | out | 1 | |
| `FillContents_O` | out | 8 | |
| `CanisterCount_O` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_146848.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
