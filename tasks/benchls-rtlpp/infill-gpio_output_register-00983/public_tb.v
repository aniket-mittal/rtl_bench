// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00983 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[47:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h100c7338d9;
    stim[1] = 37'h04444133f0;
    stim[2] = 37'h13d2df1d06;
    stim[3] = 37'h16b5b6c6be;
    stim[4] = 37'h1765ed7a9f;
    stim[5] = 37'h1f6cac06a0;
    stim[6] = 37'h0336850245;
    stim[7] = 37'h0216b55182;
    stim[8] = 37'h1abecd8b7e;
    stim[9] = 37'h133a4b04f1;
    stim[10] = 37'h175b674e80;
    stim[11] = 37'h02ebf0e35b;
    stim[12] = 37'h0f7a65969b;
    stim[13] = 37'h0fc6c71be9;
    stim[14] = 37'h0ee60ac1d5;
    stim[15] = 37'h0e055801ea;
    stim[16] = 37'h1407fd601b;
    stim[17] = 37'h0ecab798f2;
    stim[18] = 37'h17fd106cd5;
    stim[19] = 37'h164e8eb503;
    stim[20] = 37'h0e7d308ec7;
    stim[21] = 37'h0a71b9040a;
    stim[22] = 37'h1f8bbb88b3;
    stim[23] = 37'h0a927daa0c;
    stim[24] = 37'h12e20fa6cd;
    stim[25] = 37'h13136aec45;
    stim[26] = 37'h12516caefe;
    stim[27] = 37'h122b449bd9;
    stim[28] = 37'h0a9706f87d;
    stim[29] = 37'h04abab8142;
    stim[30] = 37'h1fe1bd2004;
    stim[31] = 37'h0fd8abdc9c;
    stim[32] = 37'h1ff9e40990;
    stim[33] = 37'h1334aa398e;
    stim[34] = 37'h03f56b095f;
    stim[35] = 37'h070b5ff48c;
    stim[36] = 37'h06967f5ec2;
    stim[37] = 37'h0fbb1e1a14;
    stim[38] = 37'h037b959cc0;
    stim[39] = 37'h0f27e52652;
    stim[40] = 37'h1e129f2176;
    stim[41] = 37'h1ad3d41448;
    stim[42] = 37'h0e9f1340f8;
    stim[43] = 37'h1aa7d003ce;
    stim[44] = 37'h1243016898;
    stim[45] = 37'h079d8287fa;
    stim[46] = 37'h12f061d971;
    stim[47] = 37'h1393f5f592;
    stim[48] = 37'h0b383467f9;
    stim[49] = 37'h1715068e46;
    stim[50] = 37'h0e08beeb9d;
    stim[51] = 37'h06992e907c;
    stim[52] = 37'h0a2d93a063;
    stim[53] = 37'h179be4e91c;
    stim[54] = 37'h026c014c83;
    stim[55] = 37'h1fc4423cbf;
    stim[56] = 37'h0e3443f605;
    stim[57] = 37'h0bd4b3834b;
    stim[58] = 37'h0afe739157;
    stim[59] = 37'h0e1f5511b8;
    stim[60] = 37'h1abdc4dd0e;
    stim[61] = 37'h0b35acc542;
    stim[62] = 37'h071022909f;
    stim[63] = 37'h0ff285a173;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h000000000000;
      expv[8] = 48'h000000000000;
      expv[9] = 48'h000000000000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h000000000000;
      expv[12] = 48'h000000000000;
      expv[13] = 48'h000000000000;
      expv[14] = 48'h000000000000;
      expv[15] = 48'h000000000000;
      expv[16] = 48'h000000000000;
      expv[17] = 48'h000000000000;
      expv[18] = 48'h000000000000;
      expv[19] = 48'h000000000000;
      expv[20] = 48'h000000000000;
      expv[21] = 48'h000000000000;
      expv[22] = 48'h000000000000;
      expv[23] = 48'h000000000000;
      expv[24] = 48'h000000000000;
      expv[25] = 48'h000000000000;
      expv[26] = 48'h000000000000;
      expv[27] = 48'h000000000000;
      expv[28] = 48'h000000000000;
      expv[29] = 48'h000000000000;
      expv[30] = 48'h000000000000;
      expv[31] = 48'h000000000000;
      expv[32] = 48'h000000000000;
      expv[33] = 48'h000000000000;
      expv[34] = 48'h000000000000;
      expv[35] = 48'h000000000000;
      expv[36] = 48'h000000000000;
      expv[37] = 48'h5ec200000000;
      expv[38] = 48'h5ec200005ec2;
      expv[39] = 48'h5ec200000000;
      expv[40] = 48'h5ec200000000;
      expv[41] = 48'h5ec200000000;
      expv[42] = 48'h5ec200000000;
      expv[43] = 48'h5ec200000000;
      expv[44] = 48'h5ec200000000;
      expv[45] = 48'h5ec200005ec2;
      expv[46] = 48'h5ec200000000;
      expv[47] = 48'h5ec200000000;
      expv[48] = 48'h5ec200000000;
      expv[49] = 48'h5ec200000000;
      expv[50] = 48'h5ec200000000;
      expv[51] = 48'h5ec200005ec2;
      expv[52] = 48'h907c00000000;
      expv[53] = 48'h907c00000000;
      expv[54] = 48'h907c0000907c;
      expv[55] = 48'h907c00000000;
      expv[56] = 48'h907c00000000;
      expv[57] = 48'h907c00000000;
      expv[58] = 48'h907c00000000;
      expv[59] = 48'h907c00000000;
      expv[60] = 48'h907c00000000;
      expv[61] = 48'h907c00000000;
      expv[62] = 48'h907c0000907c;
      expv[63] = 48'h907c00000000;
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
