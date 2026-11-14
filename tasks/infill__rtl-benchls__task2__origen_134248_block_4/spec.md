# Fill in the masked region of `origen_134248`

The file `origen_134248.v` holds a Verilog design whose top module is `origen_134248` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_134248`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_134248.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_134248` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_134248.v`. Only these files are graded.

## Interface of `origen_134248`

| port | dir | width | note |
|---|---|---|---|
| `m_axi_aclk` | in | 1 | clock, rising edge |
| `m_axi_aresetn` | in | 1 | reset, active low |
| `req_valid` | in | 1 |  |
| `req_address` | in | 32 |  |
| `req_last_burst_length` | in | 8 |  |
| `req_last_beat_bytes` | in | 3 |  |
| `enable` | in | 1 |  |
| `pause` | in | 1 |  |
| `sync_id` | in | 4 |  |
| `fifo_valid` | in | 1 |  |
| `fifo_data` | in | 64 |  |
| `response_ready` | in | 1 |  |
| `m_axi_awready` | in | 1 |  |
| `m_axi_wready` | in | 1 |  |
| `m_axi_bvalid` | in | 1 |  |
| `m_axi_bresp` | in | 2 |  |
| `req_ready` | out | 1 | |
| `enabled` | out | 1 | |
| `sync_id_ret` | out | 4 | |
| `response_valid` | out | 1 | |
| `response_resp` | out | 2 | |
| `response_resp_eot` | out | 1 | |
| `request_id` | out | 4 | |
| `response_id` | out | 4 | |
| `data_id` | out | 4 | |
| `address_id` | out | 4 | |
| `m_axi_awvalid` | out | 1 | |
| `m_axi_awaddr` | out | 32 | |
| `m_axi_awlen` | out | 8 | |
| `m_axi_awsize` | out | 3 | |
| `m_axi_awburst` | out | 2 | |
| `m_axi_awprot` | out | 3 | |
| `m_axi_awcache` | out | 4 | |
| `m_axi_wvalid` | out | 1 | |
| `m_axi_wdata` | out | 64 | |
| `m_axi_wstrb` | out | 8 | |
| `m_axi_wlast` | out | 1 | |
| `m_axi_bready` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_134248.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
