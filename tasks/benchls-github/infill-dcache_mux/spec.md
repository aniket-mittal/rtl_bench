# Fill in the masked region of `dcache_mux`

The file `dcache_mux.v` holds a Verilog design whose top module is `dcache_mux` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `dcache_mux`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-30.ultraembedded-riscv.

## Rules

- Edit only `dcache_mux.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `dcache_mux` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `dcache_mux.v`. Only these files are graded.

## Interface of `dcache_mux`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_i` | in | 1 | reset, active high |
| `mem_addr_i` | in | 32 |  |
| `mem_data_wr_i` | in | 32 |  |
| `mem_rd_i` | in | 1 |  |
| `mem_wr_i` | in | 4 |  |
| `mem_cacheable_i` | in | 1 |  |
| `mem_req_tag_i` | in | 11 |  |
| `mem_invalidate_i` | in | 1 |  |
| `mem_writeback_i` | in | 1 |  |
| `mem_flush_i` | in | 1 |  |
| `mem_cached_data_rd_i` | in | 32 |  |
| `mem_cached_accept_i` | in | 1 |  |
| `mem_cached_ack_i` | in | 1 |  |
| `mem_cached_error_i` | in | 1 |  |
| `mem_cached_resp_tag_i` | in | 11 |  |
| `mem_uncached_data_rd_i` | in | 32 |  |
| `mem_uncached_accept_i` | in | 1 |  |
| `mem_uncached_ack_i` | in | 1 |  |
| `mem_uncached_error_i` | in | 1 |  |
| `mem_uncached_resp_tag_i` | in | 11 |  |
| `mem_data_rd_o` | out | 32 | |
| `mem_accept_o` | out | 1 | |
| `mem_ack_o` | out | 1 | |
| `mem_error_o` | out | 1 | |
| `mem_resp_tag_o` | out | 11 | |
| `mem_cached_addr_o` | out | 32 | |
| `mem_cached_data_wr_o` | out | 32 | |
| `mem_cached_rd_o` | out | 1 | |
| `mem_cached_wr_o` | out | 4 | |
| `mem_cached_cacheable_o` | out | 1 | |
| `mem_cached_req_tag_o` | out | 11 | |
| `mem_cached_invalidate_o` | out | 1 | |
| `mem_cached_writeback_o` | out | 1 | |
| `mem_cached_flush_o` | out | 1 | |
| `mem_uncached_addr_o` | out | 32 | |
| `mem_uncached_data_wr_o` | out | 32 | |
| `mem_uncached_rd_o` | out | 1 | |
| `mem_uncached_wr_o` | out | 4 | |
| `mem_uncached_cacheable_o` | out | 1 | |
| `mem_uncached_req_tag_o` | out | 11 | |
| `mem_uncached_invalidate_o` | out | 1 | |
| `mem_uncached_writeback_o` | out | 1 | |
| `mem_uncached_flush_o` | out | 1 | |
| `cache_active_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dcache_mux.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
