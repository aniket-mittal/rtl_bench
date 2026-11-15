// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_102279 dut (
    .clk(clk),
    .nrst(in_vec[13:13]),
    .i_tindex(in_vec[12:8]),
    .i_rindex(in_vec[7:3]),
    .i_path(in_vec[2:1]),
    .i_outena(in_vec[0:0]),
    .o_ena0(out_vec[12:12]),
    .o_ena1(out_vec[11:11]),
    .o_ena2(out_vec[10:10]),
    .o_index(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3409;
    stim[1] = 14'h20ae;
    stim[2] = 14'h1108;
    stim[3] = 14'h185f;
    stim[4] = 14'h1f1b;
    stim[5] = 14'h0664;
    stim[6] = 14'h0524;
    stim[7] = 14'h02c7;
    stim[8] = 14'h1eea;
    stim[9] = 14'h05ec;
    stim[10] = 14'h1a5d;
    stim[11] = 14'h1465;
    stim[12] = 14'h048c;
    stim[13] = 14'h1b06;
    stim[14] = 14'h1e05;
    stim[15] = 14'h16f1;
    stim[16] = 14'h007e;
    stim[17] = 14'h0baa;
    stim[18] = 14'h113f;
    stim[19] = 14'h1126;
    stim[20] = 14'h07bb;
    stim[21] = 14'h03f7;
    stim[22] = 14'h1d06;
    stim[23] = 14'h19d7;
    stim[24] = 14'h192e;
    stim[25] = 14'h1826;
    stim[26] = 14'h06f5;
    stim[27] = 14'h1138;
    stim[28] = 14'h1c4f;
    stim[29] = 14'h0525;
    stim[30] = 14'h1e8b;
    stim[31] = 14'h27be;
    stim[32] = 14'h1df3;
    stim[33] = 14'h05c8;
    stim[34] = 14'h102c;
    stim[35] = 14'h0368;
    stim[36] = 14'h1923;
    stim[37] = 14'h1164;
    stim[38] = 14'h1525;
    stim[39] = 14'h0c77;
    stim[40] = 14'h0adf;
    stim[41] = 14'h1a57;
    stim[42] = 14'h1758;
    stim[43] = 14'h185b;
    stim[44] = 14'h0949;
    stim[45] = 14'h0723;
    stim[46] = 14'h08a7;
    stim[47] = 14'h181e;
    stim[48] = 14'h3227;
    stim[49] = 14'h07b9;
    stim[50] = 14'h04ff;
    stim[51] = 14'h0536;
    stim[52] = 14'h0769;
    stim[53] = 14'h177a;
    stim[54] = 14'h185f;
    stim[55] = 14'h174c;
    stim[56] = 14'h1451;
    stim[57] = 14'h10e6;
    stim[58] = 14'h09d6;
    stim[59] = 14'h0856;
    stim[60] = 14'h02da;
    stim[61] = 14'h0577;
    stim[62] = 14'h01f8;
    stim[63] = 14'h0f07;
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
      expv[0] = 13'h03ff;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h03ff;
      expv[4] = 13'h03ff;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h03ff;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h03ff;
      expv[11] = 13'h03ff;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h03ff;
      expv[15] = 13'h03ff;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h03ff;
      expv[19] = 13'h0000;
      expv[20] = 13'h03ff;
      expv[21] = 13'h03ff;
      expv[22] = 13'h0000;
      expv[23] = 13'h03ff;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h03ff;
      expv[27] = 13'h0000;
      expv[28] = 13'h03ff;
      expv[29] = 13'h03ff;
      expv[30] = 13'h03ff;
      expv[31] = 13'h0000;
      expv[32] = 13'h03ff;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h03ff;
      expv[37] = 13'h0000;
      expv[38] = 13'h03ff;
      expv[39] = 13'h03ff;
      expv[40] = 13'h03ff;
      expv[41] = 13'h03ff;
      expv[42] = 13'h0000;
      expv[43] = 13'h03ff;
      expv[44] = 13'h03ff;
      expv[45] = 13'h03ff;
      expv[46] = 13'h03ff;
      expv[47] = 13'h0000;
      expv[48] = 13'h03ff;
      expv[49] = 13'h03ff;
      expv[50] = 13'h03ff;
      expv[51] = 13'h0000;
      expv[52] = 13'h03ff;
      expv[53] = 13'h0000;
      expv[54] = 13'h03ff;
      expv[55] = 13'h0000;
      expv[56] = 13'h03ff;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h03ff;
      expv[62] = 13'h0000;
      expv[63] = 13'h03ff;
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
