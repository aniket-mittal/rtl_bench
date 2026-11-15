// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05490 dut (
    .CLK(clk),
    .RST(in_vec[32:32]),
    .SW(in_vec[31:30]),
    .xAxis(in_vec[29:20]),
    .yAxis(in_vec[19:10]),
    .zAxis(in_vec[9:0]),
    .DOUT(out_vec[12:3]),
    .LED(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h15251d104;
    stim[1] = 33'h1da4a3952;
    stim[2] = 33'h0634a7857;
    stim[3] = 33'h0541a3014;
    stim[4] = 33'h07b2fd894;
    stim[5] = 33'h0f4ab010c;
    stim[6] = 33'h069851b9c;
    stim[7] = 33'h00aec69b4;
    stim[8] = 33'h06e8a30c9;
    stim[9] = 33'h09045688e;
    stim[10] = 33'h0f2c37857;
    stim[11] = 33'h0eb4192de;
    stim[12] = 33'h0d88be7cb;
    stim[13] = 33'h09f4f7f5f;
    stim[14] = 33'h0a46f0eda;
    stim[15] = 33'h044b20d37;
    stim[16] = 33'h06b785ca4;
    stim[17] = 33'h06b241124;
    stim[18] = 33'h070d5f47b;
    stim[19] = 33'h0215d6891;
    stim[20] = 33'h0d878d5c9;
    stim[21] = 33'h0d3e10fc0;
    stim[22] = 33'h0510ddc08;
    stim[23] = 33'h00f3c4aac;
    stim[24] = 33'h00abaf9e3;
    stim[25] = 33'h07affa4e5;
    stim[26] = 33'h05877de4e;
    stim[27] = 33'h0c7be5b58;
    stim[28] = 33'h0b783330d;
    stim[29] = 33'h0744a19be;
    stim[30] = 33'h0963c0ad3;
    stim[31] = 33'h0709ad4fe;
    stim[32] = 33'h00888c4eb;
    stim[33] = 33'h09e5ecc46;
    stim[34] = 33'h063a84f8d;
    stim[35] = 33'h05cff86f3;
    stim[36] = 33'h07b6a5b5c;
    stim[37] = 33'h06b8e7544;
    stim[38] = 33'h026df19d9;
    stim[39] = 33'h06b0d4ef3;
    stim[40] = 33'h0e9721d82;
    stim[41] = 33'h01cc9615a;
    stim[42] = 33'h00dfea663;
    stim[43] = 33'h03c433ab8;
    stim[44] = 33'h0e800ebf1;
    stim[45] = 33'h050e28b4a;
    stim[46] = 33'h01da9f0eb;
    stim[47] = 33'h0ab07271f;
    stim[48] = 33'h0e651df10;
    stim[49] = 33'h013768f48;
    stim[50] = 33'h06b299d2d;
    stim[51] = 33'h09778f58f;
    stim[52] = 33'h00f2fbea0;
    stim[53] = 33'h07eeb1cab;
    stim[54] = 33'h0050238f0;
    stim[55] = 33'h0e3afe7c5;
    stim[56] = 33'h095b6d033;
    stim[57] = 33'h054ac088f;
    stim[58] = 33'h0a7de32ad;
    stim[59] = 33'h095bec3b1;
    stim[60] = 33'h017b5bf9a;
    stim[61] = 33'h03b65bdca;
    stim[62] = 33'h0d5a22862;
    stim[63] = 33'h04dc35229;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h1b12;
      expv[4] = 13'h1ba2;
      expv[5] = 13'h1052;
      expv[6] = 13'h15b1;
      expv[7] = 13'h0a32;
      expv[8] = 13'h0571;
      expv[9] = 13'h1ba2;
      expv[10] = 13'h0474;
      expv[11] = 13'h16a1;
      expv[12] = 13'h1a61;
      expv[13] = 13'h0c41;
      expv[14] = 13'h150c;
      expv[15] = 13'h1934;
      expv[16] = 13'h041a;
      expv[17] = 13'h1f4a;
      expv[18] = 13'h0822;
      expv[19] = 13'h0bea;
      expv[20] = 13'h1f59;
      expv[21] = 13'h0c39;
      expv[22] = 13'h09f1;
      expv[23] = 13'h144a;
      expv[24] = 13'h0799;
      expv[25] = 13'h0559;
      expv[26] = 13'h10ba;
      expv[27] = 13'h0fba;
      expv[28] = 13'h03d9;
      expv[29] = 13'h179c;
      expv[30] = 13'h1bd2;
      expv[31] = 13'h196c;
      expv[32] = 13'h1a5a;
      expv[33] = 13'h0441;
      expv[34] = 13'h0234;
      expv[35] = 13'h1f6a;
      expv[36] = 13'h10fa;
      expv[37] = 13'h1b52;
      expv[38] = 13'h131a;
      expv[39] = 13'h1c99;
      expv[40] = 13'h156a;
      expv[41] = 13'h1b49;
      expv[42] = 13'h0e61;
      expv[43] = 13'h06f9;
      expv[44] = 13'h11e1;
      expv[45] = 13'h1c01;
      expv[46] = 13'h0512;
      expv[47] = 13'h0ed1;
      expv[48] = 13'h170c;
      expv[49] = 13'h1cd9;
      expv[50] = 13'h09b9;
      expv[51] = 13'h1cca;
      expv[52] = 13'h0c7c;
      expv[53] = 13'h0791;
      expv[54] = 13'h19ca;
      expv[55] = 13'h0281;
      expv[56] = 13'h1e31;
      expv[57] = 13'h019c;
      expv[58] = 13'h17f2;
      expv[59] = 13'h1a9c;
      expv[60] = 13'h127c;
      expv[61] = 13'h0bd9;
      expv[62] = 13'h1251;
      expv[63] = 13'h0ad1;
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
