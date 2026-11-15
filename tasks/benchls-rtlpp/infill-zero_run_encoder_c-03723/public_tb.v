// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03723 dut (
    .clock(clk),
    .reset(in_vec[7:7]),
    .i_d(in_vec[6:4]),
    .sel_o_d(in_vec[3:3]),
    .sel_cnt(in_vec[2:1]),
    .i_b(in_vec[0:0]),
    .o_d(out_vec[6:3]),
    .f_start_i_eq_0(out_vec[2:2]),
    .f_zeros_i_eq_0(out_vec[1:1]),
    .f_zeros_t_cnt_eq_15(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'had;
    stim[1] = 8'hea;
    stim[2] = 8'h10;
    stim[3] = 8'h11;
    stim[4] = 8'h52;
    stim[5] = 8'h48;
    stim[6] = 8'h1d;
    stim[7] = 8'h20;
    stim[8] = 8'h18;
    stim[9] = 8'h60;
    stim[10] = 8'h7a;
    stim[11] = 8'h0b;
    stim[12] = 8'h23;
    stim[13] = 8'h66;
    stim[14] = 8'h5b;
    stim[15] = 8'h7d;
    stim[16] = 8'h77;
    stim[17] = 8'h06;
    stim[18] = 8'h11;
    stim[19] = 8'h41;
    stim[20] = 8'h2e;
    stim[21] = 8'h3c;
    stim[22] = 8'h12;
    stim[23] = 8'h29;
    stim[24] = 8'h34;
    stim[25] = 8'he3;
    stim[26] = 8'h31;
    stim[27] = 8'h50;
    stim[28] = 8'h6a;
    stim[29] = 8'h52;
    stim[30] = 8'h28;
    stim[31] = 8'h04;
    stim[32] = 8'h38;
    stim[33] = 8'h34;
    stim[34] = 8'h31;
    stim[35] = 8'h17;
    stim[36] = 8'h7f;
    stim[37] = 8'had;
    stim[38] = 8'h09;
    stim[39] = 8'h3c;
    stim[40] = 8'h6d;
    stim[41] = 8'h7b;
    stim[42] = 8'h2a;
    stim[43] = 8'hdf;
    stim[44] = 8'h03;
    stim[45] = 8'h4e;
    stim[46] = 8'h3a;
    stim[47] = 8'h3b;
    stim[48] = 8'h1f;
    stim[49] = 8'h24;
    stim[50] = 8'h2e;
    stim[51] = 8'h39;
    stim[52] = 8'h13;
    stim[53] = 8'h2f;
    stim[54] = 8'h67;
    stim[55] = 8'h6e;
    stim[56] = 8'h7d;
    stim[57] = 8'h07;
    stim[58] = 8'h6e;
    stim[59] = 8'h74;
    stim[60] = 8'h02;
    stim[61] = 8'h59;
    stim[62] = 8'h5a;
    stim[63] = 8'h08;
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
      expv[0] = 7'h08;
      expv[1] = 7'h08;
      expv[2] = 7'h0x;
      expv[3] = 7'h0x;
      expv[4] = 7'h0x;
      expv[5] = 7'h08;
      expv[6] = 7'h08;
      expv[7] = 7'h0x;
      expv[8] = 7'h08;
      expv[9] = 7'h0x;
      expv[10] = 7'h08;
      expv[11] = 7'h0e;
      expv[12] = 7'h0x;
      expv[13] = 7'h0x;
      expv[14] = 7'h08;
      expv[15] = 7'h08;
      expv[16] = 7'h0x;
      expv[17] = 7'h0x;
      expv[18] = 7'h0x;
      expv[19] = 7'h0x;
      expv[20] = 7'h08;
      expv[21] = 7'h08;
      expv[22] = 7'h0x;
      expv[23] = 7'h08;
      expv[24] = 7'h0x;
      expv[25] = 7'h0x;
      expv[26] = 7'h0x;
      expv[27] = 7'h0x;
      expv[28] = 7'h08;
      expv[29] = 7'h0x;
      expv[30] = 7'h08;
      expv[31] = 7'h0x;
      expv[32] = 7'h08;
      expv[33] = 7'h0x;
      expv[34] = 7'h0x;
      expv[35] = 7'h0x;
      expv[36] = 7'h08;
      expv[37] = 7'h08;
      expv[38] = 7'h0e;
      expv[39] = 7'h08;
      expv[40] = 7'h08;
      expv[41] = 7'h08;
      expv[42] = 7'h08;
      expv[43] = 7'h08;
      expv[44] = 7'h0x;
      expv[45] = 7'h08;
      expv[46] = 7'h08;
      expv[47] = 7'h08;
      expv[48] = 7'h08;
      expv[49] = 7'h0x;
      expv[50] = 7'h08;
      expv[51] = 7'h08;
      expv[52] = 7'h0x;
      expv[53] = 7'h08;
      expv[54] = 7'h0x;
      expv[55] = 7'h08;
      expv[56] = 7'h08;
      expv[57] = 7'h0x;
      expv[58] = 7'h08;
      expv[59] = 7'h0x;
      expv[60] = 7'h0x;
      expv[61] = 7'h08;
      expv[62] = 7'h08;
      expv[63] = 7'h0e;
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
