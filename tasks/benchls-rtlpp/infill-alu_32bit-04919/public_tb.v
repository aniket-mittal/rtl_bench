// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04919 dut (
    .clk(clk),
    .rst(in_vec[72:72]),
    .A(in_vec[71:40]),
    .B(in_vec[39:8]),
    .operation(in_vec[7:0]),
    .result(out_vec[33:2]),
    .overflow(out_vec[1:1]),
    .zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1b83057932838e4208c;
    stim[1] = 73'h1a05836fac5a130ee3f;
    stim[2] = 73'h002522e3b3ba5e3acb1;
    stim[3] = 73'h0a2d79bb861f220ce44;
    stim[4] = 73'h04298609420ca0d5b89;
    stim[5] = 73'h0555dc814d01c16e6f9;
    stim[6] = 73'h0e19daeeeb19fa8bb99;
    stim[7] = 73'h0cf2829f7d22b7cf2bc;
    stim[8] = 73'h0b4f7eba854b901936c;
    stim[9] = 73'h027585ce06034900732;
    stim[10] = 73'h05afeab2b544275c022;
    stim[11] = 73'h00129f38df9d21202d3;
    stim[12] = 73'h00d4bd72e43a82601eb;
    stim[13] = 73'h08758a7803df3759fb9;
    stim[14] = 73'h088a76d4ad51e12da25;
    stim[15] = 73'h01857a2b791d4c4ab06;
    stim[16] = 73'h0db3a32926e1562b4b5;
    stim[17] = 73'h00949d38fe988665fc4;
    stim[18] = 73'h0a3124b2ee84101b0c6;
    stim[19] = 73'h10bd56f375baaf648cd;
    stim[20] = 73'h04627cc6f3bc566a13b;
    stim[21] = 73'h056d3dacc896755f9e7;
    stim[22] = 73'h0742ff026421146f9ee;
    stim[23] = 73'h067306e728b61176ea6;
    stim[24] = 73'h0cfe86ea7202f1c567c;
    stim[25] = 73'h0dee4533d26e435b805;
    stim[26] = 73'h0a813eadfff716564aa;
    stim[27] = 73'h0701ff588269e29fbb9;
    stim[28] = 73'h089e2d9689b365275fd;
    stim[29] = 73'h0939d4c8e12f9bc2cfc;
    stim[30] = 73'h02f02451d3f675a573c;
    stim[31] = 73'h0d66af88df91375299a;
    stim[32] = 73'h0bfbb559ddd5f0ce7f7;
    stim[33] = 73'h012816dc52a6ac4194a;
    stim[34] = 73'h06b2c4ec5bc822045c7;
    stim[35] = 73'h000827c77223f2bef19;
    stim[36] = 73'h0eb002ded9e8366edf5;
    stim[37] = 73'h0583166c24dd9ccb7d2;
    stim[38] = 73'h0e11bc19feea983a55e;
    stim[39] = 73'h099cfb61073a8d82970;
    stim[40] = 73'h0e3d88174c80a749ffd;
    stim[41] = 73'h06a439e9b303ae05815;
    stim[42] = 73'h0dc758f144a81b244c2;
    stim[43] = 73'h03dbb16f0ba03ec5790;
    stim[44] = 73'h06d73f27609f1fe73c9;
    stim[45] = 73'h0d4679a59fd580bb040;
    stim[46] = 73'h0917a3d79819c761bd5;
    stim[47] = 73'h09278f7fcaebc539ddf;
    stim[48] = 73'h0ae6b01fd74a46a2549;
    stim[49] = 73'h0e964f17ff6ef86963b;
    stim[50] = 73'h040d08b07f40a450f94;
    stim[51] = 73'h06f5d49e2e44ea3c526;
    stim[52] = 73'h04dfa4604f740d95639;
    stim[53] = 73'h0743f7e2798850fa932;
    stim[54] = 73'h044ff03044888754ade;
    stim[55] = 73'h07ed0d7092c77c0a7a2;
    stim[56] = 73'h0964510853c384b9140;
    stim[57] = 73'h0dbd576b772a7997f4a;
    stim[58] = 73'h0f4c9348fac3588b09b;
    stim[59] = 73'h085c5bb60c21c7630c8;
    stim[60] = 73'h01cde5b71ba2207485c;
    stim[61] = 73'h04a414a416bbb4fc898;
    stim[62] = 73'h0a0765cce3e3303077d;
    stim[63] = 73'h0b08bdd14470adfc154;
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
      expv[0] = 34'h000000001;
      expv[1] = 34'h000000001;
      expv[2] = 34'h000000001;
      expv[3] = 34'h000000001;
      expv[4] = 34'h000000001;
      expv[5] = 34'h000000001;
      expv[6] = 34'h000000001;
      expv[7] = 34'h000000001;
      expv[8] = 34'h000000001;
      expv[9] = 34'h000000001;
      expv[10] = 34'h000000001;
      expv[11] = 34'h000000001;
      expv[12] = 34'h000000001;
      expv[13] = 34'h000000001;
      expv[14] = 34'h000000001;
      expv[15] = 34'h000000004;
      expv[16] = 34'h000000001;
      expv[17] = 34'h000000001;
      expv[18] = 34'h000000001;
      expv[19] = 34'h000000001;
      expv[20] = 34'h000000001;
      expv[21] = 34'h000000001;
      expv[22] = 34'h000000001;
      expv[23] = 34'h000000001;
      expv[24] = 34'h000000001;
      expv[25] = 34'h000000004;
      expv[26] = 34'h000000001;
      expv[27] = 34'h000000001;
      expv[28] = 34'h000000001;
      expv[29] = 34'h000000001;
      expv[30] = 34'h000000001;
      expv[31] = 34'h000000001;
      expv[32] = 34'h000000001;
      expv[33] = 34'h000000001;
      expv[34] = 34'h000000001;
      expv[35] = 34'h000000001;
      expv[36] = 34'h000000001;
      expv[37] = 34'h000000001;
      expv[38] = 34'h000000001;
      expv[39] = 34'h000000001;
      expv[40] = 34'h000000001;
      expv[41] = 34'h000000001;
      expv[42] = 34'h000000001;
      expv[43] = 34'h000000001;
      expv[44] = 34'h000000001;
      expv[45] = 34'h000000001;
      expv[46] = 34'h000000001;
      expv[47] = 34'h000000001;
      expv[48] = 34'h000000001;
      expv[49] = 34'h000000001;
      expv[50] = 34'h000000001;
      expv[51] = 34'h000000001;
      expv[52] = 34'h000000001;
      expv[53] = 34'h000000001;
      expv[54] = 34'h000000001;
      expv[55] = 34'h000000001;
      expv[56] = 34'h000000001;
      expv[57] = 34'h000000001;
      expv[58] = 34'h000000001;
      expv[59] = 34'h000000001;
      expv[60] = 34'h000000001;
      expv[61] = 34'h000000001;
      expv[62] = 34'h000000001;
      expv[63] = 34'h000000001;
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
