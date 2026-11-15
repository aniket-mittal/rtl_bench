// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 170;
  localparam OW = 135;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02545 dut (
    .clk(clk),
    .clk__enable(in_vec[169:169]),
    .apb_response__prdata(in_vec[168:137]),
    .apb_response__pready(in_vec[136:136]),
    .apb_response__perr(in_vec[135:135]),
    .apb_request_1__paddr(in_vec[134:103]),
    .apb_request_1__penable(in_vec[102:102]),
    .apb_request_1__psel(in_vec[101:101]),
    .apb_request_1__pwrite(in_vec[100:100]),
    .apb_request_1__pwdata(in_vec[99:68]),
    .apb_request_0__paddr(in_vec[67:36]),
    .apb_request_0__penable(in_vec[35:35]),
    .apb_request_0__psel(in_vec[34:34]),
    .apb_request_0__pwrite(in_vec[33:33]),
    .apb_request_0__pwdata(in_vec[32:1]),
    .reset_n(in_vec[0:0]),
    .apb_request__paddr(out_vec[134:103]),
    .apb_request__penable(out_vec[102:102]),
    .apb_request__psel(out_vec[101:101]),
    .apb_request__pwrite(out_vec[100:100]),
    .apb_request__pwdata(out_vec[99:68]),
    .apb_response_1__prdata(out_vec[67:36]),
    .apb_response_1__pready(out_vec[35:35]),
    .apb_response_1__perr(out_vec[34:34]),
    .apb_response_0__prdata(out_vec[33:2]),
    .apb_response_0__pready(out_vec[1:1]),
    .apb_response_0__perr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 170'h380f56e73b5d3254d80939d152f17c4895049b83ea8;
    stim[1] = 170'h2f28433ba5222dc9a6ac825dbfda82b4c9994ffcedc;
    stim[2] = 170'h3fc03448cdf1f1b2a1e022f6e1233881fb364b991c7;
    stim[3] = 170'h32a1ead71d9d5ace1e3c4fd03b156c4f6826d75308d;
    stim[4] = 170'h2bba859aa368827b5a216ecd188f1750172583d3c09;
    stim[5] = 170'h38a604a73f4f80ad0062f86a85c3acb0afdc9df7a4b;
    stim[6] = 170'h0456b0b72828765751038d849b0a5ce6afbc2d47df1;
    stim[7] = 170'h0e143a41ced0f20176ef1dd968445d3acd8d7cdf3c1;
    stim[8] = 170'h175f2112dce16c5d78a99f11ada37f4e81ca2f398eb;
    stim[9] = 170'h09b21ff9f550c01b50d50255b974233530f0e3c3327;
    stim[10] = 170'h27a12651e0b176085a1cbd3bf0bbfb6b8bd8fad65e1;
    stim[11] = 170'h21bd017a464a63ceb0185f8eaa72c74c30dbed5aae5;
    stim[12] = 170'h3291df72501d64b9d7e7e99d4c993900c199ff2cff3;
    stim[13] = 170'h252afe3abdc0a63a522e10278f0b523f0d799518891;
    stim[14] = 170'h179907b897dec7aeb81b7d965de08e0642828e10869;
    stim[15] = 170'h1a22229b19b1b75aa4f5f3c166728e6fc2f4d961cb1;
    stim[16] = 170'h086a31b94ae4748814ef47e39fe5aed23e407ed0349;
    stim[17] = 170'h24bfa2c364a6c72cf0b1f440dbe7d1919a134cdb8ab;
    stim[18] = 170'h364a9155ac966ee55172242e2a90564041cbcb0251d;
    stim[19] = 170'h022d4c6166c7dc03284e971d2afb3c5938b089e9e4b;
    stim[20] = 170'h0e1fdb66542aa6007c9e24ae729689d5f26b3440715;
    stim[21] = 170'h23785384c63b1db25c9ab4e127e07c8178bf3df3a3f;
    stim[22] = 170'h3ffffa0fd7108aab6b9287c3e5c8e24387fc9f1d3e7;
    stim[23] = 170'h3c26101c088e211b43b65836aef81dc743ac840e761;
    stim[24] = 170'h12686483af2c8045ffab8bbf08e94c598138e3e244b;
    stim[25] = 170'h391f0924d95e9bdd7d6ae34b00ce595c529f651b2e1;
    stim[26] = 170'h0a8723a1b5102cfbb0af821b5544f6690aef845c1a3;
    stim[27] = 170'h1edb7036ab78d6a8900074578883b06fad811f3581f;
    stim[28] = 170'h2ed64ace6253ae675808e30328972aa86642388deef;
    stim[29] = 170'h249b837655e0f9268de5dd3a2b16dee97e6f33cb0c9;
    stim[30] = 170'h13e76afa974d90dd16400949c0f80f628067c87e13d;
    stim[31] = 170'h24999b823a0aaef88b9cd8e918c56285a724080d371;
    stim[32] = 170'h2c6f1a416cfef7a86b9236c8fd1e0687b8e990fd223;
    stim[33] = 170'h10a3cec6874689435dd73a2e42e68b127ead316f473;
    stim[34] = 170'h382f26716b5c83db80dff96d1207035070d738e4df9;
    stim[35] = 170'h2fa26795a39317ebc535366ea4558f26974a5f01ba1;
    stim[36] = 170'h331ba042eb6324bb67ef86f00f4bea4581ffdcff1e7;
    stim[37] = 170'h2047bce4f0276cf657821e2c0eadaaa0ce2785211f5;
    stim[38] = 170'h20f78a9fa875f257067d9f2155dc081021a8c4808dd;
    stim[39] = 170'h22d58eb6d6dfafcf640335a676aa82fed4382ce372d;
    stim[40] = 170'h24818192cb970db59ef74c2c016d8d6cc31c664c903;
    stim[41] = 170'h2483b45019471253df78310295e38bee46a740edeb9;
    stim[42] = 170'h3c76930dc8cbc717d8f707a96e92cb405d3c49f073d;
    stim[43] = 170'h3323257f475086a50b3e827c5c7e901972e44ec8f9f;
    stim[44] = 170'h2c9a71175ab45598cedbe57b82445aa3c2aa1edee61;
    stim[45] = 170'h1683d4d83dfc0193948b297b5611b61ff1b7f20ca27;
    stim[46] = 170'h346ae56004bce594ffee20a6774818822a057fa20b7;
    stim[47] = 170'h2498aa2a62c65246fa59fce8dff6a5ad6e14f001459;
    stim[48] = 170'h013895017fbe3948ff3a57e50b4b79b0d59a6677201;
    stim[49] = 170'h04a5dd32ef2e147b3b972d72332af22923fb0e3b271;
    stim[50] = 170'h3688716e6595e29d5407fe32bc23e4fbfbda4e93635;
    stim[51] = 170'h177b836eae91038f71c2012adf71337bf3c2695bbcf;
    stim[52] = 170'h1da3b8a122264f7a8a7cdab443c39ddff49885b5fb3;
    stim[53] = 170'h315ef62829ad1cc95cdb1cc1f6f2439c35424329745;
    stim[54] = 170'h31c2d239778c0f461e08d82b84317454ad3fda0d33f;
    stim[55] = 170'h1209a81ea0829ecdc3c145f68aa5f46c25f9a3cffb1;
    stim[56] = 170'h18eee05cdb2beacb93478a64787c97006273af17309;
    stim[57] = 170'h0f36b5ca1f8a8dae44337672eefd7de1c8fcbe5ab8f;
    stim[58] = 170'h0b42bdd1ec4c925f87469aeeac1199721df9a737a33;
    stim[59] = 170'h33a85256da66b801af25d8eb6bd1b21727e27468837;
    stim[60] = 170'h3ab961ad6eceb24d6a99794ed2265b18bcabbd3352b;
    stim[61] = 170'h2e6cd22832467cbdc487e996e0887cb768f6a300f4b;
    stim[62] = 170'h0839a170aba9083b40f50497d379629d7c9c8c93b85;
    stim[63] = 170'h35e98190f3768a1b4d3863f906f67f28aa34e62243f;
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
      expv[0] = 135'h0000000000000000000000000000000000;
      expv[1] = 135'h0000000000000000000000000000000000;
      expv[2] = 135'h0000000000000000000000000000000000;
      expv[3] = 135'h0000000000000000000000000000000000;
      expv[4] = 135'h0000000000000000000000000000000000;
      expv[5] = 135'h59d5ace1a3c4fd03b00000000000000000;
      expv[6] = 135'h59d5ace1e3c4fd03b00000000000000000;
      expv[7] = 135'h59d5ace1e3c4fd03b00000000000000000;
      expv[8] = 135'h59d5ace1e3c4fd03b00000000000000000;
      expv[9] = 135'h59d5ace1e3c4fd03b00000000000000000;
      expv[10] = 135'h59d5ace1e3c4fd03b00000000000000000;
      expv[11] = 135'h59d5ace1e3c4fd03b00000000000000000;
      expv[12] = 135'h59d5ace1e3c4fd03b00000000000000000;
      expv[13] = 135'h59d5ace183c4fd03b948efb92800000000;
      expv[14] = 135'h59d5ace183c4fd03b948efb92000000000;
      expv[15] = 135'h59d5ace183c4fd03b948efb92000000000;
      expv[16] = 135'h59d5ace183c4fd03b948efb92000000000;
      expv[17] = 135'h59d5ace183c4fd03b948efb92000000000;
      expv[18] = 135'h05a91f86bcca8c448948efb92000000000;
      expv[19] = 135'h05a91f86fcca8c448948efb92000000000;
      expv[20] = 135'h05a91f86fcca8c448948efb92000000000;
      expv[21] = 135'h05a91f86fcca8c448948efb92000000000;
      expv[22] = 135'h05a91f86fcca8c448948efb92000000000;
      expv[23] = 135'h05a91f869cca8c448948efb923ffff41fa;
      expv[24] = 135'h7108aab6b9287c3e5948efb923ffff41f8;
      expv[25] = 135'h7108aab6b9287c3e5948efb923ffff41f8;
      expv[26] = 135'h7108aab6f9287c3e5948efb923ffff41f8;
      expv[27] = 135'h7108aab6f9287c3e5948efb923ffff41f8;
      expv[28] = 135'h7108aab6f9287c3e5948efb923ffff41f8;
      expv[29] = 135'h7108aab6f9287c3e5948efb923ffff41f8;
      expv[30] = 135'h7108aab699287c3e524dc1bb2bffff41f8;
      expv[31] = 135'h7108aab699287c3e524dc1bb2bffff41f8;
      expv[32] = 135'h0b6f74bf3799e586424dc1bb23ffff41f8;
      expv[33] = 135'h0b6f74bf7799e586424dc1bb23ffff41f8;
      expv[34] = 135'h0b6f74bf7799e586424dc1bb23ffff41f8;
      expv[35] = 135'h0b6f74bf7799e586424dc1bb23ffff41f8;
      expv[36] = 135'h0b6f74bf7799e586424dc1bb23ffff41f8;
      expv[37] = 135'h0b6f74bf7799e586424dc1bb23ffff41f8;
      expv[38] = 135'h0b6f74bf1799e586424dc1bb2008f79c9e;
      expv[39] = 135'h0276cf653821e2c0e24dc1bb2008f79c9c;
      expv[40] = 135'h0276cf657821e2c0e24dc1bb2008f79c9c;
      expv[41] = 135'h0276cf657821e2c0e24dc1bb2008f79c9c;
      expv[42] = 135'h0276cf651821e2c0e241da280c08f79c9c;
      expv[43] = 135'h0276cf651821e2c0e241da280408f79c9c;
      expv[44] = 135'h0276cf651821e2c0e241da280408f79c9c;
      expv[45] = 135'h3f480cb93227647cf241da280408f79c9c;
      expv[46] = 135'h3f480cb93227647cf241da280408f79c9c;
      expv[47] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[48] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[49] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[50] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[51] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[52] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[53] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[54] = 135'h3f480cb97227647cf241da280408f79c9c;
      expv[55] = 135'h3f480cb91227647cf241da2806385a472e;
      expv[56] = 135'h3f480cb91227647cf241da2806385a472e;
      expv[57] = 135'h3f480cb91227647cf241da2806385a472e;
      expv[58] = 135'h3f480cb91227647cf241da2806385a472e;
      expv[59] = 135'h3f480cb91227647cf241da2806385a472e;
      expv[60] = 135'h78c0f461a08d82b84241da2806385a472c;
      expv[61] = 135'h78c0f461e08d82b84241da2806385a472c;
      expv[62] = 135'h78c0f461808d82b8473669141a385a472c;
      expv[63] = 135'h78c0f461808d82b8473669141a385a472c;
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
