// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01197 dut (
    .A(in_vec[35:20]),
    .B(in_vec[19:4]),
    .sel(in_vec[3:0]),
    .Y(out_vec[31:16]),
    .flags(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h857f9fae7;
    stim[1] = 36'h7cc945ca8;
    stim[2] = 36'hb36c2a6f6;
    stim[3] = 36'h2bca8e812;
    stim[4] = 36'h08b6c2df1;
    stim[5] = 36'haa62a939c;
    stim[6] = 36'h2956a9f5d;
    stim[7] = 36'hbebcc7818;
    stim[8] = 36'h4c0d84e0e;
    stim[9] = 36'hb14512707;
    stim[10] = 36'h0a484397d;
    stim[11] = 36'h6d616d64d;
    stim[12] = 36'h1daaa70ca;
    stim[13] = 36'hc4f71b630;
    stim[14] = 36'h2ab8039d9;
    stim[15] = 36'hfd4f8bd4c;
    stim[16] = 36'h917bddd18;
    stim[17] = 36'h55609d256;
    stim[18] = 36'h0a3ff5b95;
    stim[19] = 36'ha9cca0298;
    stim[20] = 36'h8233b5de5;
    stim[21] = 36'h1ac304594;
    stim[22] = 36'hd2f2dac80;
    stim[23] = 36'h5d221433f;
    stim[24] = 36'h840ce4145;
    stim[25] = 36'h6e0417bb2;
    stim[26] = 36'h4c0c3c896;
    stim[27] = 36'hc413a8ca3;
    stim[28] = 36'h0487eaa38;
    stim[29] = 36'h32ac1fdea;
    stim[30] = 36'ha119df484;
    stim[31] = 36'h38f7608bb;
    stim[32] = 36'h7ea3c85e7;
    stim[33] = 36'h793e7dc37;
    stim[34] = 36'hcc69ca8ca;
    stim[35] = 36'hd0a415917;
    stim[36] = 36'h6b9303f25;
    stim[37] = 36'h2ecec7968;
    stim[38] = 36'h7458b553f;
    stim[39] = 36'h784490c74;
    stim[40] = 36'hf68384a30;
    stim[41] = 36'h6e1ce56ed;
    stim[42] = 36'h957a56b5a;
    stim[43] = 36'h70d834032;
    stim[44] = 36'h58dd1a0ab;
    stim[45] = 36'h49ee0cadc;
    stim[46] = 36'h53cd57e7a;
    stim[47] = 36'h75d5310fb;
    stim[48] = 36'he36462d70;
    stim[49] = 36'h498029c13;
    stim[50] = 36'h2997aeffb;
    stim[51] = 36'h3259aaf15;
    stim[52] = 36'h8c9283a11;
    stim[53] = 36'hf2c48c93b;
    stim[54] = 36'h1dd55ce5c;
    stim[55] = 36'h25963919a;
    stim[56] = 36'h957ecbf1b;
    stim[57] = 36'h86c7a34b9;
    stim[58] = 36'h9f85d2861;
    stim[59] = 36'h47cdac263;
    stim[60] = 36'hd72dd279b;
    stim[61] = 36'ha724a292c;
    stim[62] = 36'hf70c77de9;
    stim[63] = 36'hf15b624cb;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h857f0000;
      expv[1] = 32'h7cc90000;
      expv[2] = 32'hb36c0000;
      expv[3] = 32'hafcb0000;
      expv[4] = 32'h00960000;
      expv[5] = 32'haa620000;
      expv[6] = 32'ha9f50000;
      expv[7] = 32'hbebc0000;
      expv[8] = 32'h4c0d0000;
      expv[9] = 32'hb1450000;
      expv[10] = 32'h43970000;
      expv[11] = 32'h6d640000;
      expv[12] = 32'h1daa0000;
      expv[13] = 32'hc4f70000;
      expv[14] = 32'h271b0000;
      expv[15] = 32'hfd4f0000;
      expv[16] = 32'h917b0000;
      expv[17] = 32'h55600000;
      expv[18] = 32'hfff80000;
      expv[19] = 32'ha9cc0000;
      expv[20] = 32'h38110021;
      expv[21] = 32'h1ac30000;
      expv[22] = 32'hd2f20000;
      expv[23] = 32'h33000000;
      expv[24] = 32'h68200021;
      expv[25] = 32'h7fbf0000;
      expv[26] = 32'h4c0c0000;
      expv[27] = 32'h6cd90000;
      expv[28] = 32'h04870000;
      expv[29] = 32'h32ac0000;
      expv[30] = 32'ha1190000;
      expv[31] = 32'h38f70085;
      expv[32] = 32'h7ea30000;
      expv[33] = 32'h793e0000;
      expv[34] = 32'hcc690000;
      expv[35] = 32'hd0a40000;
      expv[36] = 32'h6f850000;
      expv[37] = 32'h2ece0000;
      expv[38] = 32'h53000000;
      expv[39] = 32'h78440000;
      expv[40] = 32'hf6830000;
      expv[41] = 32'he56e0000;
      expv[42] = 32'h957a0000;
      expv[43] = 32'h74db0000;
      expv[44] = 32'h58dd0000;
      expv[45] = 32'h49ee0000;
      expv[46] = 32'h53cd0000;
      expv[47] = 32'h75d50000;
      expv[48] = 32'he3640000;
      expv[49] = 32'h60410000;
      expv[50] = 32'h29970005;
      expv[51] = 32'hdd4a0000;
      expv[52] = 32'h80800000;
      expv[53] = 32'hf2c40000;
      expv[54] = 32'h1dd50000;
      expv[55] = 32'h25960000;
      expv[56] = 32'h957e0085;
      expv[57] = 32'he37c0001;
      expv[58] = 32'h92840000;
      expv[59] = 32'hebeb0000;
      expv[60] = 32'hd72d0000;
      expv[61] = 32'ha7240000;
      expv[62] = 32'h7f2e0020;
      expv[63] = 32'hf15b0080;
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
