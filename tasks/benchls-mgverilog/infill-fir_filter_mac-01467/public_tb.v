// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01467 dut (
    .CLK(clk),
    .ARST(in_vec[34:34]),
    .filterCoef(in_vec[33:18]),
    .InData(in_vec[17:2]),
    .input_Valid(in_vec[1:1]),
    .initialize(in_vec[0:0]),
    .OutData(out_vec[32:1]),
    .output_Valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h65e3319a7;
    stim[1] = 35'h6a200e8de;
    stim[2] = 35'h1e45db14d;
    stim[3] = 35'h201c0593a;
    stim[4] = 35'h26fa8897a;
    stim[5] = 35'h1c6b0fa4b;
    stim[6] = 35'h22e9f2a5a;
    stim[7] = 35'h3b1979df7;
    stim[8] = 35'h2413d3fea;
    stim[9] = 35'h3cb0a086e;
    stim[10] = 35'h388d9376f;
    stim[11] = 35'h2d0bc219a;
    stim[12] = 35'h314f9ac91;
    stim[13] = 35'h24f6b75e6;
    stim[14] = 35'h0ae529cf9;
    stim[15] = 35'h1c9f35e9b;
    stim[16] = 35'h4039d136b;
    stim[17] = 35'h19cb508cf;
    stim[18] = 35'h36415cd92;
    stim[19] = 35'h00b3ddfcb;
    stim[20] = 35'h1db9cfed8;
    stim[21] = 35'h2dfeb24ba;
    stim[22] = 35'h38fbf04df;
    stim[23] = 35'h0be79e24a;
    stim[24] = 35'h1c5fdbcf3;
    stim[25] = 35'h1c8ed78d0;
    stim[26] = 35'h1ad4f13d5;
    stim[27] = 35'h1e4e5f658;
    stim[28] = 35'h0b0967d55;
    stim[29] = 35'h39befaf63;
    stim[30] = 35'h02e7d27c5;
    stim[31] = 35'h05cbfacbc;
    stim[32] = 35'h3bac72175;
    stim[33] = 35'h0e8d5780a;
    stim[34] = 35'h1b65f2414;
    stim[35] = 35'h37bed88ba;
    stim[36] = 35'h3fa073e48;
    stim[37] = 35'h10be25da3;
    stim[38] = 35'h01495146d;
    stim[39] = 35'h35e0814d8;
    stim[40] = 35'h302e7799f;
    stim[41] = 35'h2573d5975;
    stim[42] = 35'h0227a9fdf;
    stim[43] = 35'h054cc853a;
    stim[44] = 35'h0ca85fd39;
    stim[45] = 35'h33d6a7127;
    stim[46] = 35'h2140bc92f;
    stim[47] = 35'h3913279ea;
    stim[48] = 35'h1d123bb4b;
    stim[49] = 35'h36f8650cf;
    stim[50] = 35'h11031fe96;
    stim[51] = 35'h02d3f2023;
    stim[52] = 35'h204e81567;
    stim[53] = 35'h1f8394526;
    stim[54] = 35'h28a8d21c4;
    stim[55] = 35'h2867fd94f;
    stim[56] = 35'h2d610d514;
    stim[57] = 35'h0e68eb022;
    stim[58] = 35'h0f0eead8d;
    stim[59] = 35'h18f4599b1;
    stim[60] = 35'h09a9c6d58;
    stim[61] = 35'h0c2d6434d;
    stim[62] = 35'h3351f22c1;
    stim[63] = 35'h13bdec9aa;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h06679ecea;
      expv[5] = 33'h0503f712a;
      expv[6] = 33'h035601902;
      expv[7] = 33'h03790f830;
      expv[8] = 33'h0681e2be4;
      expv[9] = 33'h003c120a2;
      expv[10] = 33'h1bdf7bcee;
      expv[11] = 33'h1cafdf9da;
      expv[12] = 33'h1ede18464;
      expv[13] = 33'h1e8e809d8;
      expv[14] = 33'h1ced14d70;
      expv[15] = 33'h1ebfd7584;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h0355c4fee;
      expv[20] = 33'h0123859d6;
      expv[21] = 33'h002a1c15c;
      expv[22] = 33'h002a1c15c;
      expv[23] = 33'h0217a7334;
      expv[24] = 33'h00dc44eb2;
      expv[25] = 33'h03a9ebeea;
      expv[26] = 33'h062a15588;
      expv[27] = 33'h062a15588;
      expv[28] = 33'h1ce7e84de;
      expv[29] = 33'h1ce7e84de;
      expv[30] = 33'h1dea94692;
      expv[31] = 33'h003f09990;
      expv[32] = 33'h006b68f5e;
      expv[33] = 33'h006b68f5e;
      expv[34] = 33'h00785fc9a;
      expv[35] = 33'h03245d16e;
      expv[36] = 33'h03245d16e;
      expv[37] = 33'h018f21fa2;
      expv[38] = 33'h018f21fa2;
      expv[39] = 33'h1c946f980;
      expv[40] = 33'h002c707ce;
      expv[41] = 33'h002c707ce;
      expv[42] = 33'h0109bf0de;
      expv[43] = 33'h1b859ec66;
      expv[44] = 33'h1fa12c4e4;
      expv[45] = 33'h1ff96d5f8;
      expv[46] = 33'h0325a981c;
      expv[47] = 33'h025e5f154;
      expv[48] = 33'h00d2bb72c;
      expv[49] = 33'h022471f9c;
      expv[50] = 33'h1f064a620;
      expv[51] = 33'h01e6bc3a6;
      expv[52] = 33'h06247631e;
      expv[53] = 33'h1fb0e24f0;
      expv[54] = 33'h1fab41e54;
      expv[55] = 33'h04ac0de50;
      expv[56] = 33'h04ac0de50;
      expv[57] = 33'h00722611a;
      expv[58] = 33'h00722611a;
      expv[59] = 33'h1e153034a;
      expv[60] = 33'h1d82f67a2;
      expv[61] = 33'h04fdec458;
      expv[62] = 33'h04fdec458;
      expv[63] = 33'h1d5b1ea5e;
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
