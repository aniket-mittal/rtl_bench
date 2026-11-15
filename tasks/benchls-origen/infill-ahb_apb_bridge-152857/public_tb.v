// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 114;
  localparam OW = 102;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_152857 dut (
    .clk(clk),
    .rst_n(in_vec[113:113]),
    .ahbls_hready(in_vec[112:112]),
    .ahbls_haddr(in_vec[111:80]),
    .ahbls_hwrite(in_vec[79:79]),
    .ahbls_htrans(in_vec[78:77]),
    .ahbls_hsize(in_vec[76:74]),
    .ahbls_hburst(in_vec[73:71]),
    .ahbls_hprot(in_vec[70:67]),
    .ahbls_hmastlock(in_vec[66:66]),
    .ahbls_hwdata(in_vec[65:34]),
    .apbm_pready(in_vec[33:33]),
    .apbm_prdata(in_vec[32:1]),
    .apbm_pslverr(in_vec[0:0]),
    .ahbls_hready_resp(out_vec[101:101]),
    .ahbls_hresp(out_vec[100:99]),
    .ahbls_hrdata(out_vec[98:67]),
    .apbm_paddr(out_vec[66:35]),
    .apbm_psel(out_vec[34:34]),
    .apbm_penable(out_vec[33:33]),
    .apbm_pwrite(out_vec[32:32]),
    .apbm_pwdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 114'h19c38a6e7de6df2d514f97d5bf4d0;
    stim[1] = 114'h1940c4b36e1cf850ac12c06ba7d18;
    stim[2] = 114'h3459355dc765289a93e46c8456a4b;
    stim[3] = 114'h2050fa4e5e93f836293eb439a30c8;
    stim[4] = 114'h39ccbf372141f0b8f9c660adbe950;
    stim[5] = 114'h349092aab2178b0c194464a3cc07b;
    stim[6] = 114'h2fa9622729ef4c4a44066ef4dc9c8;
    stim[7] = 114'h3c5c8462c259e8ba3aa94939917b8;
    stim[8] = 114'h2db9ceee27485a9642a15741e555b;
    stim[9] = 114'h2c28ec7dbbfc3eac4071b9a511767;
    stim[10] = 114'h38ce11639ec1025361e65cdfaf9c0;
    stim[11] = 114'h3553a83069b64ac642d190aa5a3cb;
    stim[12] = 114'h2e8b19ba0a45d9f85fe0241aec6fe;
    stim[13] = 114'h35a57716b8f4215a51618d933d5ca;
    stim[14] = 114'h2633bf264daf1ac0b8b0195742822;
    stim[15] = 114'h2964a7ed57f40af2a3d7cba147cec;
    stim[16] = 114'h1937d6399141a2636e9873628d00b;
    stim[17] = 114'h3b6c0122280b8f37b06b7b93b56c4;
    stim[18] = 114'h3c20f88977dae5a677c7a53357449;
    stim[19] = 114'h220cb8d7a9ba57d55ffcb16889439;
    stim[20] = 114'h329de9a79cd356580c21808e816b7;
    stim[21] = 114'h24beb3ff99f922375fd75195d7e29;
    stim[22] = 114'h30e4d675a0b5c17390493a60632a7;
    stim[23] = 114'h3e9b5a4d973709b3e40ee783a1274;
    stim[24] = 114'h308a5123cb70ea5ea2c6d66dedea2;
    stim[25] = 114'h3a51eb587081a27750e47e8920ab9;
    stim[26] = 114'h2457187a9b87ce0e0eff7fba1ea2c;
    stim[27] = 114'h34b95b441fa1aafba09b11103e198;
    stim[28] = 114'h3cb113ee796505404550dbbe38928;
    stim[29] = 114'h20c3e38c5e52f29692ba45a5aa1f6;
    stim[30] = 114'h3b536664f5c349e56388c91e41a39;
    stim[31] = 114'h239559b9cd7c57726a0babbf07c48;
    stim[32] = 114'h2703eef2c9cf3bce286999044d166;
    stim[33] = 114'h39c1e8c1f32c5252d580c6c409875;
    stim[34] = 114'h30c9a1edb476d434133e72b4dd453;
    stim[35] = 114'h308d385ac055480e8899967f3a591;
    stim[36] = 114'h2c7bf2c95724447a8a66ab2aaa021;
    stim[37] = 114'h27b7e4d241ed90b4edb06e28af2d1;
    stim[38] = 114'h3b6f0745a4d17a2e10c3ec03ef3af;
    stim[39] = 114'h3142e1e79dfdf483dfb019eecd17e;
    stim[40] = 114'h2e8eaabe2dc316c1fcc6335f2fc05;
    stim[41] = 114'h36ceabd2a3f5e97924d57841e6e52;
    stim[42] = 114'h29e44aa01d9e636b3e2fd6c309daa;
    stim[43] = 114'h27ceaef8b4e7d072479d7e5b95f66;
    stim[44] = 114'h2afc7975fcb75de00e90683959889;
    stim[45] = 114'h2d0294a7716b4324f9b5569d8d72b;
    stim[46] = 114'h383ab72821acf2b5072486cdb8578;
    stim[47] = 114'h26e49a23e45b7ed6485468ff8f3fc;
    stim[48] = 114'h2986db244c9ca74b94482fcfb7cfc;
    stim[49] = 114'h3faccd6d556bde9e57c42365a7144;
    stim[50] = 114'h2d3b2b40562b42f7f89aed4f85d5b;
    stim[51] = 114'h25e5c502604f2e5578b643fc66547;
    stim[52] = 114'h32093a0c85bfb80900ab526310f01;
    stim[53] = 114'h399ac578f03c48e6d8e87f1e37285;
    stim[54] = 114'h37d0240420f76d2f07b4fbde1027a;
    stim[55] = 114'h21d6742728d834aa8f4c6aa77ea7e;
    stim[56] = 114'h3373d9d51b269863034a76a1bcde9;
    stim[57] = 114'h2c52b3ce019ea43609857e4dce93c;
    stim[58] = 114'h393394a061b195800ecca8f8290ef;
    stim[59] = 114'h3dfb3ce5281177005b5d642a58f4d;
    stim[60] = 114'h2746efdc149071ffe943e6d832cf9;
    stim[61] = 114'h36cfed32ba3fd97aa92538ab5024e;
    stim[62] = 114'h2c2c186d3cf27be1babf583921437;
    stim[63] = 114'h38b6d06dbfe5ac93f0b1e5a3b6696;
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
      expv[0] = 102'h00000000000000000000000000;
      expv[1] = 102'h00000000000000000000000000;
      expv[2] = 102'h00000000000000000000000000;
      expv[3] = 102'h00000000022c9aaee400000000;
      expv[4] = 102'h250e68c3222c9aaee400000000;
      expv[5] = 102'h050e68c3222c9aaee400000000;
      expv[6] = 102'h050e68c3224849555c00000000;
      expv[7] = 102'h23bd3727224849555c00000000;
      expv[8] = 102'h03bd3727224849555c00000000;
      expv[9] = 102'h03bd3727224849555c00000000;
      expv[10] = 102'h03bd3727224849555c00000000;
      expv[11] = 102'h03bd3727246708b1cd00000000;
      expv[12] = 102'h03bd3727246708b1cd00000000;
      expv[13] = 102'h23bd3727246708b1cf67e17f80;
      expv[14] = 102'h03bd3727246708b1cf67e17f80;
      expv[15] = 102'h03bd3727246708b1cf67e17f80;
      expv[16] = 102'h00000000000000000000000000;
      expv[17] = 102'h00000000000000000000000000;
      expv[18] = 102'h00000000000000000000000000;
      expv[19] = 102'h0000000006107c44bc00000000;
      expv[20] = 102'h245a2250e6107c44bc00000000;
      expv[21] = 102'h045a2250e6107c44bc00000000;
      expv[22] = 102'h045a2250e6107c44bc00000000;
      expv[23] = 102'h045a2250e6107c44bc00000000;
      expv[24] = 102'h045a2250e74dad26cc00000000;
      expv[25] = 102'h045a2250e74dad26cc00000000;
      expv[26] = 102'h27a2482ae74dad26cc00000000;
      expv[27] = 102'h07a2482ae74dad26cc00000000;
      expv[28] = 102'h07a2482ae25cada20d00000000;
      expv[29] = 102'h07a2482ae25cada20d00000000;
      expv[30] = 102'h07a2482ae25cada20d00000000;
      expv[31] = 102'h07a2482ae25cada20d00000000;
      expv[32] = 102'h27a2482ae25cada20f5dc9a82e;
      expv[33] = 102'h07a2482ae25cada20f5dc9a82e;
      expv[34] = 102'h07a2482ae4e0f460fe5dc9a82e;
      expv[35] = 102'h24ad37514ce0f460fc5dc9a82e;
      expv[36] = 102'h04ad37514ce0f460fc5dc9a82e;
      expv[37] = 102'h04ad37514ce0f460fc5dc9a82e;
      expv[38] = 102'h04ad37514ce0f460fc5dc9a82e;
      expv[39] = 102'h04ad37514db783a2d45dc9a82e;
      expv[40] = 102'h04ad37514db783a2d45dc9a82e;
      expv[41] = 102'h24d7cbf015b783a2d45dc9a82e;
      expv[42] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[43] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[44] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[45] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[46] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[47] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[48] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[49] = 102'h04d7cbf015b783a2d45dc9a82e;
      expv[50] = 102'h04d7cbf017d666b6ac5dc9a82e;
      expv[51] = 102'h2353e1756fd666b6ac5dc9a82e;
      expv[52] = 102'h0353e1756fd666b6ac5dc9a82e;
      expv[53] = 102'h0353e17569049d06445dc9a82e;
      expv[54] = 102'h27c78dca11049d06445dc9a82e;
      expv[55] = 102'h07c78dca11049d06445dc9a82e;
      expv[56] = 102'h07c78dca11049d06445dc9a82e;
      expv[57] = 102'h07c78dca11b9ecea8d5dc9a82e;
      expv[58] = 102'h27c78dca11b9ecea8f90d82615;
      expv[59] = 102'h07c78dca11b9ecea8f90d82615;
      expv[60] = 102'h07c78dca11b9ecea8f90d82615;
      expv[61] = 102'h07c78dca11b9ecea8f90d82615;
      expv[62] = 102'h07c78dca1367f6995f90d82615;
      expv[63] = 102'h07c78dca1367f6995f90d82615;
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
