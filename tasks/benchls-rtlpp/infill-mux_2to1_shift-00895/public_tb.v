// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00895 dut (
    .Inp0(in_vec[18:10]),
    .Inp1(in_vec[9:1]),
    .Sel(in_vec[0:0]),
    .Output(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h1c7c0;
    stim[1] = 19'h32efd;
    stim[2] = 19'h4a11e;
    stim[3] = 19'h66f88;
    stim[4] = 19'h4d673;
    stim[5] = 19'h10998;
    stim[6] = 19'h020a8;
    stim[7] = 19'h53af2;
    stim[8] = 19'h4f4d2;
    stim[9] = 19'h2d210;
    stim[10] = 19'h0efb9;
    stim[11] = 19'h0cb37;
    stim[12] = 19'h1c30a;
    stim[13] = 19'h199ab;
    stim[14] = 19'h66837;
    stim[15] = 19'h3e78f;
    stim[16] = 19'h3a848;
    stim[17] = 19'h3ec4a;
    stim[18] = 19'h6a6a3;
    stim[19] = 19'h14ae1;
    stim[20] = 19'h69d00;
    stim[21] = 19'h3580c;
    stim[22] = 19'h7420a;
    stim[23] = 19'h6ea77;
    stim[24] = 19'h3b7b7;
    stim[25] = 19'h684d7;
    stim[26] = 19'h27416;
    stim[27] = 19'h01c83;
    stim[28] = 19'h70c1d;
    stim[29] = 19'h45be7;
    stim[30] = 19'h161ea;
    stim[31] = 19'h11992;
    stim[32] = 19'h7268a;
    stim[33] = 19'h381fb;
    stim[34] = 19'h0a750;
    stim[35] = 19'h32429;
    stim[36] = 19'h0bc0c;
    stim[37] = 19'h02372;
    stim[38] = 19'h74263;
    stim[39] = 19'h01df9;
    stim[40] = 19'h1bf1a;
    stim[41] = 19'h4d5fe;
    stim[42] = 19'h6e425;
    stim[43] = 19'h255f1;
    stim[44] = 19'h0bb9f;
    stim[45] = 19'h4f2af;
    stim[46] = 19'h51bed;
    stim[47] = 19'h31fcb;
    stim[48] = 19'h2f73c;
    stim[49] = 19'h662ee;
    stim[50] = 19'h77340;
    stim[51] = 19'h20513;
    stim[52] = 19'h1043b;
    stim[53] = 19'h0540d;
    stim[54] = 19'h6f602;
    stim[55] = 19'h0dc7f;
    stim[56] = 19'h7ea9e;
    stim[57] = 19'h59d27;
    stim[58] = 19'h135b6;
    stim[59] = 19'h1e7fd;
    stim[60] = 19'h56f97;
    stim[61] = 19'h53143;
    stim[62] = 19'h76c2e;
    stim[63] = 19'h200d8;
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
      expv[0] = 10'h3c0;
      expv[1] = 10'h2cb;
      expv[2] = 10'h11e;
      expv[3] = 10'h388;
      expv[4] = 10'h335;
      expv[5] = 10'h198;
      expv[6] = 10'h0a8;
      expv[7] = 10'h2f2;
      expv[8] = 10'h0d2;
      expv[9] = 10'h210;
      expv[10] = 10'h23b;
      expv[11] = 10'h232;
      expv[12] = 10'h30a;
      expv[13] = 10'h066;
      expv[14] = 10'h19a;
      expv[15] = 10'h2f9;
      expv[16] = 10'h048;
      expv[17] = 10'h04a;
      expv[18] = 10'h3a9;
      expv[19] = 10'h252;
      expv[20] = 10'h100;
      expv[21] = 10'h00c;
      expv[22] = 10'h20a;
      expv[23] = 10'h3ba;
      expv[24] = 10'h2ed;
      expv[25] = 10'h1a1;
      expv[26] = 10'h016;
      expv[27] = 10'h007;
      expv[28] = 10'h1c3;
      expv[29] = 10'h316;
      expv[30] = 10'h1ea;
      expv[31] = 10'h192;
      expv[32] = 10'h28a;
      expv[33] = 10'h0e0;
      expv[34] = 10'h350;
      expv[35] = 10'h0c9;
      expv[36] = 10'h00c;
      expv[37] = 10'h372;
      expv[38] = 10'h3d0;
      expv[39] = 10'h007;
      expv[40] = 10'h31a;
      expv[41] = 10'h1fe;
      expv[42] = 10'h1b9;
      expv[43] = 10'h095;
      expv[44] = 10'h22e;
      expv[45] = 10'h33c;
      expv[46] = 10'h346;
      expv[47] = 10'h2c7;
      expv[48] = 10'h33c;
      expv[49] = 10'h2ee;
      expv[50] = 10'h340;
      expv[51] = 10'h081;
      expv[52] = 10'h041;
      expv[53] = 10'h015;
      expv[54] = 10'h202;
      expv[55] = 10'h037;
      expv[56] = 10'h29e;
      expv[57] = 10'h167;
      expv[58] = 10'h1b6;
      expv[59] = 10'h279;
      expv[60] = 10'h35b;
      expv[61] = 10'h14c;
      expv[62] = 10'h02e;
      expv[63] = 10'h0d8;
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
