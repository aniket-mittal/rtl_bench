# Yosys parse status

Checked with `yosys -p "read_verilog -sv <files>; hierarchy -check; proc"` (Yosys from Homebrew, 2026-11-06).

| Collection | Result |
|---|---|
| verilog-uart | all files parse together |
| verilog-i2c | all files parse together |
| secworks-sha256 | all files parse together |
| secworks-aes | all files parse together |
| serv | all files parse together |
| picorv32 | parses |
| verilog-eval | 150 of 156 `_ref.sv` parse individually |
| basic_verilog | 49 of 68 modules parse individually |

## verilog-eval files Yosys rejects

Yosys refuses a latch inferred inside `always_comb`. The designs are valid SystemVerilog; use `read_verilog -sv -nolatches` or another tool if you need them.

Prob095_review2015_fsmshift_ref.sv, Prob096_review2015_fsmseq_ref.sv, Prob137_fsm_serial_ref.sv, Prob146_fsm_serialdata_ref.sv, Prob152_lemmings3_ref.sv, Prob155_lemmings4_ref.sv

## basic_verilog files Yosys rejects

Either SystemVerilog features Yosys does not support, or they need `clogb2.svh` included first.

ascii2hex.sv, axi4l_logger.sv, delay.sv, edge_detect.sv, fast_counter.sv, pattern_detect.sv, priority_enc.sv, round_robin_enc.sv, round_robin_performance_enc.sv, sim_clk_gen.sv, spi_master.sv, uart_rx_shifter.sv, uart_rx.sv, uart_tx_shifter.sv, uart_tx.sv, debounce_v1.v, pack_unpack_array.v, uart_rx.v, uart_tx.v
