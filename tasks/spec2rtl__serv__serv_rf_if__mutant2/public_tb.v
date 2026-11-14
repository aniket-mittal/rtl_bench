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
    stim[0] = 36'h4ea16ec3d;
    stim[1] = 36'hb08ebb1c0;
    stim[2] = 36'hafc2a398b;
    stim[3] = 36'h9ad90a658;
    stim[4] = 36'hea75cb93a;
    stim[5] = 36'hd77900ddc;
    stim[6] = 36'hc08b419cf;
    stim[7] = 36'h9537e5a71;
    stim[8] = 36'h445ba4253;
    stim[9] = 36'h9623347a1;
    stim[10] = 36'he6944ae56;
    stim[11] = 36'hb383397f1;
    stim[12] = 36'hbfae60b82;
    stim[13] = 36'h18146be09;
    stim[14] = 36'hf15216d03;
    stim[15] = 36'he8751faa8;
    stim[16] = 36'h7f5197917;
    stim[17] = 36'h61d34bc47;
    stim[18] = 36'hd7ad70ace;
    stim[19] = 36'h494c99f12;
    stim[20] = 36'hee8d8272f;
    stim[21] = 36'hf89470f96;
    stim[22] = 36'hb202abd03;
    stim[23] = 36'h902d9b745;
    stim[24] = 36'h8311fcfde;
    stim[25] = 36'h29ad06650;
    stim[26] = 36'h1b92f735e;
    stim[27] = 36'ha9b70a46b;
    stim[28] = 36'h82df1bd94;
    stim[29] = 36'hf415d497e;
    stim[30] = 36'hde177b3cc;
    stim[31] = 36'hf51a40ceb;
    stim[32] = 36'h66324a121;
    stim[33] = 36'h5e253c752;
    stim[34] = 36'ha7110c9fe;
    stim[35] = 36'h62ea6c3ac;
    stim[36] = 36'h4ee22295b;
    stim[37] = 36'h9482ca7d0;
    stim[38] = 36'h9901d7f17;
    stim[39] = 36'h02d9550ff;
    stim[40] = 36'hd7c979cd2;
    stim[41] = 36'hb24f74a86;
    stim[42] = 36'hd78bd851c;
    stim[43] = 36'ha664ac693;
    stim[44] = 36'h4e3ca2bae;
    stim[45] = 36'he9b3c1135;
    stim[46] = 36'hc793682dc;
    stim[47] = 36'h03b6a0fca;
    stim[48] = 36'h0b82e2160;
    stim[49] = 36'hb32b9c67c;
    stim[50] = 36'hd1999835e;
    stim[51] = 36'h46290f13e;
    stim[52] = 36'h54f454fe1;
    stim[53] = 36'h5c2abfc70;
    stim[54] = 36'hc7e55ce11;
    stim[55] = 36'h4aa7675fc;
    stim[56] = 36'hd88b5c281;
    stim[57] = 36'h2b736ce85;
    stim[58] = 36'h22340063c;
    stim[59] = 36'he085f07e9;
    stim[60] = 36'hc32da41df;
    stim[61] = 36'ha823e8ccf;
    stim[62] = 36'h412b0f29f;
    stim[63] = 36'hb78334445;
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
      expv[0] = 32'h2e22062a;
      expv[1] = 32'h8e2c3a11;
      expv[2] = 32'h56063225;
      expv[3] = 32'h8e2e4a30;
      expv[4] = 32'h3a3e263f;
      expv[5] = 32'h8e2d3a3a;
      expv[6] = 32'h6a0138fa;
      expv[7] = 32'h8e2f4e10;
      expv[8] = 32'h76114a1a;
      expv[9] = 32'h8e2d7610;
      expv[10] = 32'h0a1a496b;
      expv[11] = 32'h8e2e7e11;
      expv[12] = 32'h8e2f7231;
      expv[13] = 32'h8e204230;
      expv[14] = 32'h8e2e221f;
      expv[15] = 32'h223e563f;
      expv[16] = 32'h8e21223f;
      expv[17] = 32'h6a120a1f;
      expv[18] = 32'h8e2f5a1a;
      expv[19] = 32'h1203622a;
      expv[20] = 32'h3209662b;
      expv[21] = 32'h8e2c723b;
      expv[22] = 32'h8e2c2211;
      expv[23] = 32'h8e2c6a10;
      expv[24] = 32'h3e1279e0;
      expv[25] = 32'h22214a21;
      expv[26] = 32'h8e226a30;
      expv[27] = 32'h62380e21;
      expv[28] = 32'h621f3210;
      expv[29] = 32'h8e2d2e1b;
      expv[30] = 32'h8e2d7a3a;
      expv[31] = 32'h8e2f1e1b;
      expv[32] = 32'h4a30241b;
      expv[33] = 32'h8e216a3a;
      expv[34] = 32'h22123de1;
      expv[35] = 32'h4e23762f;
      expv[36] = 32'h46202a2a;
      expv[37] = 32'h8e2d7a10;
      expv[38] = 32'h8e2e6230;
      expv[39] = 32'h2a131e10;
      expv[40] = 32'h8e2f1a1a;
      expv[41] = 32'h8e2c5215;
      expv[42] = 32'h8e2f221a;
      expv[43] = 32'h162e5225;
      expv[44] = 32'h1631762a;
      expv[45] = 32'h7a30262b;
      expv[46] = 32'h6e1059ca;
      expv[47] = 32'h563278a0;
      expv[48] = 32'h5e002e20;
      expv[49] = 32'h8e2c4e11;
      expv[50] = 32'h8e2e6a1a;
      expv[51] = 32'h222325ea;
      expv[52] = 32'h8e217e3a;
      expv[53] = 32'h8e210e3a;
      expv[54] = 32'h2a2e422a;
      expv[55] = 32'h6e223e2a;
      expv[56] = 32'h8e2c523a;
      expv[57] = 32'h6e325235;
      expv[58] = 32'h023045c1;
      expv[59] = 32'h3e0a7c9b;
      expv[60] = 32'h362939fa;
      expv[61] = 32'h7e221a21;
      expv[62] = 32'h622351fa;
      expv[63] = 32'h8e2f0a11;
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
