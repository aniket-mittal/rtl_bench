// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03908 dut (
    .clk(clk),
    .reset(in_vec[42:42]),
    .start_i(in_vec[41:41]),
    .decrypt_i(in_vec[40:40]),
    .data_i(in_vec[39:8]),
    .sbox_data_i(in_vec[7:0]),
    .ready_o(out_vec[41:41]),
    .data_o(out_vec[40:9]),
    .sbox_data_o(out_vec[8:1]),
    .sbox_decrypt_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h723558fe4b5;
    stim[1] = 43'h45fc370d1e8;
    stim[2] = 43'h0d7b5da1869;
    stim[3] = 43'h32b4c1bbb7e;
    stim[4] = 43'h39be0bf7510;
    stim[5] = 43'h0c924c1e0c2;
    stim[6] = 43'h015b3b01d13;
    stim[7] = 43'h26ccacc5b9e;
    stim[8] = 43'h0f8e533728e;
    stim[9] = 43'h23c7d9d34fe;
    stim[10] = 43'h288ef962094;
    stim[11] = 43'h19747e6b131;
    stim[12] = 43'h3a0c30db3d4;
    stim[13] = 43'h1682a33ae0c;
    stim[14] = 43'h14df5e645c7;
    stim[15] = 43'h2e74e22373e;
    stim[16] = 43'h1afa723566b;
    stim[17] = 43'h296acab6e61;
    stim[18] = 43'h3385f2c29b7;
    stim[19] = 43'h3621b75776d;
    stim[20] = 43'h0b7cabd9df7;
    stim[21] = 43'h0b2fe672223;
    stim[22] = 43'h1abd1aad235;
    stim[23] = 43'h130766a2ace;
    stim[24] = 43'h082594b8e0f;
    stim[25] = 43'h265866c6bb3;
    stim[26] = 43'h2efda2b4d19;
    stim[27] = 43'h198c7db9a5e;
    stim[28] = 43'h38e8e20fef1;
    stim[29] = 43'h1d4c501d98d;
    stim[30] = 43'h2ba513d0db7;
    stim[31] = 43'h15eceee3b0c;
    stim[32] = 43'h2407517c1e3;
    stim[33] = 43'h0f6f271c60b;
    stim[34] = 43'h224dfab4ec4;
    stim[35] = 43'h031bbfdaf40;
    stim[36] = 43'h0af0f5f05b2;
    stim[37] = 43'h2c7ad6c9625;
    stim[38] = 43'h212bc0d79f7;
    stim[39] = 43'h08914ddf8e5;
    stim[40] = 43'h3023d73a9eb;
    stim[41] = 43'h03097a3dd52;
    stim[42] = 43'h249c43e4c27;
    stim[43] = 43'h1d07ad25a9d;
    stim[44] = 43'h3c163926ecc;
    stim[45] = 43'h0be2df924fc;
    stim[46] = 43'h3db81f58afc;
    stim[47] = 43'h143d60946f3;
    stim[48] = 43'h0b7dae5799a;
    stim[49] = 43'h326c55a2fd4;
    stim[50] = 43'h3964161ec77;
    stim[51] = 43'h16a5885a823;
    stim[52] = 43'h284c5d3a8fe;
    stim[53] = 43'h098859b8b4d;
    stim[54] = 43'h19aab20370f;
    stim[55] = 43'h19caffe4fcf;
    stim[56] = 43'h081320e66bb;
    stim[57] = 43'h20e042a98a9;
    stim[58] = 43'h3060fd19737;
    stim[59] = 43'h0494d1408d6;
    stim[60] = 43'h353ff9ec519;
    stim[61] = 43'h38a07a4cd4a;
    stim[62] = 43'h36ea64dcb5c;
    stim[63] = 43'h17ecb4105c3;
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
      expv[0] = 42'h00000000047;
      expv[1] = 42'h16a00000186;
      expv[2] = 42'h000000001ae;
      expv[3] = 42'h00000000057;
      expv[4] = 42'h00000000137;
      expv[5] = 42'h00000000192;
      expv[6] = 42'h0000000002a;
      expv[7] = 42'h000000000d8;
      expv[8] = 42'h000000001f0;
      expv[9] = 42'h00000000078;
      expv[10] = 42'h00000000110;
      expv[11] = 42'h0000000012f;
      expv[12] = 42'h00000000141;
      expv[13] = 42'h000000000d1;
      expv[14] = 42'h0000000009b;
      expv[15] = 42'h000000001ce;
      expv[16] = 42'h0000000015f;
      expv[17] = 42'h0000000012c;
      expv[18] = 42'h00000000071;
      expv[19] = 42'h000000000c5;
      expv[20] = 42'h0000000016e;
      expv[21] = 42'h00000000164;
      expv[22] = 42'h00000000157;
      expv[23] = 42'h00000000061;
      expv[24] = 42'h00000000104;
      expv[25] = 42'h000000000ca;
      expv[26] = 42'h000000001de;
      expv[27] = 42'h00000000131;
      expv[28] = 42'h0000000011d;
      expv[29] = 42'h000000001a9;
      expv[30] = 42'h00000000174;
      expv[31] = 42'h000000000bd;
      expv[32] = 42'h00000000080;
      expv[33] = 42'h000000001ec;
      expv[34] = 42'h00000000048;
      expv[35] = 42'h00000000062;
      expv[36] = 42'h0000000015e;
      expv[37] = 42'h0000000018e;
      expv[38] = 42'h00000000024;
      expv[39] = 42'h00000000112;
      expv[40] = 42'h00000000005;
      expv[41] = 42'h00000000060;
      expv[42] = 42'h00000000092;
      expv[43] = 42'h000000001a1;
      expv[44] = 42'h00000000183;
      expv[45] = 42'h0000000017c;
      expv[46] = 42'h000000001b7;
      expv[47] = 42'h00000000087;
      expv[48] = 42'h0000000016e;
      expv[49] = 42'h0000000004d;
      expv[50] = 42'h0000000012d;
      expv[51] = 42'h000000000d5;
      expv[52] = 42'h00000000108;
      expv[53] = 42'h00000000130;
      expv[54] = 42'h00000000135;
      expv[55] = 42'h00000000139;
      expv[56] = 42'h00000000102;
      expv[57] = 42'h0000000001c;
      expv[58] = 42'h0000000000d;
      expv[59] = 42'h00000000092;
      expv[60] = 42'h000000000a7;
      expv[61] = 42'h00000000115;
      expv[62] = 42'h000000000dd;
      expv[63] = 42'h000000000fd;
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
