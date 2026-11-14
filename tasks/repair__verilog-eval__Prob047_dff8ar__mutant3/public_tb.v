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
    stim[0] = 9'h107;
    stim[1] = 9'h04d;
    stim[2] = 9'h09c;
    stim[3] = 9'h120;
    stim[4] = 9'h1e4;
    stim[5] = 9'h142;
    stim[6] = 9'h1a0;
    stim[7] = 9'h103;
    stim[8] = 9'h014;
    stim[9] = 9'h1c0;
    stim[10] = 9'h1f6;
    stim[11] = 9'h1bf;
    stim[12] = 9'h19c;
    stim[13] = 9'h054;
    stim[14] = 9'h162;
    stim[15] = 9'h160;
    stim[16] = 9'h006;
    stim[17] = 9'h12a;
    stim[18] = 9'h1f0;
    stim[19] = 9'h13a;
    stim[20] = 9'h1b6;
    stim[21] = 9'h182;
    stim[22] = 9'h080;
    stim[23] = 9'h132;
    stim[24] = 9'h018;
    stim[25] = 9'h1fa;
    stim[26] = 9'h138;
    stim[27] = 9'h1f4;
    stim[28] = 9'h05e;
    stim[29] = 9'h116;
    stim[30] = 9'h10c;
    stim[31] = 9'h0f0;
    stim[32] = 9'h0ce;
    stim[33] = 9'h1b8;
    stim[34] = 9'h100;
    stim[35] = 9'h178;
    stim[36] = 9'h18a;
    stim[37] = 9'h0b0;
    stim[38] = 9'h140;
    stim[39] = 9'h182;
    stim[40] = 9'h1b8;
    stim[41] = 9'h0da;
    stim[42] = 9'h03e;
    stim[43] = 9'h1e6;
    stim[44] = 9'h1ba;
    stim[45] = 9'h064;
    stim[46] = 9'h12a;
    stim[47] = 9'h1e0;
    stim[48] = 9'h00a;
    stim[49] = 9'h052;
    stim[50] = 9'h018;
    stim[51] = 9'h006;
    stim[52] = 9'h16c;
    stim[53] = 9'h178;
    stim[54] = 9'h19c;
    stim[55] = 9'h0ca;
    stim[56] = 9'h17a;
    stim[57] = 9'h166;
    stim[58] = 9'h174;
    stim[59] = 9'h032;
    stim[60] = 9'h07e;
    stim[61] = 9'h124;
    stim[62] = 9'h074;
    stim[63] = 9'h1ac;
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
      expv[3] = 8'h4e;
      expv[4] = 8'h90;
      expv[5] = 8'hf2;
      expv[6] = 8'ha0;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h0a;
      expv[10] = 8'he0;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'hce;
      expv[14] = 8'h2a;
      expv[15] = 8'hb0;
      expv[16] = 8'hb0;
      expv[17] = 8'h02;
      expv[18] = 8'h94;
      expv[19] = 8'hf8;
      expv[20] = 8'h9c;
      expv[21] = 8'hda;
      expv[22] = 8'hc0;
      expv[23] = 8'h40;
      expv[24] = 8'h98;
      expv[25] = 8'h0c;
      expv[26] = 8'hfc;
      expv[27] = 8'h9c;
      expv[28] = 8'hfa;
      expv[29] = 8'h2e;
      expv[30] = 8'h8a;
      expv[31] = 8'h86;
      expv[32] = 8'h78;
      expv[33] = 8'h66;
      expv[34] = 8'hdc;
      expv[35] = 8'h80;
      expv[36] = 8'hbc;
      expv[37] = 8'hc4;
      expv[38] = 8'h58;
      expv[39] = 8'ha0;
      expv[40] = 8'hc0;
      expv[41] = 8'hdc;
      expv[42] = 8'h6c;
      expv[43] = 8'h1e;
      expv[44] = 8'hf2;
      expv[45] = 8'hdc;
      expv[46] = 8'h32;
      expv[47] = 8'h94;
      expv[48] = 8'hf0;
      expv[49] = 8'h04;
      expv[50] = 8'h28;
      expv[51] = 8'h0c;
      expv[52] = 8'h02;
      expv[53] = 8'hb6;
      expv[54] = 8'hbc;
      expv[55] = 8'hce;
      expv[56] = 8'h64;
      expv[57] = 8'hbc;
      expv[58] = 8'hb2;
      expv[59] = 8'hba;
      expv[60] = 8'h18;
      expv[61] = 8'h3e;
      expv[62] = 8'h92;
      expv[63] = 8'h3a;
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
