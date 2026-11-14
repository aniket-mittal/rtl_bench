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
    stim[0] = 36'h45822a33f;
    stim[1] = 36'h3b9970896;
    stim[2] = 36'h9a0f44085;
    stim[3] = 36'h596243ff8;
    stim[4] = 36'h131962494;
    stim[5] = 36'h8847f408a;
    stim[6] = 36'h4a3ccc6c1;
    stim[7] = 36'hb441cf569;
    stim[8] = 36'h69423ee27;
    stim[9] = 36'h5e990219e;
    stim[10] = 36'hea14bb37c;
    stim[11] = 36'h0d3d7e072;
    stim[12] = 36'ha9f43abbc;
    stim[13] = 36'h818b398ea;
    stim[14] = 36'h7a83cf09f;
    stim[15] = 36'he704f2c36;
    stim[16] = 36'h0e2f10615;
    stim[17] = 36'h2fdf61b71;
    stim[18] = 36'hccb10f041;
    stim[19] = 36'h350c156bc;
    stim[20] = 36'h0cca73c58;
    stim[21] = 36'h3f2518edc;
    stim[22] = 36'h06fdc8bcc;
    stim[23] = 36'hd0d58d29a;
    stim[24] = 36'h8c114ad07;
    stim[25] = 36'hafa16071b;
    stim[26] = 36'h3f5e9a065;
    stim[27] = 36'h3e6b50357;
    stim[28] = 36'hbd61c4eb3;
    stim[29] = 36'h876aa2da8;
    stim[30] = 36'h90bf54b0a;
    stim[31] = 36'h082092d96;
    stim[32] = 36'ha5a4d4380;
    stim[33] = 36'h4b607a318;
    stim[34] = 36'h0f50bfc28;
    stim[35] = 36'hcbadb56c2;
    stim[36] = 36'he70bad38c;
    stim[37] = 36'hce8e8aa9b;
    stim[38] = 36'h3ef3be432;
    stim[39] = 36'h4d1f66e1d;
    stim[40] = 36'h8cb7797b8;
    stim[41] = 36'h3228330d9;
    stim[42] = 36'h770aed5d9;
    stim[43] = 36'h2f834899d;
    stim[44] = 36'h927091a2c;
    stim[45] = 36'h90b9eb920;
    stim[46] = 36'h0bce2b706;
    stim[47] = 36'he709c1d07;
    stim[48] = 36'h9d8dd7908;
    stim[49] = 36'h9d7ddfaf1;
    stim[50] = 36'hfa1dfbc6f;
    stim[51] = 36'hf7c60ca7d;
    stim[52] = 36'h7d35828e9;
    stim[53] = 36'h4902f1b56;
    stim[54] = 36'hee6bbdf23;
    stim[55] = 36'h5ce2c2eae;
    stim[56] = 36'h9935aa63b;
    stim[57] = 36'h66e09d6f3;
    stim[58] = 36'hdf5ac5a07;
    stim[59] = 36'hc6e577baa;
    stim[60] = 36'h03eecce2c;
    stim[61] = 36'h4be540aaf;
    stim[62] = 36'h5b6b22714;
    stim[63] = 36'h2723b11a7;
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
      expv[0] = 32'h460065f2;
      expv[1] = 32'h8e221239;
      expv[2] = 32'h8e2c1230;
      expv[3] = 32'h8e227e32;
      expv[4] = 32'h8e201210;
      expv[5] = 32'h7e0e1220;
      expv[6] = 32'h1a335a22;
      expv[7] = 32'h8e2d2e1d;
      expv[8] = 32'h4602462f;
      expv[9] = 32'h8e233232;
      expv[10] = 32'h16126e2b;
      expv[11] = 32'h2e330e20;
      expv[12] = 32'h0636763d;
      expv[13] = 32'h66031ca0;
      expv[14] = 32'h8e22123b;
      expv[15] = 32'h1e02056b;
      expv[16] = 32'h62234220;
      expv[17] = 32'h6e116e3d;
      expv[18] = 32'h22320a22;
      expv[19] = 32'h8e235619;
      expv[20] = 32'h4e030a20;
      expv[21] = 32'h8e215a39;
      expv[22] = 32'h3a317a30;
      expv[23] = 32'h8e2c5212;
      expv[24] = 32'h2a122220;
      expv[25] = 32'h2e206229;
      expv[26] = 32'h8e210e3d;
      expv[27] = 32'h8e216a3d;
      expv[28] = 32'h8e2f563d;
      expv[29] = 32'h56273620;
      expv[30] = 32'h8e2c6210;
      expv[31] = 32'h12223220;
      expv[32] = 32'h1a227009;
      expv[33] = 32'h0e226222;
      expv[34] = 32'h16120630;
      expv[35] = 32'h36235a22;
      expv[36] = 32'h760370cb;
      expv[37] = 32'h52015222;
      expv[38] = 32'h8e23063d;
      expv[39] = 32'h6e134222;
      expv[40] = 32'h6e327620;
      expv[41] = 32'h8e201a19;
      expv[42] = 32'h8e213a1b;
      expv[43] = 32'h6a003229;
      expv[44] = 32'h8e2c4630;
      expv[45] = 32'h8e2c2610;
      expv[46] = 32'h46036220;
      expv[47] = 32'h3a03207b;
      expv[48] = 32'h8e2f2230;
      expv[49] = 32'h8e2f5e30;
      expv[50] = 32'h8e2c0e3b;
      expv[51] = 32'h8e2f4e1f;
      expv[52] = 32'h8e231e3b;
      expv[53] = 32'h5e026a22;
      expv[54] = 32'h7627662f;
      expv[55] = 32'h8e215632;
      expv[56] = 32'h8e2e4630;
      expv[57] = 32'h12225e2f;
      expv[58] = 32'h8e2d4232;
      expv[59] = 32'h2e267622;
      expv[60] = 32'h5a234620;
      expv[61] = 32'h2a205622;
      expv[62] = 32'h8e206232;
      expv[63] = 32'h76223479;
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
