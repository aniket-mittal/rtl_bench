// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10359 dut (
    .clk(clk),
    .A_mul_src1(in_vec[64:33]),
    .A_mul_src2(in_vec[32:1]),
    .reset_n(in_vec[0:0]),
    .A_mul_cell_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h12232081a91381110;
    stim[1] = 65'h0bddd5ca9605aeefa;
    stim[2] = 65'h08c09e604d64c030b;
    stim[3] = 65'h0abbdf3bd69915997;
    stim[4] = 65'h1feeec0fa22ee752f;
    stim[5] = 65'h1e0305aaccb21c12f;
    stim[6] = 65'h0e1a7787f0ff4504b;
    stim[7] = 65'h07b4803171ed2172f;
    stim[8] = 65'h0f2571f80cf20b7cf;
    stim[9] = 65'h088b0307336dc3a65;
    stim[10] = 65'h138317e1ed9685681;
    stim[11] = 65'h06d55ed1effb40089;
    stim[12] = 65'h14c246f1c7d3a4509;
    stim[13] = 65'h18c967e7b58ce802f;
    stim[14] = 65'h0fcd18a7e666bc4fb;
    stim[15] = 65'h18eb13b4da0671fd5;
    stim[16] = 65'h055da287cc0c24ecb;
    stim[17] = 65'h15bbfe81703a2263b;
    stim[18] = 65'h17aa448962d56dbeb;
    stim[19] = 65'h0d583a35e5bb593d3;
    stim[20] = 65'h1bf617e1715849f43;
    stim[21] = 65'h0d476d9e2d9f7d29d;
    stim[22] = 65'h0fc04b39791702051;
    stim[23] = 65'h0937b3d010502539f;
    stim[24] = 65'h1fbe8cff8a3cdb109;
    stim[25] = 65'h1c02704a25306e7eb;
    stim[26] = 65'h0c378136fd660c7fb;
    stim[27] = 65'h1983fa3143ca15b7b;
    stim[28] = 65'h0405be92d5222b2c7;
    stim[29] = 65'h165a6daca29d84987;
    stim[30] = 65'h1bf20b5653cce5a95;
    stim[31] = 65'h18fec96063ffb1bd3;
    stim[32] = 65'h02c3fc27448bee4c3;
    stim[33] = 65'h158ef418d825ca3ef;
    stim[34] = 65'h1ccfb23025d661821;
    stim[35] = 65'h03defcc319b2ebaad;
    stim[36] = 65'h1c44b3deeba97c755;
    stim[37] = 65'h0769962a70e5adfe7;
    stim[38] = 65'h165cebae0e26ee4e3;
    stim[39] = 65'h00d78dfae0c83f1c3;
    stim[40] = 65'h03b75628fb75e0bb5;
    stim[41] = 65'h05e185526e0c4365d;
    stim[42] = 65'h0526f824fd4e36db7;
    stim[43] = 65'h10732435b8a5be3d3;
    stim[44] = 65'h1605446eb0cfe5ac5;
    stim[45] = 65'h03769626bfa598615;
    stim[46] = 65'h17170e0879f9da555;
    stim[47] = 65'h071b8d0b9fae20ad3;
    stim[48] = 65'h001b6c326c06b6af3;
    stim[49] = 65'h03938e4007e87b377;
    stim[50] = 65'h09720cae14accd3b9;
    stim[51] = 65'h0c3eb3f3fa90cf23f;
    stim[52] = 65'h1437f672bf6b681bf;
    stim[53] = 65'h1de91ac6063d560cb;
    stim[54] = 65'h07525d19600a7867d;
    stim[55] = 65'h1be0ff7771a4ba4d5;
    stim[56] = 65'h07cfb2fe28f27955b;
    stim[57] = 65'h093525132841f7c3f;
    stim[58] = 65'h12864a8068ef9cd3f;
    stim[59] = 65'h17861d08b892cfe45;
    stim[60] = 65'h02b33af3bccb08f7b;
    stim[61] = 65'h01c851445efcb68e1;
    stim[62] = 65'h0d2bd098a7dac620d;
    stim[63] = 65'h10c5d3ed60039b34f;
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
      expv[0] = 32'hdd6a8ee8;
      expv[1] = 32'h4d942b04;
      expv[2] = 32'h6585420a;
      expv[3] = 32'he7b14b0a;
      expv[4] = 32'hbb463bbb;
      expv[5] = 32'hc5edfdba;
      expv[6] = 32'h64040d1b;
      expv[7] = 32'h67cde1fd;
      expv[8] = 32'hd267f640;
      expv[9] = 32'h53f33022;
      expv[10] = 32'h2e4748c0;
      expv[11] = 32'h85697dfc;
      expv[12] = 32'h0cc58138;
      expv[13] = 32'ha091ee7b;
      expv[14] = 32'h3749edc3;
      expv[15] = 32'hb70fd3bc;
      expv[16] = 32'h0d9e6e76;
      expv[17] = 32'h517b763f;
      expv[18] = 32'h2910aac7;
      expv[19] = 32'h580a3f47;
      expv[20] = 32'h391c8aeb;
      expv[21] = 32'h74428a6e;
      expv[22] = 32'hd5fab7b8;
      expv[23] = 32'hfeb5a980;
      expv[24] = 32'h29c23df0;
      expv[25] = 32'h36361a85;
      expv[26] = 32'h4e975edb;
      expv[27] = 32'h3417f4e2;
      expv[28] = 32'h6bcdbc02;
      expv[29] = 32'hf26e87ef;
      expv[30] = 32'hffab8174;
      expv[31] = 32'ha67aecbb;
      expv[32] = 32'h94602afa;
      expv[33] = 32'h414ac50a;
      expv[34] = 32'h4aab2410;
      expv[35] = 32'h75de0410;
      expv[36] = 32'h88f09506;
      expv[37] = 32'h8aaf4ec9;
      expv[38] = 32'hffbc1e70;
      expv[39] = 32'h77f693f7;
      expv[40] = 32'hf6715976;
      expv[41] = 32'hbcad276a;
      expv[42] = 32'he603f65d;
      expv[43] = 32'hef138375;
      expv[44] = 32'hd85d23ca;
      expv[45] = 32'hb80a4b12;
      expv[46] = 32'hf691827e;
      expv[47] = 32'ha07099bc;
      expv[48] = 32'h83ae0d7b;
      expv[49] = 32'h82e94600;
      expv[50] = 32'h29b21c40;
      expv[51] = 32'hf5307b41;
      expv[52] = 32'hd2e2aecb;
      expv[53] = 32'h7afd80f0;
      expv[54] = 32'h16e7022a;
      expv[55] = 32'he5cda16e;
      expv[56] = 32'h54c3d7dd;
      expv[57] = 32'h779d7887;
      expv[58] = 32'h42bcdfdd;
      expv[59] = 32'h41b9142a;
      expv[60] = 32'h9d60b9e9;
      expv[61] = 32'h063c56e0;
      expv[62] = 32'h8fa0d19e;
      expv[63] = 32'h0d8bb1cd;
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
