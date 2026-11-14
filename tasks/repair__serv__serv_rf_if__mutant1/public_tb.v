// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .i_cnt_en(in_vec[35:35]),
    .i_rdata0(in_vec[34:34]),
    .i_rdata1(in_vec[33:33]),
    .i_trap(in_vec[32:32]),
    .i_mret(in_vec[31:31]),
    .i_mepc(in_vec[30:30]),
    .i_mtval_pc(in_vec[29:29]),
    .i_bufreg_q(in_vec[28:28]),
    .i_bad_pc(in_vec[27:27]),
    .i_csr_en(in_vec[26:26]),
    .i_csr_addr(in_vec[25:24]),
    .i_csr(in_vec[23:23]),
    .i_rd_wen(in_vec[22:22]),
    .i_rd_waddr(in_vec[21:17]),
    .i_ctrl_rd(in_vec[16:16]),
    .i_alu_rd(in_vec[15:15]),
    .i_rd_alu_en(in_vec[14:14]),
    .i_csr_rd(in_vec[13:13]),
    .i_rd_csr_en(in_vec[12:12]),
    .i_mem_rd(in_vec[11:11]),
    .i_rd_mem_en(in_vec[10:10]),
    .i_rs1_raddr(in_vec[9:5]),
    .i_rs2_raddr(in_vec[4:0]),
    .o_wreg0(out_vec[31:26]),
    .o_wreg1(out_vec[25:20]),
    .o_wen0(out_vec[19:19]),
    .o_wen1(out_vec[18:18]),
    .o_wdata0(out_vec[17:17]),
    .o_wdata1(out_vec[16:16]),
    .o_rreg0(out_vec[15:10]),
    .o_rreg1(out_vec[9:4]),
    .o_csr_pc(out_vec[3:3]),
    .o_csr(out_vec[2:2]),
    .o_rs1(out_vec[1:1]),
    .o_rs2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h407ffe3ff;
    stim[1] = 36'hf6e86a423;
    stim[2] = 36'hf70c5bc26;
    stim[3] = 36'hf42425309;
    stim[4] = 36'h6e77c952b;
    stim[5] = 36'h1d98faca8;
    stim[6] = 36'hb0fc2fbe9;
    stim[7] = 36'h83f385bf5;
    stim[8] = 36'h86b6ee620;
    stim[9] = 36'h913f5d064;
    stim[10] = 36'hcab07c5d4;
    stim[11] = 36'hb89cb5770;
    stim[12] = 36'hd6b773083;
    stim[13] = 36'h6b4a323b2;
    stim[14] = 36'h601eee122;
    stim[15] = 36'h28ed554dd;
    stim[16] = 36'hc4290fbfa;
    stim[17] = 36'h490758efa;
    stim[18] = 36'he40b8d742;
    stim[19] = 36'ha6a84c567;
    stim[20] = 36'ha9de51eb5;
    stim[21] = 36'h70b68ebce;
    stim[22] = 36'hb4fb9366d;
    stim[23] = 36'h3d198f6e6;
    stim[24] = 36'hca5989d4c;
    stim[25] = 36'h87c0609d2;
    stim[26] = 36'he8b6ef7c7;
    stim[27] = 36'h52610f57f;
    stim[28] = 36'h39fa52146;
    stim[29] = 36'h8173b963f;
    stim[30] = 36'h8dab16cb8;
    stim[31] = 36'hb2eef6d68;
    stim[32] = 36'h93222cd04;
    stim[33] = 36'habaa3043c;
    stim[34] = 36'hb338c768f;
    stim[35] = 36'h4547c38d3;
    stim[36] = 36'h460cd0194;
    stim[37] = 36'h197abe50e;
    stim[38] = 36'h472c92257;
    stim[39] = 36'he5db08ced;
    stim[40] = 36'h2b3a9881b;
    stim[41] = 36'h247079aef;
    stim[42] = 36'h3034d204e;
    stim[43] = 36'hca44458b0;
    stim[44] = 36'h79ee32a5c;
    stim[45] = 36'h31179fd0f;
    stim[46] = 36'ha2944e6c9;
    stim[47] = 36'h054c2c649;
    stim[48] = 36'hf806822e5;
    stim[49] = 36'h22f4b237d;
    stim[50] = 36'hd94f40663;
    stim[51] = 36'h31e66cdf7;
    stim[52] = 36'h1e7c8944a;
    stim[53] = 36'hd9e4325c8;
    stim[54] = 36'h5557d78c0;
    stim[55] = 36'h5a71159d1;
    stim[56] = 36'hb490128ac;
    stim[57] = 36'hbe7e1f5dc;
    stim[58] = 36'h332fa8531;
    stim[59] = 36'h0f48af423;
    stim[60] = 36'h8a666223f;
    stim[61] = 36'h524365a58;
    stim[62] = 36'h87bf1d5c4;
    stim[63] = 36'h6ebd22a1e;
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
      expv[0] = 32'h7e337e32;
      expv[1] = 32'h8e2f063f;
      expv[2] = 32'h8e2d061b;
      expv[3] = 32'h8e2d621b;
      expv[4] = 32'h7a30263f;
      expv[5] = 32'h8e231630;
      expv[6] = 32'h8e2c7e3d;
      expv[7] = 32'h72347e30;
      expv[8] = 32'h5e324400;
      expv[9] = 32'h8e2e0e10;
      expv[10] = 32'h0e323a22;
      expv[11] = 32'h8e2c6e39;
      expv[12] = 32'h8e2f1212;
      expv[13] = 32'h4603762f;
      expv[14] = 32'h5e13242b;
      expv[15] = 32'h2a231a2d;
      expv[16] = 32'h22237da2;
      expv[17] = 32'h6a025e22;
      expv[18] = 32'h7203682b;
      expv[19] = 32'h0a232c79;
      expv[20] = 32'h4a17563d;
      expv[21] = 32'h8e207a1b;
      expv[22] = 32'h8e2d4e3d;
      expv[23] = 32'h8e235e39;
      expv[24] = 32'h32172a32;
      expv[25] = 32'h0e043a00;
      expv[26] = 32'h5e327a2b;
      expv[27] = 32'h8e202e32;
      expv[28] = 32'h8e222a3d;
      expv[29] = 32'h76364630;
      expv[30] = 32'h62231620;
      expv[31] = 32'h8e2e2e3d;
      expv[32] = 32'h8e2c2210;
      expv[33] = 32'h46230629;
      expv[34] = 32'h8e2c5219;
      expv[35] = 32'h7a021a02;
      expv[36] = 32'h1a033142;
      expv[37] = 32'h8e222230;
      expv[38] = 32'h12234972;
      expv[39] = 32'h62171e1f;
      expv[40] = 32'h52330229;
      expv[41] = 32'h0e325e3d;
      expv[42] = 32'h8e200a19;
      expv[43] = 32'h0a041622;
      expv[44] = 32'h8e224a3f;
      expv[45] = 32'h8e222219;
      expv[46] = 32'h0a125899;
      expv[47] = 32'h06034a00;
      expv[48] = 32'h8e2c5e3b;
      expv[49] = 32'h16326e3d;
      expv[50] = 32'h8e2e4e32;
      expv[51] = 32'h8e223e3d;
      expv[52] = 32'h8e210a30;
      expv[53] = 32'h8e2e3a32;
      expv[54] = 32'h8e231a12;
      expv[55] = 32'h8e203a32;
      expv[56] = 32'h8e2d1619;
      expv[57] = 32'h8e2d3a3d;
      expv[58] = 32'h8e202619;
      expv[59] = 32'h16030620;
      expv[60] = 32'h4e244620;
      expv[61] = 32'h8e204a12;
      expv[62] = 32'h62333840;
      expv[63] = 32'h2631422b;
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
