// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09585 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h389d2e23160ab6cec2;
    stim[1] = 70'h2a547d2d5ff4587b20;
    stim[2] = 70'h08e878b362255646f9;
    stim[3] = 70'h0d0795226c00deefa6;
    stim[4] = 70'h1d183f29905d83f1fc;
    stim[5] = 70'h1deef4474212b6acf6;
    stim[6] = 70'h0b726f30622a54fee7;
    stim[7] = 70'h153538a243436bf873;
    stim[8] = 70'h04e65c94d22964701c;
    stim[9] = 70'h094b484740a93c7813;
    stim[10] = 70'h1863c467f129e2a21c;
    stim[11] = 70'h1da92c3a748c352227;
    stim[12] = 70'h0178b11f874abe14ed;
    stim[13] = 70'h175f7ba077e44322ac;
    stim[14] = 70'h01219c722bc02a2174;
    stim[15] = 70'h02f77918b942e73137;
    stim[16] = 70'h0934a47cf726da66c6;
    stim[17] = 70'h1171914f4bd6dbe735;
    stim[18] = 70'h1db3bc517c178fe350;
    stim[19] = 70'h16197c87c8adba5ebf;
    stim[20] = 70'h09f11eb51a6671a330;
    stim[21] = 70'h0329bbf7524a263dd5;
    stim[22] = 70'h02ec2658dbd4de7261;
    stim[23] = 70'h13f789f3d1abf8a8c7;
    stim[24] = 70'h11095c986eb8000696;
    stim[25] = 70'h16966fac477f27f589;
    stim[26] = 70'h1f26b1903fe30ce9c8;
    stim[27] = 70'h07f20c91e3a1ca24f9;
    stim[28] = 70'h004ab2d6566c97bd81;
    stim[29] = 70'h03f0338a68449d1dcb;
    stim[30] = 70'h08a83d0a7ff365ba61;
    stim[31] = 70'h02d552d73e391f0f25;
    stim[32] = 70'h03cc37d7c63ed57536;
    stim[33] = 70'h10aab1c3c44770f8a7;
    stim[34] = 70'h0f1ef180f29d446946;
    stim[35] = 70'h0e49f7914572e0c453;
    stim[36] = 70'h0c6f7a8822eb07a8f2;
    stim[37] = 70'h08679da2559e93c8e2;
    stim[38] = 70'h011311780783b653c0;
    stim[39] = 70'h022e24d9eb7b0a04d4;
    stim[40] = 70'h1bd875007f125fd446;
    stim[41] = 70'h1936c374cac6f12d93;
    stim[42] = 70'h0c925321472b196c60;
    stim[43] = 70'h00e7fdeabbd6b8de50;
    stim[44] = 70'h0b6b65a0668225e290;
    stim[45] = 70'h3b8c814e4bbbbd6829;
    stim[46] = 70'h1ca6e1d43a917a413c;
    stim[47] = 70'h0a72956a34ae3aa434;
    stim[48] = 70'h0a33540f9961246406;
    stim[49] = 70'h19a0fafe88e6eae5c4;
    stim[50] = 70'h0e4c0be722c7aab844;
    stim[51] = 70'h1c145039474a86302d;
    stim[52] = 70'h1acd07da168504b149;
    stim[53] = 70'h092b39941c12d616db;
    stim[54] = 70'h18be98f18fa2d73785;
    stim[55] = 70'h06ecfa07a37c617b48;
    stim[56] = 70'h1feb383c344f7540e1;
    stim[57] = 70'h098246912ff6e6522f;
    stim[58] = 70'h06451a0ab462f22231;
    stim[59] = 70'h09dd7b547c835b5733;
    stim[60] = 70'h0b5546aa907d6e447a;
    stim[61] = 70'h0865320ebf4c992cb3;
    stim[62] = 70'h1d74ac0d95a581300a;
    stim[63] = 70'h10311d8cd8b8b34412;
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
      expv[0] = 33'h00ab6cec2;
      expv[1] = 33'h1f4587b20;
      expv[2] = 33'h0255646f8;
      expv[3] = 33'h000deefa6;
      expv[4] = 33'h05d83f1fd;
      expv[5] = 33'h012b6acf6;
      expv[6] = 33'h02a54fee6;
      expv[7] = 33'h1436bf872;
      expv[8] = 33'h02964701c;
      expv[9] = 33'h0a93c7812;
      expv[10] = 33'h129e2a21d;
      expv[11] = 33'h08c352226;
      expv[12] = 33'h14abe14ec;
      expv[13] = 33'h1e44322ac;
      expv[14] = 33'h1c02a2174;
      expv[15] = 33'h142e73136;
      expv[16] = 33'h126da66c6;
      expv[17] = 33'h1d6dbe734;
      expv[18] = 33'h0178fe350;
      expv[19] = 33'h0adba5ebe;
      expv[20] = 33'h06671a330;
      expv[21] = 33'h04a263dd4;
      expv[22] = 33'h1d4de7260;
      expv[23] = 33'h1abf8a8c6;
      expv[24] = 33'h0b8000696;
      expv[25] = 33'h17f27f588;
      expv[26] = 33'h1e30ce9c8;
      expv[27] = 33'h1a1ca24f8;
      expv[28] = 33'h06c97bd80;
      expv[29] = 33'h0449d1dca;
      expv[30] = 33'h1f365ba60;
      expv[31] = 33'h0391f0f24;
      expv[32] = 33'h03ed57536;
      expv[33] = 33'h04770f8a6;
      expv[34] = 33'h09d446946;
      expv[35] = 33'h172e0c452;
      expv[36] = 33'h0eb07a8f2;
      expv[37] = 33'h19e93c8e2;
      expv[38] = 33'h183b653c0;
      expv[39] = 33'h17b0a04d4;
      expv[40] = 33'h1125fd446;
      expv[41] = 33'h0c6f12d92;
      expv[42] = 33'h12b196c60;
      expv[43] = 33'h1d6b8de50;
      expv[44] = 33'h08225e290;
      expv[45] = 33'h1bbbd6828;
      expv[46] = 33'h0917a413c;
      expv[47] = 33'h0ae3aa434;
      expv[48] = 33'h161246406;
      expv[49] = 33'h0e6eae5c5;
      expv[50] = 33'h0c7aab844;
      expv[51] = 33'h14a86302c;
      expv[52] = 33'h08504b148;
      expv[53] = 33'h012d616da;
      expv[54] = 33'h1a2d73784;
      expv[55] = 33'h17c617b48;
      expv[56] = 33'h04f7540e0;
      expv[57] = 33'h1f6e6522e;
      expv[58] = 33'h062f22230;
      expv[59] = 33'h0835b5732;
      expv[60] = 33'h07d6e447a;
      expv[61] = 33'h14c992cb2;
      expv[62] = 33'h1a581300a;
      expv[63] = 33'h0b8b34413;
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
