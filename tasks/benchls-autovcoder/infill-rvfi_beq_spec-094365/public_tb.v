// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094365 dut (
    .rvfi_valid(in_vec[160:160]),
    .rvfi_insn(in_vec[159:128]),
    .rvfi_pc_rdata(in_vec[127:96]),
    .rvfi_rs1_rdata(in_vec[95:64]),
    .rvfi_rs2_rdata(in_vec[63:32]),
    .rvfi_mem_rdata(in_vec[31:0]),
    .spec_valid(out_vec[152:152]),
    .spec_trap(out_vec[151:151]),
    .spec_rs1_addr(out_vec[150:146]),
    .spec_rs2_addr(out_vec[145:141]),
    .spec_rd_addr(out_vec[140:136]),
    .spec_rd_wdata(out_vec[135:104]),
    .spec_pc_wdata(out_vec[103:72]),
    .spec_mem_addr(out_vec[71:40]),
    .spec_mem_rmask(out_vec[39:36]),
    .spec_mem_wmask(out_vec[35:32]),
    .spec_mem_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h044df7562334be032455dd4f928480dde16500139;
    stim[1] = 161'h0a4b8cc8182536291370911b1d2504081140e2b82;
    stim[2] = 161'h10565fa1d7101bd7e45d52eaf9badeba23bb0d910;
    stim[3] = 161'h1f6a2ca600e108257c139ed6887ea9c1dacef944b;
    stim[4] = 161'h1897de0e3e688eadf524f0b8b0ad0b2c16dd4388c;
    stim[5] = 161'h19f2319dc1c9b3c01990a3de915bee2912a666532;
    stim[6] = 161'h0709afb83322f2eb70289b628efe7208e945ac0b4;
    stim[7] = 161'h05484589084346f7ac19ea7692206151e68780ae7;
    stim[8] = 161'h16ca08f3811599fdccdb751292c99e63ac498bda0;
    stim[9] = 161'h14872921625abb3abfdd4a2e661e9fa63474275b2;
    stim[10] = 161'h1ee56f59c9a98c7e7842dfbacc1455c31688f9ad2;
    stim[11] = 161'h1ea0c1a90bf25db4854358d0ee54183964ce74ede;
    stim[12] = 161'h087d98372144d190ebaea582c3b19a9e31c590542;
    stim[13] = 161'h026d9438671ee30c21dcf983be7695d728cfb6601;
    stim[14] = 161'h12d3d1bb3cf1ee43ed8fb7e042d9e0d6d347da8c1;
    stim[15] = 161'h09e37664df6e844b45da711cbf1485d919e057b03;
    stim[16] = 161'h0a7642d912a4687d6a89eb616bd0f0c8e0b994b2b;
    stim[17] = 161'h1c9a28055f4f6a5bee57846c477130fa6bd6852ac;
    stim[18] = 161'h0d5d06b7ef16ec493dafa113ef97f53dbe1a3f380;
    stim[19] = 161'h022f46eb304318fcfa2e0205df586cf3842e93383;
    stim[20] = 161'h10fbd02699ca5b142fd53b602f7caa42e04a96554;
    stim[21] = 161'h0c7c77310205441aa2d56603dd52d3a03b9b85565;
    stim[22] = 161'h196e6d1ce81087fb9be402d58ae29ac209fe0b591;
    stim[23] = 161'h1548608094c1803a1774f333b978931de45ae9aa4;
    stim[24] = 161'h1d2d0a3462b7edb5ba3499ef33fa46223683a539e;
    stim[25] = 161'h025f7a2ce4088ebcfc7f2c968bf96cee84fc2bd3c;
    stim[26] = 161'h045cbc8d2c874123f1d9db4a93b6acf04a2ec405c;
    stim[27] = 161'h1702c2f9a7d1b0a8b5220085afdaecbf451246b8d;
    stim[28] = 161'h002e79708be0520e068c95230325ded7e63cc04f8;
    stim[29] = 161'h043b9905316738406bc6053deba834bfc52c6ed66;
    stim[30] = 161'h0c717e41491ff931e45acd496400d68bd0d989466;
    stim[31] = 161'h1802aa062746eb3ada5a5b1bca3e7d966ce51e1d1;
    stim[32] = 161'h17e5bb3f74a0a74034c0de899d0121a2a61da0199;
    stim[33] = 161'h0e29c760057b32fe30b860877b2c21c71a4955f93;
    stim[34] = 161'h0f25dadbd5d71216bea71c3350316b537ed2c2c14;
    stim[35] = 161'h09c815430d580fc9b2fb0c7f9fd2791bf32e78e1f;
    stim[36] = 161'h1cc6295a66958f2f22ce058e58a130aad282201ae;
    stim[37] = 161'h128f089dc695b64b348e866213b897dc29a7b0051;
    stim[38] = 161'h148f7f4cad8bd91af0743ad81d25234631f684265;
    stim[39] = 161'h10be9779706e87f554aa99d106931072310f1854a;
    stim[40] = 161'h106ddacf3687798f137d0d6b7de8efdaa56283467;
    stim[41] = 161'h036734893c5dc57c64467f9103686ce5dd8edaffd;
    stim[42] = 161'h0c611865b643cd063578fd458c203a89bcde70114;
    stim[43] = 161'h1897a311351e14218dec8729310ba891a32c38268;
    stim[44] = 161'h1c2ac79535a4785afe536a4f03f94aeb0aa87d752;
    stim[45] = 161'h174c70941b2a1627dc42bdfa32f3fbd2c9f721df8;
    stim[46] = 161'h12f9bbc55b7e125b84f1c2e4779365a20125d91d7;
    stim[47] = 161'h0e9387656c80965710e15ee452e8bd96358903085;
    stim[48] = 161'h0df835d494578f793dc31ef8b3dde2d9f4b7bf2fc;
    stim[49] = 161'h1c7544cb100d4b0f16648d7c98420d7fcde867d40;
    stim[50] = 161'h0afd934a0c7d5ace42df9e4528ff21134a320a3e9;
    stim[51] = 161'h1f736afc9c105fa5962a4c0fe520212d8e446848a;
    stim[52] = 161'h11bf8ab3c7d7cab1c77e46d889513038224f90881;
    stim[53] = 161'h066509775d08b5b51306a1b914b8187b14de8c327;
    stim[54] = 161'h135908ed3d9fb9ea3c78c400231b2fdfb5cc2d81f;
    stim[55] = 161'h1482bdbcd98a361c70d9fd2162aeac8ea6cb60081;
    stim[56] = 161'h0183f97a7d6fa70401b9d901b2259f6732f3da671;
    stim[57] = 161'h08453652416877b635e6956e8d01464649ee6f756;
    stim[58] = 161'h19e3e46b973ad6d2559a7e89c2d32002bb7740540;
    stim[59] = 161'h0b1ec74ec006d4c6550bbb76e1b54cc6eec9da02e;
    stim[60] = 161'h0ff2a4e5506df5304a5defab5c7fd90da0f52b5c1;
    stim[61] = 161'h1aef39c0d8d1735773335a205ceca207d2c531330;
    stim[62] = 161'h091a7683110f55a89063f8ba9e7a5367e9b722287;
    stim[63] = 161'h0fb037594fb6c82edb36f2db41a555237f0aabe0d;
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
      expv[0] = 153'h0f9a000000000334be036000000000000000000;
      expv[1] = 153'h0c5600000000082536295000000000000000000;
      expv[2] = 153'h0aec0000000007101bd82000000000000000000;
      expv[3] = 153'h09540000000000e10825b000000000000000000;
      expv[4] = 153'h0eee000000000e688eae3000000000000000000;
      expv[5] = 153'h09a40000000001c9b3c05000000000000000000;
      expv[6] = 153'h0d52000000000322f2ebb000000000000000000;
      expv[7] = 153'h0a1000000000084346f7e000000000000000000;
      expv[8] = 153'h005400000000011599fe0000000000000000000;
      expv[9] = 153'h094e00000000025abb3af000000000000000000;
      expv[10] = 153'h0b4a0000000009a98c7eb000000000000000000;
      expv[11] = 153'h0600000000000bf25db4c000000000000000000;
      expv[12] = 153'h0cfa000000000144d1912000000000000000000;
      expv[13] = 153'h0c9a00000000071ee30c6000000000000000000;
      expv[14] = 153'h0ea6000000000cf1ee442000000000000000000;
      expv[15] = 153'h0386000000000f6e844b8000000000000000000;
      expv[16] = 153'h0a2c0000000002a4687da000000000000000000;
      expv[17] = 153'h0974000000000f4f6a5c2000000000000000000;
      expv[18] = 153'h083a000000000f16ec497000000000000000000;
      expv[19] = 153'h0a1e00000000004318fd3000000000000000000;
      expv[20] = 153'h0eb60000000009ca5b146000000000000000000;
      expv[21] = 153'h0bb8000000000205441ae000000000000000000;
      expv[22] = 153'h0b5c00000000081087fbd000000000000000000;
      expv[23] = 153'h0b100000000004c1803a5000000000000000000;
      expv[24] = 153'h085a0000000002b7edb5f000000000000000000;
      expv[25] = 153'h0bfe0000000004088ebd3000000000000000000;
      expv[26] = 153'h0df8000000000c8741243000000000000000000;
      expv[27] = 153'h0e040000000007d1b0a8f000000000000000000;
      expv[28] = 153'h03dc000000000be0520e4000000000000000000;
      expv[29] = 153'h0cf60000000001673840a000000000000000000;
      expv[30] = 153'h0be200000000091ff9322000000000000000000;
      expv[31] = 153'h0d44000000000746eb3b1000000000000000000;
      expv[32] = 153'h0dca0000000004a0a7407000000000000000000;
      expv[33] = 153'h0e1200000000057b32fe7000000000000000000;
      expv[34] = 153'h0eca0000000005d71216f000000000000000000;
      expv[35] = 153'h0890000000000d580fc9f000000000000000000;
      expv[36] = 153'h094c0000000006958f2f6000000000000000000;
      expv[37] = 153'h085e000000000695b64b7000000000000000000;
      expv[38] = 153'h0bde000000000d8bd91b3000000000000000000;
      expv[39] = 153'h0cbc00000000006e87f59000000000000000000;
      expv[40] = 153'h0eda000000000687798f5000000000000000000;
      expv[41] = 153'h098e000000000c5dc57ca000000000000000000;
      expv[42] = 153'h08c2000000000643cd067000000000000000000;
      expv[43] = 153'h052e00000000051e1421c000000000000000000;
      expv[44] = 153'h0e140000000005a4785b3000000000000000000;
      expv[45] = 153'h0b98000000000b2a16281000000000000000000;
      expv[46] = 153'h05f2000000000b7e125bc000000000000000000;
      expv[47] = 153'h0c26000000000c8096575000000000000000000;
      expv[48] = 153'h09b00000000004578f797000000000000000000;
      expv[49] = 153'h0a2a00000000000d4b0f5000000000000000000;
      expv[50] = 153'h04ba000000000c7d5ace8000000000000000000;
      expv[51] = 153'h0b66000000000c105fa5d000000000000000000;
      expv[52] = 153'h047e0000000007d7cab20000000000000000000;
      expv[53] = 153'h084a000000000d08b5b55000000000000000000;
      expv[54] = 153'h0872000000000d9fb9ea7000000000000000000;
      expv[55] = 153'h0dc400000000098a361cb000000000000000000;
      expv[56] = 153'h07c6000000000d6fa7044000000000000000000;
      expv[57] = 153'h098a00000000016877b67000000000000000000;
      expv[58] = 153'h0f0600000000073ad6d29000000000000000000;
      expv[59] = 153'h0e3c000000000006d4c69000000000000000000;
      expv[60] = 153'h052400000000006df5308000000000000000000;
      expv[61] = 153'h09de0000000008d17357b000000000000000000;
      expv[62] = 153'h0bb400000000010f55a8d000000000000000000;
      expv[63] = 153'h09a0000000000fb6c82f1000000000000000000;
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
