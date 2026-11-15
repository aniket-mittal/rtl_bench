// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132360 dut (
    .wbs_clk_i(clk),
    .sys_rst(in_vec[106:106]),
    .wbs_adr_i(in_vec[105:74]),
    .wbs_dat_i(in_vec[73:42]),
    .wbs_sel_i(in_vec[41:38]),
    .wbs_tga_i(in_vec[37:37]),
    .wbs_stb_i(in_vec[36:36]),
    .wbs_cyc_i(in_vec[35:35]),
    .wbs_we_i(in_vec[34:34]),
    .wbm_clk_i(in_vec[33:33]),
    .wbm_dat_i(in_vec[32:1]),
    .wbm_ack_i(in_vec[0:0]),
    .wbs_dat_o(out_vec[104:73]),
    .wbs_ack_o(out_vec[72:72]),
    .wbm_adr_o(out_vec[71:40]),
    .wbm_dat_o(out_vec[39:8]),
    .wbm_sel_o(out_vec[7:4]),
    .wbm_tga_o(out_vec[3:3]),
    .wbm_stb_o(out_vec[2:2]),
    .wbm_cyc_o(out_vec[1:1]),
    .wbm_we_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h67951704e4205141feb4655c7d4;
    stim[1] = 107'h65508f370f85850c3b5ab0e79d1;
    stim[2] = 107'h296ecff5c55c64b56083930fa56;
    stim[3] = 107'h02ed40d5d264ca8c5c80e370ef9;
    stim[4] = 107'h2934a9cee769ae00f34145fae92;
    stim[5] = 107'h15cfccf622e22d3f6e6312be412;
    stim[6] = 107'h3897d8912c90e30a92df0819f73;
    stim[7] = 107'h1673d91856106acec908aee795c;
    stim[8] = 107'h049e5212da138ca0a1e730d91cb;
    stim[9] = 107'h16a996250b5a2689a215f37ccc3;
    stim[10] = 107'h2244bd60784bc82372859c6c149;
    stim[11] = 107'h0e94f992a8f9b5356d5adbd81cc;
    stim[12] = 107'h2b242021c83298934aff7251a99;
    stim[13] = 107'h3bc7bdf51d1b566f7574232805c;
    stim[14] = 107'h195cd6e5ab03be97d90b003d524;
    stim[15] = 107'h2b08a8f110dbd064a545be5ab9f;
    stim[16] = 107'h3101450d341e77c781ba47a5fdc;
    stim[17] = 107'h18005344a2314199013fc5bdd1e;
    stim[18] = 107'h319e46ccf9fe3fabaad5a9ed218;
    stim[19] = 107'h26c31cdb954396e0d31f9a0cd85;
    stim[20] = 107'h3a30c11dbeea170de489a99733a;
    stim[21] = 107'h2c73f26d5b5c4bc88f1aeef03b4;
    stim[22] = 107'h02756ba3b0cde9c298477fcb258;
    stim[23] = 107'h1934d44c1d0e6004a5c096fd5c1;
    stim[24] = 107'h06b7d2c545c9da1c97fc9caaea6;
    stim[25] = 107'h0a94a7276654310bcec8b8ed614;
    stim[26] = 107'h2279b4518e231ad4785fe22e9e6;
    stim[27] = 107'h0d428e678fc5b9f887e74bc50f7;
    stim[28] = 107'h2a4d437682c4c23bd14a9ff5352;
    stim[29] = 107'h3e7a5bb125dbc2b8c5fe3943b39;
    stim[30] = 107'h07a13a15b3949f87361cac21c5c;
    stim[31] = 107'h248f785be1a86d7f0d67a788bc5;
    stim[32] = 107'h177dc144525e731775ba8be7a12;
    stim[33] = 107'h0db88b6d682732c2a526054fc58;
    stim[34] = 107'h04256845f987198b8fe9b0287a6;
    stim[35] = 107'h28bc6175af66fc7a9540c7b1598;
    stim[36] = 107'h20eaac7287868e0ca27d80b4728;
    stim[37] = 107'h01bd2053e186be483947a2e2fd6;
    stim[38] = 107'h2ee0f0ea48c6d483ec4fe081594;
    stim[39] = 107'h342cb01cc0e3e2b767b0804320d;
    stim[40] = 107'h1c07923e217d5e3b43e4b2cf2ae;
    stim[41] = 107'h262c56e15a11074bc7d6d0e17ce;
    stim[42] = 107'h2c63b434c58bc60a83bfb16497d;
    stim[43] = 107'h37ae1803acc4cba2a65e5535fda;
    stim[44] = 107'h38be26fbc374c9f285777dad5fa;
    stim[45] = 107'h1890e2a9d9a69a0f5ee980ff8ce;
    stim[46] = 107'h669be6889703fbe8ddc5d95d32f;
    stim[47] = 107'h1b95f365bad1a9ef50826f125ed;
    stim[48] = 107'h2976fae624031fca4e19f7be50d;
    stim[49] = 107'h314264460aff370973d66e373cd;
    stim[50] = 107'h1960977836888acae015df5b6e6;
    stim[51] = 107'h76e167f7f8a60bd545c27cad307;
    stim[52] = 107'h310c036654c1dcd6863a32f4007;
    stim[53] = 107'h2d4bf9cc776191030a86dc826e6;
    stim[54] = 107'h3aad2ebb1cb0525ae3a2eb161d3;
    stim[55] = 107'h1ed32203601ae8ba0137a62810e;
    stim[56] = 107'h16ef030d6b95b9e75980a648d20;
    stim[57] = 107'h07cd79a09455dce308d513127e7;
    stim[58] = 107'h14de988f5932d6616246e65ce55;
    stim[59] = 107'h2bcc04501b42b57452082e9d0b7;
    stim[60] = 107'h343148c1c546a679717f43fd611;
    stim[61] = 107'h41c87727a71b7eb55c8b91be60c;
    stim[62] = 107'h26dde65c378b047fc0069341ca2;
    stim[63] = 107'h1564d1b31f393666704f5bf79d2;
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
      expv[0] = 105'h000000000000000000000000000;
      expv[1] = 105'h000000000000000000000000000;
      expv[2] = 105'h000000000000000000000000000;
      expv[3] = 105'h000000000000000000000000000;
      expv[4] = 105'h000000000000000000000000000;
      expv[5] = 105'h000000001000000000000000000;
      expv[6] = 105'h000000000000000000000000000;
      expv[7] = 105'h000000000000000000000000000;
      expv[8] = 105'h000000001000000000000000000;
      expv[9] = 105'h0730d91ca000000000000000000;
      expv[10] = 105'h0730d91cb000000000000000000;
      expv[11] = 105'h0730d91ca000000000000000000;
      expv[12] = 105'h0730d91ca000000000000000000;
      expv[13] = 105'h1f7251a98000000000000000000;
      expv[14] = 105'h1f7251a99000000000000000000;
      expv[15] = 105'h1f7251a98000000000000000000;
      expv[16] = 105'h1f7251a98000000000000000000;
      expv[17] = 105'h1f7251a99000000000000000000;
      expv[18] = 105'h1f7251a98000000000000000000;
      expv[19] = 105'h1f7251a98000000000000000000;
      expv[20] = 105'h1f7251a98000000000000000000;
      expv[21] = 105'h1f7251a99000000000000000000;
      expv[22] = 105'h1f7251a98000000000000000000;
      expv[23] = 105'h1f7251a98000000000000000000;
      expv[24] = 105'h1f7251a981adf4b157439801257;
      expv[25] = 105'h1f7251a991adf4b157439801257;
      expv[26] = 105'h1f7251a981adf4b157439801257;
      expv[27] = 105'h1f7251a981adf4b157439801251;
      expv[28] = 105'h074bc50f61adf4b157439801251;
      expv[29] = 105'h074bc50f71adf4b157439801251;
      expv[30] = 105'h1e3943b381adf4b157439801251;
      expv[31] = 105'h1e3943b391adf4b157439801251;
      expv[32] = 105'h07a788bc41adf4b157439801251;
      expv[33] = 105'h07a788bc51adf4b157439801251;
      expv[34] = 105'h07a788bc41adf4b157439801251;
      expv[35] = 105'h07a788bc41adf4b157439801251;
      expv[36] = 105'h07a788bc41adf4b157439801251;
      expv[37] = 105'h07a788bc41adf4b157439801251;
      expv[38] = 105'h07a788bc41adf4b157439801251;
      expv[39] = 105'h07a788bc41adf4b157439801251;
      expv[40] = 105'h10804320c1adf4b157439801251;
      expv[41] = 105'h10804320d1adf4b157439801251;
      expv[42] = 105'h10804320cb18ed0d368441d2f0f;
      expv[43] = 105'h1fb16497cb18ed0d368441d2f0f;
      expv[44] = 105'h1fb16497db18ed0d368441d2f0f;
      expv[45] = 105'h1fb16497cb18ed0d368441d2f0f;
      expv[46] = 105'h000000000000000000000000000;
      expv[47] = 105'h000000000000000000000000000;
      expv[48] = 105'h000000000000000000000000000;
      expv[49] = 105'h000000001000000000000000000;
      expv[50] = 105'h000000000000000000000000000;
      expv[51] = 105'h000000000000000000000000000;
      expv[52] = 105'h000000000000000000000000000;
      expv[53] = 105'h1a32f4006000000000000000000;
      expv[54] = 105'h1a32f4007000000000000000000;
      expv[55] = 105'h02eb161d2000000000000000000;
      expv[56] = 105'h02eb161d3000000000000000000;
      expv[57] = 105'h02eb161d2000000000000000000;
      expv[58] = 105'h02eb161d2000000000000000000;
      expv[59] = 105'h02eb161d3000000000000000000;
      expv[60] = 105'h02eb161d2000000000000000000;
      expv[61] = 105'h000000000000000000000000000;
      expv[62] = 105'h000000000000000000000000000;
      expv[63] = 105'h000000000000000000000000000;
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
