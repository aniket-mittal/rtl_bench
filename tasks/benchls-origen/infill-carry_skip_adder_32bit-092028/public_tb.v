// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_092028 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[32:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0473059e5bbf695c6;
    stim[1] = 65'h0acfdcec3d2699816;
    stim[2] = 65'h11f69031b684cb908;
    stim[3] = 65'h0e9445081e5fba2de;
    stim[4] = 65'h140bbd6ae1a8eda75;
    stim[5] = 65'h1b2d245694fac9566;
    stim[6] = 65'h0900dd7881f38282c;
    stim[7] = 65'h0d604fadb83092903;
    stim[8] = 65'h00e555c254e93dc10;
    stim[9] = 65'h12c52db500a1c5347;
    stim[10] = 65'h127d6bae2c2826b66;
    stim[11] = 65'h010972941e68d0e95;
    stim[12] = 65'h1dfc6ba2867970f22;
    stim[13] = 65'h0295f9c0a0cbad316;
    stim[14] = 65'h17c87887b53da5562;
    stim[15] = 65'h1f821f81dab5a1408;
    stim[16] = 65'h10e034df394c85779;
    stim[17] = 65'h08b79ecb23b570a40;
    stim[18] = 65'h1232972d7545e3e22;
    stim[19] = 65'h143ac63654f488d7f;
    stim[20] = 65'h002cd12e46116785f;
    stim[21] = 65'h019229f3bda1014c0;
    stim[22] = 65'h0e69fa7284bbb049a;
    stim[23] = 65'h0abb6d3ecc520ce2c;
    stim[24] = 65'h13ccfc7aa3075c2ed;
    stim[25] = 65'h075ba5c23b02ec485;
    stim[26] = 65'h04c110957f2c70e17;
    stim[27] = 65'h14f404f58ef8222dc;
    stim[28] = 65'h1aa3f9125d4dd2ea6;
    stim[29] = 65'h037359176be0f283c;
    stim[30] = 65'h1ccdb60c54e05b1fa;
    stim[31] = 65'h1783fb54f230ec1c9;
    stim[32] = 65'h16785f9937d90c17c;
    stim[33] = 65'h0f684b28569c4e48c;
    stim[34] = 65'h1b62648a50cd34b02;
    stim[35] = 65'h0d68935a4600dac67;
    stim[36] = 65'h1a2e21602e5852a97;
    stim[37] = 65'h0844a3f7d61d272fe;
    stim[38] = 65'h1ad5b18793ecd4da3;
    stim[39] = 65'h1e71f83c644d83835;
    stim[40] = 65'h169ab3e5961c1c942;
    stim[41] = 65'h0ee5a7087d2b4a7bf;
    stim[42] = 65'h0ee41d7a2593dd358;
    stim[43] = 65'h1270d51cdddddbf6e;
    stim[44] = 65'h0190f63d4cda63671;
    stim[45] = 65'h0fe0076b909989517;
    stim[46] = 65'h1b6445d01bc5bd473;
    stim[47] = 65'h03c73e0e7a66c1c79;
    stim[48] = 65'h1b6a699c836e24586;
    stim[49] = 65'h106fcead0e87f3785;
    stim[50] = 65'h1415b40582d509ee7;
    stim[51] = 65'h112f448e7e8fee7dc;
    stim[52] = 65'h09474919e2371ce5f;
    stim[53] = 65'h140c9fda386a8c2b8;
    stim[54] = 65'h057396411113bad95;
    stim[55] = 65'h0c6dad8163257449b;
    stim[56] = 65'h04926a62c1a9f6aa5;
    stim[57] = 65'h0d301a0da87caf668;
    stim[58] = 65'h0c5838ce8565b269f;
    stim[59] = 65'h1f88598544ca0ba26;
    stim[60] = 65'h17fa8f20c4833629b;
    stim[61] = 65'h15b6e3046670e3951;
    stim[62] = 65'h187698be9ce7e8a8c;
    stim[63] = 65'h0c500fb054f08617f;
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
      expv[0] = 33'h00326edab;
      expv[1] = 33'h07f6746d8;
      expv[2] = 33'h067b5bc23;
      expv[3] = 33'h0cd3ff35e;
      expv[4] = 33'h15b4a9124;
      expv[5] = 33'h0e07edace;
      expv[6] = 33'h08f45ffb4;
      expv[7] = 33'h0590e23df;
      expv[8] = 33'h15ce93834;
      expv[9] = 33'h1364f2e98;
      expv[10] = 33'h1ea592448;
      expv[11] = 33'h1f72437d6;
      expv[12] = 33'h0475da94b;
      expv[13] = 33'h0361a4f00;
      expv[14] = 33'h0d041dddd;
      expv[15] = 33'h1a37c0c25;
      expv[16] = 33'h082cba56d;
      expv[17] = 33'h0c6aef6f2;
      expv[18] = 33'h0776790f9;
      expv[19] = 33'h090f4f0e5;
      expv[20] = 33'h063c38b44;
      expv[21] = 33'h1f33293fa;
      expv[22] = 33'h1325aabc2;
      expv[23] = 33'h170d78018;
      expv[24] = 33'h16d458898;
      expv[25] = 33'h025c920a9;
      expv[26] = 33'h03ed8176e;
      expv[27] = 33'h03ec27234;
      expv[28] = 33'h17f1cbfca;
      expv[29] = 33'h0d544b992;
      expv[30] = 33'h11adf10bf;
      expv[31] = 33'h09b2c7719;
      expv[32] = 33'h0e514b8ef;
      expv[33] = 33'h060499711;
      expv[34] = 33'h0a2f993a7;
      expv[35] = 33'h13696e00c;
      expv[36] = 33'h08667209a;
      expv[37] = 33'h1e61c905a;
      expv[38] = 33'h0ec28641d;
      expv[39] = 33'h02bd7bbfc;
      expv[40] = 33'h0c96ae79b;
      expv[41] = 33'h0a0ef1846;
      expv[42] = 33'h1277fa8fa;
      expv[43] = 33'h104e8ef3b;
      expv[44] = 33'h0e6b59a46;
      expv[45] = 33'h1e7990bd0;
      expv[46] = 33'h152a03175;
      expv[47] = 33'h1c2dffd60;
      expv[48] = 33'h1ed88df4e;
      expv[49] = 33'h1ef7c2256;
      expv[50] = 33'h16eabdf40;
      expv[51] = 33'h0fbd32ea2;
      expv[52] = 33'h0b7e65ffe;
      expv[53] = 33'h0c772c05b;
      expv[54] = 33'h1687311a6;
      expv[55] = 33'h0f9321cb2;
      expv[56] = 33'h063a410d2;
      expv[57] = 33'h15aca9742;
      expv[58] = 33'h11bdeb388;
      expv[59] = 33'h04526527b;
      expv[60] = 33'h1a7da54a8;
      expv[61] = 33'h1c27c6998;
      expv[62] = 33'h155e81475;
      expv[63] = 33'h014095c85;
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
