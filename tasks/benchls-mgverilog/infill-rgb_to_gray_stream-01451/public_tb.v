// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01451 dut (
    .clk(clk),
    .reset(in_vec[30:30]),
    .stream_in_data(in_vec[29:6]),
    .stream_in_startofpacket(in_vec[5:5]),
    .stream_in_endofpacket(in_vec[4:4]),
    .stream_in_empty(in_vec[3:2]),
    .stream_in_valid(in_vec[1:1]),
    .stream_out_ready(in_vec[0:0]),
    .stream_in_ready(out_vec[12:12]),
    .stream_out_data(out_vec[11:4]),
    .stream_out_startofpacket(out_vec[3:3]),
    .stream_out_endofpacket(out_vec[2:2]),
    .stream_out_empty(out_vec[1:1]),
    .stream_out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h669b2942;
    stim[1] = 31'h69abbb94;
    stim[2] = 31'h09bfa324;
    stim[3] = 31'h49052e8e;
    stim[4] = 31'h147d0c5f;
    stim[5] = 31'h0250f8c8;
    stim[6] = 31'h2fec0a17;
    stim[7] = 31'h366ed789;
    stim[8] = 31'h38c60818;
    stim[9] = 31'h2e98765e;
    stim[10] = 31'h0aedfb90;
    stim[11] = 31'h06f9d5b3;
    stim[12] = 31'h2048ea63;
    stim[13] = 31'h1cb36855;
    stim[14] = 31'h637af41f;
    stim[15] = 31'h06890c1c;
    stim[16] = 31'h02417e0b;
    stim[17] = 31'h07fdaf6b;
    stim[18] = 31'h04309b0a;
    stim[19] = 31'h00e95c49;
    stim[20] = 31'h106f5a6b;
    stim[21] = 31'h06c8aa69;
    stim[22] = 31'h1e0a8b6a;
    stim[23] = 31'h2a04c82d;
    stim[24] = 31'h2b728c0e;
    stim[25] = 31'h2c970ce2;
    stim[26] = 31'h177329a2;
    stim[27] = 31'h15276173;
    stim[28] = 31'h171e4fa7;
    stim[29] = 31'h1497f451;
    stim[30] = 31'h4e0e1db2;
    stim[31] = 31'h0b063ab0;
    stim[32] = 31'h1d5634bb;
    stim[33] = 31'h1ee5e216;
    stim[34] = 31'h1ad604f2;
    stim[35] = 31'h0f3127ae;
    stim[36] = 31'h0bb7d84a;
    stim[37] = 31'h0721ba7d;
    stim[38] = 31'h1374bbe6;
    stim[39] = 31'h108c90b6;
    stim[40] = 31'h39a1c6cf;
    stim[41] = 31'h1acd536c;
    stim[42] = 31'h03727a29;
    stim[43] = 31'h0d3ff3ad;
    stim[44] = 31'h4cd08863;
    stim[45] = 31'h17d36034;
    stim[46] = 31'h27692391;
    stim[47] = 31'h02747276;
    stim[48] = 31'h22148a67;
    stim[49] = 31'h00fa3fcd;
    stim[50] = 31'h3aff7bc7;
    stim[51] = 31'h07756494;
    stim[52] = 31'h3765e6f1;
    stim[53] = 31'h2dac538e;
    stim[54] = 31'h05bd0a89;
    stim[55] = 31'h2117c33c;
    stim[56] = 31'h124d6a13;
    stim[57] = 31'h25dd1baf;
    stim[58] = 31'h2120c502;
    stim[59] = 31'h38c8b188;
    stim[60] = 31'h1c291abe;
    stim[61] = 31'h3ba32272;
    stim[62] = 31'h0719b2ec;
    stim[63] = 31'h3c279886;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'h1000;
      expv[2] = 13'h1000;
      expv[3] = 13'h1aca;
      expv[4] = 13'h1000;
      expv[5] = 13'h09a7;
      expv[6] = 13'h19a7;
      expv[7] = 13'h1927;
      expv[8] = 13'h1ab0;
      expv[9] = 13'h14c4;
      expv[10] = 13'h0957;
      expv[11] = 13'h1957;
      expv[12] = 13'h190d;
      expv[13] = 13'h15c9;
      expv[14] = 13'h1ab6;
      expv[15] = 13'h1000;
      expv[16] = 13'h1246;
      expv[17] = 13'h1421;
      expv[18] = 13'h0b29;
      expv[19] = 13'h1b29;
      expv[20] = 13'h16f0;
      expv[21] = 13'h1899;
      expv[22] = 13'h1428;
      expv[23] = 13'h13e9;
      expv[24] = 13'h13ba;
      expv[25] = 13'h09c3;
      expv[26] = 13'h09c3;
      expv[27] = 13'h19c3;
      expv[28] = 13'h185d;
      expv[29] = 13'h163b;
      expv[30] = 13'h1784;
      expv[31] = 13'h1000;
      expv[32] = 13'h151c;
      expv[33] = 13'h07ed;
      expv[34] = 13'h07ed;
      expv[35] = 13'h07ed;
      expv[36] = 13'h07ed;
      expv[37] = 13'h17ed;
      expv[38] = 13'h184e;
      expv[39] = 13'h0b8b;
      expv[40] = 13'h1b8b;
      expv[41] = 13'h0843;
      expv[42] = 13'h1843;
      expv[43] = 13'h1a28;
      expv[44] = 13'h1c0a;
      expv[45] = 13'h1000;
      expv[46] = 13'h15ee;
      expv[47] = 13'h19d4;
      expv[48] = 13'h19df;
      expv[49] = 13'h155b;
      expv[50] = 13'h1b52;
      expv[51] = 13'h0f53;
      expv[52] = 13'h1f53;
      expv[53] = 13'h1aac;
      expv[54] = 13'h1993;
      expv[55] = 13'h18a0;
      expv[56] = 13'h153e;
      expv[57] = 13'h1565;
      expv[58] = 13'h07bb;
      expv[59] = 13'h07bb;
      expv[60] = 13'h07bb;
      expv[61] = 13'h07bb;
      expv[62] = 13'h07bb;
      expv[63] = 13'h07bb;
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
