# Fix GitHub issue #11576 in `lowRISC/opentitan`

This task comes from a real bug report against the open-source repository `lowRISC/opentitan`. You get the repository's RTL as it was when the bug was reported (commit `b465ef9965c0`), trimmed to the files needed to elaborate the module `tlul_cmd_intg_gen`. The code was mechanically converted from SystemVerilog to plain Verilog-2005 with sv2v, so it reads differently from the upstream sources (see Files).

## Bug report

**Title:** [tlul_intg_chk] Should unselected byte lanes of `a_data` be masked before ECC computation

**Description:**

The tlul cmd intg gen module masks the unused byte lanes in `a_data` when computing the integrity ECC bits. This means, if the host writes garbage onto the unselected data byte lanes, those do not affect the value of the intg bits.
https://github.com/lowRISC/opentitan/blob/834bbe5fc65fe32742b86be6fe22e81242219289/hw/ip/tlul/rtl/tlul_cmd_intg_gen.sv#L41

The tlul intg gen module also masks `a_data` appropriately, so that when the device checks the intg, the computation matches:
https://github.com/lowRISC/opentitan/blob/834bbe5fc65fe32742b86be6fe22e81242219289/hw/ip/tlul/rtl/tlul_cmd_intg_gen.sv#L51

This obviates the need for the intg chk module to mask the data bits, when computing the expected intg value to report intg errors:
https://github.com/lowRISC/opentitan/blob/master/hw/ip/tlul/rtl/tlul_cmd_intg_chk.sv

In simulations, however, we drive the TLUL host traffic using our agent. So we have the liberty to control the `a_data` bits (as well as the intg bits). Ideally, there should be no side-effects from the design, when injecting X's (to model dont-care bits) into unselected byte-lanes of `a_data`. Unfortunately, since the `tlul_cmd_intg_chk` itself does not mask the `a_data` bits before comparison, the injected Xs end up propagating everywhere - so the design is indeed affected by the don't care bits not being set to 0.

The question to  ask is - what should happen when faults are injected onto don't care `a_data` bits? Do we want an alert to fire whether or not, the `a_data` bits are selected or not? Given that our entire SW interface is publicly visible, it does not seem useful to do so.

By having `tlul_cmd_intg_chk` module also mask the unused `a_data` bits when computing ECC for comparison, it gives us chance in simulation to verify that the downstream logic (i.e. the TLUL device's internals) are also similarly unperturbed by garbage on don't care `a_data` bits (which, surprisingly has not been tested so far!).

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `tlul_cmd_intg_gen`.

- Do not change the ports of `tlul_cmd_intg_gen` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/tlul_cmd_intg_gen.v` | `hw/ip/tlul/rtl/tlul_cmd_intg_gen.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `src/prim_secded_inv_39_32_enc.v` | `hw/ip/prim/rtl/prim_secded_inv_39_32_enc.sv` |
| `src/prim_secded_inv_64_57_enc.v` | `hw/ip/prim/rtl/prim_secded_inv_64_57_enc.sv` |

The upstream SystemVerilog was converted to Verilog-2005 with sv2v 0.0.13 (one file per module under `rtl/src/`, named after the module), because Yosys and iverilog cannot read it directly. The conversion is mechanical and keeps behavior, but changes how the code reads: packages are gone (their parameters, types and functions are inlined into the modules that use them), structs, enums and other typedefs become plain bit vectors with the field selects written as bit ranges, `logic` becomes `wire`/`reg`, `always_comb`/`always_ff` become `always`, interfaces and modules with type parameters are flattened or specialized (a specialized copy is named `<module>_<hash>`), and comments and `include`/`define` directives are not kept. Fix the bug in this converted code; port names and widths of `tlul_cmd_intg_gen` are the same as upstream.

## Grading

Your `tlul_cmd_intg_gen` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/tlul_cmd_intg_gen.v`. Only these files are graded.
Read-only (restored before grading): `src/prim_secded_inv_39_32_enc.v`, `src/prim_secded_inv_64_57_enc.v`.

## Interface of `tlul_cmd_intg_gen`

| port | dir | width | note |
|---|---|---|---|
| `tl_i` | in | 109 |  |
| `tl_o` | out | 109 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/tlul_cmd_intg_gen.v src/prim_secded_inv_39_32_enc.v src/prim_secded_inv_64_57_enc.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
