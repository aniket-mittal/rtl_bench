# Fix GitHub issue #23936 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `1518dc864134`), trimmed to the files needed to elaborate the module `prim_sha2_pad`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [prim_sha2_pad, hmac] Don't allow skipping the padding after stopping a hash operation

**Description:**

### Description

During coverage closure for V2S, @martin-velay  and @gdessouky noted that there are some uncovered FSM transitions inside `prim_sha2_pad`:
- StLenHi -> StFifoReceive
- StLenLo -> StFifoReceive
- StPad00 -> StFifoReceive
- StPad80 -> StFifoReceive

An inspection of the RTL reveals that these transtions can be covered by something like the following sequence:
 1.  Trigger and message and make `prim_sha2_pad` go into any the `StPad80` / `StPad00` / `StLenHi` / `StLenLo` states. As a result of this `cfg_block` will assert and any future `reg_hash_start` / `reg_hash_continue` won't be forwarded to `prim_sha2_pad`.
 2. Trigger a `reg_hash_stop`. This will make `cfg_block` go low again in the next clock cycle.
 3. In the next clock cycle, trigger again a `reg_hash_start` / `reg_hash_continue`. This will trigger the uncovered transition.

The problematic thing with this is that after Step 2, the design should finish the hashing and then append the padding. By triggering another `reg_hash_start` or `reg_hash_continue`, software can cause the hardware to abort the padding and restart the hashing. This is not intended behavior, but software is also not expected to start another operation directly after stopping one. Instead, software is expected to wait for the `hmac_done` interrupt or to poll the status register to wait for the hashing and padding to finish before triggering further operations as outlined in the [HMAC programmer's guide](https://opentitan.org/book/hw/ip/hmac/doc/programmers_guide.html#saving-and-restoring-the-context) .

@andreaskurth and I concluded that this is NOT a terrible bug for Earlgrey-PROD and we will exclude the missing / buggy transitions from FSM coverage. But we should still fix this in a future release. The FSM should only be able to go back into the `StFifoReceive` state after finishing the padding.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `prim_sha2_pad`.

- Do not change the ports of `prim_sha2_pad` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/prim_sha2_pad.v` | `hw/ip/prim/rtl/prim_sha2_pad.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `prim_sha2_pad` are the same as upstream.

## Grading

Your `prim_sha2_pad` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/prim_sha2_pad.v`. Only these files are graded.

## Interface of `prim_sha2_pad`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `fifo_rvalid_i` | in | 1 |  |
| `fifo_rdata_i` | in | 72 |  |
| `shaf_rready_i` | in | 1 |  |
| `sha_en_i` | in | 1 |  |
| `hash_start_i` | in | 1 |  |
| `hash_stop_i` | in | 1 |  |
| `hash_continue_i` | in | 1 |  |
| `digest_mode_i` | in | 4 |  |
| `hash_process_i` | in | 1 |  |
| `hash_done_i` | in | 1 |  |
| `message_length_i` | in | 128 |  |
| `fifo_rready_o` | out | 1 | |
| `shaf_rvalid_o` | out | 1 | |
| `shaf_rdata_o` | out | 64 | |
| `msg_feed_complete_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/prim_sha2_pad.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
