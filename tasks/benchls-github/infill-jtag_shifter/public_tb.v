// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jtag_shifter dut (
    .shift_clk(clk),
    .shift_din(in_vec[20:20]),
    .shift(in_vec[19:19]),
    .din_load(in_vec[18:18]),
    .din(in_vec[17:0]),
    .shift_dout(out_vec[31:31]),
    .control_reg_ce(out_vec[30:30]),
    .bram_ce(out_vec[29:29]),
    .bram_a(out_vec[28:19]),
    .bram_d(out_vec[18:1]),
    .bram_we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0cf8df;
    stim[1] = 21'h03f18e;
    stim[2] = 21'h189331;
    stim[3] = 21'h063094;
    stim[4] = 21'h1863aa;
    stim[5] = 21'h0ce4a2;
    stim[6] = 21'h15c763;
    stim[7] = 21'h06e135;
    stim[8] = 21'h047c1c;
    stim[9] = 21'h12a454;
    stim[10] = 21'h11b2af;
    stim[11] = 21'h0b1f9a;
    stim[12] = 21'h0c5ab4;
    stim[13] = 21'h108c9a;
    stim[14] = 21'h10af50;
    stim[15] = 21'h032e28;
    stim[16] = 21'h15f3ad;
    stim[17] = 21'h027ee9;
    stim[18] = 21'h17c769;
    stim[19] = 21'h00aaa7;
    stim[20] = 21'h181980;
    stim[21] = 21'h0441c7;
    stim[22] = 21'h1eef7c;
    stim[23] = 21'h10382e;
    stim[24] = 21'h09c9dc;
    stim[25] = 21'h149f8d;
    stim[26] = 21'h01a9f7;
    stim[27] = 21'h1724f4;
    stim[28] = 21'h07b8f3;
    stim[29] = 21'h047b57;
    stim[30] = 21'h0bae5a;
    stim[31] = 21'h166d70;
    stim[32] = 21'h0d4aef;
    stim[33] = 21'h00f250;
    stim[34] = 21'h156407;
    stim[35] = 21'h128557;
    stim[36] = 21'h0a96e7;
    stim[37] = 21'h1cf24f;
    stim[38] = 21'h011069;
    stim[39] = 21'h1779c7;
    stim[40] = 21'h03c085;
    stim[41] = 21'h1809c4;
    stim[42] = 21'h14b028;
    stim[43] = 21'h1f35a2;
    stim[44] = 21'h19938a;
    stim[45] = 21'h142dd4;
    stim[46] = 21'h190463;
    stim[47] = 21'h1de02a;
    stim[48] = 21'h00333c;
    stim[49] = 21'h0e4d8a;
    stim[50] = 21'h021e44;
    stim[51] = 21'h18101e;
    stim[52] = 21'h076b7d;
    stim[53] = 21'h083f12;
    stim[54] = 21'h035b28;
    stim[55] = 21'h1f33e0;
    stim[56] = 21'h12c2bf;
    stim[57] = 21'h0874f6;
    stim[58] = 21'h0abbb1;
    stim[59] = 21'h01b09b;
    stim[60] = 21'h0a4763;
    stim[61] = 21'h1239cc;
    stim[62] = 21'h0e765c;
    stim[63] = 21'h16fafc;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxx612x;
      expv[5] = 32'hxxxxc25x;
      expv[6] = 32'hxxx184ax;
      expv[7] = 32'hxxx38ec7;
      expv[8] = 32'hxxx5c26b;
      expv[9] = 32'hxxx0f839;
      expv[10] = 32'hxxx0f839;
      expv[11] = 32'hxxx0f839;
      expv[12] = 32'hxxx9f07x;
      expv[13] = 32'hxxxbe0ex;
      expv[14] = 32'hxxxbe0ex;
      expv[15] = 32'hxxxbe0ex;
      expv[16] = 32'hxxxbe0ex;
      expv[17] = 32'hxxxbe75a;
      expv[18] = 32'hxxxbe75a;
      expv[19] = 32'hxxxf8ed2;
      expv[20] = 32'hxxxf8ed2;
      expv[21] = 32'hxxx71dax;
      expv[22] = 32'hxxx0838e;
      expv[23] = 32'hxx61071c;
      expv[24] = 32'hxx61071c;
      expv[25] = 32'hxxc20e3x;
      expv[26] = 32'hxxc13f1b;
      expv[27] = 32'hxxc13f1b;
      expv[28] = 32'hxxc649e9;
      expv[29] = 32'hxxc771e7;
      expv[30] = 32'hxxc0f6af;
      expv[31] = 32'hxx89ed5x;
      expv[32] = 32'hxx8cdae1;
      expv[33] = 32'hxx19b5c2;
      expv[34] = 32'hxx19b5c2;
      expv[35] = 32'hxx1ac80e;
      expv[36] = 32'hxx1ac80e;
      expv[37] = 32'hx635901x;
      expv[38] = 32'h4c63203x;
      expv[39] = 32'h4c63203x;
      expv[40] = 32'hcc66f38e;
      expv[41] = 32'hcc66f38e;
      expv[42] = 32'hf8c5e71c;
      expv[43] = 32'h78c16050;
      expv[44] = 32'h7182c0a1;
      expv[45] = 32'he30d8143;
      expv[46] = 32'h63085ba9;
      expv[47] = 32'h6618b751;
      expv[48] = 32'h6c396ea1;
      expv[49] = 32'h6c396ea1;
      expv[50] = 32'h387add41;
      expv[51] = 32'h387add41;
      expv[52] = 32'hd0fdba83;
      expv[53] = 32'hd0fed6fb;
      expv[54] = 32'ha1fdadf6;
      expv[55] = 32'ha1fdadf6;
      expv[56] = 32'h43f35bed;
      expv[57] = 32'h43f35bed;
      expv[58] = 32'ha7eeb7d8;
      expv[59] = 32'h8fd56fb1;
      expv[60] = 32'h8fd56fb1;
      expv[61] = 32'h1faadf60;
      expv[62] = 32'h1faadf60;
      expv[63] = 32'h9f55bec0;
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
