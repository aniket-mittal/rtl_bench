// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 81;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02081 dut (
    .clk(clk),
    .reset(in_vec[80:80]),
    .address(in_vec[79:77]),
    .write(in_vec[76:76]),
    .read(in_vec[75:75]),
    .writedata(in_vec[74:43]),
    .rx_data(in_vec[42:11]),
    .rx_dval(in_vec[10:10]),
    .rx_sop(in_vec[9:9]),
    .rx_eop(in_vec[8:8]),
    .rx_mod(in_vec[7:6]),
    .rx_err(in_vec[5:0]),
    .readdata(out_vec[32:1]),
    .rx_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 81'h1d36f3feb7b2065d56009;
    stim[1] = 81'h1130c5b9d0ab38bca7c0e;
    stim[2] = 81'h06d2479cf797dd7fcaf7d;
    stim[3] = 81'h0ea4b54e18bdc99a240dc;
    stim[4] = 81'h083dd6c81d6bde5f40dd1;
    stim[5] = 81'h093a9a259516621d43c78;
    stim[6] = 81'h0eb8d5efbb4d6d5bc39cd;
    stim[7] = 81'h0225df56666b12b8da3bf;
    stim[8] = 81'h066cd23a1b4e7a67668d8;
    stim[9] = 81'h0e8035b6dfcb2a6430928;
    stim[10] = 81'h030330cfb171e3cf68705;
    stim[11] = 81'h0ce092253bd4122f50165;
    stim[12] = 81'h035221d92e8f1d1026c5e;
    stim[13] = 81'h031413dff200c2bab28ff;
    stim[14] = 81'h0980476d3bf83659291c3;
    stim[15] = 81'h063a127858cf6a7a1ce73;
    stim[16] = 81'h07b6ec98f029e33dee776;
    stim[17] = 81'h13769963481f685780e9f;
    stim[18] = 81'h00088793ad51175e1bc04;
    stim[19] = 81'h0b1bdcc0c49ce3109391c;
    stim[20] = 81'h047b137fa3e0ba8d1a244;
    stim[21] = 81'h091214f034c21eaef2c19;
    stim[22] = 81'h056277fc15163a7a8d45f;
    stim[23] = 81'h01f089a8ace9010c3b658;
    stim[24] = 81'h08739a19672828d0c6941;
    stim[25] = 81'h0138ea0fb779721fa85a3;
    stim[26] = 81'h0750ea6ba833b6c464997;
    stim[27] = 81'h0da16737b31061dc79bad;
    stim[28] = 81'h0e60428dbc687b5507d77;
    stim[29] = 81'h08b8f5550654e36a0e287;
    stim[30] = 81'h06d28873907b84822e85f;
    stim[31] = 81'h00f61deefd24a93972a40;
    stim[32] = 81'h0ff5f6d23e91f99ec931c;
    stim[33] = 81'h075d203aa3deb763b9958;
    stim[34] = 81'h04004ffc9f08b416cd6e8;
    stim[35] = 81'h00c595c510d9673550850;
    stim[36] = 81'h0da6315a7b1e0ece31b1d;
    stim[37] = 81'h0c4804f1cdf8579a2211b;
    stim[38] = 81'h0a87cbe0445c05c41351d;
    stim[39] = 81'h0574de8a3fae3723cf5b8;
    stim[40] = 81'h04a8e90476171ca3a88b7;
    stim[41] = 81'h0f251a1857cc9a3388a4b;
    stim[42] = 81'h0162dcf07730341c161c9;
    stim[43] = 81'h0fa75c6491f228facb449;
    stim[44] = 81'h074dded19321ad68b501b;
    stim[45] = 81'h04970d9217bb6c1bb8f21;
    stim[46] = 81'h00e99fc0cd1adac21bf9e;
    stim[47] = 81'h0816813ecda9cb3bd76f7;
    stim[48] = 81'h184ee013a4e998f7e8487;
    stim[49] = 81'h0462f5a7c3307efbc4929;
    stim[50] = 81'h056701c598a612654c962;
    stim[51] = 81'h01f5f893333a9a2e474a8;
    stim[52] = 81'h07b1cac7b91578333740d;
    stim[53] = 81'h0636934810527d2f99996;
    stim[54] = 81'h0a6734731e7e0cf8e03aa;
    stim[55] = 81'h0dcfb78474c6cb3c40ac9;
    stim[56] = 81'h032646e91965c6ca065e4;
    stim[57] = 81'h09a08a619d0c05ba696e5;
    stim[58] = 81'h0f90dfbe1971f2b2ca934;
    stim[59] = 81'h05b7dc8693686de8562d2;
    stim[60] = 81'h0f2cefc54d0f1af65c1ff;
    stim[61] = 81'h0a32e973f89180f56c35b;
    stim[62] = 81'h0e87011a2960c6ad09cd4;
    stim[63] = 81'h0cefbc623b31f3061fc66;
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
      expv[3] = 33'h0000007a1;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000231;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000001;
      expv[9] = 33'h0000007f1;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000001;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000029;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000001;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000001;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h000000001;
      expv[30] = 33'h00000002b;
      expv[31] = 33'h0e3a83edd;
      expv[32] = 33'h0000006f9;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000001;
      expv[35] = 33'h0e3a83edd;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000007;
      expv[39] = 33'h000000001;
      expv[40] = 33'h000000009;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000711;
      expv[44] = 33'h000000001;
      expv[45] = 33'h000000001;
      expv[46] = 33'h18b73c1dd;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000001;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000000009;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000001;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000001;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000491;
      expv[59] = 33'h00000000b;
      expv[60] = 33'h000000001;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000375;
      expv[63] = 33'h000000001;
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
