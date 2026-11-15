// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01119 dut (
    .clk(clk),
    .reset(in_vec[19:19]),
    .clear(in_vec[18:18]),
    .data_i(in_vec[17:2]),
    .src_rdy_i(in_vec[1:1]),
    .dst_rdy_i(in_vec[0:0]),
    .dst_rdy_o(out_vec[38:38]),
    .data_o(out_vec[37:19]),
    .src_rdy_o(out_vec[18:18]),
    .state(out_vec[17:17]),
    .eof_out(out_vec[16:16]),
    .length(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hae13e;
    stim[1] = 20'hfe7d4;
    stim[2] = 20'h05324;
    stim[3] = 20'h5febb;
    stim[4] = 20'h0413c;
    stim[5] = 20'h51432;
    stim[6] = 20'h13876;
    stim[7] = 20'h00daa;
    stim[8] = 20'hd4010;
    stim[9] = 20'h1013a;
    stim[10] = 20'h4a6d4;
    stim[11] = 20'h77f52;
    stim[12] = 20'h3fee7;
    stim[13] = 20'h6f59b;
    stim[14] = 20'h143e1;
    stim[15] = 20'h35a8a;
    stim[16] = 20'h32d95;
    stim[17] = 20'h10819;
    stim[18] = 20'h51a00;
    stim[19] = 20'h6269a;
    stim[20] = 20'h58d6a;
    stim[21] = 20'h67378;
    stim[22] = 20'h28890;
    stim[23] = 20'h6773d;
    stim[24] = 20'h258d3;
    stim[25] = 20'h52daf;
    stim[26] = 20'h7108f;
    stim[27] = 20'h4de32;
    stim[28] = 20'h68e27;
    stim[29] = 20'h58613;
    stim[30] = 20'h261c1;
    stim[31] = 20'h1f7e4;
    stim[32] = 20'h58775;
    stim[33] = 20'h260c8;
    stim[34] = 20'h1259d;
    stim[35] = 20'h768f9;
    stim[36] = 20'h0ece1;
    stim[37] = 20'h7611b;
    stim[38] = 20'h0b9e6;
    stim[39] = 20'h133af;
    stim[40] = 20'h58226;
    stim[41] = 20'h6a244;
    stim[42] = 20'h5fa3f;
    stim[43] = 20'h34db9;
    stim[44] = 20'h63b59;
    stim[45] = 20'h590ad;
    stim[46] = 20'h496e0;
    stim[47] = 20'h6f15b;
    stim[48] = 20'h09d83;
    stim[49] = 20'h815a6;
    stim[50] = 20'h3b925;
    stim[51] = 20'h1512a;
    stim[52] = 20'h14f4b;
    stim[53] = 20'h25ce7;
    stim[54] = 20'h40cde;
    stim[55] = 20'h1f3e7;
    stim[56] = 20'h562ea;
    stim[57] = 20'h22476;
    stim[58] = 20'h57b0c;
    stim[59] = 20'h6083f;
    stim[60] = 20'h19f41;
    stim[61] = 20'h5847f;
    stim[62] = 20'h51a4e;
    stim[63] = 20'h0df6c;
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
      expv[0] = 39'hxxc27xxxxx;
      expv[1] = 39'h0fcfa8xxxx;
      expv[2] = 39'h08a648xxxx;
      expv[3] = 39'h4bfd74xxxx;
      expv[4] = 39'h088278xxxx;
      expv[5] = 39'h0a2864xxxx;
      expv[6] = 39'h0a70ecxxxx;
      expv[7] = 39'h081b54xxxx;
      expv[8] = 39'h0a8020xxxx;
      expv[9] = 39'h0a0274xxxx;
      expv[10] = 39'h094da8xxxx;
      expv[11] = 39'h0efea4xxxx;
      expv[12] = 39'h4ffdccxxxx;
      expv[13] = 39'h45eb36ff72;
      expv[14] = 39'h4a87c0ff72;
      expv[15] = 39'h0eb514ff72;
      expv[16] = 39'h4e5b28ff72;
      expv[17] = 39'h4a1030ff72;
      expv[18] = 39'h0a3400ff72;
      expv[19] = 39'h0c4d34ff72;
      expv[20] = 39'h0b1ad4ff72;
      expv[21] = 39'h0ce6f0ff72;
      expv[22] = 39'h0d1120ff72;
      expv[23] = 39'h4cee78ff72;
      expv[24] = 39'h4cb1a4ff72;
      expv[25] = 39'h425b5e2c68;
      expv[26] = 39'h4e211c2c68;
      expv[27] = 39'h09bc642c68;
      expv[28] = 39'h4d1c4c2c68;
      expv[29] = 39'h4b0c242c68;
      expv[30] = 39'h4cc3802c68;
      expv[31] = 39'h0befc82c68;
      expv[32] = 39'h4b0ee82c68;
      expv[33] = 39'h0cc1902c68;
      expv[34] = 39'h4a4b382c68;
      expv[35] = 39'h4ed1f02c68;
      expv[36] = 39'h49d9c02c68;
      expv[37] = 39'h4ec2342c68;
      expv[38] = 39'h0973cc2c68;
      expv[39] = 39'h4a675c2c68;
      expv[40] = 39'h03044e99d6;
      expv[41] = 39'h0d448899d6;
      expv[42] = 39'h4bf47c99d6;
      expv[43] = 39'h4e9b7099d6;
      expv[44] = 39'h4c76b099d6;
      expv[45] = 39'h4b215899d6;
      expv[46] = 39'h092dc099d6;
      expv[47] = 39'h4de2b499d6;
      expv[48] = 39'h493b0499d6;
      expv[49] = 39'h002b4e4ec0;
      expv[50] = 39'h4f72484ec0;
      expv[51] = 39'h0aa2544ec0;
      expv[52] = 39'h4a9e944ec0;
      expv[53] = 39'h44b9cea7a4;
      expv[54] = 39'h0019bea7a3;
      expv[55] = 39'h4be7cca7a3;
      expv[56] = 39'h02c5d6f9f2;
      expv[57] = 39'h0c48ecf9f2;
      expv[58] = 39'h0af618f9f2;
      expv[59] = 39'h4c107cf9f2;
      expv[60] = 39'h4b3e80f9f2;
      expv[61] = 39'h4b08fcf9f2;
      expv[62] = 39'h0a349cf9f2;
      expv[63] = 39'h09bed8f9f2;
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
