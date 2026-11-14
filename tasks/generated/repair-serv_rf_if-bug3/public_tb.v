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
    stim[0] = 36'h5223aa4cd;
    stim[1] = 36'h0deaefab3;
    stim[2] = 36'hfac8e21ef;
    stim[3] = 36'h58c92546d;
    stim[4] = 36'h0ee7810cc;
    stim[5] = 36'h05329cb10;
    stim[6] = 36'hbc968d60b;
    stim[7] = 36'h7c048ae65;
    stim[8] = 36'h7bf1335f0;
    stim[9] = 36'h3f8215425;
    stim[10] = 36'hf877a9533;
    stim[11] = 36'h11426ad8c;
    stim[12] = 36'h32ab3076b;
    stim[13] = 36'h49aeed696;
    stim[14] = 36'h3544ab273;
    stim[15] = 36'hc773f701d;
    stim[16] = 36'h07e5a60c7;
    stim[17] = 36'h4e91d5264;
    stim[18] = 36'he8d3ec71d;
    stim[19] = 36'hd33a18267;
    stim[20] = 36'hf758d6a9d;
    stim[21] = 36'hec6f475b4;
    stim[22] = 36'h50424f18f;
    stim[23] = 36'h6b743edcb;
    stim[24] = 36'h4510c8e0e;
    stim[25] = 36'h3e1e28641;
    stim[26] = 36'hca4a96f55;
    stim[27] = 36'h92f0556e2;
    stim[28] = 36'hfac454b32;
    stim[29] = 36'h8ca1839f7;
    stim[30] = 36'hb1b9f2c9a;
    stim[31] = 36'hbc66a2851;
    stim[32] = 36'h3053709fe;
    stim[33] = 36'h41c626fc6;
    stim[34] = 36'hee45f6bbe;
    stim[35] = 36'h8f4b6bbbb;
    stim[36] = 36'h3ee7fcd4f;
    stim[37] = 36'h6ac942ebc;
    stim[38] = 36'hfcea6ea2f;
    stim[39] = 36'h0f75279d3;
    stim[40] = 36'h46f6c7dc3;
    stim[41] = 36'h7d01540c1;
    stim[42] = 36'h74843199c;
    stim[43] = 36'h9d69dc64f;
    stim[44] = 36'hc4d1fabba;
    stim[45] = 36'h86623074e;
    stim[46] = 36'hd17506a8a;
    stim[47] = 36'h7b736c5fb;
    stim[48] = 36'hf873464d9;
    stim[49] = 36'h99aaf4bac;
    stim[50] = 36'h89ac35a09;
    stim[51] = 36'ha937aef8f;
    stim[52] = 36'h1b9050041;
    stim[53] = 36'h835e89a69;
    stim[54] = 36'he8d165e56;
    stim[55] = 36'ha47c0da63;
    stim[56] = 36'h2b23c98cc;
    stim[57] = 36'he664286d0;
    stim[58] = 36'h56d8b9537;
    stim[59] = 36'h40fa962fc;
    stim[60] = 36'hc01fe9af5;
    stim[61] = 36'hd3577afd4;
    stim[62] = 36'he6030831c;
    stim[63] = 36'h19335244d;
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
      expv[0] = 32'h8e201a12;
      expv[1] = 32'h5e235620;
      expv[2] = 32'h8e2e3e3f;
      expv[3] = 32'h8e200e32;
      expv[4] = 32'h72201a20;
      expv[5] = 32'h52326100;
      expv[6] = 32'h8e2d4239;
      expv[7] = 32'h8e214e3b;
      expv[8] = 32'h8e223e3f;
      expv[9] = 32'h8e230639;
      expv[10] = 32'h8e2c263f;
      expv[11] = 32'h8e223210;
      expv[12] = 32'h8e226e19;
      expv[13] = 32'h5e235222;
      expv[14] = 32'h8e234e1d;
      expv[15] = 32'h7e360232;
      expv[16] = 32'h36201a20;
      expv[17] = 32'h3a124e22;
      expv[18] = 32'h7e16623f;
      expv[19] = 32'h8e2c4e12;
      expv[20] = 32'h8e2d521f;
      expv[21] = 32'h6a2d362f;
      expv[22] = 32'h8e203212;
      expv[23] = 32'h06323a3f;
      expv[24] = 32'h1a1240e2;
      expv[25] = 32'h8e214a39;
      expv[26] = 32'h52076a22;
      expv[27] = 32'h8e2e5e30;
      expv[28] = 32'h8e2e663f;
      expv[29] = 32'h32223e20;
      expv[30] = 32'h8e2e1219;
      expv[31] = 32'h8e2d0a3d;
      expv[32] = 32'h8e203e1d;
      expv[33] = 32'h46027a02;
      expv[34] = 32'h3e0e762f;
      expv[35] = 32'h6e077620;
      expv[36] = 32'h8e232a3d;
      expv[37] = 32'h2a03562f;
      expv[38] = 32'h8e2d463f;
      expv[39] = 32'h26323a30;
      expv[40] = 32'h5a323a32;
      expv[41] = 32'h8e231a3b;
      expv[42] = 32'h8e21321b;
      expv[43] = 32'h8e2f4a30;
      expv[44] = 32'h3e167612;
      expv[45] = 32'h46266a20;
      expv[46] = 32'h8e2e5232;
      expv[47] = 32'h8e203e3f;
      expv[48] = 32'h8e2c1a3f;
      expv[49] = 32'h8e2e7630;
      expv[50] = 32'h062b4220;
      expv[51] = 32'h763a7229;
      expv[52] = 32'h8e220a30;
      expv[53] = 32'h521f4e10;
      expv[54] = 32'h2e164a3f;
      expv[55] = 32'h02374e3d;
      expv[56] = 32'h7a221a29;
      expv[57] = 32'h062c5a2f;
      expv[58] = 32'h8e232612;
      expv[59] = 32'h52335e32;
      expv[60] = 32'h7e1b5d52;
      expv[61] = 32'h8e2c7a12;
      expv[62] = 32'h620061cb;
      expv[63] = 32'h8e220a30;
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
