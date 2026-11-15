// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 145;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06099 dut (
    .CLK(clk),
    .A(in_vec[33:18]),
    .AVALID(in_vec[17:17]),
    .B(in_vec[16:1]),
    .BVALID(in_vec[0:0]),
    .AND_OUT(out_vec[144:129]),
    .D(out_vec[128:113]),
    .OR_OUT(out_vec[112:97]),
    .P(out_vec[96:65]),
    .Q(out_vec[64:33]),
    .QVALID(out_vec[32:32]),
    .S(out_vec[31:16]),
    .XOR_OUT(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h0cb8d2e29;
    stim[1] = 34'h18e25eac3;
    stim[2] = 34'h165a81022;
    stim[3] = 34'h11e2c6ea6;
    stim[4] = 34'h135b9e3f7;
    stim[5] = 34'h0599099a9;
    stim[6] = 34'h0ffed4875;
    stim[7] = 34'h38ea6ce7a;
    stim[8] = 34'h20f3a45ff;
    stim[9] = 34'h0f10d5fdf;
    stim[10] = 34'h11c53ee3e;
    stim[11] = 34'h0bf55bd5e;
    stim[12] = 34'h11a212025;
    stim[13] = 34'h16ded828a;
    stim[14] = 34'h020b8a3bb;
    stim[15] = 34'h1b3d6c05c;
    stim[16] = 34'h2c15cb36f;
    stim[17] = 34'h25a8ced9d;
    stim[18] = 34'h13641f222;
    stim[19] = 34'h0c748525b;
    stim[20] = 34'h17f98a438;
    stim[21] = 34'h267393051;
    stim[22] = 34'h3ad22c08d;
    stim[23] = 34'h1fa1f0f33;
    stim[24] = 34'h14f86a502;
    stim[25] = 34'h357d8e7ca;
    stim[26] = 34'h3203d07b7;
    stim[27] = 34'h08bc4fa2f;
    stim[28] = 34'h2402472ec;
    stim[29] = 34'h1830c55d9;
    stim[30] = 34'h0a6c8a45f;
    stim[31] = 34'h1ea268bd6;
    stim[32] = 34'h2213695b3;
    stim[33] = 34'h27257b196;
    stim[34] = 34'h380cc1837;
    stim[35] = 34'h264f978a9;
    stim[36] = 34'h29eda5ca5;
    stim[37] = 34'h2782b1f29;
    stim[38] = 34'h168681e0a;
    stim[39] = 34'h22f963223;
    stim[40] = 34'h107867686;
    stim[41] = 34'h25c8c4b89;
    stim[42] = 34'h203a3f899;
    stim[43] = 34'h32e16bd58;
    stim[44] = 34'h1b2213df4;
    stim[45] = 34'h117d68979;
    stim[46] = 34'h3f916789a;
    stim[47] = 34'h18b46640d;
    stim[48] = 34'h154d3ee06;
    stim[49] = 34'h013b08a4b;
    stim[50] = 34'h2be374b2e;
    stim[51] = 34'h2ce6ac9fe;
    stim[52] = 34'h09e79a317;
    stim[53] = 34'h025d22bfa;
    stim[54] = 34'h1d3ab9ad0;
    stim[55] = 34'h136e3fadc;
    stim[56] = 34'h17d532977;
    stim[57] = 34'h1633363ec;
    stim[58] = 34'h375af6db5;
    stim[59] = 34'h3c2dc0382;
    stim[60] = 34'h3b0e2d731;
    stim[61] = 34'h13924c566;
    stim[62] = 34'h1c7a6dc68;
    stim[63] = 34'h2dca40929;
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
      expv[0] = 145'h0240193ef6fee3c0fbd7800000001c9f7a5f7;
      expv[1] = 145'h0c202b1d5efd2becfa7d20000000158ea96e8;
      expv[2] = 145'h01000c2f6b2f605a2801400000017617b517b;
      expv[3] = 145'h00e06fdbcefb61eec1e22000000037ede70d8;
      expv[4] = 145'h082d47ed3fbfe9260f1b4000000013f69bc95;
      expv[5] = 145'h00888c670bde80d7075a00000000163385ab0;
      expv[6] = 145'h04875c86b7ff6521695bc00000001e4359bc1;
      expv[7] = 145'h0c65295cdcf7ab79e7c8a000000054ae68494;
      expv[8] = 145'h0059d4d9b47fe24094c6400000007a6cda131;
      expv[9] = 145'h05887d8657fde52d41f1a00000001ec3293ac;
      expv[10] = 145'h08e287c67ee3e8939ced8000000013e33b00b;
      expv[11] = 145'h01d0a1d09fffe5336d136000000010e84f17a;
      expv[12] = 145'h00001ad35ad344f62eb2000000001d69ad69a;
      expv[13] = 145'h082823981b6fe8a20c64e000000011cc09a3e;
      expv[14] = 145'h00018b416b3fe053b3b6c000000015a0b59f3;
      expv[15] = 145'h0c0499a46d9fe51dee80c00000003cd230cdb;
      expv[16] = 145'h0202e141df3ee7b989a62000000030a0ee9e0;
      expv[17] = 145'h02d041ae3edde8bd0b254000000030d71e06d;
      expv[18] = 145'h092208d43fb2296ec6d200000000146a1b481;
      expv[19] = 145'h04200b5fe73fe1006c7d4000000035aff18ff;
      expv[20] = 145'h0a4096404bffc3d84525000000003b2020dfa;
      expv[21] = 145'h1301063ed33dcb6d4b0600000000331f601e6;
      expv[22] = 145'h0c080971dd69cb0f6ab60000000054b8e8b0e;
      expv[23] = 145'h00d020c41ff3e86099f5e000000010620f91e;
      expv[24] = 145'h0a5034cc4a7c23610acc200000003a6620160;
      expv[25] = 145'h0a3c893b7efeec1b9ce1c0000000349dba613;
      expv[26] = 145'h1001697d597bece15a3aa000000034bea4bd4;
      expv[27] = 145'h040234010ffee2225a14e00000001a0085fe6;
      expv[28] = 145'h0200192ff72fe40a8ca4c00000005c97fa97f;
      expv[29] = 145'h04181175ed5de20726388000000058baf4a2f;
      expv[30] = 145'h00044f7c2f77e1ac5575c000000017be17b9d;
      expv[31] = 145'h0811380e8ffd642eed18600000003c0743f62;
      expv[32] = 145'h01093a64d95ba4fb3968a00000003d326c294;
      expv[33] = 145'h13102eac1b9bf0933c44e000000017560445e;
      expv[34] = 145'h00027d89dd876153412c200000025ec4eec28;
      expv[35] = 145'h13028ab257afce177a0b0000000015592256a;
      expv[36] = 145'h04c25ac115fec3cb0d89800000007d60889e4;
      expv[37] = 145'h11c005b3d3f3cb145e790000000032d9e119e;
      expv[38] = 145'h01400d23ebe3e0a9291040000000b691f551f;
      expv[39] = 145'h0120349ed37ea1b654e6a0000000ba4f692f4;
      expv[40] = 145'h00282fa48f7c61e8031c6000000037d247aa2;
      expv[41] = 145'h00a0179cf6fce2c978b9800000009bce7b2e7;
      expv[42] = 145'h10090fa69f9d8fe1549c0000000017d347ca4;
      expv[43] = 145'h095085463bf5a968726b8000000052a319529;
      expv[44] = 145'h019101705fdf486cbd9a0000000010b82f272;
      expv[45] = 145'h0896915628bfa2590e7d8000000038ab10149;
      expv[46] = 145'h0788a7525fc9a77c94d82000000093a92c208;
      expv[47] = 145'h0440129aee5ae269e45cc0000000394d750d7;
      expv[48] = 145'h0aa00986fee6ea46c5738000000014c37a237;
      expv[49] = 145'h0084894228bda02a8a438000000014a1141c9;
      expv[50] = 145'h14b0aaa495f3ee31ada560000000355240a1a;
      expv[51] = 145'h041343133effe8db61ccc000000031899d765;
      expv[52] = 145'h00315f253ef3e40db019400000001f929f615;
      expv[53] = 145'h002e83ee23bfa019fb748000000011f711c89;
      expv[54] = 145'h088d084a5fbd4bb9dc220000000014252b982;
      expv[55] = 145'h09a50964dfbfc99e07a20000000014b26b0d6;
      expv[56] = 145'h02821e81fbffe6ec464b800000001f40fcbef;
      expv[57] = 145'h021881585f3fc7b74c010000000010ac2e93a;
      expv[58] = 145'h12895288bfff73c4d3e3c0000000394456bb1;
      expv[59] = 145'h00103e4f1e3ee034c61ee00000113f278f176;
      expv[60] = 145'h0d030afa1df70c68f52800000000557d087a0;
      expv[61] = 145'h0840361f8ddf63c5d5e1600000001b0fc2cfa;
      expv[62] = 145'h0c041c03afffa621282a800000003e01d1fdd;
      expv[63] = 145'h00801777b6f7a068d0f6800000051bbbdb3bd;
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
