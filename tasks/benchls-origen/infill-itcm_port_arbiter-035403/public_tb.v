// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035403 dut (
    .HCLK(clk),
    .HRESETn(in_vec[9:9]),
    .REQ_ICODE(in_vec[8:8]),
    .REQ_DCODE(in_vec[7:7]),
    .HREADY_Outputstage_ITCM(in_vec[6:6]),
    .HSEL_Outputstage_ITCM(in_vec[5:5]),
    .HTRANS_Outputstage_ITCM(in_vec[4:3]),
    .HBURST_Outputstage_ITCM(in_vec[2:0]),
    .PORT_SEL_ARBITER_ITCM(out_vec[2:1]),
    .PORT_NOSEL_ARBITER_ITCM(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h049;
    stim[1] = 10'h197;
    stim[2] = 10'h260;
    stim[3] = 10'h2ae;
    stim[4] = 10'h331;
    stim[5] = 10'h399;
    stim[6] = 10'h3fe;
    stim[7] = 10'h30d;
    stim[8] = 10'h21f;
    stim[9] = 10'h2d6;
    stim[10] = 10'h3fe;
    stim[11] = 10'h230;
    stim[12] = 10'h216;
    stim[13] = 10'h3af;
    stim[14] = 10'h251;
    stim[15] = 10'h20a;
    stim[16] = 10'h224;
    stim[17] = 10'h33e;
    stim[18] = 10'h2d5;
    stim[19] = 10'h320;
    stim[20] = 10'h327;
    stim[21] = 10'h2b9;
    stim[22] = 10'h311;
    stim[23] = 10'h348;
    stim[24] = 10'h38d;
    stim[25] = 10'h2f1;
    stim[26] = 10'h3c0;
    stim[27] = 10'h293;
    stim[28] = 10'h35b;
    stim[29] = 10'h394;
    stim[30] = 10'h3a2;
    stim[31] = 10'h372;
    stim[32] = 10'h2a0;
    stim[33] = 10'h210;
    stim[34] = 10'h22f;
    stim[35] = 10'h298;
    stim[36] = 10'h289;
    stim[37] = 10'h283;
    stim[38] = 10'h240;
    stim[39] = 10'h3da;
    stim[40] = 10'h263;
    stim[41] = 10'h297;
    stim[42] = 10'h3e9;
    stim[43] = 10'h2d0;
    stim[44] = 10'h267;
    stim[45] = 10'h347;
    stim[46] = 10'h2cd;
    stim[47] = 10'h25e;
    stim[48] = 10'h309;
    stim[49] = 10'h286;
    stim[50] = 10'h3f1;
    stim[51] = 10'h3ab;
    stim[52] = 10'h3f9;
    stim[53] = 10'h2df;
    stim[54] = 10'h3d2;
    stim[55] = 10'h28f;
    stim[56] = 10'h325;
    stim[57] = 10'h267;
    stim[58] = 10'h385;
    stim[59] = 10'h3a2;
    stim[60] = 10'h2ff;
    stim[61] = 10'h386;
    stim[62] = 10'h2a5;
    stim[63] = 10'h3ba;
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
      expv[0] = 3'h1;
      expv[1] = 3'h1;
      expv[2] = 3'h1;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h1;
      expv[7] = 3'h2;
      expv[8] = 3'h2;
      expv[9] = 3'h2;
      expv[10] = 3'h2;
      expv[11] = 3'h2;
      expv[12] = 3'h2;
      expv[13] = 3'h2;
      expv[14] = 3'h2;
      expv[15] = 3'h1;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h2;
      expv[20] = 3'h2;
      expv[21] = 3'h2;
      expv[22] = 3'h2;
      expv[23] = 3'h2;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h2;
      expv[27] = 3'h2;
      expv[28] = 3'h2;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h1;
      expv[40] = 3'h2;
      expv[41] = 3'h1;
      expv[42] = 3'h1;
      expv[43] = 3'h2;
      expv[44] = 3'h2;
      expv[45] = 3'h1;
      expv[46] = 3'h4;
      expv[47] = 3'h2;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h2;
      expv[52] = 3'h2;
      expv[53] = 3'h2;
      expv[54] = 3'h2;
      expv[55] = 3'h2;
      expv[56] = 3'h2;
      expv[57] = 3'h2;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h2;
      expv[62] = 3'h2;
      expv[63] = 3'h2;
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
