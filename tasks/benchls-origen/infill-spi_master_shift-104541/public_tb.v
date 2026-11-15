// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104541 dut (
    .clk(clk),
    .MISOx(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .d(in_vec[7:0]),
    .MOSIx(out_vec[10:10]),
    .q(out_vec[9:2]),
    .cs(out_vec[1:1]),
    .sck(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h19a;
    stim[1] = 10'h19e;
    stim[2] = 10'h09f;
    stim[3] = 10'h0cf;
    stim[4] = 10'h052;
    stim[5] = 10'h04f;
    stim[6] = 10'h084;
    stim[7] = 10'h085;
    stim[8] = 10'h243;
    stim[9] = 10'h22c;
    stim[10] = 10'h2d7;
    stim[11] = 10'h0c8;
    stim[12] = 10'h2d0;
    stim[13] = 10'h228;
    stim[14] = 10'h2b0;
    stim[15] = 10'h2b3;
    stim[16] = 10'h022;
    stim[17] = 10'h216;
    stim[18] = 10'h0f7;
    stim[19] = 10'h03d;
    stim[20] = 10'h066;
    stim[21] = 10'h109;
    stim[22] = 10'h23c;
    stim[23] = 10'h01f;
    stim[24] = 10'h296;
    stim[25] = 10'h2e9;
    stim[26] = 10'h032;
    stim[27] = 10'h0fe;
    stim[28] = 10'h2e4;
    stim[29] = 10'h0ee;
    stim[30] = 10'h066;
    stim[31] = 10'h2e1;
    stim[32] = 10'h203;
    stim[33] = 10'h05f;
    stim[34] = 10'h290;
    stim[35] = 10'h0c0;
    stim[36] = 10'h023;
    stim[37] = 10'h294;
    stim[38] = 10'h215;
    stim[39] = 10'h0f3;
    stim[40] = 10'h2a3;
    stim[41] = 10'h208;
    stim[42] = 10'h05b;
    stim[43] = 10'h2ad;
    stim[44] = 10'h118;
    stim[45] = 10'h06a;
    stim[46] = 10'h0a2;
    stim[47] = 10'h2ce;
    stim[48] = 10'h204;
    stim[49] = 10'h0e9;
    stim[50] = 10'h0b9;
    stim[51] = 10'h2f9;
    stim[52] = 10'h02c;
    stim[53] = 10'h0dc;
    stim[54] = 10'h02b;
    stim[55] = 10'h20b;
    stim[56] = 10'h0ab;
    stim[57] = 10'h04f;
    stim[58] = 10'h22a;
    stim[59] = 10'h2cc;
    stim[60] = 10'h2a7;
    stim[61] = 10'h211;
    stim[62] = 10'h0af;
    stim[63] = 10'h2ee;
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
      expv[0] = 11'h400;
      expv[1] = 11'h400;
      expv[2] = 11'h400;
      expv[3] = 11'h400;
      expv[4] = 11'h33d;
      expv[5] = 11'h33d;
      expv[6] = 11'h33c;
      expv[7] = 11'h33c;
      expv[8] = 11'h679;
      expv[9] = 11'h679;
      expv[10] = 11'h678;
      expv[11] = 11'h678;
      expv[12] = 11'h4f1;
      expv[13] = 11'h4f1;
      expv[14] = 11'h4f0;
      expv[15] = 11'h4f0;
      expv[16] = 11'h1e5;
      expv[17] = 11'h1e5;
      expv[18] = 11'h1e4;
      expv[19] = 11'h1e4;
      expv[20] = 11'h3c9;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h47d;
      expv[25] = 11'h47d;
      expv[26] = 11'h07c;
      expv[27] = 11'h07c;
      expv[28] = 11'h0f9;
      expv[29] = 11'h0f9;
      expv[30] = 11'h0f8;
      expv[31] = 11'h0f8;
      expv[32] = 11'h1f5;
      expv[33] = 11'h1f5;
      expv[34] = 11'h1f4;
      expv[35] = 11'h1f4;
      expv[36] = 11'h3e9;
      expv[37] = 11'h3e9;
      expv[38] = 11'h3e8;
      expv[39] = 11'h3e8;
      expv[40] = 11'h7d1;
      expv[41] = 11'h7d1;
      expv[42] = 11'h7d0;
      expv[43] = 11'h7d0;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h400;
      expv[47] = 11'h689;
      expv[48] = 11'h289;
      expv[49] = 11'h288;
      expv[50] = 11'h288;
      expv[51] = 11'h511;
      expv[52] = 11'h511;
      expv[53] = 11'h510;
      expv[54] = 11'h510;
      expv[55] = 11'h221;
      expv[56] = 11'h221;
      expv[57] = 11'h220;
      expv[58] = 11'h220;
      expv[59] = 11'h445;
      expv[60] = 11'h445;
      expv[61] = 11'h444;
      expv[62] = 11'h444;
      expv[63] = 11'h089;
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
