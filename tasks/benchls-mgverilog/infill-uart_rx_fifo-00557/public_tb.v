// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00557 dut (
    .CLK(clk),
    .RST_X(in_vec[10:10]),
    .D_IN(in_vec[9:2]),
    .WE(in_vec[1:1]),
    .RE(in_vec[0:0]),
    .D_OUT(out_vec[10:3]),
    .D_EN(out_vec[2:2]),
    .RDY(out_vec[1:1]),
    .ERR(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4b5;
    stim[1] = 11'h5d5;
    stim[2] = 11'h3f5;
    stim[3] = 11'h367;
    stim[4] = 11'h0bf;
    stim[5] = 11'h19d;
    stim[6] = 11'h389;
    stim[7] = 11'h27d;
    stim[8] = 11'h38f;
    stim[9] = 11'h2d6;
    stim[10] = 11'h28f;
    stim[11] = 11'h299;
    stim[12] = 11'h132;
    stim[13] = 11'h117;
    stim[14] = 11'h383;
    stim[15] = 11'h2db;
    stim[16] = 11'h18c;
    stim[17] = 11'h08c;
    stim[18] = 11'h1f4;
    stim[19] = 11'h239;
    stim[20] = 11'h197;
    stim[21] = 11'h1b9;
    stim[22] = 11'h395;
    stim[23] = 11'h3fe;
    stim[24] = 11'h047;
    stim[25] = 11'h0f3;
    stim[26] = 11'h07e;
    stim[27] = 11'h3e5;
    stim[28] = 11'h214;
    stim[29] = 11'h08e;
    stim[30] = 11'h3af;
    stim[31] = 11'h094;
    stim[32] = 11'h122;
    stim[33] = 11'h2da;
    stim[34] = 11'h3e2;
    stim[35] = 11'h12a;
    stim[36] = 11'h2cd;
    stim[37] = 11'h084;
    stim[38] = 11'h228;
    stim[39] = 11'h7e0;
    stim[40] = 11'h28d;
    stim[41] = 11'h3e4;
    stim[42] = 11'h0f4;
    stim[43] = 11'h0cf;
    stim[44] = 11'h003;
    stim[45] = 11'h28d;
    stim[46] = 11'h1cd;
    stim[47] = 11'h141;
    stim[48] = 11'h03d;
    stim[49] = 11'h0e9;
    stim[50] = 11'h25a;
    stim[51] = 11'h154;
    stim[52] = 11'h299;
    stim[53] = 11'h0d7;
    stim[54] = 11'h3c0;
    stim[55] = 11'h177;
    stim[56] = 11'h148;
    stim[57] = 11'h0d1;
    stim[58] = 11'h383;
    stim[59] = 11'h1ca;
    stim[60] = 11'h0aa;
    stim[61] = 11'h2ee;
    stim[62] = 11'h257;
    stim[63] = 11'h1c1;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
