// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09814 dut (
    .clk(clk),
    .a(in_vec[40:25]),
    .b(in_vec[24:9]),
    .op(in_vec[8:1]),
    .cf(in_vec[0:0]),
    .c_flag(out_vec[34:34]),
    .z_flag(out_vec[33:33]),
    .o_flag(out_vec[32:32]),
    .acc(out_vec[31:16]),
    .c(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h079c4e3d84e;
    stim[1] = 41'h15eb14d3d47;
    stim[2] = 41'h186ae128af1;
    stim[3] = 41'h05450b3b29f;
    stim[4] = 41'h19f28326311;
    stim[5] = 41'h192d3d88034;
    stim[6] = 41'h0a990c23769;
    stim[7] = 41'h0547968e523;
    stim[8] = 41'h0826f40f356;
    stim[9] = 41'h01a520642f9;
    stim[10] = 41'h12d5649d6c7;
    stim[11] = 41'h05e49364f0f;
    stim[12] = 41'h0abbaf62527;
    stim[13] = 41'h0845d257465;
    stim[14] = 41'h0a2774774bf;
    stim[15] = 41'h1d280ff1a21;
    stim[16] = 41'h0261ef50c1f;
    stim[17] = 41'h01a8b9a1601;
    stim[18] = 41'h1c344ebc98a;
    stim[19] = 41'h16060abe98e;
    stim[20] = 41'h1755d3e6326;
    stim[21] = 41'h0273f05e31c;
    stim[22] = 41'h12c5102b66b;
    stim[23] = 41'h141365f79ff;
    stim[24] = 41'h03ec6331c3c;
    stim[25] = 41'h1cb9f0057d4;
    stim[26] = 41'h1ca78d97533;
    stim[27] = 41'h0849bc2219e;
    stim[28] = 41'h1e2637c4577;
    stim[29] = 41'h01672ff2126;
    stim[30] = 41'h14df99d5aa9;
    stim[31] = 41'h11ad96556fc;
    stim[32] = 41'h0f24fa1bd6a;
    stim[33] = 41'h058403c046e;
    stim[34] = 41'h0a5456c40ec;
    stim[35] = 41'h1b4b94ec2b6;
    stim[36] = 41'h1f452d08a3c;
    stim[37] = 41'h14ab848e0b5;
    stim[38] = 41'h063e41205b8;
    stim[39] = 41'h02271c32d5c;
    stim[40] = 41'h14ae83bfc86;
    stim[41] = 41'h141b7746bc8;
    stim[42] = 41'h146008c28df;
    stim[43] = 41'h0fb77076ca4;
    stim[44] = 41'h170926c4198;
    stim[45] = 41'h0c05abc3ec2;
    stim[46] = 41'h161f7e1cc46;
    stim[47] = 41'h1ae68ef6f7b;
    stim[48] = 41'h0e6854445e7;
    stim[49] = 41'h1def059b77c;
    stim[50] = 41'h0ac979c9dbc;
    stim[51] = 41'h05d83ec3f51;
    stim[52] = 41'h1f772c0b138;
    stim[53] = 41'h19242489141;
    stim[54] = 41'h11dec237a18;
    stim[55] = 41'h10d463cc8cb;
    stim[56] = 41'h1cdc9b42807;
    stim[57] = 41'h17d7c5f8092;
    stim[58] = 41'h0824bbc60e6;
    stim[59] = 41'h1eb644e6768;
    stim[60] = 41'h158fdef978f;
    stim[61] = 41'h1c0ef76b87c;
    stim[62] = 41'h0a83b9a6276;
    stim[63] = 41'h0f1ecc45759;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'hxxxxxxxxx;
      expv[3] = 35'hxxxxxxxxx;
      expv[4] = 35'hxxxxxxxxx;
      expv[5] = 35'hxxxxxxxxx;
      expv[6] = 35'hxxxxxxxxx;
      expv[7] = 35'hxxxxxxxxx;
      expv[8] = 35'hxxxxxxxxx;
      expv[9] = 35'hxxxxxxxxx;
      expv[10] = 35'hxxxxxxxxx;
      expv[11] = 35'hxxxxxxxxx;
      expv[12] = 35'hxxxxxxxxx;
      expv[13] = 35'hxxxxxxxxx;
      expv[14] = 35'hxxxxxxxxx;
      expv[15] = 35'hxxxxxxxxx;
      expv[16] = 35'hxxxxxxxxx;
      expv[17] = 35'hxxxxxxxxx;
      expv[18] = 35'hxxxxxxxxx;
      expv[19] = 35'hxxxxxxxxx;
      expv[20] = 35'hxxxxxxxxx;
      expv[21] = 35'hxxxxxxxxx;
      expv[22] = 35'hxxxxxxxxx;
      expv[23] = 35'hxxxxxxxxx;
      expv[24] = 35'hxxxxxxxxx;
      expv[25] = 35'hxxxxxxxxx;
      expv[26] = 35'hxxxxxxxxx;
      expv[27] = 35'hxxxxxxxxx;
      expv[28] = 35'hxxxxxxxxx;
      expv[29] = 35'hxxxxxxxxx;
      expv[30] = 35'hxxxxxxxxx;
      expv[31] = 35'hxxxxxxxxx;
      expv[32] = 35'hxxxxxxxxx;
      expv[33] = 35'hxxxxxxxxx;
      expv[34] = 35'hxxxxxxxxx;
      expv[35] = 35'hxxxxxxxxx;
      expv[36] = 35'hxxxxxxxxx;
      expv[37] = 35'hxxxxxxxxx;
      expv[38] = 35'hxxxxxxxxx;
      expv[39] = 35'hxxxxxxxxx;
      expv[40] = 35'hxxxxxxxxx;
      expv[41] = 35'hxxxxxxxxx;
      expv[42] = 35'hxxxxxxxxx;
      expv[43] = 35'hxxxxxxxxx;
      expv[44] = 35'hxxxxxxxxx;
      expv[45] = 35'hxxxxxxxxx;
      expv[46] = 35'hxxxxxxxxx;
      expv[47] = 35'hxxxxxxxxx;
      expv[48] = 35'hxxxxxxxxx;
      expv[49] = 35'hxxxxxxxxx;
      expv[50] = 35'hxxxxxxxxx;
      expv[51] = 35'hxxxxxxxxx;
      expv[52] = 35'hxxxxxxxxx;
      expv[53] = 35'hxxxxxxxxx;
      expv[54] = 35'hxxxxxxxxx;
      expv[55] = 35'hxxxxxxxxx;
      expv[56] = 35'hxxxxxxxxx;
      expv[57] = 35'h00cd0xxxx;
      expv[58] = 35'h00cd0xxxx;
      expv[59] = 35'h00cd0xxxx;
      expv[60] = 35'h00cd0xxxx;
      expv[61] = 35'h00cd0xxxx;
      expv[62] = 35'h00cd0xxxx;
      expv[63] = 35'h00cd0xxxx;
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
