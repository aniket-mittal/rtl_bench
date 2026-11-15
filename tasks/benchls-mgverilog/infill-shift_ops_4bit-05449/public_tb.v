// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05449 dut (
    .in(in_vec[12:12]),
    .vin(in_vec[11:8]),
    .vin1(in_vec[7:4]),
    .vin2(in_vec[3:0]),
    .out(out_vec[12:12]),
    .vout(out_vec[11:8]),
    .vout1(out_vec[7:4]),
    .vout2(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h16cd;
    stim[1] = 13'h1f29;
    stim[2] = 13'h0fe9;
    stim[3] = 13'h193f;
    stim[4] = 13'h1599;
    stim[5] = 13'h0fbd;
    stim[6] = 13'h057c;
    stim[7] = 13'h1ed7;
    stim[8] = 13'h17ee;
    stim[9] = 13'h0780;
    stim[10] = 13'h1c67;
    stim[11] = 13'h09cd;
    stim[12] = 13'h180e;
    stim[13] = 13'h0c96;
    stim[14] = 13'h19ce;
    stim[15] = 13'h1f9b;
    stim[16] = 13'h1d60;
    stim[17] = 13'h191e;
    stim[18] = 13'h0580;
    stim[19] = 13'h1eb2;
    stim[20] = 13'h0a74;
    stim[21] = 13'h0997;
    stim[22] = 13'h181e;
    stim[23] = 13'h0961;
    stim[24] = 13'h03ba;
    stim[25] = 13'h1af1;
    stim[26] = 13'h0f0c;
    stim[27] = 13'h14e1;
    stim[28] = 13'h18f0;
    stim[29] = 13'h0141;
    stim[30] = 13'h0125;
    stim[31] = 13'h1645;
    stim[32] = 13'h07ff;
    stim[33] = 13'h1ed7;
    stim[34] = 13'h1267;
    stim[35] = 13'h061e;
    stim[36] = 13'h0f71;
    stim[37] = 13'h08e3;
    stim[38] = 13'h1540;
    stim[39] = 13'h13a7;
    stim[40] = 13'h0a6d;
    stim[41] = 13'h06e1;
    stim[42] = 13'h1f30;
    stim[43] = 13'h1968;
    stim[44] = 13'h1268;
    stim[45] = 13'h1fdc;
    stim[46] = 13'h1310;
    stim[47] = 13'h0080;
    stim[48] = 13'h0467;
    stim[49] = 13'h169f;
    stim[50] = 13'h1304;
    stim[51] = 13'h09fc;
    stim[52] = 13'h14fb;
    stim[53] = 13'h1b28;
    stim[54] = 13'h02e8;
    stim[55] = 13'h1198;
    stim[56] = 13'h02da;
    stim[57] = 13'h1e20;
    stim[58] = 13'h037c;
    stim[59] = 13'h034d;
    stim[60] = 13'h079a;
    stim[61] = 13'h10c6;
    stim[62] = 13'h07ed;
    stim[63] = 13'h153e;
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
      expv[0] = 13'h0833;
      expv[1] = 13'h0c02;
      expv[2] = 13'h0c32;
      expv[3] = 13'h0403;
      expv[4] = 13'h0422;
      expv[5] = 13'h0c23;
      expv[6] = 13'h0413;
      expv[7] = 13'h0831;
      expv[8] = 13'h0c33;
      expv[9] = 13'h0c20;
      expv[10] = 13'h0011;
      expv[11] = 13'h0433;
      expv[12] = 13'h0003;
      expv[13] = 13'h0021;
      expv[14] = 13'h0433;
      expv[15] = 13'h0c22;
      expv[16] = 13'h0410;
      expv[17] = 13'h0403;
      expv[18] = 13'h0420;
      expv[19] = 13'h0820;
      expv[20] = 13'h0811;
      expv[21] = 13'h0421;
      expv[22] = 13'h0003;
      expv[23] = 13'h0410;
      expv[24] = 13'h0c22;
      expv[25] = 13'h0830;
      expv[26] = 13'h0c03;
      expv[27] = 13'h0030;
      expv[28] = 13'h0030;
      expv[29] = 13'h0410;
      expv[30] = 13'h0401;
      expv[31] = 13'h0811;
      expv[32] = 13'h0c33;
      expv[33] = 13'h0831;
      expv[34] = 13'h0811;
      expv[35] = 13'h0803;
      expv[36] = 13'h0c10;
      expv[37] = 13'h0030;
      expv[38] = 13'h0410;
      expv[39] = 13'h0c21;
      expv[40] = 13'h0813;
      expv[41] = 13'h0830;
      expv[42] = 13'h0c00;
      expv[43] = 13'h0412;
      expv[44] = 13'h0812;
      expv[45] = 13'h0c33;
      expv[46] = 13'h0c00;
      expv[47] = 13'h0020;
      expv[48] = 13'h0011;
      expv[49] = 13'h0823;
      expv[50] = 13'h0c01;
      expv[51] = 13'h0433;
      expv[52] = 13'h0032;
      expv[53] = 13'h0c02;
      expv[54] = 13'h0832;
      expv[55] = 13'h0422;
      expv[56] = 13'h0832;
      expv[57] = 13'h0800;
      expv[58] = 13'h0c13;
      expv[59] = 13'h0c13;
      expv[60] = 13'h0c22;
      expv[61] = 13'h0031;
      expv[62] = 13'h0c33;
      expv[63] = 13'h0403;
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
