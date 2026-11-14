// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .d(in_vec[8:1]),
    .areset(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h17b;
    stim[1] = 9'h167;
    stim[2] = 9'h162;
    stim[3] = 9'h078;
    stim[4] = 9'h0dc;
    stim[5] = 9'h020;
    stim[6] = 9'h0c6;
    stim[7] = 9'h18a;
    stim[8] = 9'h18a;
    stim[9] = 9'h1bc;
    stim[10] = 9'h024;
    stim[11] = 9'h1c4;
    stim[12] = 9'h158;
    stim[13] = 9'h196;
    stim[14] = 9'h02e;
    stim[15] = 9'h016;
    stim[16] = 9'h00c;
    stim[17] = 9'h038;
    stim[18] = 9'h120;
    stim[19] = 9'h0fc;
    stim[20] = 9'h124;
    stim[21] = 9'h012;
    stim[22] = 9'h11c;
    stim[23] = 9'h1ee;
    stim[24] = 9'h142;
    stim[25] = 9'h09c;
    stim[26] = 9'h0a2;
    stim[27] = 9'h09c;
    stim[28] = 9'h0c8;
    stim[29] = 9'h103;
    stim[30] = 9'h040;
    stim[31] = 9'h07e;
    stim[32] = 9'h1e2;
    stim[33] = 9'h1f4;
    stim[34] = 9'h1dc;
    stim[35] = 9'h0eb;
    stim[36] = 9'h1b2;
    stim[37] = 9'h164;
    stim[38] = 9'h140;
    stim[39] = 9'h182;
    stim[40] = 9'h038;
    stim[41] = 9'h044;
    stim[42] = 9'h12a;
    stim[43] = 9'h178;
    stim[44] = 9'h180;
    stim[45] = 9'h16e;
    stim[46] = 9'h0d2;
    stim[47] = 9'h0b2;
    stim[48] = 9'h0be;
    stim[49] = 9'h018;
    stim[50] = 9'h060;
    stim[51] = 9'h094;
    stim[52] = 9'h0a2;
    stim[53] = 9'h03e;
    stim[54] = 9'h048;
    stim[55] = 9'h088;
    stim[56] = 9'h010;
    stim[57] = 9'h1a2;
    stim[58] = 9'h0a4;
    stim[59] = 9'h160;
    stim[60] = 9'h182;
    stim[61] = 9'h138;
    stim[62] = 9'h0a8;
    stim[63] = 9'h10a;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h1b;
      expv[4] = 8'hc3;
      expv[5] = 8'he6;
      expv[6] = 8'h01;
      expv[7] = 8'h36;
      expv[8] = 8'h5c;
      expv[9] = 8'h5c;
      expv[10] = 8'hed;
      expv[11] = 8'h21;
      expv[12] = 8'h2e;
      expv[13] = 8'hca;
      expv[14] = 8'hbc;
      expv[15] = 8'h71;
      expv[16] = 8'hb0;
      expv[17] = 8'h60;
      expv[18] = 8'hc1;
      expv[19] = 8'h09;
      expv[20] = 8'he7;
      expv[21] = 8'h29;
      expv[22] = 8'h90;
      expv[23] = 8'he8;
      expv[24] = 8'h7f;
      expv[25] = 8'h1a;
      expv[26] = 8'he4;
      expv[27] = 8'h15;
      expv[28] = 8'he4;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h02;
      expv[32] = 8'hf3;
      expv[33] = 8'h1f;
      expv[34] = 8'haf;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h9d;
      expv[38] = 8'h2b;
      expv[39] = 8'h0a;
      expv[40] = 8'h1c;
      expv[41] = 8'hc1;
      expv[42] = 8'h22;
      expv[43] = 8'h59;
      expv[44] = 8'hcb;
      expv[45] = 8'h0c;
      expv[46] = 8'h7b;
      expv[47] = 8'h96;
      expv[48] = 8'h95;
      expv[49] = 8'hf5;
      expv[50] = 8'hc0;
      expv[51] = 8'h03;
      expv[52] = 8'ha4;
      expv[53] = 8'h15;
      expv[54] = 8'hf1;
      expv[55] = 8'h42;
      expv[56] = 8'h44;
      expv[57] = 8'h80;
      expv[58] = 8'h1d;
      expv[59] = 8'h25;
      expv[60] = 8'h0b;
      expv[61] = 8'h1c;
      expv[62] = 8'hc9;
      expv[63] = 8'h45;
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
