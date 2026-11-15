// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06509 dut (
    .CLK_RX(clk),
    .RST(in_vec[2:2]),
    .MKD_RX(in_vec[1:1]),
    .DATA_RX(in_vec[0:0]),
    .WRITE(out_vec[17:17]),
    .FRAME_START(out_vec[16:16]),
    .DATA(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h7;
    stim[1] = 3'h4;
    stim[2] = 3'h3;
    stim[3] = 3'h1;
    stim[4] = 3'h3;
    stim[5] = 3'h0;
    stim[6] = 3'h1;
    stim[7] = 3'h0;
    stim[8] = 3'h2;
    stim[9] = 3'h1;
    stim[10] = 3'h1;
    stim[11] = 3'h0;
    stim[12] = 3'h0;
    stim[13] = 3'h1;
    stim[14] = 3'h1;
    stim[15] = 3'h3;
    stim[16] = 3'h2;
    stim[17] = 3'h0;
    stim[18] = 3'h1;
    stim[19] = 3'h2;
    stim[20] = 3'h2;
    stim[21] = 3'h0;
    stim[22] = 3'h2;
    stim[23] = 3'h2;
    stim[24] = 3'h2;
    stim[25] = 3'h0;
    stim[26] = 3'h2;
    stim[27] = 3'h1;
    stim[28] = 3'h3;
    stim[29] = 3'h1;
    stim[30] = 3'h0;
    stim[31] = 3'h2;
    stim[32] = 3'h3;
    stim[33] = 3'h3;
    stim[34] = 3'h3;
    stim[35] = 3'h1;
    stim[36] = 3'h3;
    stim[37] = 3'h0;
    stim[38] = 3'h2;
    stim[39] = 3'h1;
    stim[40] = 3'h2;
    stim[41] = 3'h1;
    stim[42] = 3'h3;
    stim[43] = 3'h0;
    stim[44] = 3'h3;
    stim[45] = 3'h3;
    stim[46] = 3'h0;
    stim[47] = 3'h3;
    stim[48] = 3'h3;
    stim[49] = 3'h0;
    stim[50] = 3'h0;
    stim[51] = 3'h2;
    stim[52] = 3'h1;
    stim[53] = 3'h0;
    stim[54] = 3'h1;
    stim[55] = 3'h1;
    stim[56] = 3'h1;
    stim[57] = 3'h0;
    stim[58] = 3'h3;
    stim[59] = 3'h2;
    stim[60] = 3'h2;
    stim[61] = 3'h3;
    stim[62] = 3'h2;
    stim[63] = 3'h0;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxdxxx;
      expv[5] = 18'hxexxx;
      expv[6] = 18'hx7xxx;
      expv[7] = 18'hxbxxx;
      expv[8] = 18'hx5dxx;
      expv[9] = 18'hx2exx;
      expv[10] = 18'hx97xx;
      expv[11] = 18'hxcbxx;
      expv[12] = 18'hx65dx;
      expv[13] = 18'hx32ex;
      expv[14] = 18'h0997x;
      expv[15] = 18'h0ccbx;
      expv[16] = 18'h0e65d;
      expv[17] = 18'h0732e;
      expv[18] = 18'h03997;
      expv[19] = 18'h09ccb;
      expv[20] = 18'h04e65;
      expv[21] = 18'h02732;
      expv[22] = 18'h01399;
      expv[23] = 18'h009cc;
      expv[24] = 18'h004e6;
      expv[25] = 18'h00273;
      expv[26] = 18'h00139;
      expv[27] = 18'h0009c;
      expv[28] = 18'h0804e;
      expv[29] = 18'h0c027;
      expv[30] = 18'h0e013;
      expv[31] = 18'h07009;
      expv[32] = 18'h03804;
      expv[33] = 18'h09c02;
      expv[34] = 18'h0ce01;
      expv[35] = 18'h0e700;
      expv[36] = 18'h0f380;
      expv[37] = 18'h0f9c0;
      expv[38] = 18'h07ce0;
      expv[39] = 18'h03e70;
      expv[40] = 18'h09f38;
      expv[41] = 18'h04f9c;
      expv[42] = 18'h0a7ce;
      expv[43] = 18'h0d3e7;
      expv[44] = 18'h069f3;
      expv[45] = 18'h0b4f9;
      expv[46] = 18'h0da7c;
      expv[47] = 18'h36d3e;
      expv[48] = 18'h0b69f;
      expv[49] = 18'h0db4f;
      expv[50] = 18'h06da7;
      expv[51] = 18'h036d3;
      expv[52] = 18'h01b69;
      expv[53] = 18'h08db4;
      expv[54] = 18'h046da;
      expv[55] = 18'h0a36d;
      expv[56] = 18'h0d1b6;
      expv[57] = 18'h0e8db;
      expv[58] = 18'h0746d;
      expv[59] = 18'h0ba36;
      expv[60] = 18'h05d1b;
      expv[61] = 18'h02e8d;
      expv[62] = 18'h09746;
      expv[63] = 18'h24ba3;
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
