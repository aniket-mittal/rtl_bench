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
    stim[0] = 36'ha688e4d34;
    stim[1] = 36'h604daa7af;
    stim[2] = 36'h4fd3103dd;
    stim[3] = 36'hb790e9c04;
    stim[4] = 36'hbb26b3f25;
    stim[5] = 36'h45d6002f3;
    stim[6] = 36'hd9ccddbac;
    stim[7] = 36'h7aec9d156;
    stim[8] = 36'h644eab44c;
    stim[9] = 36'h4f9cd60ef;
    stim[10] = 36'h52ab3f006;
    stim[11] = 36'h9292da1cc;
    stim[12] = 36'h14b56457f;
    stim[13] = 36'h461e362ed;
    stim[14] = 36'h432296bdb;
    stim[15] = 36'h566af5c9e;
    stim[16] = 36'hb071680a4;
    stim[17] = 36'hca641c47a;
    stim[18] = 36'h0f96fb372;
    stim[19] = 36'hc2902b086;
    stim[20] = 36'h73b3b51d5;
    stim[21] = 36'h9a9ac192b;
    stim[22] = 36'h0e2d43727;
    stim[23] = 36'h0697583fd;
    stim[24] = 36'ha9e18254d;
    stim[25] = 36'hb97b1e968;
    stim[26] = 36'hdad16db06;
    stim[27] = 36'hd6c635ef9;
    stim[28] = 36'hb19512511;
    stim[29] = 36'h57a9e79d9;
    stim[30] = 36'h35ec676d1;
    stim[31] = 36'h21e3a5cba;
    stim[32] = 36'h58ca5be4b;
    stim[33] = 36'h6d1a5cf69;
    stim[34] = 36'hd65c69416;
    stim[35] = 36'h0846d1c7d;
    stim[36] = 36'hf060ec6ef;
    stim[37] = 36'h51f623c4d;
    stim[38] = 36'hae35c5baa;
    stim[39] = 36'h38eba991f;
    stim[40] = 36'h10231acac;
    stim[41] = 36'he0f071e80;
    stim[42] = 36'he272e9c26;
    stim[43] = 36'hc6305756f;
    stim[44] = 36'hac335f459;
    stim[45] = 36'h707b723d7;
    stim[46] = 36'h7ee609e06;
    stim[47] = 36'h962648bcc;
    stim[48] = 36'h9884d1007;
    stim[49] = 36'h9c8d56a51;
    stim[50] = 36'he53d80350;
    stim[51] = 36'h892433d06;
    stim[52] = 36'h3e9b77d7f;
    stim[53] = 36'hd7c44a936;
    stim[54] = 36'hc87ee4984;
    stim[55] = 36'hc185114e9;
    stim[56] = 36'h1a86a0921;
    stim[57] = 36'h80ad2af57;
    stim[58] = 36'hd5fab1e21;
    stim[59] = 36'h632435923;
    stim[60] = 36'h2d8d5ec0f;
    stim[61] = 36'hcfc12d3f2;
    stim[62] = 36'h6b2bdd5c8;
    stim[63] = 36'h8529bd7dc;
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
      expv[0] = 32'h1e032549;
      expv[1] = 32'h3601760f;
      expv[2] = 32'h62127a32;
      expv[3] = 32'h8e2f0219;
      expv[4] = 32'h8e2c6639;
      expv[5] = 32'h42105e12;
      expv[6] = 32'h8e2e7632;
      expv[7] = 32'h8e222a3f;
      expv[8] = 32'h56010a0f;
      expv[9] = 32'h1a131e22;
      expv[10] = 32'h8e220212;
      expv[11] = 32'h8e2e3a10;
      expv[12] = 32'h8e212e10;
      expv[13] = 32'h46135cd2;
      expv[14] = 32'h522279b2;
      expv[15] = 32'h8e211232;
      expv[16] = 32'h8e2c163d;
      expv[17] = 32'h02260e22;
      expv[18] = 32'h5e126e20;
      expv[19] = 32'h06101062;
      expv[20] = 32'h8e223a1b;
      expv[21] = 32'h8e2e2630;
      expv[22] = 32'h2a216620;
      expv[23] = 32'h6a127dd0;
      expv[24] = 32'h32242a2d;
      expv[25] = 32'h8e2e2e3d;
      expv[26] = 32'h8e2e6232;
      expv[27] = 32'h8e2f5e12;
      expv[28] = 32'h8e2e2219;
      expv[29] = 32'h8e233a12;
      expv[30] = 32'h8e235a3d;
      expv[31] = 32'h7622162d;
      expv[32] = 32'h8e204a32;
      expv[33] = 32'h4a136e2b;
      expv[34] = 32'h8e2d0212;
      expv[35] = 32'h5a020e20;
      expv[36] = 32'h8e2c5e3f;
      expv[37] = 32'h8e220a32;
      expv[38] = 32'h3a3a7629;
      expv[39] = 32'h8e20223d;
      expv[40] = 32'h8e201610;
      expv[41] = 32'h0e36523f;
      expv[42] = 32'h5e36063f;
      expv[43] = 32'h0a322cf2;
      expv[44] = 32'h6a320a29;
      expv[45] = 32'h8e207a3f;
      expv[46] = 32'h8e23423f;
      expv[47] = 32'h8e2d7a10;
      expv[48] = 32'h8e2c0230;
      expv[49] = 32'h8e2d4a30;
      expv[50] = 32'h3239690b;
      expv[51] = 32'h062a2220;
      expv[52] = 32'h8e232e39;
      expv[53] = 32'h8e2f2612;
      expv[54] = 32'h5e3d3232;
      expv[55] = 32'h220a1c92;
      expv[56] = 32'h8e222630;
      expv[57] = 32'h262b6970;
      expv[58] = 32'h8e2f4632;
      expv[59] = 32'h0622243b;
      expv[60] = 32'h2a030229;
      expv[61] = 32'h26067e22;
      expv[62] = 32'h7a233a2b;
      expv[63] = 32'h362379c0;
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
