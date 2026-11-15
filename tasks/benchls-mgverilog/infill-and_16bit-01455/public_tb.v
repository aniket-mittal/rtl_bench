// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01455 dut (
    .in1(in_vec[31:16]),
    .in2(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'ha736c1c7;
    stim[1] = 32'h3974ed05;
    stim[2] = 32'h790d52ea;
    stim[3] = 32'h42039644;
    stim[4] = 32'hf9148979;
    stim[5] = 32'he6255b4b;
    stim[6] = 32'ha13151f2;
    stim[7] = 32'h0cbe79bc;
    stim[8] = 32'hc6cb14a6;
    stim[9] = 32'h9c59840d;
    stim[10] = 32'ha913966b;
    stim[11] = 32'h53541eb2;
    stim[12] = 32'hf232b5e4;
    stim[13] = 32'hdc6e8226;
    stim[14] = 32'h5fa5b2aa;
    stim[15] = 32'hd5f7f184;
    stim[16] = 32'h40466921;
    stim[17] = 32'h663da659;
    stim[18] = 32'h742ac9dc;
    stim[19] = 32'hedfac669;
    stim[20] = 32'h22c78762;
    stim[21] = 32'hf9d4c310;
    stim[22] = 32'hc9e0de31;
    stim[23] = 32'h19cb3890;
    stim[24] = 32'h5f6613dd;
    stim[25] = 32'ha3a5cded;
    stim[26] = 32'h98c09536;
    stim[27] = 32'hcfcbb318;
    stim[28] = 32'h0e124500;
    stim[29] = 32'h88d9b7cf;
    stim[30] = 32'hcbe6df97;
    stim[31] = 32'ha7c6033d;
    stim[32] = 32'he4f8e73d;
    stim[33] = 32'h22183d45;
    stim[34] = 32'ha09a69a8;
    stim[35] = 32'hedce2ceb;
    stim[36] = 32'h06b0316e;
    stim[37] = 32'ha53160ab;
    stim[38] = 32'he63cab22;
    stim[39] = 32'h5bb27187;
    stim[40] = 32'hd5d5e3db;
    stim[41] = 32'h7caab109;
    stim[42] = 32'h1ac9f148;
    stim[43] = 32'hfcd4ba85;
    stim[44] = 32'h9502acc9;
    stim[45] = 32'h3348539a;
    stim[46] = 32'h3ed59de3;
    stim[47] = 32'hc5568888;
    stim[48] = 32'h89add16a;
    stim[49] = 32'h6ff7f5e7;
    stim[50] = 32'h14c01041;
    stim[51] = 32'h5605db4f;
    stim[52] = 32'h0a7f1d63;
    stim[53] = 32'hbbfa106b;
    stim[54] = 32'h0dce8e42;
    stim[55] = 32'h99ad68b3;
    stim[56] = 32'h5f08578b;
    stim[57] = 32'h781e2a69;
    stim[58] = 32'hce3ead3e;
    stim[59] = 32'h30bf677c;
    stim[60] = 32'h1a03bc5b;
    stim[61] = 32'he0ecb5c1;
    stim[62] = 32'he36a61a7;
    stim[63] = 32'h485a8785;
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
      expv[0] = 16'h8106;
      expv[1] = 16'h2904;
      expv[2] = 16'h5008;
      expv[3] = 16'h0200;
      expv[4] = 16'h8910;
      expv[5] = 16'h4201;
      expv[6] = 16'h0130;
      expv[7] = 16'h08bc;
      expv[8] = 16'h0482;
      expv[9] = 16'h8409;
      expv[10] = 16'h8003;
      expv[11] = 16'h1210;
      expv[12] = 16'hb020;
      expv[13] = 16'h8026;
      expv[14] = 16'h12a0;
      expv[15] = 16'hd184;
      expv[16] = 16'h4000;
      expv[17] = 16'h2619;
      expv[18] = 16'h4008;
      expv[19] = 16'hc468;
      expv[20] = 16'h0242;
      expv[21] = 16'hc110;
      expv[22] = 16'hc820;
      expv[23] = 16'h1880;
      expv[24] = 16'h1344;
      expv[25] = 16'h81a5;
      expv[26] = 16'h9000;
      expv[27] = 16'h8308;
      expv[28] = 16'h0400;
      expv[29] = 16'h80c9;
      expv[30] = 16'hcb86;
      expv[31] = 16'h0304;
      expv[32] = 16'he438;
      expv[33] = 16'h2000;
      expv[34] = 16'h2088;
      expv[35] = 16'h2cca;
      expv[36] = 16'h0020;
      expv[37] = 16'h2021;
      expv[38] = 16'ha220;
      expv[39] = 16'h5182;
      expv[40] = 16'hc1d1;
      expv[41] = 16'h3008;
      expv[42] = 16'h1048;
      expv[43] = 16'hb884;
      expv[44] = 16'h8400;
      expv[45] = 16'h1308;
      expv[46] = 16'h1cc1;
      expv[47] = 16'h8000;
      expv[48] = 16'h8128;
      expv[49] = 16'h65e7;
      expv[50] = 16'h1040;
      expv[51] = 16'h5205;
      expv[52] = 16'h0863;
      expv[53] = 16'h106a;
      expv[54] = 16'h0c42;
      expv[55] = 16'h08a1;
      expv[56] = 16'h5708;
      expv[57] = 16'h2808;
      expv[58] = 16'h8c3e;
      expv[59] = 16'h203c;
      expv[60] = 16'h1803;
      expv[61] = 16'ha0c0;
      expv[62] = 16'h6122;
      expv[63] = 16'h0000;
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
