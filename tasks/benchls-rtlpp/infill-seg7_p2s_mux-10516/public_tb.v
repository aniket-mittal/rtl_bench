// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10516 dut (
    .clk(clk),
    .flash(in_vec[51:51]),
    .Hexs(in_vec[50:19]),
    .LES(in_vec[18:11]),
    .point(in_vec[10:3]),
    .rst(in_vec[2:2]),
    .Start(in_vec[1:1]),
    .SW0(in_vec[0:0]),
    .seg_clk(out_vec[3:3]),
    .seg_clrn(out_vec[2:2]),
    .SEG_PEN(out_vec[1:1]),
    .seg_sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h7063fcb1c3ade;
    stim[1] = 52'hb99db33cc3964;
    stim[2] = 52'h1ebfc2e927d2b;
    stim[3] = 52'h85ea00cf6c602;
    stim[4] = 52'ha320170970c01;
    stim[5] = 52'h909d14e5b0a09;
    stim[6] = 52'h36c603a4d30da;
    stim[7] = 52'h8ebb331616cbb;
    stim[8] = 52'h3b024c4b38c10;
    stim[9] = 52'h8fe353f4229a1;
    stim[10] = 52'hc42a70a263b08;
    stim[11] = 52'h21aef808c2781;
    stim[12] = 52'h85f29d4d47890;
    stim[13] = 52'h025cd84575f13;
    stim[14] = 52'hfc080a9062ad2;
    stim[15] = 52'ha0c1a35a17458;
    stim[16] = 52'h7e9e740214c13;
    stim[17] = 52'h43f3eb388ff02;
    stim[18] = 52'he5d5adfb4f370;
    stim[19] = 52'h5357d3cfb5223;
    stim[20] = 52'h6057e9f99d930;
    stim[21] = 52'h102d1dc79055b;
    stim[22] = 52'ha78261f5016e1;
    stim[23] = 52'h0d6ecc52ee351;
    stim[24] = 52'he3ca45857bbfa;
    stim[25] = 52'h9a822714d2409;
    stim[26] = 52'h759c616125e98;
    stim[27] = 52'hfb596884c3478;
    stim[28] = 52'h43002f602e67a;
    stim[29] = 52'heca3b513ac730;
    stim[30] = 52'h9b90611126bca;
    stim[31] = 52'h0523a61d3a913;
    stim[32] = 52'h6d4baaba2bcf1;
    stim[33] = 52'hcd7464b2e9e41;
    stim[34] = 52'h3ad12a4293528;
    stim[35] = 52'h3464f30498008;
    stim[36] = 52'hb189c4f178d8a;
    stim[37] = 52'h0e5f9de89c2cb;
    stim[38] = 52'hd4d57c2996679;
    stim[39] = 52'ha9fad1ac38925;
    stim[40] = 52'hbee0264eec05b;
    stim[41] = 52'h7916a0002b5f2;
    stim[42] = 52'hd1f09e40e5343;
    stim[43] = 52'h6f61a19caf1aa;
    stim[44] = 52'h80b66e09ce2d8;
    stim[45] = 52'h8bdcab385ba49;
    stim[46] = 52'hddd3ca8475fd0;
    stim[47] = 52'h23e2c676d61b8;
    stim[48] = 52'hb2bc3d239f809;
    stim[49] = 52'hce40f9c35f9c9;
    stim[50] = 52'h6d13bab5e4b53;
    stim[51] = 52'h254740fc863a9;
    stim[52] = 52'he46a0950d95b8;
    stim[53] = 52'hd6698f5920588;
    stim[54] = 52'h3fb854521e863;
    stim[55] = 52'h3d14f43be12b9;
    stim[56] = 52'h2794975435a80;
    stim[57] = 52'he88c46997d47a;
    stim[58] = 52'h7c83c71aba09b;
    stim[59] = 52'h8f063602e53f1;
    stim[60] = 52'hf8ac88934b7d1;
    stim[61] = 52'h2267747bd39a3;
    stim[62] = 52'hbb85b8be6fa7b;
    stim[63] = 52'hf517ef43b0a08;
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
      expv[0] = 4'h2;
      expv[1] = 4'h0;
      expv[2] = 4'h6;
      expv[3] = 4'h6;
      expv[4] = 4'h4;
      expv[5] = 4'h5;
      expv[6] = 4'h7;
      expv[7] = 4'h7;
      expv[8] = 4'h4;
      expv[9] = 4'h4;
      expv[10] = 4'h5;
      expv[11] = 4'h5;
      expv[12] = 4'h4;
      expv[13] = 4'h7;
      expv[14] = 4'h6;
      expv[15] = 4'h4;
      expv[16] = 4'h6;
      expv[17] = 4'h6;
      expv[18] = 4'h5;
      expv[19] = 4'h6;
      expv[20] = 4'h5;
      expv[21] = 4'h7;
      expv[22] = 4'h5;
      expv[23] = 4'h5;
      expv[24] = 4'h7;
      expv[25] = 4'h4;
      expv[26] = 4'h5;
      expv[27] = 4'h4;
      expv[28] = 4'h7;
      expv[29] = 4'h4;
      expv[30] = 4'h6;
      expv[31] = 4'h6;
      expv[32] = 4'h4;
      expv[33] = 4'h5;
      expv[34] = 4'h4;
      expv[35] = 4'h5;
      expv[36] = 4'h7;
      expv[37] = 4'h6;
      expv[38] = 4'h5;
      expv[39] = 4'h0;
      expv[40] = 4'h6;
      expv[41] = 4'h7;
      expv[42] = 4'h6;
      expv[43] = 4'h7;
      expv[44] = 4'h5;
      expv[45] = 4'h4;
      expv[46] = 4'h4;
      expv[47] = 4'h5;
      expv[48] = 4'h5;
      expv[49] = 4'h4;
      expv[50] = 4'h6;
      expv[51] = 4'h5;
      expv[52] = 4'h5;
      expv[53] = 4'h4;
      expv[54] = 4'h7;
      expv[55] = 4'h4;
      expv[56] = 4'h4;
      expv[57] = 4'h7;
      expv[58] = 4'h6;
      expv[59] = 4'h5;
      expv[60] = 4'h4;
      expv[61] = 4'h7;
      expv[62] = 4'h7;
      expv[63] = 4'h4;
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
