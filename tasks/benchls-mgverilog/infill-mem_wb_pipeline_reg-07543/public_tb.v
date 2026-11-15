// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 137;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07543 dut (
    .clk(clk),
    .rst(in_vec[106:106]),
    .mem_read(in_vec[105:105]),
    .mem_write(in_vec[104:104]),
    .alu_result(in_vec[103:72]),
    .B(in_vec[71:40]),
    .dst_reg(in_vec[39:35]),
    .wb_reg_write(in_vec[34:34]),
    .wb_mem_to_reg(in_vec[33:33]),
    .pstop_i(in_vec[32:32]),
    .d_data_in(in_vec[31:0]),
    .MEM_WB_dst_reg(out_vec[136:132]),
    .MEM_WB_reg_write(out_vec[131:131]),
    .MEM_WB_mem_to_reg(out_vec[130:130]),
    .MEM_WB_mem_out(out_vec[129:98]),
    .MEM_WB_alu_out(out_vec[97:66]),
    .d_read_en(out_vec[65:65]),
    .d_write_en(out_vec[64:64]),
    .d_addr(out_vec[63:32]),
    .d_write_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h6aba52c14add069de3c7803bc13;
    stim[1] = 107'h41ecec6336e9a565075f4b3b3a6;
    stim[2] = 107'h0f6b3a0df504c3d172370e68a0c;
    stim[3] = 107'h319407aeb54e5e1d2b316bfe640;
    stim[4] = 107'h066b18fad7cc85114c941c2ec34;
    stim[5] = 107'h2831d8c59faf75d8aae745a7e1e;
    stim[6] = 107'h34c833d7e943f5db3066f7e3660;
    stim[7] = 107'h141d094734ff6c79eb112c0310f;
    stim[8] = 107'h0999c4b06b3e1e0fd125689294d;
    stim[9] = 107'h1039802461594d13969589e579b;
    stim[10] = 107'h32f8c6222f81ce8d1c5abb83c18;
    stim[11] = 107'h1a47489baaf6ad74c574767e3d1;
    stim[12] = 107'h1631795f4141fa4b65d4580daad;
    stim[13] = 107'h21a43f91f6e700b7d6d3ec17393;
    stim[14] = 107'h3a4bde5e983170520a1f61ca622;
    stim[15] = 107'h15df7bb76d827022bc552add35c;
    stim[16] = 107'h1c1364e88ef1b6b68d15e0ec842;
    stim[17] = 107'h1136b3d38cd95ef0b3742872bde;
    stim[18] = 107'h156d20acfde681e527ba8b67571;
    stim[19] = 107'h3730e91f079282db1b9265dd05a;
    stim[20] = 107'h12f291ab3cd02375d15ba578856;
    stim[21] = 107'h243cfddbc0cc49858955daf004b;
    stim[22] = 107'h2f3c82f06ea708e1a58f3508e2d;
    stim[23] = 107'h21a2d7961f32eef680dc9b60a1d;
    stim[24] = 107'h2ada47d239a0f1da4ebbc3b28ab;
    stim[25] = 107'h299b0defe9dd24db9b8ea7bfa0b;
    stim[26] = 107'h392ca400409d8c4dc781c059d49;
    stim[27] = 107'h3b03c292f21866831951e5f7961;
    stim[28] = 107'h3dd4055f8dc8975148d067a98af;
    stim[29] = 107'h0e89ee4ccbf8ed4f30c75d95817;
    stim[30] = 107'h352c9dc7df6562cc459b1825773;
    stim[31] = 107'h2dbb0fb0072076b398b2dd91df3;
    stim[32] = 107'h26714ff9cc0c20960f5bf1ed4ee;
    stim[33] = 107'h3a2ac0bffc2e8a0fa0a5d706dd3;
    stim[34] = 107'h38aaef2637a29647c48762aa46f;
    stim[35] = 107'h3bcbaeed48520dace09d4dfe110;
    stim[36] = 107'h26010da7f03a7e6360f5d5cdab3;
    stim[37] = 107'h2511e865a14f8c770a17528f124;
    stim[38] = 107'h2fc2b0c3320b2dc01a0d1f3f769;
    stim[39] = 107'h085a909379cea7e3f0980bcf120;
    stim[40] = 107'h1ee28da25bdd93497c4ad14bdf5;
    stim[41] = 107'h26831c99f3ac0832c20b3e41175;
    stim[42] = 107'h0d8698b59b57f71de730cb9a5e3;
    stim[43] = 107'h290c3219a1cef454cc25850b8bd;
    stim[44] = 107'h2bf0de0b28646487556b931f45f;
    stim[45] = 107'h3b67c0a323a4aa82680b91c142b;
    stim[46] = 107'h32a5b0e8ccc0dcb8a2578275457;
    stim[47] = 107'h1d6c0ff095f6ee79f9ec38c9a78;
    stim[48] = 107'h338158995b42340ce9deffb5362;
    stim[49] = 107'h1081c4ddbb26a64616633cbdfbe;
    stim[50] = 107'h1f9a611739bd6bc89f0237dc476;
    stim[51] = 107'h3b78bfb0c09872a6e7bddb3f4b2;
    stim[52] = 107'h1b4f8bc10c2b18adc7030d5fe1e;
    stim[53] = 107'h01c328a0b5edb8cfd0322cf8e6d;
    stim[54] = 107'h055564c0f4ff4946d9e8f3c070c;
    stim[55] = 107'h4c2e4a4e068b75373eed92800bb;
    stim[56] = 107'h2b8cdf06e093d28d0d2bf839cb9;
    stim[57] = 107'h322114cac716758baf11eb94acb;
    stim[58] = 107'h3bf523e09d689451358a6df836e;
    stim[59] = 107'h20b1e2a73a89e93da3811c7b198;
    stim[60] = 107'h29936430f02d9e3ca6a837f5da1;
    stim[61] = 107'h3f5554a110b7b83ef4d3ec94a5d;
    stim[62] = 107'h0870d9f328de9cd56df5891394f;
    stim[63] = 107'h105b52f2ce943607b54e73d3485;
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
      expv[0] = 137'hxxxxxxxxxxxxxxxxxxxaba52c14add069de;
      expv[1] = 137'h00000000000000000001ecec6336e9a5650;
      expv[2] = 137'h0000000000000000000f6b3a0df504c3d17;
      expv[3] = 137'h045c39a2833dace837f19407aeb54e5e1d2;
      expv[4] = 137'h1645aff99006501ebac66b18fad7cc85114;
      expv[5] = 137'h191070bb0d19ac63eb6831d8c59faf75d8a;
      expv[6] = 137'h15dd169f87a0c7631674c833d7e943f5db3;
      expv[7] = 137'h00dbdf8d981320cf5f941d094734ff6c79e;
      expv[8] = 137'h1604b00c43d074251cc999c4b06b3e1e0fd;
      expv[9] = 137'h0255a24a53666712c19039802461594d139;
      expv[10] = 137'h0d162795e6c0e60091b2f8c6222f81ce8d1;
      expv[11] = 137'h18aaee0f060be318889a47489baaf6ad74c;
      expv[12] = 137'h0ad1d9f8f4691d226e9631795f4141fa4b6;
      expv[13] = 137'h0b916036ab58c5e57d21a43f91f6e700b7d;
      expv[14] = 137'h0d8fb05ce4c690fe47fa4bde5e983170520;
      expv[15] = 137'h143d872988a92f797a55df7bb76d827022b;
      expv[16] = 137'h1894ab74d7177deedd9c1364e88ef1b6b68;
      expv[17] = 137'h1a1783b210b04d93a21136b3d38cd95ef0b;
      expv[18] = 137'h06d0a1caf784dacf4e156d20acfde681e52;
      expv[19] = 137'h0f6a2d9d5c55b482b3f730e91f079282db1;
      expv[20] = 137'h17099774169cc3a47c12f291ab3cd02375d;
      expv[21] = 137'h02ae95e2158bca46ace43cfddbc0cc49858;
      expv[22] = 137'h12976bc012d0f3f76f2f3c82f06ea708e1a;
      expv[23] = 137'h0b3cd4238b7cf20bc1a1a2d7961f32eef68;
      expv[24] = 137'h01b26d8287468b5e586ada47d239a0f1da4;
      expv[25] = 137'h1d6f0eca2aeb691f48e99b0defe9dd24db9;
      expv[26] = 137'h173a9efe82e66c37bfb92ca400409d8c4dc;
      expv[27] = 137'h0f0701675264b290013b03c292f21866831;
      expv[28] = 137'h128797de586c0f0a4bfdd4055f8dc897514;
      expv[29] = 137'h11819ea62bf750157e0e89ee4ccbf8ed4f3;
      expv[30] = 137'h019d765605fa27b933352c9dc7df6562cc4;
      expv[31] = 137'h0b2c6095dcd4b2771f6dbb0fb0072076b39;
      expv[32] = 137'h114b76477cf6ec3ec026714ff9cc0c20960;
      expv[33] = 137'h1eafc7b53b99c53fe73a2ac0bffc2e8a0fa;
      expv[34] = 137'h01575c1b74e8ab02fff8aaef2637a29647c;
      expv[35] = 137'h091d8aa91be2abbc98fbcbaeed48520dace;
      expv[36] = 137'h013537f8442f2ebbb526010da7f03a7e636;
      expv[37] = 137'h01d75736acd804369fe511e865a14f8c770;
      expv[38] = 137'h141d4a3c491447a196afc2b0c3320b2dc01;
      expv[39] = 137'h14347cfdda7f0ac30cc85a909379cea7e3f;
      expv[40] = 137'h01202f3c48216a424ddee28da25bdd93497;
      expv[41] = 137'h18ab452f7d7b8a368966831c99f3ac0832c;
      expv[42] = 137'h042cf9045d5a0c7267cd8698b59b57f71de;
      expv[43] = 137'h0e432e6978f61a62d6690c3219a1cef454c;
      expv[44] = 137'h1856142e2f6430c866abf0de0b286464875;
      expv[45] = 137'h0aee4c7d17efc3782cbb67c0a323a4aa826;
      expv[46] = 137'h102e47050aed9f028cb2a5b0e8ccc0dcb8a;
      expv[47] = 137'h049e09d515ca96c3a31d6c0ff095f6ee79f;
      expv[48] = 137'h13f0e3269e35b03fc2738158995b42340ce;
      expv[49] = 137'h13bbfed4d88e0562655081c4ddbb26a6461;
      expv[50] = 137'h0cccf2f7ef82071376df9a611739bd6bc89;
      expv[51] = 137'h1e08df711dbe69845cfb78bfb0c09872a6e;
      expv[52] = 137'h0f776cfd2cade2fec31b4f8bc10c2b18adc;
      expv[53] = 137'h0e0c357f87ad3e2f0401c328a0b5edb8cfd;
      expv[54] = 137'h0048b3e39b470ca282c55564c0f4ff4946d;
      expv[55] = 137'h13e3cf01c315559303cc2e4a4e068b75373;
      expv[56] = 137'h0000000000000000002b8cdf06e093d28d0;
      expv[57] = 137'h1a6fe0e72e6e337c1bb22114cac716758ba;
      expv[58] = 137'h1e07ae52b2c884532b3bf523e09d6894513;
      expv[59] = 137'h0b29b7e0dbafd48f8260b1e2a73a89e93da;
      expv[60] = 137'h070471ec6602c78a9ce9936430f02d9e3ca;
      expv[61] = 137'h0d60dfd768664d90c3ff5554a110b7b83ef;
      expv[62] = 137'h098fb252977d5552844870d9f328de9cd56;
      expv[63] = 137'h1bd6244e53e1c367cc905b52f2ce943607b;
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
