// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_156837 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .currEndP(in_vec[15:14]),
    .NAKSent(in_vec[13:13]),
    .stallSent(in_vec[12:12]),
    .CRCError(in_vec[11:11]),
    .bitStuffError(in_vec[10:10]),
    .RxOverflow(in_vec[9:9]),
    .RxTimeOut(in_vec[8:8]),
    .dataSequence(in_vec[7:7]),
    .ACKRxed(in_vec[6:6]),
    .transType(in_vec[5:4]),
    .transTypeNAK(in_vec[3:2]),
    .endPMuxErrorsWEn(in_vec[1:1]),
    .clrEPRdy(in_vec[0:0]),
    .endPControlReg(out_vec[39:36]),
    .endP0StatusReg(out_vec[35:32]),
    .endP1StatusReg(out_vec[31:28]),
    .endP2StatusReg(out_vec[27:24]),
    .endP3StatusReg(out_vec[23:20]),
    .endP0TransTypeReg(out_vec[19:18]),
    .endP1TransTypeReg(out_vec[17:16]),
    .endP2TransTypeReg(out_vec[15:14]),
    .endP3TransTypeReg(out_vec[13:12]),
    .endP0NAKTransTypeReg(out_vec[11:10]),
    .endP1NAKTransTypeReg(out_vec[9:8]),
    .endP2NAKTransTypeReg(out_vec[7:6]),
    .endP3NAKTransTypeReg(out_vec[5:4]),
    .clrEP0Rdy(out_vec[3:3]),
    .clrEP1Rdy(out_vec[2:2]),
    .clrEP2Rdy(out_vec[1:1]),
    .clrEP3Rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1c04e;
    stim[1] = 17'h15d3e;
    stim[2] = 17'h005ff;
    stim[3] = 17'h020cd;
    stim[4] = 17'h02186;
    stim[5] = 17'h01b09;
    stim[6] = 17'h0dd4d;
    stim[7] = 17'h06675;
    stim[8] = 17'h0c65d;
    stim[9] = 17'h1413b;
    stim[10] = 17'h0631e;
    stim[11] = 17'h05684;
    stim[12] = 17'h1f186;
    stim[13] = 17'h01878;
    stim[14] = 17'h0e8cd;
    stim[15] = 17'h08e1d;
    stim[16] = 17'h0e894;
    stim[17] = 17'h1e0aa;
    stim[18] = 17'h076d2;
    stim[19] = 17'h0eb9e;
    stim[20] = 17'h07bd1;
    stim[21] = 17'h09068;
    stim[22] = 17'h0bfb6;
    stim[23] = 17'h00bd9;
    stim[24] = 17'h0bea1;
    stim[25] = 17'h0ed52;
    stim[26] = 17'h0b27a;
    stim[27] = 17'h0142e;
    stim[28] = 17'h0c58e;
    stim[29] = 17'h08a0b;
    stim[30] = 17'h0a48e;
    stim[31] = 17'h07100;
    stim[32] = 17'h06d35;
    stim[33] = 17'h0c296;
    stim[34] = 17'h0e2b9;
    stim[35] = 17'h0c410;
    stim[36] = 17'h094ab;
    stim[37] = 17'h07939;
    stim[38] = 17'h077cc;
    stim[39] = 17'h0ac38;
    stim[40] = 17'h06c2f;
    stim[41] = 17'h08463;
    stim[42] = 17'h01b27;
    stim[43] = 17'h026ea;
    stim[44] = 17'h0be5b;
    stim[45] = 17'h0842b;
    stim[46] = 17'h09793;
    stim[47] = 17'h0cae0;
    stim[48] = 17'h0a2f0;
    stim[49] = 17'h0f8c5;
    stim[50] = 17'h0ceec;
    stim[51] = 17'h04465;
    stim[52] = 17'h04c8a;
    stim[53] = 17'h004a6;
    stim[54] = 17'h19de5;
    stim[55] = 17'h0dc89;
    stim[56] = 17'h082b8;
    stim[57] = 17'h00972;
    stim[58] = 17'h0cd04;
    stim[59] = 17'h03bc1;
    stim[60] = 17'h0ad4f;
    stim[61] = 17'h0326f;
    stim[62] = 17'h0e7ea;
    stim[63] = 17'h0b832;
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
      expv[0] = 40'h8000000000;
      expv[1] = 40'h2000000000;
      expv[2] = 40'h1000000008;
      expv[3] = 40'h1d000c0c08;
      expv[4] = 40'h1d000c0c00;
      expv[5] = 40'h1900000408;
      expv[6] = 40'h8900000401;
      expv[7] = 40'h2900000404;
      expv[8] = 40'h8900000401;
      expv[9] = 40'h2000000004;
      expv[10] = 40'h2000000000;
      expv[11] = 40'h2010010300;
      expv[12] = 40'h8000000000;
      expv[13] = 40'h1000000000;
      expv[14] = 40'h8000000001;
      expv[15] = 40'h4000000002;
      expv[16] = 40'h8000000000;
      expv[17] = 40'h8000000000;
      expv[18] = 40'h2000000000;
      expv[19] = 40'h80f0010000;
      expv[20] = 40'h20f0911034;
      expv[21] = 40'h40f0911030;
      expv[22] = 40'h40f0911030;
      expv[23] = 40'h10fb91d078;
      expv[24] = 40'h40fb91d072;
      expv[25] = 40'h80fb91d070;
      expv[26] = 40'h40fb51d040;
      expv[27] = 40'h10f751d080;
      expv[28] = 40'h83f759dc80;
      expv[29] = 40'h43f799ccb2;
      expv[30] = 40'h43f1990cb0;
      expv[31] = 40'h23f9990cf0;
      expv[32] = 40'h23f9990cf4;
      expv[33] = 40'h83f9990cf0;
      expv[34] = 40'h83f9991cd1;
      expv[35] = 40'h83f9991cd0;
      expv[36] = 40'h43f9991cd2;
      expv[37] = 40'h23fb999c94;
      expv[38] = 40'h23fb999c90;
      expv[39] = 40'h43fb999c90;
      expv[40] = 40'h23fb999c94;
      expv[41] = 40'h431b9a9f92;
      expv[42] = 40'h13159a9f18;
      expv[43] = 40'h13159a9710;
      expv[44] = 40'h4d159a9b12;
      expv[45] = 40'h4d179a5b92;
      expv[46] = 40'h4d119a9b92;
      expv[47] = 40'h8d1b9a5b10;
      expv[48] = 40'h4d1b9a5b10;
      expv[49] = 40'h8d1b9a5b11;
      expv[50] = 40'h8d1b9a5b10;
      expv[51] = 40'h2d1b9a5b14;
      expv[52] = 40'h2d1b9a5b10;
      expv[53] = 40'h1d9b985a10;
      expv[54] = 40'h4000000002;
      expv[55] = 40'h8000000001;
      expv[56] = 40'h4000000000;
      expv[57] = 40'h1000000000;
      expv[58] = 40'h85000c0000;
      expv[59] = 40'h15000c0008;
      expv[60] = 40'h45000c0002;
      expv[61] = 40'h15050c00c8;
      expv[62] = 40'h8705080cc0;
      expv[63] = 40'h4705d82ce0;
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
