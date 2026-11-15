// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_094513 dut (
    .fraction(in_vec[25:0]),
    .result(out_vec[33:8]),
    .shifted_amount(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h05b313a;
    stim[1] = 26'h0b1e787;
    stim[2] = 26'h3f8a5da;
    stim[3] = 26'h2728912;
    stim[4] = 26'h034b0a1;
    stim[5] = 26'h1511274;
    stim[6] = 26'h29f3301;
    stim[7] = 26'h1628b45;
    stim[8] = 26'h1882b50;
    stim[9] = 26'h341855f;
    stim[10] = 26'h0a25f74;
    stim[11] = 26'h04511c7;
    stim[12] = 26'h214210b;
    stim[13] = 26'h2b59304;
    stim[14] = 26'h32b89c7;
    stim[15] = 26'h2d5bf1a;
    stim[16] = 26'h11cb0d2;
    stim[17] = 26'h1773cff;
    stim[18] = 26'h141e07c;
    stim[19] = 26'h3036412;
    stim[20] = 26'h14e0731;
    stim[21] = 26'h2a58077;
    stim[22] = 26'h3f3c9d5;
    stim[23] = 26'h1b02b0c;
    stim[24] = 26'h22984c5;
    stim[25] = 26'h2d9fba8;
    stim[26] = 26'h2bc3622;
    stim[27] = 26'h01b9f08;
    stim[28] = 26'h20813b1;
    stim[29] = 26'h22280c7;
    stim[30] = 26'h250b824;
    stim[31] = 26'h277b429;
    stim[32] = 26'h033db74;
    stim[33] = 26'h1665956;
    stim[34] = 26'h2346a69;
    stim[35] = 26'h1f71534;
    stim[36] = 26'h21e1cdc;
    stim[37] = 26'h228e468;
    stim[38] = 26'h26b1eb0;
    stim[39] = 26'h143263c;
    stim[40] = 26'h00cbfa3;
    stim[41] = 26'h2f1afe9;
    stim[42] = 26'h2e6ae59;
    stim[43] = 26'h028371e;
    stim[44] = 26'h0dc344e;
    stim[45] = 26'h03f3c0d;
    stim[46] = 26'h2e66cc9;
    stim[47] = 26'h1148241;
    stim[48] = 26'h0e436b1;
    stim[49] = 26'h1700513;
    stim[50] = 26'h27bb832;
    stim[51] = 26'h04bfe78;
    stim[52] = 26'h134b8d2;
    stim[53] = 26'h2db483f;
    stim[54] = 26'h1a1ee35;
    stim[55] = 26'h2d799f5;
    stim[56] = 26'h3d2c15f;
    stim[57] = 26'h3b1d43c;
    stim[58] = 26'h2d6d5a9;
    stim[59] = 26'h1200428;
    stim[60] = 26'h25d9072;
    stim[61] = 26'h0952c70;
    stim[62] = 26'h303274e;
    stim[63] = 26'h23834d2;
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
      expv[0] = 34'h2d989d003;
      expv[1] = 34'h2c79e1c02;
      expv[2] = 34'h3f8a5da00;
      expv[3] = 34'h272891200;
      expv[4] = 34'h34b0a1004;
      expv[5] = 34'h2a224e801;
      expv[6] = 34'h29f330100;
      expv[7] = 34'h2c5168a01;
      expv[8] = 34'h31056a001;
      expv[9] = 34'h341855f00;
      expv[10] = 34'h2897dd002;
      expv[11] = 34'h2288e3803;
      expv[12] = 34'h214210b00;
      expv[13] = 34'h2b5930400;
      expv[14] = 34'h32b89c700;
      expv[15] = 34'h2d5bf1a00;
      expv[16] = 34'h23961a401;
      expv[17] = 34'h2ee79fe01;
      expv[18] = 34'h283c0f801;
      expv[19] = 34'h303641200;
      expv[20] = 34'h29c0e6201;
      expv[21] = 34'h2a5807700;
      expv[22] = 34'h3f3c9d500;
      expv[23] = 34'h360561801;
      expv[24] = 34'h22984c500;
      expv[25] = 34'h2d9fba800;
      expv[26] = 34'h2bc362200;
      expv[27] = 34'h373e10005;
      expv[28] = 34'h20813b100;
      expv[29] = 34'h22280c700;
      expv[30] = 34'h250b82400;
      expv[31] = 34'h277b42900;
      expv[32] = 34'h33db74004;
      expv[33] = 34'h2ccb2ac01;
      expv[34] = 34'h2346a6900;
      expv[35] = 34'h3ee2a6801;
      expv[36] = 34'h21e1cdc00;
      expv[37] = 34'h228e46800;
      expv[38] = 34'h26b1eb000;
      expv[39] = 34'h2864c7801;
      expv[40] = 34'h32fe8c006;
      expv[41] = 34'h2f1afe900;
      expv[42] = 34'h2e6ae5900;
      expv[43] = 34'h28371e004;
      expv[44] = 34'h370d13802;
      expv[45] = 34'h3f3c0d004;
      expv[46] = 34'h2e66cc900;
      expv[47] = 34'h229048201;
      expv[48] = 34'h390dac402;
      expv[49] = 34'h2e00a2601;
      expv[50] = 34'h27bb83200;
      expv[51] = 34'h25ff3c003;
      expv[52] = 34'h26971a401;
      expv[53] = 34'h2db483f00;
      expv[54] = 34'h343dc6a01;
      expv[55] = 34'h2d799f500;
      expv[56] = 34'h3d2c15f00;
      expv[57] = 34'h3b1d43c00;
      expv[58] = 34'h2d6d5a900;
      expv[59] = 34'h240085001;
      expv[60] = 34'h25d907200;
      expv[61] = 34'h254b1c002;
      expv[62] = 34'h303274e00;
      expv[63] = 34'h23834d200;
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
