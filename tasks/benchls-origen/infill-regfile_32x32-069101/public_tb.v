// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 85;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_069101 dut (
    .clk(clk),
    .rst(in_vec[84:84]),
    .r1_addr(in_vec[83:79]),
    .r2_addr(in_vec[78:74]),
    .rd1_addr(in_vec[73:69]),
    .rd2_addr(in_vec[68:64]),
    .rd1_data(in_vec[63:32]),
    .rd2_data(in_vec[31:0]),
    .r1_data(out_vec[63:32]),
    .r2_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 85'h17feb186cf0a319ab46785;
    stim[1] = 85'h156c4f92b86f09c5903b9a;
    stim[2] = 85'h0f4550547fc270bfde8e60;
    stim[3] = 85'h0b397bd77c8dcb6a3812fa;
    stim[4] = 85'h051a21488a5d37907e734d;
    stim[5] = 85'h0a2701db2efc2f08100540;
    stim[6] = 85'h0fb0b4bde67c707723f1dc;
    stim[7] = 85'h010d2090868c21bf9473b9;
    stim[8] = 85'h18d29fc5e9a5f2680895f2;
    stim[9] = 85'h0b57553eab06f99b967bdb;
    stim[10] = 85'h006efde832282ca6a391fc;
    stim[11] = 85'h0b9ae7b8a7dcffc1250bed;
    stim[12] = 85'h0fe9db1095d3d3cd0361d4;
    stim[13] = 85'h0806ece62bc8a8d2335335;
    stim[14] = 85'h051d08e54c91fcedfc7bc9;
    stim[15] = 85'h0dfcb14bb0231f77d1f88c;
    stim[16] = 85'h0240e29207960eee93a0f8;
    stim[17] = 85'h0b754c6bd44041a6f1a1c7;
    stim[18] = 85'h0602989ccd9a59ae8bef10;
    stim[19] = 85'h01070117d0f407209b1b09;
    stim[20] = 85'h0475d8fdf9386c118ccc01;
    stim[21] = 85'h015e2de5cb758dca207ebd;
    stim[22] = 85'h00c6e5279973f304ebed0d;
    stim[23] = 85'h081f648cb6bb590eca1aad;
    stim[24] = 85'h076247312d3b41bafe01e3;
    stim[25] = 85'h04135d99a8c4d948a8681f;
    stim[26] = 85'h08b28a7164dedf510bd5b0;
    stim[27] = 85'h0b92ba18d0fa081a948413;
    stim[28] = 85'h07096ef3987ca159842ab3;
    stim[29] = 85'h0d99735c8abe33dccad173;
    stim[30] = 85'h0e96219f438569afb5d6d7;
    stim[31] = 85'h090973027297f8ff81ebfd;
    stim[32] = 85'h01aaa4324361ff5fbf5532;
    stim[33] = 85'h063f8dcfc63bbf7d8dc574;
    stim[34] = 85'h0bc970a2fe1f3a8532bc08;
    stim[35] = 85'h0ef385620b76ec63b646b6;
    stim[36] = 85'h011ab2721c3b44a7830e63;
    stim[37] = 85'h0986d6b4bec0f52dde94b0;
    stim[38] = 85'h0bb4283c30159748857d0b;
    stim[39] = 85'h18357259f0388f4dd9de0d;
    stim[40] = 85'h0e777c3649b7d878258bbb;
    stim[41] = 85'h029aa61bddcbab774a6d83;
    stim[42] = 85'h0e195a8bb8c760f864388c;
    stim[43] = 85'h0e298842ada8085d8d7c70;
    stim[44] = 85'h0db78412c27221da93eec4;
    stim[45] = 85'h0d39c726c10f56eab67aff;
    stim[46] = 85'h03049dc51f805fd21dbb6f;
    stim[47] = 85'h0e257a4f5c2dbc4b097f26;
    stim[48] = 85'h091dd20a31ad4607da4659;
    stim[49] = 85'h0373f0c4782218f9697252;
    stim[50] = 85'h03f70c696cd5b9261bb5ea;
    stim[51] = 85'h0ee5cf211d4c85372efb43;
    stim[52] = 85'h00caad67325ca0ca696093;
    stim[53] = 85'h0c8a59bb3e10baeae968d9;
    stim[54] = 85'h007f59d9277751b96d1bc9;
    stim[55] = 85'h066db4e4d55757af09c606;
    stim[56] = 85'h07cd6b5e26cf4e4fa862d8;
    stim[57] = 85'h0a45a0b3a2d251f936fe05;
    stim[58] = 85'h0dbe252d7c62a545e5fdbb;
    stim[59] = 85'h05e2e968a2fcd4edf9580f;
    stim[60] = 85'h050aca3e6344d0e74a0d9d;
    stim[61] = 85'h0f44a51db175bb0e55ce07;
    stim[62] = 85'h02f64e15bb28c2f03cba65;
    stim[63] = 85'h014d82f91560e91aa560ac;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h547fc27000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h00000000c5e9a5f2;
      expv[9] = 64'h000000009b967bdb;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'hb8a7dcff00000000;
      expv[12] = 64'h000000003eab06f9;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h00000000c1250bed;
      expv[15] = 64'hcd0361d400000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h00000000a6a391fc;
      expv[18] = 64'ha6f1a1c700000000;
      expv[19] = 64'hee93a0f8209b1b09;
      expv[20] = 64'hedfc7bc9a6a391fc;
      expv[21] = 64'hee93a0f8e62bc8a8;
      expv[22] = 64'h209b1b09e5cb758d;
      expv[23] = 64'h000000009207960e;
      expv[24] = 64'hfdf9386c118ccc01;
      expv[25] = 64'hedfc7bc90eca1aad;
      expv[26] = 64'he5cb758da6f1a1c7;
      expv[27] = 64'h279973f30eca1aad;
      expv[28] = 64'h59842ab3ee93a0f8;
      expv[29] = 64'h8cb6bb5900000000;
      expv[30] = 64'h48a8681f04ebed0d;
      expv[31] = 64'h312d3b41ee93a0f8;
      expv[32] = 64'h00000000510bd5b0;
      expv[33] = 64'ha6f1a1c700000000;
      expv[34] = 64'h279973f3312d3b41;
      expv[35] = 64'h48a8681f620b76ec;
      expv[36] = 64'hee93a0f800000000;
      expv[37] = 64'hff81ebfdafb5d6d7;
      expv[38] = 64'h279973f37d8dc574;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h78258bbb00000000;
      expv[41] = 64'h00000000774a6d83;
      expv[42] = 64'h78258bbb774a6d83;
      expv[43] = 64'h78258bbb8bb8c760;
      expv[44] = 64'h3649b7d800000000;
      expv[45] = 64'hf864388c26c10f56;
      expv[46] = 64'h774a6d8300000000;
      expv[47] = 64'h12c2722100000000;
      expv[48] = 64'h07da4659eab67aff;
      expv[49] = 64'h774a6d8312c27221;
      expv[50] = 64'heab67affd21dbb6f;
      expv[51] = 64'hd21dbb6f00000000;
      expv[52] = 64'h0000000007da4659;
      expv[53] = 64'heae968d900000000;
      expv[54] = 64'h00000000c4782218;
      expv[55] = 64'h261bb5ea3649b7d8;
      expv[56] = 64'h372efb4300000000;
      expv[57] = 64'haf09c60600000000;
      expv[58] = 64'h3649b7d8372efb43;
      expv[59] = 64'h4fa862d8696cd5b9;
      expv[60] = 64'he74a0d9d00000000;
      expv[61] = 64'h000000002d7c62a5;
      expv[62] = 64'h0e55ce07d21dbb6f;
      expv[63] = 64'h1aa560ac00000000;
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
