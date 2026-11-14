# Fix GitHub issue #46 in `lowRISC/ibex`

This task comes from a real bug report against the open-source repository `lowRISC/ibex`. You get the repository's RTL as it was when the bug was reported (commit `145269fdc88e`), trimmed to the files needed to elaborate the module `ibex_compressed_decoder`.

## Bug report

**Title:** Decode HINT as NOP

**Description:**

The core fetched an compressed instruction like below.

From a downstream bug report:

core   0: 0xffffffff8000f2ec (0x00009056) add     zero, zero, s5

0x9056 is correctly decoded as HINT instruction by spike, but ibex decode it as illegal C.EBREAK instruction:

https://github.com/lowRISC/stwg-base/blob/master/hw/vendor/lowrisc_ibex/rtl/ibex_compressed_decoder.sv#L215

```
              if (instr_i[11:7] == 5'b0) begin
                // c.ebreak -> ebreak
                instr_o = {32'h00_10_00_73};
                if (instr_i[6:2] != 5'b0) illegal_instr_o = 1'b1;
```

This code first checks if instr[11:7] is zero to determine if it's c.ebreak instruction, then check instr[6:2] to see if it's illegal. However, when instr[6:2] == 0 and instr_i[11:7] != 0, it should be treated as HINT instruction rather than illegal instruction.

## Your job

Fix the editable file(s) so that the problem described in the bug report is resolved. The design is graded at the module `ibex_compressed_decoder`.

- Do not change the ports of `ibex_compressed_decoder` (names, directions, widths) or its parameters.
- Make the smallest change that fixes the reported problem. Do not refactor or change unrelated behavior: everything the report does not mention must keep working exactly as it does now.
- The code must still compile in iverilog (`-g2012`) and Yosys (`read_verilog -sv`).

## Files

Editable (path in this task | path in the repository):

| task path | repository path |
|---|---|
| `src/ibex_compressed_decoder.sv` | `rtl/ibex_compressed_decoder.sv` |

Read-only support files (changes to these are discarded at grading):

| task path | repository path |
|---|---|
| `pkg/00_ibex_defines.sv` | `rtl/ibex_defines.sv` |

Packages are under `rtl/pkg/` with a numeric prefix so that they compile before the files that use them.
Module files are under `rtl/src/`.
For tool compatibility the files were normalized mechanically, without changing behavior: `import` statements inside modules were moved to file scope just before the module.

## Grading

Your `ibex_compressed_decoder` is simulated against the repository's own fix for this issue and checked for formal equivalence with it. Only behavior at the ports of the top module counts; your code does not have to match the upstream fix textually.

---

## Files

Edit: `src/ibex_compressed_decoder.sv`. Only these files are graded.
Read-only (restored before grading): `pkg/00_ibex_defines.sv`.

## Interface of `ibex_compressed_decoder`

| port | dir | width | note |
|---|---|---|---|
| `instr_i` | in | 32 |  |
| `instr_o` | out | 32 | |
| `is_compressed_o` | out | 1 | |
| `illegal_instr_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v src/ibex_compressed_decoder.sv pkg/00_ibex_defines.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
