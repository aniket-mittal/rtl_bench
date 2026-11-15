// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 94;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061039 dut (
    .clk_core(clk),
    .rst_x(in_vec[149:149]),
    .i_req_sys(in_vec[148:148]),
    .i_wr_sys(in_vec[147:147]),
    .i_adrs_sys(in_vec[146:125]),
    .i_be_sys(in_vec[124:121]),
    .i_dbw_sys(in_vec[120:89]),
    .i_req_dma(in_vec[88:88]),
    .i_adrs_dma(in_vec[87:66]),
    .i_dbw_dma(in_vec[65:34]),
    .i_ack(in_vec[33:33]),
    .i_strr(in_vec[32:32]),
    .i_dbr(in_vec[31:0]),
    .o_ack_sys(out_vec[93:93]),
    .o_strr_sys(out_vec[92:92]),
    .o_dbr_sys(out_vec[91:60]),
    .o_req(out_vec[59:59]),
    .o_wr(out_vec[58:58]),
    .o_adrs(out_vec[57:36]),
    .o_be(out_vec[35:32]),
    .o_dbw(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h2ef5a388e91ea0284ca5c5b6ec2dcb58317d17;
    stim[1] = 150'h22991ff33501d29d6522d8f445fdd5b9983bfc;
    stim[2] = 150'h106bc85bb861c29d77b5cda17524aad932b0dc;
    stim[3] = 150'h0c38e3bc0209765d8788d2cfb45e7b469130d5;
    stim[4] = 150'h1e0bf965ed64ec7790439d74b8d7642d011a75;
    stim[5] = 150'h134428979e6b58690df40b40206a7997d2fbad;
    stim[6] = 150'h0698164a0de9a94a4b8df94940e23913217a24;
    stim[7] = 150'h08022b42cdfb645c90eb93d7dfdcb1f05998a1;
    stim[8] = 150'h2b9b08fdb78c6858bc7cda3d2aea53dbc0bd50;
    stim[9] = 150'h0eba163c38247588d58b21df355cbb331c48c1;
    stim[10] = 150'h1f0745ffa2d39bf813a215f8e73a4697165ef4;
    stim[11] = 150'h180219db8dbaa169b73d2359815e56e83608dc;
    stim[12] = 150'h03c2fc95b1fc701b21f9101abf380ca3cfad1b;
    stim[13] = 150'h1d96f44287027827da6f139f67296810b6b61b;
    stim[14] = 150'h026540291c9c293aeb8f0d2c9e07e37a91bc54;
    stim[15] = 150'h1811ed63c7ba90cc63df90345ada75711ab9bb;
    stim[16] = 150'h03d7cad709c5e653e2131c3645c2c6c4ff4e4c;
    stim[17] = 150'h18fb6fca1735a980950290a3bfe9099e8d7db5;
    stim[18] = 150'h1e4167069ecd0e2844193455a55157fbefa066;
    stim[19] = 150'h0423e33e4a65c1749c052c994d5ca50dd5d76c;
    stim[20] = 150'h19fe0d90ac4a28646774a6ec7e6a253f00ab28;
    stim[21] = 150'h133602099555d900857047f1fdd6a12b297baa;
    stim[22] = 150'h15708ef4afc6773bf2e5badeedf60873dc77e4;
    stim[23] = 150'h1f0f9cd885f959fe8eab1afa55281f1be118b4;
    stim[24] = 150'h0b42bf088f8d65408085db3164534fe93bb07a;
    stim[25] = 150'h13c552be295a4e22ced45b1333766e3538472d;
    stim[26] = 150'h19e0190ec275e10f956635551db94f63cbda3c;
    stim[27] = 150'h0a11111b7a78b3eec4f1ff49fca5e1ff348df7;
    stim[28] = 150'h1d3edbb77bc5a3b22147a871426849286ea4af;
    stim[29] = 150'h014fbe2325851cef2476b6826ab214ab6a43b9;
    stim[30] = 150'h130cb2d6ca2369d786c56db3e1480b0a737262;
    stim[31] = 150'h18db37f620d30169a4da67428d2e37e9bbfa3b;
    stim[32] = 150'h1627ef2b41fd4bb3683dba0d96b3262f6abc04;
    stim[33] = 150'h081505d83e9b3615e642cd208b407273d12df5;
    stim[34] = 150'h0bcdfd773a870cb32efbd77f0dab98d4f189b1;
    stim[35] = 150'h172ff841fac0d2a41d8355fb6105012bd54890;
    stim[36] = 150'h19c367679376ceaaaefe22c08830f4d697393c;
    stim[37] = 150'h19fa673bb67bc11b8c8e8898fb347a8db35840;
    stim[38] = 150'h0b0c9aa6c678c236ed8c4fe195df23d621f3e8;
    stim[39] = 150'h118b40effb7fe4932063864d508cd0cb1ff70d;
    stim[40] = 150'h08ccbf5f5b5f2018222ab4413c957cab0456b5;
    stim[41] = 150'h00620224e19dc389d3ebf1a274f5abda144018;
    stim[42] = 150'h0450488c3ff0c95c31402ff4fe900fde89e923;
    stim[43] = 150'h0450969a8cce1432b56287b429565d1bd322dc;
    stim[44] = 150'h12d93a5c5160afd36736fa9b906f83f917a09f;
    stim[45] = 150'h0f1058e67f1f7934435134590742cd85fbf37d;
    stim[46] = 150'h15cbb723779af977d4a5428c884d161f1f3434;
    stim[47] = 150'h15b37dc039b51f83f41915cc941139cbb920b7;
    stim[48] = 150'h008589a31d4a690c990d33d72941f4e5e68c44;
    stim[49] = 150'h0c92dd40eff6c52820a35049fe89e248a27d38;
    stim[50] = 150'h1bd1465ad9f8f07eef977e88b7fb707eea19ad;
    stim[51] = 150'h0d8b36f30b5a16e89e5b923a3662ed13e12a41;
    stim[52] = 150'h0f68b7ff6db499aaba0746ce790b50af863d9c;
    stim[53] = 150'h055782309418734e88c62ce62afbf24217738e;
    stim[54] = 150'h053322686091042e922a3813b9014afb4090ba;
    stim[55] = 150'h09c8bb2bb679ba795a179d65dd09ef1c462153;
    stim[56] = 150'h0f05d3f0d1f8aac504abec099b6306cab72343;
    stim[57] = 150'h0dadf7de4f7604ec5d64bdc956ea3aa534c841;
    stim[58] = 150'h0cfcb49892f837ebd67445ec4a6a2cf008e29a;
    stim[59] = 150'h0a86434b2b62e2f63c9b9cb2a75ea171c6057c;
    stim[60] = 150'h1dff643c29047e1fdb4318d9dc48368445fded;
    stim[61] = 150'h0df137d3dc44080f864b3736d936653acec818;
    stim[62] = 150'h0c7ebf0ff826ab38ad04a15a68111ee6d64749;
    stim[63] = 150'h00c25bda129aae736ffe382d90bf3f06cff8f2;
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
      expv[0] = 94'h358317d17xxxxxxxxxxxxxxx;
      expv[1] = 94'h1b9983bfc77ad1c4748f5014;
      expv[2] = 94'h2d932b0dc14c8ff99a80e94e;
      expv[3] = 94'h3469130d5035e42ddc30e14e;
      expv[4] = 94'h02d011a7561c71de0104bb2e;
      expv[5] = 94'h197d2fbad705fcb2f6b2763b;
      expv[6] = 94'h113217a241a2144bcf35ac34;
      expv[7] = 94'h1f05998a134c0b2506f4d4a5;
      expv[8] = 94'h3dbc0bd5040115a166fdb22e;
      expv[9] = 94'h3331c48c15cd847edbc6342c;
      expv[10] = 94'h297165ef475d0b1e1c123ac4;
      expv[11] = 94'h2e83608dc783a2ffd169cdfc;
      expv[12] = 94'h0a3cfad1b4010cedc6dd50b4;
      expv[13] = 94'h010b6b61b1e17e4ad8fe380d;
      expv[14] = 94'h37a91bc546cb7a2143813c13;
      expv[15] = 94'h1711ab9bb132a0148e4e149d;
      expv[16] = 94'h2c4ff4e4c408f6b1e3dd4866;
      expv[17] = 94'h19e8d7db51ebe56b84e2f329;
      expv[18] = 94'h3fbefa06647db7e50b9ad4c0;
      expv[19] = 94'h10dd5d76c720b3834f668714;
      expv[20] = 94'h13f00ab28211f19f2532e0ba;
      expv[21] = 94'h12b297baa4ff06c856251432;
      expv[22] = 94'h073dc77e419b0104caaaec80;
      expv[23] = 94'h31be118b42b8477a57e33b9d;
      expv[24] = 94'h3e93bb07a787ce6c42fcacff;
      expv[25] = 94'h23538472d5a15f8447c6b2a0;
      expv[26] = 94'h363cbda3c1e2a95f14ad2711;
      expv[27] = 94'h1ff348df74f00c87613af087;
      expv[28] = 94'h1286ea4af508888dbd3c59f7;
      expv[29] = 94'h0ab6a43b969f6ddbbde2d1d9;
      expv[30] = 94'h30a7372620a7df1192c28e77;
      expv[31] = 94'h3e9bbfa3b186596b6511b4eb;
      expv[32] = 94'h22f6abc0446d9bfb106980b4;
      expv[33] = 94'h273d12df5313f795a0fea5d9;
      expv[34] = 94'h0d4f189b140a82ec1f4d9b0a;
      expv[35] = 94'h12bd548905e6febb9d438659;
      expv[36] = 94'h0d697393c397fc20fd606952;
      expv[37] = 94'h28db358404e1b3b3c9bb6755;
      expv[38] = 94'h3d621f3e84fd339ddb3de08d;
      expv[39] = 94'h0cb1ff70d5864d53633c611b;
      expv[40] = 94'h0ab0456b50c5a077fdbff249;
      expv[41] = 94'h3da1440184665fafadaf900c;
      expv[42] = 94'h3de89e923031011270cee1c4;
      expv[43] = 94'h11bd322dc22824461ff864ae;
      expv[44] = 94'h3f917a09f2284b4d46670a19;
      expv[45] = 94'h185fbf37d16c9d2e28b057e9;
      expv[46] = 94'h21f1f34347882c733f8fbc9a;
      expv[47] = 94'h1cbb920b72e5db91bbcd7cbb;
      expv[48] = 94'h0e5e68c442d9bee01cda8fc1;
      expv[49] = 94'h248a27d38042c4d18ea53486;
      expv[50] = 94'h07eea19ad6496ea077fb6294;
      expv[51] = 94'h113e12a415e8a32d6cfc783f;
      expv[52] = 94'h0af863d9c6c59b7985ad0b74;
      expv[53] = 94'h24217738e7b45bffb6da4cd5;
      expv[54] = 94'h2fb4090ba2abc1184a0c39a7;
      expv[55] = 94'h31c462153299913430488217;
      expv[56] = 94'h2cab723434e45d95db3cdd3c;
      expv[57] = 94'h2a534c841782e9f868fc5562;
      expv[58] = 94'h0f008e29a6d6fbef27bb0276;
      expv[59] = 94'h171c6057c67e5a4c497c1bf5;
      expv[60] = 94'h28445fded54321a595b1717b;
      expv[61] = 94'h13acec8186ffb21e14823f0f;
      expv[62] = 94'h2e6d647496f89be9ee220407;
      expv[63] = 94'h306cff8f263f5f87fc13559c;
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
