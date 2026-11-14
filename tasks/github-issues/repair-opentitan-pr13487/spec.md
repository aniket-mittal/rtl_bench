# Fix GitHub issue #13434 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `47e856187ae4`), trimmed to the files needed to elaborate the module `pwm_chan`.

## Bug report

**Title:** [pwm] Heartbeat DC overflow question

**Description:**

Hey @martin-lueker, the PWM spec mentions that during heartbeat mode, the linearly transformed duty cycle will NEVER overflow or underflow when the two values A/B are set close to 0 and 2^16-1:
https://github.com/lowRISC/opentitan/blob/9b6225e63885b551f432a6f89189f9f4383e09ce/hw/ip/pwm/doc/_index.md?plain=1#L275-L277

Is this really the case?
It appears that the RTL allows the value to overflow explicitly, and then it detects that condition with an overflow bit (`dc_wrap`):
https://github.com/lowRISC/opentitan/blob/9b6225e63885b551f432a6f89189f9f4383e09ce/hw/ip/pwm/rtl/pwm_chan.sv#L93-L117

Can you double check whether this has to be corrected?

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `pwm_chan`.

- Do not change the ports of `pwm_chan` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/pwm_chan.sv` | `hw/ip/pwm/rtl/pwm_chan.sv` |

Module files are under `rtl/src/`.

## Grading

Your `pwm_chan` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/pwm_chan.sv`. Only these files are graded.

## Interface of `pwm_chan`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `pwm_en_i` | in | 1 |  |
| `invert_i` | in | 1 |  |
| `blink_en_i` | in | 1 |  |
| `htbt_en_i` | in | 1 |  |
| `phase_delay_i` | in | 16 |  |
| `duty_cycle_a_i` | in | 16 |  |
| `duty_cycle_b_i` | in | 16 |  |
| `blink_param_x_i` | in | 16 |  |
| `blink_param_y_i` | in | 16 |  |
| `phase_ctr_i` | in | 16 |  |
| `cycle_end_i` | in | 1 |  |
| `clr_blink_cntr_i` | in | 1 |  |
| `dc_resn_i` | in | 4 |  |
| `pwm_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/pwm_chan.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
