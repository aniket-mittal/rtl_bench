// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 90;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_101482 dut (
    .avmm_clk(clk),
    .avmm_rst_n(in_vec[102:102]),
    .i_avmm_write(in_vec[101:101]),
    .i_avmm_read(in_vec[100:100]),
    .i_avmm_addr(in_vec[99:68]),
    .i_avmm_wdata(in_vec[67:36]),
    .i_avmm_byte_en(in_vec[35:32]),
    .readdata(in_vec[31:0]),
    .o_avmm_rdata(out_vec[89:58]),
    .o_avmm_rdatavalid(out_vec[57:57]),
    .o_avmm_waitrequest(out_vec[56:56]),
    .clk(out_vec[55:55]),
    .reset(out_vec[54:54]),
    .writedata(out_vec[53:22]),
    .read(out_vec[21:21]),
    .write(out_vec[20:20]),
    .byteenable(out_vec[19:16]),
    .address(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h2b0069b66c00625181646a8ebf;
    stim[1] = 103'h030c9ca85c704a9d794ce93914;
    stim[2] = 103'h513054c7f54c9d1b01330f7d8a;
    stim[3] = 103'h53ccc8b579782fe1eb288276c4;
    stim[4] = 103'h44a86659b39320f6a18fd9d4a5;
    stim[5] = 103'h6e89b015040fe51a4aaa377cab;
    stim[6] = 103'h40f3c0ecf1f15149395f65290c;
    stim[7] = 103'h781b23870d93a8e619f38c0815;
    stim[8] = 103'h6e1f7d801ff292ac2f50cb17e0;
    stim[9] = 103'h73791ec8ef421b082a3b0e4907;
    stim[10] = 103'h45c2368e9b0599ed1039bd5746;
    stim[11] = 103'h6509e903aeecb14c1ac0edc830;
    stim[12] = 103'h4507b92439215d0bfb557269e7;
    stim[13] = 103'h52dbefc2704e4a83d729ea9b1e;
    stim[14] = 103'h7c02ed96b8f9939900cac27c67;
    stim[15] = 103'h4cf9384832e4abe25cfc49e7a1;
    stim[16] = 103'h6346465c46c3d367543bed9a34;
    stim[17] = 103'h6bda37169c5c2d909c8e1763a6;
    stim[18] = 103'h4243b251dc223ef9ce4f242977;
    stim[19] = 103'h4a4acb7355c5c14d45c70ea1d2;
    stim[20] = 103'h4c8d9919c1d82b219a82eac0e6;
    stim[21] = 103'h465c1c7e99a88bf7ed8a5ed3f2;
    stim[22] = 103'h7af8c8f89cca5bb81e3dbff3d2;
    stim[23] = 103'h50df890df0889e99283369ba3c;
    stim[24] = 103'h76853062c14ed1e42615043813;
    stim[25] = 103'h586b5d68d5798e0cac78dab741;
    stim[26] = 103'h500fd0e8edc3f69c5186f39e31;
    stim[27] = 103'h635c68a36a4d96319736a4b243;
    stim[28] = 103'h59564fbc6ff7b7713e33f3d6d8;
    stim[29] = 103'h6591ff432445e5e34207c79bd4;
    stim[30] = 103'h71b0a78ab0c3913a6af8536d5e;
    stim[31] = 103'h6a2f34a53a7b76f004e1181fb6;
    stim[32] = 103'h5ea27b5a70173ed3be9166fe82;
    stim[33] = 103'h6b3aa366644b410906b986ae4d;
    stim[34] = 103'h7f5115438917acfb4e95c3d6a5;
    stim[35] = 103'h6aaf7617cc5c62177223b290ed;
    stim[36] = 103'h6523adb5470a5a9c87cd14d227;
    stim[37] = 103'h584af3bd106e136799b3d48f44;
    stim[38] = 103'h606d8a730f6bda17d905151db0;
    stim[39] = 103'h6c268720c72bde68b2e2ea0bf4;
    stim[40] = 103'h70212afac6785024a489b724d9;
    stim[41] = 103'h5f549d5c2dc454556d60af54e9;
    stim[42] = 103'h53ad4b25cab12314a117256f58;
    stim[43] = 103'h54e7b0c8fc7daaa5367a2d754c;
    stim[44] = 103'h6015ef93d13ceca7718e69417a;
    stim[45] = 103'h64b456981e628b763bf911d442;
    stim[46] = 103'h7c1731f673d432ba5acf1a332f;
    stim[47] = 103'h6895da0c6a3e2f21575477d687;
    stim[48] = 103'h73dd8288472848243434951e32;
    stim[49] = 103'h48aba83e40a0d818873802fd8c;
    stim[50] = 103'h747935f7d6d970a6bee8642c3c;
    stim[51] = 103'h70eaccdd7ad7ca3fbb33eb5ebe;
    stim[52] = 103'h33ca996548d387028be6b8268f;
    stim[53] = 103'h1ef1e85e8535a48239fd2a5b3a;
    stim[54] = 103'h769fcf9f50831a75d15805f4e4;
    stim[55] = 103'h46023e97c9dfff0aee8f541d31;
    stim[56] = 103'h77f1658d116348f69a0bd8f5c5;
    stim[57] = 103'h47120c7b96c0ef45143b316c41;
    stim[58] = 103'h57dd77dd1c6518d16bb6030beb;
    stim[59] = 103'h5c0d98793be21f6d47a7c35ef4;
    stim[60] = 103'h51841420ccef4d7def4866b9e7;
    stim[61] = 103'h6e8cba1733c3eccb5812f616a5;
    stim[62] = 103'h58a98f5823a18847a8a046d2c7;
    stim[63] = 103'h68fe6cf7c64a97b7258201d0a1;
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
      expv[0] = 90'h00000000040000000000000;
      expv[1] = 90'h00000000040000000000000;
      expv[2] = 90'h00000000000000000000000;
      expv[3] = 90'h00000000100000000004c7f;
      expv[4] = 90'h00000000100000000004c7f;
      expv[5] = 90'h37ab6fbbf00000000004c7f;
      expv[6] = 90'h37ab6fbbd00000000000150;
      expv[7] = 90'h37ab6fbbc00000000000150;
      expv[8] = 90'h37ab6fbbd00000000003870;
      expv[9] = 90'h37ab6fbbc00000000003870;
      expv[10] = 90'h37ab6fbbd0000000000ec8e;
      expv[11] = 90'h37ab6fbbc0000000000ec8e;
      expv[12] = 90'h37ab6fbbd0000000000903a;
      expv[13] = 90'h37ab6fbbc0000000000903a;
      expv[14] = 90'h37ab6fbbd0000000000fc27;
      expv[15] = 90'h37ab6fbbd0000000000fc27;
      expv[16] = 90'h37ab6fbbf0000000000fc27;
      expv[17] = 90'h37ab6fbbd000000000065c4;
      expv[18] = 90'h37ab6fbbc000000000065c4;
      expv[19] = 90'h37ab6fbbc000000000065c4;
      expv[20] = 90'h37ab6fbbc000000000065c4;
      expv[21] = 90'h37ab6fbbc000000000065c4;
      expv[22] = 90'h37ab6fbbc000000000065c4;
      expv[23] = 90'h37ab6fbbd00000000008f89;
      expv[24] = 90'h37ab6fbbc00000000008f89;
      expv[25] = 90'h37ab6fbbd0000000000062c;
      expv[26] = 90'h37ab6fbbc0000000000062c;
      expv[27] = 90'h37ab6fbbd00000000000e8e;
      expv[28] = 90'h37ab6fbbd00000000000e8e;
      expv[29] = 90'h37ab6fbbf00000000000e8e;
      expv[30] = 90'h37ab6fbbd0000000000f432;
      expv[31] = 90'h37ab6fbbc0000000000f432;
      expv[32] = 90'h37ab6fbbd00000000004a53;
      expv[33] = 90'h37ab6fbbc00000000004a53;
      expv[34] = 90'h37ab6fbbd00000000003666;
      expv[35] = 90'h37ab6fbbc00000000003666;
      expv[36] = 90'h37ab6fbbd0000000000617c;
      expv[37] = 90'h37ab6fbbc0000000000617c;
      expv[38] = 90'h37ab6fbbd00000000003bd1;
      expv[39] = 90'h37ab6fbbd00000000003bd1;
      expv[40] = 90'h37ab6fbbf00000000003bd1;
      expv[41] = 90'h37ab6fbbd0000000000afac;
      expv[42] = 90'h37ab6fbbc0000000000afac;
      expv[43] = 90'h37ab6fbbd0000000000b25c;
      expv[44] = 90'h37ab6fbbd0000000000b25c;
      expv[45] = 90'h37ab6fbbf0000000000b25c;
      expv[46] = 90'h37ab6fbbd00000000006981;
      expv[47] = 90'h37ab6fbbc00000000006981;
      expv[48] = 90'h37ab6fbbd0000000000a0c6;
      expv[49] = 90'h37ab6fbbc0000000000a0c6;
      expv[50] = 90'h37ab6fbbc0000000000a0c6;
      expv[51] = 90'h37ab6fbbd00000000005f7d;
      expv[52] = 90'h00000000040000000000000;
      expv[53] = 90'h00000000040000000000000;
      expv[54] = 90'h00000000000000000000000;
      expv[55] = 90'h0000000010000000000f9f5;
      expv[56] = 90'h0000000000000000000f9f5;
      expv[57] = 90'h000000001000000000058d1;
      expv[58] = 90'h000000000000000000058d1;
      expv[59] = 90'h00000000100000000007dd1;
      expv[60] = 90'h00000000100000000007dd1;
      expv[61] = 90'h37ab6fbbf00000000007dd1;
      expv[62] = 90'h37ab6fbbd0000000000a173;
      expv[63] = 90'h37ab6fbbc0000000000a173;
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
