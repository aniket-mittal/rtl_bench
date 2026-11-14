# Fix GitHub issue #10062 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `5a990dd81fb8`), trimmed to the files needed to elaborate the module `pwm_chan`.

## Bug report

**Title:** PWM does not get the duty cycle correct

**Description:**

checkout `pwm_dbg`
reproduce run
```./util/dvsim/dvsim.py hw/ip/pwm/dv/pwm_sim_cfg.hjson -i pwm_smoke -r 1 -t xcelium --xprop-off --job-prefix="nc run -C ncsim_interactive -Il" -w=shm -s=1```

currently the settings are fixed to

 ```
   cfg.pwm_cfg.DcResn       = 12;
    cfg.pwm_cfg.ClkDiv       = 'h1;
    cfg.pwm_cfg.CntrEn       = 1;
    cfg.duty_cycle[0].A      = 6500;
    cfg.duty_cycle[0].B      = 0;
    cfg.blink[0].A           = 0;
    cfg.blink[0].B           = 0;
    cfg.pwm_param[0].BlinkEn = 0;
```

if my calculations are correct each pulse should be
 2^13 = 8192 beats
 each beat is 2 clks wide
 and the duty cycle should be 6500>>3 = 812/8192 or 1624/16384 clks

 but what I see in simulation is

Expected ITEM
------| PWM ITEM |------
 Item from channel           0
 Period       16384 clocks
 Duty cycle 0 pct
 inverted 0
 Num of active cycles        1624
 Num of inactive cycles       14760
 phase cnt           0

Actual item seen on wire
------| PWM ITEM |------
 Item from channel           0
 Period       16384 clocks
 Duty cycle 0 pct
 inverted 0
 Num of active cycles       13000
 Num of inactive cycles        3384

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
