// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_102778 dut (
    .i_BCLK(clk),
    .i_rst(in_vec[6:6]),
    .i_stop(in_vec[5:5]),
    .i_playpause(in_vec[4:4]),
    .i_record(in_vec[3:3]),
    .i_LRC(in_vec[2:2]),
    .i_DAT(in_vec[1:1]),
    .i_Memory_full_flag(in_vec[0:0]),
    .sram_start(out_vec[19:19]),
    .o_reset_all_sram_addr(out_vec[18:18]),
    .o_sram_data(out_vec[17:2]),
    .state_denote(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h75;
    stim[1] = 7'h4b;
    stim[2] = 7'h08;
    stim[3] = 7'h2f;
    stim[4] = 7'h22;
    stim[5] = 7'h0e;
    stim[6] = 7'h2b;
    stim[7] = 7'h18;
    stim[8] = 7'h39;
    stim[9] = 7'h30;
    stim[10] = 7'h03;
    stim[11] = 7'h14;
    stim[12] = 7'h03;
    stim[13] = 7'h30;
    stim[14] = 7'h29;
    stim[15] = 7'h09;
    stim[16] = 7'h65;
    stim[17] = 7'h2f;
    stim[18] = 7'h25;
    stim[19] = 7'h3c;
    stim[20] = 7'h1e;
    stim[21] = 7'h09;
    stim[22] = 7'h3c;
    stim[23] = 7'h15;
    stim[24] = 7'h35;
    stim[25] = 7'h1b;
    stim[26] = 7'h3a;
    stim[27] = 7'h06;
    stim[28] = 7'h13;
    stim[29] = 7'h3b;
    stim[30] = 7'h28;
    stim[31] = 7'h00;
    stim[32] = 7'h3a;
    stim[33] = 7'h0b;
    stim[34] = 7'h18;
    stim[35] = 7'h1f;
    stim[36] = 7'h19;
    stim[37] = 7'h24;
    stim[38] = 7'h0a;
    stim[39] = 7'h3c;
    stim[40] = 7'h20;
    stim[41] = 7'h09;
    stim[42] = 7'h3a;
    stim[43] = 7'h19;
    stim[44] = 7'h1c;
    stim[45] = 7'h2e;
    stim[46] = 7'h18;
    stim[47] = 7'h0b;
    stim[48] = 7'h2b;
    stim[49] = 7'h3f;
    stim[50] = 7'h07;
    stim[51] = 7'h00;
    stim[52] = 7'h07;
    stim[53] = 7'h36;
    stim[54] = 7'h28;
    stim[55] = 7'h14;
    stim[56] = 7'h07;
    stim[57] = 7'h2b;
    stim[58] = 7'h05;
    stim[59] = 7'h0e;
    stim[60] = 7'h31;
    stim[61] = 7'h3e;
    stim[62] = 7'h23;
    stim[63] = 7'h20;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'h40000;
      expv[2] = 20'h40000;
      expv[3] = 20'h40000;
      expv[4] = 20'h40000;
      expv[5] = 20'h40000;
      expv[6] = 20'h40000;
      expv[7] = 20'h40000;
      expv[8] = 20'h40000;
      expv[9] = 20'h00001;
      expv[10] = 20'h40000;
      expv[11] = 20'h40000;
      expv[12] = 20'h40000;
      expv[13] = 20'h40000;
      expv[14] = 20'h40000;
      expv[15] = 20'h40000;
      expv[16] = 20'h40000;
      expv[17] = 20'h40000;
      expv[18] = 20'h40000;
      expv[19] = 20'h40000;
      expv[20] = 20'h40000;
      expv[21] = 20'h40000;
      expv[22] = 20'h00001;
      expv[23] = 20'h00002;
      expv[24] = 20'h40000;
      expv[25] = 20'h40000;
      expv[26] = 20'h40000;
      expv[27] = 20'h00001;
      expv[28] = 20'h40000;
      expv[29] = 20'h40000;
      expv[30] = 20'h40000;
      expv[31] = 20'h40000;
      expv[32] = 20'h40000;
      expv[33] = 20'h40000;
      expv[34] = 20'h40000;
      expv[35] = 20'h40000;
      expv[36] = 20'h00001;
      expv[37] = 20'h00002;
      expv[38] = 20'h00002;
      expv[39] = 20'h40000;
      expv[40] = 20'h40000;
      expv[41] = 20'h40000;
      expv[42] = 20'h40000;
      expv[43] = 20'h40000;
      expv[44] = 20'h40000;
      expv[45] = 20'h00001;
      expv[46] = 20'h00002;
      expv[47] = 20'h40000;
      expv[48] = 20'h00001;
      expv[49] = 20'h00002;
      expv[50] = 20'h40000;
      expv[51] = 20'h40000;
      expv[52] = 20'h40000;
      expv[53] = 20'h40000;
      expv[54] = 20'h40000;
      expv[55] = 20'h40000;
      expv[56] = 20'h40000;
      expv[57] = 20'h40000;
      expv[58] = 20'h40000;
      expv[59] = 20'h40000;
      expv[60] = 20'h40000;
      expv[61] = 20'h40000;
      expv[62] = 20'h40000;
      expv[63] = 20'h40000;
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
