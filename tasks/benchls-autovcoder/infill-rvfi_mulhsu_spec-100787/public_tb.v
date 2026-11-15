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

  autovcoder_100787 dut (
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
    stim[0] = 161'h153dc2fc67089b3e6382fa6e0cfacd82d12979e01;
    stim[1] = 161'h1d1ec52309e86c91febf1a5535f3feec0c656a25a;
    stim[2] = 161'h03f26841f9d44a97d2a4c6b94015e937f26d90970;
    stim[3] = 161'h194fed0c327fe015b61a9705c4ceb8d985feb5bf4;
    stim[4] = 161'h0136e42555cc9d4110e731e0b8a04bba3e94ec246;
    stim[5] = 161'h08410bdcae68acafbde922222078b76f7ae2de37e;
    stim[6] = 161'h01b7226c83d4c8b5b081cd02afe1dc81699850855;
    stim[7] = 161'h124542553c5566e3d444db9dfe7be54650ade8e55;
    stim[8] = 161'h0581d3f366eba309226f885cd3fdd6d93caa9b765;
    stim[9] = 161'h1a18e1657206f4a6ad7f7b54982ecbe29159c090f;
    stim[10] = 161'h09bc5d79986a27190e3751d2dd70a79e964303f0e;
    stim[11] = 161'h1e9f64afbe8e3255ceaa1666577bb26e44c63cfea;
    stim[12] = 161'h044b34dee396af2c9969515035e4a29a8ee33ff28;
    stim[13] = 161'h1761b5f7700590388559be0b8c53043effa912fc3;
    stim[14] = 161'h12445b6ef354faa85899bdd77301b9c32a6a9f5ca;
    stim[15] = 161'h0b84a7c17d76c9e9dd9edbe98e3f23ffec3d89d31;
    stim[16] = 161'h0db3f5bc83b898acad4c0fe955cd1e259f00dbe08;
    stim[17] = 161'h064c83b78a3ab8ca1a065f28d69e562ca201f40bf;
    stim[18] = 161'h12f3eff7b0426f5d874c2d1ab51da8c81ac54aafb;
    stim[19] = 161'h0c8297a1822e8afeaf309bbbe2bf5412ddb83cf65;
    stim[20] = 161'h1f52972cf02e85dc0acc9a63b47b39d04506ab05c;
    stim[21] = 161'h0099281b80507f5f3c3eeb0196f1e0678e370f7a5;
    stim[22] = 161'h0cde641088a407f90c1a893cf5603427a5477c119;
    stim[23] = 161'h1e5c03e223980b6108730ff6aded2bc0b09ae8a39;
    stim[24] = 161'h168502d3846c91b76ca71b3665cfbb932438d4a8a;
    stim[25] = 161'h0182e23b3912d3bb1691e148f395ea7a2f9cd90cf;
    stim[26] = 161'h1c78aea9d2430eca6814b67e718c30c6faf0ffce7;
    stim[27] = 161'h0d3f8768c15a9d34a6048c865ca262a66597a7af0;
    stim[28] = 161'h0ab88882aa9d2e9d2bb3c52115e43209c194a916d;
    stim[29] = 161'h1639e3c33b1994506017f7af29d8d73a4d8de9513;
    stim[30] = 161'h0e489501f64616e9fcf67770717c1cc3883901724;
    stim[31] = 161'h161d7dd3bf8c2c9185e032fa02a97f038fb3c7bfb;
    stim[32] = 161'h010893aaeffa4cc51ead678f18f093b1d8dcbf6e6;
    stim[33] = 161'h174100fa09363ad5718813b8d70e2966fb9622939;
    stim[34] = 161'h1e86aa6634a3701d59ddf331428db4cb2628f97ee;
    stim[35] = 161'h17a556decc54c4a220edad643d340f36b84a891af;
    stim[36] = 161'h17fed887d865476a7556aee3cf99723edee4c95bf;
    stim[37] = 161'h0e474542ba984ac730303e3cd9e18528b0072606c;
    stim[38] = 161'h09857141c0189e54b95caf585316772cffa8a6908;
    stim[39] = 161'h1fcfa692dcffb5e3bd500adf48f82c3a18c4acd61;
    stim[40] = 161'h014529977727d317aa78da818f6595985f5844b2a;
    stim[41] = 161'h0f87ba60f2c2c166c5c77b4d700eff599120b5191;
    stim[42] = 161'h16557f238130e9cc75acd6b1ca1fe8e99b5290621;
    stim[43] = 161'h18db5e14add7961694a7a6592254ae1468c912f58;
    stim[44] = 161'h102983e58870fc29e3e1e335c713e134d6432781f;
    stim[45] = 161'h0ffd5008c9639df4d3cf453d5081d4535fbdc2b9a;
    stim[46] = 161'h035e9b165ac84b023e5ff53ef191ccfd8d143a810;
    stim[47] = 161'h0c1f99193ff0f607f32bd24352373e9feb7718d85;
    stim[48] = 161'h0134665e11b8c7cb494dc3700385ab75cab498921;
    stim[49] = 161'h1b0c9fdbc70006a95943a93444ca08fa23b3685f0;
    stim[50] = 161'h0da119dece0a4984e02e0aa64471ac00ecb63a5a4;
    stim[51] = 161'h06dcf6c6d723f32ad40eeda381dbaf943846d6e55;
    stim[52] = 161'h1dd08cf4351d1fb9ba999d079e795895589e4f4f5;
    stim[53] = 161'h1ea8573413c63b560b03fad4645573b42477bcab1;
    stim[54] = 161'h1da523183aad4eb27997990793fb12e66aef81460;
    stim[55] = 161'h053061547611a69f96543720b4fe953d49424be99;
    stim[56] = 161'h1f737bdaeaadf8acdd4577a91d9975d8fb3450253;
    stim[57] = 161'h0bae2645a12aa7f81bc4f94b18f65a154d00a7ec2;
    stim[58] = 161'h1dba6f5ca2003ed9f0e51183cd4087da0487215de;
    stim[59] = 161'h0954a80888a8ba62b9c5b38f42b87b30302a8d23a;
    stim[60] = 161'h0f25960530a4b58feffb8838985b7a64d02c8569c;
    stim[61] = 161'h0c39382211bf962b0c1d6deaabc3086d87a9615e6;
    stim[62] = 161'h089d85a96b30a8e7f3c97d9edbbd43ca48a592cac;
    stim[63] = 161'h11d91b644d392979d9dfa71347d905366d8697c98;
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
      expv[0] = 153'h063bf2d9477657089b3ea000000000000000000;
      expv[1] = 153'h063c4f889aa1d9e86c923000000000000000000;
      expv[2] = 153'h036480039ecd99d44a981000000000000000000;
      expv[3] = 153'h075e11d5829e927fe015f000000000000000000;
      expv[4] = 153'h072c407ca52955cc9d415000000000000000000;
      expv[5] = 153'h0043bff03c8bee68acaff000000000000000000;
      expv[6] = 153'h012ed080d88243d4c8b5f000000000000000000;
      expv[7] = 153'h020aa3dd4eaecc5566e41000000000000000000;
      expv[8] = 153'h0683e09b8de276eba3096000000000000000000;
      expv[9] = 153'h0730ceb86c4ad206f4a6e000000000000000000;
      expv[10] = 153'h02f8fe806307c86a27194000000000000000000;
      expv[11] = 153'h033f5f601673fe8e32560000000000000000000;
      expv[12] = 153'h0197bd92c33a7396af2cd000000000000000000;
      expv[13] = 153'h0583e41f117df0059038c000000000000000000;
      expv[14] = 153'h02c8de9c074ba354faa89000000000000000000;
      expv[15] = 153'h05098de19c93ad76c9ea1000000000000000000;
      expv[16] = 153'h07a77f051e6d03b898ace000000000000000000;
      expv[17] = 153'h04196d87426c9a3ab8ca5000000000000000000;
      expv[18] = 153'h0767e255552530426f5dc000000000000000000;
      expv[19] = 153'h04854fdc6378c22e8afee000000000000000000;
      expv[20] = 153'h04a45e8b18b0f02e85dc4000000000000000000;
      expv[21] = 153'h01723e5ed72ce0507f5f7000000000000000000;
      expv[22] = 153'h033c2eb0dd6718a407f94000000000000000000;
      expv[23] = 153'h0039c96d90af23980b614000000000000000000;
      expv[24] = 153'h000baec8c333546c91b7a000000000000000000;
      expv[25] = 153'h07047178e9074912d3bb5000000000000000000;
      expv[26] = 153'h05715f3be88062430ecaa000000000000000000;
      expv[27] = 153'h043ed4c07c8df15a9d34e000000000000000000;
      expv[28] = 153'h04710e6ae1e29a9d2e9d6000000000000000000;
      expv[29] = 153'h0733800ec024ab199450a000000000000000000;
      expv[30] = 153'h049000000000064616ea3000000000000000000;
      expv[31] = 153'h03fba0fa451e8f8c2c91c000000000000000000;
      expv[32] = 153'h04915f42d0a35ffa4cc55000000000000000000;
      expv[33] = 153'h0003f0ace3a8a9363ad5b000000000000000000;
      expv[34] = 153'h054ccf056d0854a3701d9000000000000000000;
      expv[35] = 153'h028bb0c42236ec54c4a26000000000000000000;
      expv[36] = 153'h06fd053476fc7865476ab000000000000000000;
      expv[37] = 153'h020e801dcafeea984ac77000000000000000000;
      expv[38] = 153'h038a8eb80ee050189e54f000000000000000000;
      expv[39] = 153'h051f2e7e56aa8cffb5e3f000000000000000000;
      expv[40] = 153'h014b2aae340d8727d317e000000000000000000;
      expv[41] = 153'h05cec0056ac772c2c1670000000000000000000;
      expv[42] = 153'h03ea439757ac1130e9ccb000000000000000000;
      expv[43] = 153'h02f620ad97999dd79616d000000000000000000;
      expv[44] = 153'h0413c1b7a64aa870fc2a2000000000000000000;
      expv[45] = 153'h02ba101ee9ac69639df51000000000000000000;
      expv[46] = 153'h04fc2fd730203ac84b027000000000000000000;
      expv[47] = 153'h04fe30706d54bff0f6083000000000000000000;
      expv[48] = 153'h0328be86a34b61b8c7cb8000000000000000000;
      expv[49] = 153'h04d9bdfbdcbdc70006a99000000000000000000;
      expv[50] = 153'h00c3b00cc9c3be0a49852000000000000000000;
      expv[51] = 153'h07b98078a7b7c723f32b1000000000000000000;
      expv[52] = 153'h0461eb1d7534a51d1fb9f000000000000000000;
      expv[53] = 153'h02906ea65fce13c63b564000000000000000000;
      expv[54] = 153'h010a3e67df505aad4eb2b000000000000000000;
      expv[55] = 153'h0320a1f9c1bbc611a69fd000000000000000000;
      expv[56] = 153'h03e7bdae45689aadf8ad1000000000000000000;
      expv[57] = 153'h011c8da1594cc12aa7f85000000000000000000;
      expv[58] = 153'h0374b0bdba1a02003eda3000000000000000000;
      expv[59] = 153'h05681ef0e80fe8a8ba62f000000000000000000;
      expv[60] = 153'h048a0000000000a4b5902000000000000000000;
      expv[61] = 153'h01f24d24e03101bf962b4000000000000000000;
      expv[62] = 153'h043b52c75284ab30a8e83000000000000000000;
      expv[63] = 153'h00f2ccfec0637d39297a1000000000000000000;
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
