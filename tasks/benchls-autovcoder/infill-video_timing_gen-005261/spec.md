# Fill in the masked region of `autovcoder_005261`

The file `autovcoder_005261.v` holds a Verilog design whose top module is `autovcoder_005261` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `autovcoder_005261`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_005261.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_005261` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_005261.v`. Only these files are graded.

## Interface of `autovcoder_005261`

| port | dir | width | note |
|---|---|---|---|
| `trs` | in | 4 |  |
| `is_interlaced` | in | 1 |  |
| `is_serial_output` | in | 1 |  |
| `is_sample_count_f0` | in | 16 |  |
| `is_line_count_f0` | in | 16 |  |
| `is_sample_count_f1` | in | 16 |  |
| `is_line_count_f1` | in | 16 |  |
| `is_h_front_porch` | in | 16 |  |
| `is_h_sync_length` | in | 16 |  |
| `is_h_blank` | in | 16 |  |
| `is_v_front_porch` | in | 16 |  |
| `is_v_sync_length` | in | 16 |  |
| `is_v_blank` | in | 16 |  |
| `is_v1_front_porch` | in | 16 |  |
| `is_v1_sync_length` | in | 16 |  |
| `is_v1_blank` | in | 16 |  |
| `is_ap_line` | in | 16 |  |
| `is_v1_rising_edge` | in | 16 |  |
| `is_f_rising_edge` | in | 16 |  |
| `is_f_falling_edge` | in | 16 |  |
| `is_anc_line` | in | 16 |  |
| `is_v1_anc_line` | in | 16 |  |
| `interlaced_nxt` | out | 1 | |
| `serial_output_nxt` | out | 1 | |
| `h_total_minus_one_nxt` | out | 16 | |
| `v_total_minus_one_nxt` | out | 16 | |
| `ap_line_nxt` | out | 16 | |
| `ap_line_end_nxt` | out | 16 | |
| `h_blank_nxt` | out | 16 | |
| `sav_nxt` | out | 16 | |
| `h_sync_start_nxt` | out | 16 | |
| `h_sync_end_nxt` | out | 16 | |
| `f2_v_start_nxt` | out | 16 | |
| `f1_v_start_nxt` | out | 16 | |
| `f1_v_end_nxt` | out | 16 | |
| `f2_v_sync_start_nxt` | out | 16 | |
| `f2_v_sync_end_nxt` | out | 16 | |
| `f1_v_sync_start_nxt` | out | 16 | |
| `f1_v_sync_end_nxt` | out | 16 | |
| `f_rising_edge_nxt` | out | 16 | |
| `f_falling_edge_nxt` | out | 16 | |
| `total_line_count_f0_nxt` | out | 13 | |
| `total_line_count_f1_nxt` | out | 13 | |
| `f2_anc_v_start_nxt` | out | 16 | |
| `f1_anc_v_start_nxt` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_005261.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
