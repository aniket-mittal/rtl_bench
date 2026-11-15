// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01913 dut (
    .clk(clk),
    .rst(in_vec[55:55]),
    .a1(in_vec[54:53]),
    .a2(in_vec[52:51]),
    .a3(in_vec[50:49]),
    .a4(in_vec[48:47]),
    .a5(in_vec[46:45]),
    .a6(in_vec[44:43]),
    .off1(in_vec[42:39]),
    .off2(in_vec[38:35]),
    .din1(in_vec[34:8]),
    .din2(in_vec[7:4]),
    .din3(in_vec[3:0]),
    .dout1(out_vec[34:31]),
    .dout2(out_vec[30:27]),
    .dout3(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'hb75e6cb3a6e9f0;
    stim[1] = 56'hbe3c715a9f4b27;
    stim[2] = 56'h35f61c75f7d4ec;
    stim[3] = 56'h23390a9f1b8646;
    stim[4] = 56'h4e184800799845;
    stim[5] = 56'h074afac61307e2;
    stim[6] = 56'h30227df909ed44;
    stim[7] = 56'h3b4874ce0304fb;
    stim[8] = 56'h335a2b58d4a2ca;
    stim[9] = 56'h045656f729afc3;
    stim[10] = 56'h02e27ebbf875a3;
    stim[11] = 56'h2b3008ef7050aa;
    stim[12] = 56'h1a15ba8d373c7c;
    stim[13] = 56'h7410dda494221e;
    stim[14] = 56'h1a0efcb0e75fd9;
    stim[15] = 56'h64297cf6e078a5;
    stim[16] = 56'h4fd5a96d8d3c82;
    stim[17] = 56'h015daf4770c225;
    stim[18] = 56'h39b7f2f97a385e;
    stim[19] = 56'h589984526e25fe;
    stim[20] = 56'h3e5f7859475426;
    stim[21] = 56'h0344dc5f730b40;
    stim[22] = 56'h027da50ae48e52;
    stim[23] = 56'h2a70e9666e56cd;
    stim[24] = 56'h27e328be588afe;
    stim[25] = 56'h377639eafc2e50;
    stim[26] = 56'h52f52bd05e502d;
    stim[27] = 56'h219f1833adc701;
    stim[28] = 56'h19ecef9b5dfc69;
    stim[29] = 56'h344906c9ff9a71;
    stim[30] = 56'h74789057f8222f;
    stim[31] = 56'h63d0c985e0f0fe;
    stim[32] = 56'h270b43f4e5f129;
    stim[33] = 56'h55bc14fed3e578;
    stim[34] = 56'h48221b9af99f1a;
    stim[35] = 56'h178c9a5cf3757a;
    stim[36] = 56'h51571477837c23;
    stim[37] = 56'h38b6c65eb112f7;
    stim[38] = 56'h269fd71de65fdc;
    stim[39] = 56'h135abad01e9296;
    stim[40] = 56'h6bbebf14944881;
    stim[41] = 56'h3af39aaae8c9a5;
    stim[42] = 56'h07164b440d9c68;
    stim[43] = 56'h5b55f4b57a92dc;
    stim[44] = 56'h5f6c209f79cbab;
    stim[45] = 56'h7976b39f55e3bc;
    stim[46] = 56'h036f5831b71f26;
    stim[47] = 56'h07cbc4b2f6e76c;
    stim[48] = 56'h4db28507428b44;
    stim[49] = 56'h3a7b216581c556;
    stim[50] = 56'hdf2ad646bc2624;
    stim[51] = 56'h3c2f5f126bfad2;
    stim[52] = 56'h214d2c342f649d;
    stim[53] = 56'h46fa66bbfe3c2f;
    stim[54] = 56'h0a5da653e00d3b;
    stim[55] = 56'h4c7515c333cf40;
    stim[56] = 56'h547e7a5897e12e;
    stim[57] = 56'h4d0222178e681e;
    stim[58] = 56'h6224fb0537680c;
    stim[59] = 56'h2890dd35ce7706;
    stim[60] = 56'h0ec5302b58b187;
    stim[61] = 56'h14ea73c45f68f6;
    stim[62] = 56'h380e069381a407;
    stim[63] = 56'h2ec3c3cbf5614d;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'hxxxxxxxxx;
      expv[3] = 35'h000000000;
      expv[4] = 35'h450000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h4829f191a;
      expv[7] = 35'h472c61387;
      expv[8] = 35'h08df909ed;
      expv[9] = 35'h0c00003c5;
      expv[10] = 35'h270007b18;
      expv[11] = 35'h506f72b2f;
      expv[12] = 35'h0c8003b18;
      expv[13] = 35'h5a8003b18;
      expv[14] = 35'h1b0003b18;
      expv[15] = 35'h1d0ef629a;
      expv[16] = 35'h2f0ef229a;
      expv[17] = 35'h390003854;
      expv[18] = 35'h1ccf69078;
      expv[19] = 35'h3e16d8d3c;
      expv[20] = 35'h194f69178;
      expv[21] = 35'h7a4f693f8;
      expv[22] = 35'h16f4728f2;
      expv[23] = 35'h05cf590b8;
      expv[24] = 35'h264526e25;
      expv[25] = 35'h5ad0ae54e;
      expv[26] = 35'h13c526e25;
      expv[27] = 35'h16c526d65;
      expv[28] = 35'h5ccf503b8;
      expv[29] = 35'h5c033adc7;
      expv[30] = 35'h78033adc7;
      expv[31] = 35'h7f4f501b8;
      expv[32] = 35'h173d05c9e;
      expv[33] = 35'h49ec9ff9c;
      expv[34] = 35'h3e185e270;
      expv[35] = 35'h5f79b50bc;
      expv[36] = 35'h3abf4e471;
      expv[37] = 35'h6bb9af9df;
      expv[38] = 35'h3a47780bc;
      expv[39] = 35'h0e185f7f0;
      expv[40] = 35'h5898677f0;
      expv[41] = 35'h7e98677f0;
      expv[42] = 35'h0cc77827c;
      expv[43] = 35'h3fc77827c;
      expv[44] = 35'h3f477827c;
      expv[45] = 35'h4a2aae2c9;
      expv[46] = 35'h6709f79cb;
      expv[47] = 35'h652aae2c9;
      expv[48] = 35'h74aa9a2c9;
      expv[49] = 35'h3489f79cb;
      expv[50] = 35'h5339f5663;
      expv[51] = 35'h5339f5663;
      expv[52] = 35'h000000000;
      expv[53] = 35'h007126bfa;
      expv[54] = 35'h300000340;
      expv[55] = 35'h4180003f0;
      expv[56] = 35'h066bbfe3c;
      expv[57] = 35'h0000003f0;
      expv[58] = 35'h50653e00d;
      expv[59] = 35'h04653e00d;
      expv[60] = 35'h362178ee8;
      expv[61] = 35'h1de53e00d;
      expv[62] = 35'h1a535ce37;
      expv[63] = 35'h34535ce37;
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
