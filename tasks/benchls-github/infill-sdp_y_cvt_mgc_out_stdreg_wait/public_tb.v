// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  SDP_Y_CVT_mgc_out_stdreg_wait_v1 dut (
    .ld(in_vec[9:9]),
    .d(in_vec[8:1]),
    .vz(in_vec[0:0]),
    .vd(out_vec[9:9]),
    .lz(out_vec[8:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h17e;
    stim[1] = 10'h255;
    stim[2] = 10'h3b7;
    stim[3] = 10'h39c;
    stim[4] = 10'h01c;
    stim[5] = 10'h080;
    stim[6] = 10'h241;
    stim[7] = 10'h10a;
    stim[8] = 10'h102;
    stim[9] = 10'h1db;
    stim[10] = 10'h04e;
    stim[11] = 10'h0b9;
    stim[12] = 10'h245;
    stim[13] = 10'h0a8;
    stim[14] = 10'h228;
    stim[15] = 10'h3f5;
    stim[16] = 10'h186;
    stim[17] = 10'h1e3;
    stim[18] = 10'h0fe;
    stim[19] = 10'h3d2;
    stim[20] = 10'h27d;
    stim[21] = 10'h122;
    stim[22] = 10'h176;
    stim[23] = 10'h397;
    stim[24] = 10'h281;
    stim[25] = 10'h35d;
    stim[26] = 10'h306;
    stim[27] = 10'h291;
    stim[28] = 10'h014;
    stim[29] = 10'h020;
    stim[30] = 10'h319;
    stim[31] = 10'h07e;
    stim[32] = 10'h395;
    stim[33] = 10'h297;
    stim[34] = 10'h1cc;
    stim[35] = 10'h0ef;
    stim[36] = 10'h19b;
    stim[37] = 10'h231;
    stim[38] = 10'h335;
    stim[39] = 10'h3a5;
    stim[40] = 10'h096;
    stim[41] = 10'h3b7;
    stim[42] = 10'h268;
    stim[43] = 10'h305;
    stim[44] = 10'h022;
    stim[45] = 10'h0b6;
    stim[46] = 10'h3bf;
    stim[47] = 10'h2a3;
    stim[48] = 10'h2b1;
    stim[49] = 10'h388;
    stim[50] = 10'h040;
    stim[51] = 10'h31d;
    stim[52] = 10'h271;
    stim[53] = 10'h246;
    stim[54] = 10'h0e6;
    stim[55] = 10'h393;
    stim[56] = 10'h0d9;
    stim[57] = 10'h297;
    stim[58] = 10'h0c1;
    stim[59] = 10'h0ff;
    stim[60] = 10'h008;
    stim[61] = 10'h08e;
    stim[62] = 10'h104;
    stim[63] = 10'h1ef;
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
      expv[0] = 10'h0bf;
      expv[1] = 10'h32a;
      expv[2] = 10'h3db;
      expv[3] = 10'h1ce;
      expv[4] = 10'h00e;
      expv[5] = 10'h040;
      expv[6] = 10'h320;
      expv[7] = 10'h085;
      expv[8] = 10'h081;
      expv[9] = 10'h2ed;
      expv[10] = 10'h027;
      expv[11] = 10'h25c;
      expv[12] = 10'h322;
      expv[13] = 10'h054;
      expv[14] = 10'h114;
      expv[15] = 10'h3fa;
      expv[16] = 10'h0c3;
      expv[17] = 10'h2f1;
      expv[18] = 10'h07f;
      expv[19] = 10'h1e9;
      expv[20] = 10'h33e;
      expv[21] = 10'h091;
      expv[22] = 10'h0bb;
      expv[23] = 10'h3cb;
      expv[24] = 10'h340;
      expv[25] = 10'h3ae;
      expv[26] = 10'h183;
      expv[27] = 10'h348;
      expv[28] = 10'h00a;
      expv[29] = 10'h010;
      expv[30] = 10'h38c;
      expv[31] = 10'h03f;
      expv[32] = 10'h3ca;
      expv[33] = 10'h34b;
      expv[34] = 10'h0e6;
      expv[35] = 10'h277;
      expv[36] = 10'h2cd;
      expv[37] = 10'h318;
      expv[38] = 10'h39a;
      expv[39] = 10'h3d2;
      expv[40] = 10'h04b;
      expv[41] = 10'h3db;
      expv[42] = 10'h134;
      expv[43] = 10'h382;
      expv[44] = 10'h011;
      expv[45] = 10'h05b;
      expv[46] = 10'h3df;
      expv[47] = 10'h351;
      expv[48] = 10'h358;
      expv[49] = 10'h1c4;
      expv[50] = 10'h020;
      expv[51] = 10'h38e;
      expv[52] = 10'h338;
      expv[53] = 10'h123;
      expv[54] = 10'h073;
      expv[55] = 10'h3c9;
      expv[56] = 10'h26c;
      expv[57] = 10'h34b;
      expv[58] = 10'h260;
      expv[59] = 10'h27f;
      expv[60] = 10'h004;
      expv[61] = 10'h047;
      expv[62] = 10'h082;
      expv[63] = 10'h2f7;
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
