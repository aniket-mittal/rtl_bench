// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 164;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09774 dut (
    .clk(clk),
    .rst(in_vec[163:163]),
    .alu_result_i(in_vec[162:131]),
    .lsu_result_i(in_vec[130:99]),
    .ppc_i(in_vec[98:67]),
    .pc_fetch_next_i(in_vec[66:35]),
    .spr_i(in_vec[34:3]),
    .op_jal_i(in_vec[2:2]),
    .op_lsu_load_i(in_vec[1:1]),
    .op_mfspr_i(in_vec[0:0]),
    .rf_result_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 164'he8b7dcb2b710b9be2e6b8d32df452e15a8b1d4389;
    stim[1] = 164'h8f5c92dade94fd7b4b7086314fe6c35f3f040a800;
    stim[2] = 164'h1f7fa0c94c95a0c62e0eaf9ea76d96b3586c21467;
    stim[3] = 164'h1f2ea6a9519153bcd338315005c0c5916529edb66;
    stim[4] = 164'h22b22ec7f39ce181e557958809afdb55d21f679f7;
    stim[5] = 164'h0c25b3c89e69721b088e7cf2cf9755efbff5b20d1;
    stim[6] = 164'h1ac0647760fd9c9f196e10b1afaebbb4f6c0f472b;
    stim[7] = 164'h3c71a640488e64d85d603e758e8064dd2a3996603;
    stim[8] = 164'h6a0eea87b0d278fe8dd7a849f54a0b361fc4f8bcf;
    stim[9] = 164'h66c9e14743c69641685a80d557124c5df9fd6d0b8;
    stim[10] = 164'h2309f99eb623f3e56a9cc9fd74a3f0943cb2b2fdb;
    stim[11] = 164'h1f9ba233340b54a77fb365322f5b86f594ad996ee;
    stim[12] = 164'h0a466065e6cd5d6c450d7514ef2f3d1b026a46a7c;
    stim[13] = 164'h5991e5061116c9f8b048fccc8f40c06e27d3e5e1b;
    stim[14] = 164'h1a633cbe25caea86f4052a3163ba966f7fd3f98d3;
    stim[15] = 164'h6a05db733df35ced91733b35ddd8bfe628dad4e2b;
    stim[16] = 164'h1376bf2ade00438e8fe090f42e67664beb422dc9e;
    stim[17] = 164'h1ff5541c7fbe7d624060df7202b78f09c69feda9f;
    stim[18] = 164'h7f9a3852dfc7d1bf5aa2580b44c7f14df791ecefe;
    stim[19] = 164'h3306ebdaed5fef3d482095d7de80d813a296959a6;
    stim[20] = 164'h45f297a5c5780dea9793d76fd845bcb1548092b5e;
    stim[21] = 164'h220ad8570977d92714fbb42851e4f7382f8acef08;
    stim[22] = 164'h4e4b0e38ef634c53dc3c50e39a9408fb2e6399e05;
    stim[23] = 164'h03d5962a84fd981e86a24538d57242d0dfd8f90c8;
    stim[24] = 164'h5ea6634cceeede2aae52eb4fb0006fad59551bb41;
    stim[25] = 164'h1d2ec7fe588b9ed90a46e94a0e583e7537e54842b;
    stim[26] = 164'h49e7294c37cb40aa1e1e5662dd94cc101121743bd;
    stim[27] = 164'h4a85cb25f1a8dfe84515b52159aaf22136e02c171;
    stim[28] = 164'h749d69d17c84fb24fb2fc9d383487d96d5d555d89;
    stim[29] = 164'h5d8410dcd19e7718227b67c630341b2f5fd895bf4;
    stim[30] = 164'h1a9402455eef9088cc822f3590cd75db6b998756b;
    stim[31] = 164'h6ede39eb91b41300536852ed907b9c1a35dd0f7d7;
    stim[32] = 164'h0d0f3e3ad7b0ea209606fa10ffe266f56e9233d23;
    stim[33] = 164'h3118d5a078e428c90f19bad72b04ba7c371af70fa;
    stim[34] = 164'h74559fb48d88c366044dd857f784fbaddee0f654f;
    stim[35] = 164'h5e1125d33a617870ce1c92ee29b966fb999b72de9;
    stim[36] = 164'h253c15454c2e8645aa0941f53fe613efcca3524bb;
    stim[37] = 164'h68da31b54d0bf4aec3a09b917f9790aea2deb3ddb;
    stim[38] = 164'h3eef950b8b44ede12ba67ded47b05b7fcf892e3dc;
    stim[39] = 164'h75c630990f5f57a2d6f06e2888ff27b23287ad200;
    stim[40] = 164'h68388067b45bafb0b6bdc3d1fdb29f98ba48fee8f;
    stim[41] = 164'h6a1d4373b24a6ddab28544ac26e673fbaf5cba7c8;
    stim[42] = 164'h2a7dca2ca92714bb78feb3c97300a90101d95b70b;
    stim[43] = 164'h72c2f14d8a130df64974f9baaeba3e1bd416046bb;
    stim[44] = 164'h227844c63a591f0a92b4ce38d730382b1ee8f0336;
    stim[45] = 164'h0db6c629f927ada1daf774982de0c6ae3d31c56b7;
    stim[46] = 164'h0780abfd39889db39a2fd92ca83625433c64b1258;
    stim[47] = 164'h01de370e29b23b1490ecbf879c56434d9a871b1ba;
    stim[48] = 164'h2cf6e06a447482ced1b889372fa83b15b2fee8111;
    stim[49] = 164'h2f744953a3bbf29559a7a04cacd2f7ea9fab92b33;
    stim[50] = 164'h508b4904f96de10a929f3891680f5cbdded9edd18;
    stim[51] = 164'h1a526561a5aec40a6c808173b27bb0cc5bbf1c8be;
    stim[52] = 164'h0f702f4333ddbd8e8f0f22d484601565c40fb32b6;
    stim[53] = 164'h3eb8ebfee17097f9dc5f6df339981ff09ac885797;
    stim[54] = 164'h3eb38fe2274ed7349cbb2b18651e73fb2d3235a36;
    stim[55] = 164'h22848fd319cf403bf80a1dc97c561b895c6624e59;
    stim[56] = 164'h15efa205b0e500bfae11ec1c17a8e22bd641142d5;
    stim[57] = 164'h14a03e24cca82b5d1a7f8ddcfcd0151bb9fd25af3;
    stim[58] = 164'h76b0a3f92982d3d77043d09ef37327ea3544026cf;
    stim[59] = 164'h9bcf7247fae2bfbb29937f4a2f4a4a9a6a03b0bcf;
    stim[60] = 164'h00807885579596dd07c608badbdf006b8916e2fbf;
    stim[61] = 164'h61da0e713d27aeb5dc0ed38f383e635c332a040d0;
    stim[62] = 164'h31fc9ed4dad1ceacc005deee614a96af1f241e411;
    stim[63] = 164'h7e686e7df187583b31f97a5a5002992b8161e69c2;
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
      expv[0] = 32'h5163a871;
      expv[1] = 32'h1eb925b5;
      expv[2] = 32'h992b418c;
      expv[3] = 32'ha322a779;
      expv[4] = 32'he739c303;
      expv[5] = 32'h7feb641a;
      expv[6] = 32'hc1fb393e;
      expv[7] = 32'h911cc9b0;
      expv[8] = 32'h61a4f1fd;
      expv[9] = 32'hcd93c28e;
      expv[10] = 32'h6c47e7ca;
      expv[11] = 32'h6816a94e;
      expv[12] = 32'hde5e7a36;
      expv[13] = 32'h222d93f1;
      expv[14] = 32'h4b95d50d;
      expv[15] = 32'h7be6b9db;
      expv[16] = 32'hbc00871d;
      expv[17] = 32'hff7cfac4;
      expv[18] = 32'hbf8fa37e;
      expv[19] = 32'hdabfde7a;
      expv[20] = 32'h8af01bd5;
      expv[21] = 32'h4415b0ae;
      expv[22] = 32'h5cc733c0;
      expv[23] = 32'h07ab2c55;
      expv[24] = 32'hb2aa3768;
      expv[25] = 32'hb1173db2;
      expv[26] = 32'h2242e877;
      expv[27] = 32'h6dc0582e;
      expv[28] = 32'habaaabb1;
      expv[29] = 32'h6068365e;
      expv[30] = 32'hbddf2111;
      expv[31] = 32'h23682600;
      expv[32] = 32'haf61d441;
      expv[33] = 32'hf1c85192;
      expv[34] = 32'h1b1186cc;
      expv[35] = 32'h3336e5bd;
      expv[36] = 32'h985d0c8b;
      expv[37] = 32'h9a17e95d;
      expv[38] = 32'h8f60b6ff;
      expv[39] = 32'heb8c6132;
      expv[40] = 32'h68b75f61;
      expv[41] = 32'hd43a86e7;
      expv[42] = 32'h524e2976;
      expv[43] = 32'h14261bec;
      expv[44] = 32'h74b23e15;
      expv[45] = 32'hf24f5b43;
      expv[46] = 32'h0f0157fa;
      expv[47] = 32'h53647629;
      expv[48] = 32'h65fdd022;
      expv[49] = 32'h4777e52a;
      expv[50] = 32'ha1169209;
      expv[51] = 32'h4b5d8814;
      expv[52] = 32'h67bb7b1d;
      expv[53] = 32'hc2e12ff3;
      expv[54] = 32'h4e9dae69;
      expv[55] = 32'hb8cc49cb;
      expv[56] = 32'hac82285a;
      expv[57] = 32'h995056ba;
      expv[58] = 32'h5305a7ae;
      expv[59] = 32'hf5c57f76;
      expv[60] = 32'haf2b2dba;
      expv[61] = 32'hc3b41ce2;
      expv[62] = 32'h3e483c82;
      expv[63] = 32'he30eb076;
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
