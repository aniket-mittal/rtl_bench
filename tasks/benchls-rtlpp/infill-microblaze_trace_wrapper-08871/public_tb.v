// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 288;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08871 dut (
    .Clk(clk),
    .Reset(in_vec[33:33]),
    .IO_read_data(in_vec[32:1]),
    .IO_ready(in_vec[0:0]),
    .TRACE_data_access(out_vec[287:287]),
    .TRACE_data_address(out_vec[286:255]),
    .TRACE_data_byte_enable(out_vec[254:251]),
    .TRACE_data_read(out_vec[250:250]),
    .TRACE_data_write(out_vec[249:249]),
    .TRACE_data_write_value(out_vec[248:217]),
    .TRACE_dcache_hit(out_vec[216:216]),
    .TRACE_dcache_rdy(out_vec[215:215]),
    .TRACE_dcache_read(out_vec[214:214]),
    .TRACE_dcache_req(out_vec[213:213]),
    .TRACE_delay_slot(out_vec[212:212]),
    .TRACE_ex_piperun(out_vec[211:211]),
    .TRACE_exception_kind(out_vec[210:206]),
    .TRACE_exception_taken(out_vec[205:205]),
    .TRACE_icache_hit(out_vec[204:204]),
    .TRACE_icache_rdy(out_vec[203:203]),
    .TRACE_icache_req(out_vec[202:202]),
    .TRACE_instruction(out_vec[201:170]),
    .TRACE_jump_hit(out_vec[169:169]),
    .TRACE_jump_taken(out_vec[168:168]),
    .TRACE_mb_halted(out_vec[167:167]),
    .TRACE_mem_piperun(out_vec[166:166]),
    .TRACE_msr_reg(out_vec[165:151]),
    .TRACE_new_reg_value(out_vec[150:119]),
    .TRACE_of_piperun(out_vec[118:118]),
    .TRACE_pc(out_vec[117:86]),
    .TRACE_pid_reg(out_vec[85:78]),
    .TRACE_reg_addr(out_vec[77:73]),
    .TRACE_reg_write(out_vec[72:72]),
    .TRACE_valid_instr(out_vec[71:71]),
    .IO_addr_strobe(out_vec[70:70]),
    .IO_address(out_vec[69:38]),
    .IO_byte_enable(out_vec[37:34]),
    .IO_read_strobe(out_vec[33:33]),
    .IO_write_data(out_vec[32:1]),
    .IO_write_strobe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3a1eef22e;
    stim[1] = 34'h2b95ea653;
    stim[2] = 34'h045ec78db;
    stim[3] = 34'h01fda67f8;
    stim[4] = 34'h028449e2b;
    stim[5] = 34'h13e7b5a40;
    stim[6] = 34'h1d6eb78b3;
    stim[7] = 34'h0728db013;
    stim[8] = 34'h148f09ec1;
    stim[9] = 34'h06d502e3e;
    stim[10] = 34'h1ecb576c0;
    stim[11] = 34'h016b3220f;
    stim[12] = 34'h16fb95bde;
    stim[13] = 34'h0f1fda5e9;
    stim[14] = 34'h172e6726a;
    stim[15] = 34'h07c40b218;
    stim[16] = 34'h1151356b6;
    stim[17] = 34'h0f4e879c5;
    stim[18] = 34'h049405e41;
    stim[19] = 34'h1de156386;
    stim[20] = 34'h14dd0a130;
    stim[21] = 34'h0e11d1d7c;
    stim[22] = 34'h0cecedf8a;
    stim[23] = 34'h063a26b7f;
    stim[24] = 34'h0a827c1a8;
    stim[25] = 34'h0228d6cd9;
    stim[26] = 34'h13b786abf;
    stim[27] = 34'h24f054b10;
    stim[28] = 34'h028f02519;
    stim[29] = 34'h1ff265ec4;
    stim[30] = 34'h12afdd2a9;
    stim[31] = 34'h03fec47ff;
    stim[32] = 34'h1e5e2ded4;
    stim[33] = 34'h07a947d88;
    stim[34] = 34'h0ffacb1d3;
    stim[35] = 34'h19bcad700;
    stim[36] = 34'h08a5d1b62;
    stim[37] = 34'h1c6861625;
    stim[38] = 34'h0cca4475e;
    stim[39] = 34'h1bc9cbc1e;
    stim[40] = 34'h0b77f15a8;
    stim[41] = 34'h0f3feaeee;
    stim[42] = 34'h0528efab5;
    stim[43] = 34'h0fffd3039;
    stim[44] = 34'h1492db3e4;
    stim[45] = 34'h1bc48a586;
    stim[46] = 34'h0edd994f7;
    stim[47] = 34'h0eb05de79;
    stim[48] = 34'h0d99dde5f;
    stim[49] = 34'h008bc8c86;
    stim[50] = 34'h0a42b3726;
    stim[51] = 34'h0a660351b;
    stim[52] = 34'h1e95723d2;
    stim[53] = 34'h1d3d097cf;
    stim[54] = 34'h16590369d;
    stim[55] = 34'h07dd4e94b;
    stim[56] = 34'h1e307a434;
    stim[57] = 34'h1cea14505;
    stim[58] = 34'h10ed61b04;
    stim[59] = 34'h1207974fb;
    stim[60] = 34'h31e339d0d;
    stim[61] = 34'h0b8a5e4c7;
    stim[62] = 34'h179fd503c;
    stim[63] = 34'h02a503ef7;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[1] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[2] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[3] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[4] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[5] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[6] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[7] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[8] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[9] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[10] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[11] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[12] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[13] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[14] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[15] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[16] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[17] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[18] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[19] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[20] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[21] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[22] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[23] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[24] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[25] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[26] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[27] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[28] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[29] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[30] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[31] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[32] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[33] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[34] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[35] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[36] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[37] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[38] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[39] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[40] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[41] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[42] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[43] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[44] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[45] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[46] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[47] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[48] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[49] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[50] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[51] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[52] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[53] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[54] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[55] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[56] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[57] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[58] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[59] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[60] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[61] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[62] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      expv[63] = 288'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000xxxxxxxxxxxxxxxxx00xxxxxxxxxxxxxxxxxxx;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
