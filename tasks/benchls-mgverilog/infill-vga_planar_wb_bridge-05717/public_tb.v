// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05717 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[48:48]),
    .wbs_adr_i(in_vec[47:32]),
    .wbs_sel_i(in_vec[31:30]),
    .wbs_stb_i(in_vec[29:29]),
    .wbm_dat_i(in_vec[28:13]),
    .wbm_ack_i(in_vec[12:12]),
    .memory_mapping1(in_vec[11:11]),
    .read_mode(in_vec[10:10]),
    .read_map_select(in_vec[9:8]),
    .color_compare(in_vec[7:4]),
    .color_dont_care(in_vec[3:0]),
    .wbs_dat_o(out_vec[66:51]),
    .wbs_ack_o(out_vec[50:50]),
    .wbm_adr_o(out_vec[49:33]),
    .wbm_stb_o(out_vec[32:32]),
    .latch0(out_vec[31:24]),
    .latch1(out_vec[23:16]),
    .latch2(out_vec[15:8]),
    .latch3(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h10a8f51ed303e;
    stim[1] = 49'h16f64cdb0b0c2;
    stim[2] = 49'h09983c92bb690;
    stim[3] = 49'h0843df3d0acde;
    stim[4] = 49'h02c3d26047298;
    stim[5] = 49'h0c47ec674358e;
    stim[6] = 49'h08db18e787bb9;
    stim[7] = 49'h0ce3c168dc10d;
    stim[8] = 49'h0b1ce7f1e9490;
    stim[9] = 49'h07f491d19c966;
    stim[10] = 49'h06f910d4e6a8f;
    stim[11] = 49'h0b5af95b76f53;
    stim[12] = 49'h07315bc79a07a;
    stim[13] = 49'h0431ec2c3af95;
    stim[14] = 49'h047ad077a7982;
    stim[15] = 49'h05304471138dc;
    stim[16] = 49'h0e7508b086212;
    stim[17] = 49'h0ca9c71ff8481;
    stim[18] = 49'h003d842a7bd69;
    stim[19] = 49'h09f8a2e2bf3e3;
    stim[20] = 49'h07d72bc5262d6;
    stim[21] = 49'h09ef5ba9d9f48;
    stim[22] = 49'h09415dcaedb35;
    stim[23] = 49'h094c153c53c79;
    stim[24] = 49'h0638b73e55344;
    stim[25] = 49'h0472e244b22f0;
    stim[26] = 49'h0ca1f8afd0ab6;
    stim[27] = 49'h0b4d15c336420;
    stim[28] = 49'h0c1b6d2d6ce27;
    stim[29] = 49'h038a6f146f1ad;
    stim[30] = 49'h03a834fb6bf0a;
    stim[31] = 49'h0c488aaba1aee;
    stim[32] = 49'h0aff8c18877da;
    stim[33] = 49'h0f2ed82528fb3;
    stim[34] = 49'h036e2e23ae54b;
    stim[35] = 49'h05e12336380d7;
    stim[36] = 49'h0751cbeeeab6c;
    stim[37] = 49'h0c42808b7394a;
    stim[38] = 49'h034d1ca68f7ff;
    stim[39] = 49'h02f6c9ff2513c;
    stim[40] = 49'h0cffe2602f1c7;
    stim[41] = 49'h0d8a252782981;
    stim[42] = 49'h0ae490a1e943f;
    stim[43] = 49'h0958779c2dbe6;
    stim[44] = 49'h07146faf08f94;
    stim[45] = 49'h026694895e901;
    stim[46] = 49'h0046cc4e16b7e;
    stim[47] = 49'h03f334c7ad642;
    stim[48] = 49'h0be4e1b7ae41a;
    stim[49] = 49'h0e1455ee46077;
    stim[50] = 49'h0cff123142957;
    stim[51] = 49'h0257c15f60d3e;
    stim[52] = 49'h0c51174baa8f1;
    stim[53] = 49'h0648eada25f6d;
    stim[54] = 49'h09524bd93ef7d;
    stim[55] = 49'h0a87f0cf514a9;
    stim[56] = 49'h04e362fc39137;
    stim[57] = 49'h04a9afbcff033;
    stim[58] = 49'h0baa4363e8b14;
    stim[59] = 49'h0fbf7bc627115;
    stim[60] = 49'h0ef489cd73001;
    stim[61] = 49'h02f260bfb1e44;
    stim[62] = 49'h01ee67f8528a9;
    stim[63] = 49'h061a8fbfb6748;
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
      expv[0] = 67'hxxxxx547xxxxxxxxx;
      expv[1] = 67'h000037b2000000000;
      expv[2] = 67'h7fff8cc1800000000;
      expv[3] = 67'h0000021e800000000;
      expv[4] = 67'h0000161e900000000;
      expv[5] = 67'h19d0a23f323000000;
      expv[6] = 67'h39e186d8b23a10000;
      expv[7] = 67'h39e1a71e323c30000;
      expv[8] = 67'h7fff98e7323c30000;
      expv[9] = 67'h7c7a1fa4d23f40000;
      expv[10] = 67'h000017c8d23f40000;
      expv[11] = 67'h00019ad7d23f40000;
      expv[12] = 67'h1811b98ad23f40000;
      expv[13] = 67'h1811818f530f80000;
      expv[14] = 67'h7c7a03d6d30f80000;
      expv[15] = 67'h18118982530f83b00;
      expv[16] = 67'h1c44b3a8530f83800;
      expv[17] = 67'h67ee254e530f83800;
      expv[18] = 67'h656001ec523f48900;
      expv[19] = 67'h38af8fc5523f43d00;
      expv[20] = 67'h38afbeb9723f45f00;
      expv[21] = 67'h1589cf7af30f87100;
      expv[22] = 67'h72bb0a0a830f871d4;
      expv[23] = 67'h10010a60830f871d4;
      expv[24] = 67'h4f9531c5830f871d4;
      expv[25] = 67'h38afa397323f45fec;
      expv[26] = 67'h38af850fb23f45fec;
      expv[27] = 67'h7fff9a68b23f45fec;
      expv[28] = 67'h444000db323f45fec;
      expv[29] = 67'h7c7a1c53323f45fec;
      expv[30] = 67'h00241d41d308a71d4;
      expv[31] = 67'h3eda82445308a7dd4;
      expv[32] = 67'h022057fc7308a55d4;
      expv[33] = 67'h00119976e308a550c;
      expv[34] = 67'h22041b716308a550c;
      expv[35] = 67'h1811af097308a550c;
      expv[36] = 67'h7bba9a8e72337d043;
      expv[37] = 67'h451bc2147308a550c;
      expv[38] = 67'h00005a68e308a5545;
      expv[39] = 67'h451bd7b66308a5545;
      expv[40] = 67'h451be7ff6308a5545;
      expv[41] = 67'h451b8c5112337d0b9;
      expv[42] = 67'h0001972492337d0b9;
      expv[43] = 67'h670b0ac39f437d0b9;
      expv[44] = 67'h551798a331637d0b9;
      expv[45] = 67'h451b9334bce8a5545;
      expv[46] = 67'h138582363ce8a5545;
      expv[47] = 67'h3ae41f99bce8a5545;
      expv[48] = 67'h02141f273ce635545;
      expv[49] = 67'h670b30a2bce635545;
      expv[50] = 67'h31eb07f8bce635545;
      expv[51] = 67'h000312be316d6d0b9;
      expv[52] = 67'h670b0288b16d6d0b9;
      expv[53] = 67'h08601247316d6d0b9;
      expv[54] = 67'h00000a925ce6d5545;
      expv[55] = 67'h10d4143fdce6d5545;
      expv[56] = 67'h3689271b5ce6d6745;
      expv[57] = 67'h670b654d716121cb9;
      expv[58] = 67'h58fa1d520ce6d7ede;
      expv[59] = 67'h36893dfb916121c7f;
      expv[60] = 67'h7189b7a43e36d7ede;
      expv[61] = 67'h3f0e17933e3e67ede;
      expv[62] = 67'h71898f733e35f7ede;
      expv[63] = 67'h101230d4313d81c7f;
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
