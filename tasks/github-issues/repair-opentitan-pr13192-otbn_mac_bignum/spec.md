# Fix GitHub issue #11019 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `b1f6dddfdf29`), trimmed to the files needed to elaborate the module `otbn_mac_bignum`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [otbn] D2S review opens

**Description:**

Pre D2S review known actions:
- [x] Finish blanking implementation - #10824
- [x] Implement ECC integrity for ISPRs, including end to end integrity (keep existing ECC from ISPR/Reg when copying to/from register file) - #11973
- [x] Loop stack integrity (see actions below and meeting notes for more details)

From 1st session:

- [x] Add CM labels to RTL https://github.com/lowRISC/opentitan/pull/12986
- [x] Make sure all sparse FSMs have an error state. See #11843
- [x] Make multiple copies of lc_escalate_en using prim_lc_sync, see #11864
- [x] @GregAC  to review again all paths going from bignum to base side and note them on the blanking issue so that we can decide whether more is needed here.
- [x] @johannheyszl to check RE SW hardening for the zero point detection path: It was found that any implementation would react to a failed check (zero flag set) with something that is much more visible in SCA than the flag itself (by executing the "else" branch). Therefore further hardening doesn't seem necessary.
- [x] add prim_and cells for blanking. Pirmin can help to create these cells. Michael to add the closed source version. See #11084
- [x]  check FIPS bit of EDN it and make it a recoverable alert, see #11914
- [x] Add repetition check for EDN data inside prim_edn_req. Make the error a recoverable alert. See #11914
- [x] Document type of PRNG used, See #12199
- [x] Switch on secure wipe feature, see #11842
- [x] @rswarbrick  to create an issue to track secure wipe bug: https://github.com/lowRISC/opentitan/issues/11091
- [x] @vogelpi  to review memory subsystem (see associated items in the notes)
- [x] Add prim_count for loop stack, use cross count if possible otherwise redundant count https://github.com/lowRISC/opentitan/pull/12485
- [x] Trigger fatal alert if OTBN imem/dmem access not granted (currently a [TODO in otbn.sv](https://github.com/lowRISC/opentitan/blob/f3ff88a9d3df10aa2aef2db208065bbfdb8acdb3/hw/ip/otbn/rtl/otbn.sv#L307-L308)) - #12229

From offline memory scrambling review:

- [x] Add prim_bufs around register-file entities, note this will come for free on the read side with the blanking (assuming we have prim_and inside the one-hot muxes)
- [x] Dmem window: add a SEC_CM label for that e.g. MEM.SW_UNREADABLE?
- [x] dmem/imem_rdata_bus signals are blanked to 0 whenever OTBN is busy to not leak instructions and data through bus - #12256
- [x] dmem/imem_rdata_bus signal blanking: Should probably use a prim_buf to not make synthesis optimize away the blanking - #12256
- [x] dmem/imem_rdata_bus signal blanking: Should probably add a SEC_CM label for that https://github.com/lowRISC/opentitan/pull/12986

From 2nd session:

- [x] Program counter: we should add counter duplication here.
- [x] Program counter: Investigate whether it makes sense to reuse the Ibex PC countermeasure for the OTBN PC as well.
- [x] Loop stack: ECC on addresses, we are adding cross/duplicate counters per loop. https://github.com/lowRISC/opentitan/pull/12485 https://github.com/lowRISC/opentitan/pull/12660
- [x] Call stack: use redundant counters for the r/w pointers. https://github.com/lowRISC/opentitan/pull/12467
- [x] Call stack: investigate whether it makes sense to add a depth crosscheck or an increment size check. https://github.com/lowRISC/opentitan/pull/12467
- [x] Call stack: add a check for push/pop signals (decode these in two different ways, and crosscheck them at the call stack). https://github.com/lowRISC/opentitan/pull/12467
- [x] URND: modify the reseed request signal in the internal FSM so that it is not being pulsed, but held high as long as the request is pending. Also check for spurious acks on that interface. - https://github.com/lowRISC/opentitan/pull/12474
  - [x] Add spurious ack check https://github.com/lowRISC/opentitan/pull/12669
- [x] URND: create an issue for examination of all req/ack interfaces, need to check whether additional check for spurious acks is needed on a per case basis. #11172
- [x] we should document that the narrow regfile is not protected with blanking.
- [x] zero the flags once op completes.
- [x] make sure that the OTP scrambling key holding register is reset to a RndCnst instead of all-zero. #11175
- [x] create an issue that captures the “memory window isolation via different scrambling keys” feature (future enhancement). #11171
- [x] Chris to sync spreadsheet to CMs

Other D2S requirements:
- [x] A couple of final decisions to make on the blanking implementation (https://github.com/lowRISC/opentitan/issues/12224)
- [x] BN.LID hardening (https://github.com/lowRISC/opentitan/issues/7888)
- [x] remove critical GPR and WDR registers from reset (https://github.com/lowRISC/opentitan/pull/13321, https://github.com/lowRISC/opentitan/pull/13192, https://github.com/lowRISC/opentitan/pull/13724)
- [x] Shrink scratchpad memory https://github.com/lowRISC/opentitan/pull/11026, work complete but PR needs rebasing.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `otbn_mac_bignum`.

- Do not change the ports of `otbn_mac_bignum` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/otbn_mac_bignum.v` | `hw/ip/otbn/rtl/otbn_mac_bignum.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/prim_and2.v` | (stand-in for `prim_and2`, see below) |
| `src/prim_blanker.v` | `hw/ip/prim/rtl/prim_blanker.sv` |
| `src/prim_secded_inv_39_32_dec.v` | `hw/ip/prim/rtl/prim_secded_inv_39_32_dec.sv` |
| `src/prim_secded_inv_39_32_enc.v` | `hw/ip/prim/rtl/prim_secded_inv_39_32_enc.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `otbn_mac_bignum` are the same as upstream.
Modules derived from a `prim_*` stand-in come from OpenTitan's generic implementation (`prim_generic_*`) with the module renamed.

## Grading

Your `otbn_mac_bignum` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/otbn_mac_bignum.v`. Only these files are graded.
Read-only (restored before grading): `src/prim_and2.v`, `src/prim_blanker.v`, `src/prim_secded_inv_39_32_dec.v`, `src/prim_secded_inv_39_32_enc.v`.

## Interface of `otbn_mac_bignum`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_ni` | in | 1 | reset, active low |
| `operation_i` | in | 521 |  |
| `mac_en_i` | in | 1 |  |
| `mac_commit_i` | in | 1 |  |
| `mac_predec_bignum_i` | in | 2 |  |
| `urnd_data_i` | in | 256 |  |
| `sec_wipe_acc_urnd_i` | in | 1 |  |
| `ispr_acc_wr_data_intg_i` | in | 312 |  |
| `ispr_acc_wr_en_i` | in | 1 |  |
| `operation_result_o` | out | 256 | |
| `operation_flags_o` | out | 4 | |
| `operation_flags_en_o` | out | 4 | |
| `operation_intg_violation_err_o` | out | 1 | |
| `predec_error_o` | out | 1 | |
| `ispr_acc_intg_o` | out | 312 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/otbn_mac_bignum.v src/prim_and2.v src/prim_blanker.v src/prim_secded_inv_39_32_dec.v src/prim_secded_inv_39_32_enc.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
