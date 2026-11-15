// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03101 dut (
    .clk(clk),
    .reset(in_vec[105:105]),
    .valid_wb_pipe_reg_i(in_vec[104:104]),
    .rf_en_wb_pipe_reg_i(in_vec[103:103]),
    .wb_sel_wb_pipe_reg_i(in_vec[102:101]),
    .rd_wb_pipe_reg_i(in_vec[100:96]),
    .alu_res_wb_pipe_reg_i(in_vec[95:64]),
    .read_data_wb_pipe_reg_i(in_vec[63:32]),
    .next_seq_pc_wb_pipe_reg_i(in_vec[31:0]),
    .instr_retired_wb_pipe_reg_o(out_vec[104:104]),
    .rf_en_wb_pipe_reg_o(out_vec[103:103]),
    .wb_sel_wb_pipe_reg_o(out_vec[102:101]),
    .rd_wb_pipe_reg_o(out_vec[100:96]),
    .alu_res_wb_pipe_reg_o(out_vec[95:64]),
    .read_data_wb_pipe_reg_o(out_vec[63:32]),
    .next_seq_pc_wb_pipe_reg_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h3c959f1892c9bf98ba5984e48ab;
    stim[1] = 106'h3942e5a432b2da29020d0fdaf1c;
    stim[2] = 106'h05d9c117c784fdd176db113f99f;
    stim[3] = 106'h0228388838c30b4e57f39c9024b;
    stim[4] = 106'h152f9f967db41561598810f1fe3;
    stim[5] = 106'h0da7c882ac7d46d52848c90a988;
    stim[6] = 106'h1115d6e94053f8a66c78c0c439e;
    stim[7] = 106'h161397c444bdd09137656652291;
    stim[8] = 106'h0804d7b84d394136cf4ac719827;
    stim[9] = 106'h00b628a5139d0104ca05bf1474c;
    stim[10] = 106'h1a9f1d797283401a40510058297;
    stim[11] = 106'h0130ea28855046c0fe5f3a8ee66;
    stim[12] = 106'h16efcd908b5a35cbd743cdb72a8;
    stim[13] = 106'h1a3d5683a2e1544139967909df9;
    stim[14] = 106'h00b6bd481f86148ee0b4d54faf0;
    stim[15] = 106'h1ec13d880063f3e85db30ccc614;
    stim[16] = 106'h1a29cba452716c7fbb2a5c133c2;
    stim[17] = 106'h18c103903e9577648664dd18b10;
    stim[18] = 106'h0ba7bc4bc978ffbfc07adb8427f;
    stim[19] = 106'h2eab4ebe233968e188f1ea6c93b;
    stim[20] = 106'h1d73995cde1c05b2ae770100301;
    stim[21] = 106'h1e2a5b6cd2319a60e36dd747484;
    stim[22] = 106'h12ca2c5d1f8535d6a145e76cf0b;
    stim[23] = 106'h1b6875a26fbee10ed6368e56dba;
    stim[24] = 106'h091181aed04846e8d7caf244193;
    stim[25] = 106'h13bf000300b02a323f35f347466;
    stim[26] = 106'h1765d607a8ddc002d780823430c;
    stim[27] = 106'h0e80b86ee5637c8dc8efc6f4d84;
    stim[28] = 106'h1ec3999ffbc938a4747a0a30f3d;
    stim[29] = 106'h112a55d601f645c2354eb821c76;
    stim[30] = 106'h1fd274789ac353b54cbb871c1d5;
    stim[31] = 106'h2ca9728e264c2ac271e1072bd2c;
    stim[32] = 106'h0c78ab50e4abeeed36c7353d284;
    stim[33] = 106'h1807fcaf72d9aece6ea4f7cbe20;
    stim[34] = 106'h08062515fb91753cf5f8e3ae076;
    stim[35] = 106'h04bf0b6a4a7e9228221cd8123d4;
    stim[36] = 106'h009cc7d35c83e2f35208111fa49;
    stim[37] = 106'h0255186fbbb00af62a91c427a92;
    stim[38] = 106'h1a617d177c462bbded76f87faf4;
    stim[39] = 106'h115ce5ff2b89077d16df28d83e7;
    stim[40] = 106'h0ad91dd2088aebb8a31216fadd8;
    stim[41] = 106'h0d8609de533bf1024335261a7e9;
    stim[42] = 106'h14540750456be2af0f892bcea66;
    stim[43] = 106'h1c33ec5a905e3f74c0e9176706c;
    stim[44] = 106'h141a71c6d56d282f8ad6d279e29;
    stim[45] = 106'h0190dcfcff2718b8964e7879ddc;
    stim[46] = 106'h04516b25e3e9251cc9ab85eb500;
    stim[47] = 106'h1b2494dedb00f46ccc394eff9ef;
    stim[48] = 106'h15d874f079efa622c248a0a44e2;
    stim[49] = 106'h2d143164b6f45c80324542235a1;
    stim[50] = 106'h1132f657a6c967023fe5da78a7a;
    stim[51] = 106'h05e0fab507854ce553abd597625;
    stim[52] = 106'h178b8a2f5b0dc00646df88f853e;
    stim[53] = 106'h04b3785e8a6c398634652dee9dd;
    stim[54] = 106'h1eec4ad39ff264d796916a7dd2f;
    stim[55] = 106'h170a9546c3f1d86d331431b199b;
    stim[56] = 106'h1e6e4f710dca0a76d3760e22b99;
    stim[57] = 106'h0463b6e12ef7e7d1af683dacbc8;
    stim[58] = 106'h07514714dcc3e569d6a1c7d122b;
    stim[59] = 106'h0cec6b9348c77647608e88c5855;
    stim[60] = 106'h1e0e81f7e067e4a4e0e4a643e5c;
    stim[61] = 106'h16b6707b1283527de6c873d8f7e;
    stim[62] = 106'h0ca1a1a199aae29e5b89bbcea53;
    stim[63] = 106'h103c445450bc2df34c736328f27;
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
      expv[3] = 105'h05d9c117c784fdd176db113f99f;
      expv[4] = 105'h0228388838c30b4e57f39c9024b;
      expv[5] = 105'h152f9f967db41561598810f1fe3;
      expv[6] = 105'h0da7c882ac7d46d52848c90a988;
      expv[7] = 105'h1115d6e94053f8a66c78c0c439e;
      expv[8] = 105'h161397c444bdd09137656652291;
      expv[9] = 105'h0804d7b84d394136cf4ac719827;
      expv[10] = 105'h00b628a5139d0104ca05bf1474c;
      expv[11] = 105'h1a9f1d797283401a40510058297;
      expv[12] = 105'h0130ea28855046c0fe5f3a8ee66;
      expv[13] = 105'h16efcd908b5a35cbd743cdb72a8;
      expv[14] = 105'h1a3d5683a2e1544139967909df9;
      expv[15] = 105'h00b6bd481f86148ee0b4d54faf0;
      expv[16] = 105'h1ec13d880063f3e85db30ccc614;
      expv[17] = 105'h1a29cba452716c7fbb2a5c133c2;
      expv[18] = 105'h18c103903e9577648664dd18b10;
      expv[19] = 105'h000000000000000000000000000;
      expv[20] = 105'h000000000000000000000000000;
      expv[21] = 105'h1d73995cde1c05b2ae770100301;
      expv[22] = 105'h1e2a5b6cd2319a60e36dd747484;
      expv[23] = 105'h12ca2c5d1f8535d6a145e76cf0b;
      expv[24] = 105'h1b6875a26fbee10ed6368e56dba;
      expv[25] = 105'h091181aed04846e8d7caf244193;
      expv[26] = 105'h13bf000300b02a323f35f347466;
      expv[27] = 105'h1765d607a8ddc002d780823430c;
      expv[28] = 105'h0e80b86ee5637c8dc8efc6f4d84;
      expv[29] = 105'h1ec3999ffbc938a4747a0a30f3d;
      expv[30] = 105'h112a55d601f645c2354eb821c76;
      expv[31] = 105'h000000000000000000000000000;
      expv[32] = 105'h000000000000000000000000000;
      expv[33] = 105'h0c78ab50e4abeeed36c7353d284;
      expv[34] = 105'h1807fcaf72d9aece6ea4f7cbe20;
      expv[35] = 105'h08062515fb91753cf5f8e3ae076;
      expv[36] = 105'h04bf0b6a4a7e9228221cd8123d4;
      expv[37] = 105'h009cc7d35c83e2f35208111fa49;
      expv[38] = 105'h0255186fbbb00af62a91c427a92;
      expv[39] = 105'h1a617d177c462bbded76f87faf4;
      expv[40] = 105'h115ce5ff2b89077d16df28d83e7;
      expv[41] = 105'h0ad91dd2088aebb8a31216fadd8;
      expv[42] = 105'h0d8609de533bf1024335261a7e9;
      expv[43] = 105'h14540750456be2af0f892bcea66;
      expv[44] = 105'h1c33ec5a905e3f74c0e9176706c;
      expv[45] = 105'h141a71c6d56d282f8ad6d279e29;
      expv[46] = 105'h0190dcfcff2718b8964e7879ddc;
      expv[47] = 105'h04516b25e3e9251cc9ab85eb500;
      expv[48] = 105'h1b2494dedb00f46ccc394eff9ef;
      expv[49] = 105'h000000000000000000000000000;
      expv[50] = 105'h000000000000000000000000000;
      expv[51] = 105'h1132f657a6c967023fe5da78a7a;
      expv[52] = 105'h05e0fab507854ce553abd597625;
      expv[53] = 105'h178b8a2f5b0dc00646df88f853e;
      expv[54] = 105'h04b3785e8a6c398634652dee9dd;
      expv[55] = 105'h1eec4ad39ff264d796916a7dd2f;
      expv[56] = 105'h170a9546c3f1d86d331431b199b;
      expv[57] = 105'h1e6e4f710dca0a76d3760e22b99;
      expv[58] = 105'h0463b6e12ef7e7d1af683dacbc8;
      expv[59] = 105'h07514714dcc3e569d6a1c7d122b;
      expv[60] = 105'h0cec6b9348c77647608e88c5855;
      expv[61] = 105'h1e0e81f7e067e4a4e0e4a643e5c;
      expv[62] = 105'h16b6707b1283527de6c873d8f7e;
      expv[63] = 105'h0ca1a1a199aae29e5b89bbcea53;
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
