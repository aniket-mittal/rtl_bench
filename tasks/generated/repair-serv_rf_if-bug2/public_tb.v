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
    stim[0] = 36'h3f614de04;
    stim[1] = 36'h4388c9b6f;
    stim[2] = 36'h242f11f65;
    stim[3] = 36'h088834c43;
    stim[4] = 36'heb25504a3;
    stim[5] = 36'hcba5d9745;
    stim[6] = 36'h312564913;
    stim[7] = 36'h658daf55b;
    stim[8] = 36'hb98975455;
    stim[9] = 36'h512df6bc8;
    stim[10] = 36'h9b6e36cab;
    stim[11] = 36'h2f8ad26f9;
    stim[12] = 36'h56cbcc884;
    stim[13] = 36'h35c344eaa;
    stim[14] = 36'hf7097db24;
    stim[15] = 36'h312fb9ea3;
    stim[16] = 36'hda13301f7;
    stim[17] = 36'hbf001c9cd;
    stim[18] = 36'h44550e015;
    stim[19] = 36'h9aefec672;
    stim[20] = 36'ha292e6860;
    stim[21] = 36'ha62a1aaa1;
    stim[22] = 36'h993601b68;
    stim[23] = 36'h1ff608188;
    stim[24] = 36'h9c6c1cb48;
    stim[25] = 36'hcc06fcffc;
    stim[26] = 36'hfc2bc51b1;
    stim[27] = 36'hbc92c8ad9;
    stim[28] = 36'h87f6fbcb9;
    stim[29] = 36'ha6f3a3bbf;
    stim[30] = 36'h51a231a57;
    stim[31] = 36'hfd1405eeb;
    stim[32] = 36'h967891e3d;
    stim[33] = 36'h528072306;
    stim[34] = 36'he9490efd2;
    stim[35] = 36'h3c7f9bd19;
    stim[36] = 36'h1c0eccee0;
    stim[37] = 36'haa66d3e51;
    stim[38] = 36'hf13794de0;
    stim[39] = 36'h1838c7d40;
    stim[40] = 36'h981295ce2;
    stim[41] = 36'h42664ea32;
    stim[42] = 36'haaa25ae21;
    stim[43] = 36'h79a7feece;
    stim[44] = 36'hdb2a7f30e;
    stim[45] = 36'h4655e9a01;
    stim[46] = 36'h733a2f0d7;
    stim[47] = 36'h4d84de101;
    stim[48] = 36'h45c645bc7;
    stim[49] = 36'h1195f307e;
    stim[50] = 36'h3753d5046;
    stim[51] = 36'he1b83976a;
    stim[52] = 36'h5b839c250;
    stim[53] = 36'h09f9c9f3b;
    stim[54] = 36'hcb6321382;
    stim[55] = 36'hfb52cc4ea;
    stim[56] = 36'h5cfc10223;
    stim[57] = 36'h33e53d0c9;
    stim[58] = 36'h39daab14f;
    stim[59] = 36'h3ca79491f;
    stim[60] = 36'h56d9adc4d;
    stim[61] = 36'hbef89c11e;
    stim[62] = 36'h594cb6de4;
    stim[63] = 36'h15466cf5c;
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
      expv[0] = 32'h8e214235;
      expv[1] = 32'h1a016cfa;
      expv[2] = 32'h62236c51;
      expv[3] = 32'h06030a20;
      expv[4] = 32'h2a2a162b;
      expv[5] = 32'h3a2a6a2a;
      expv[6] = 32'h8e222211;
      expv[7] = 32'h360329bb;
      expv[8] = 32'h8e2e0a31;
      expv[9] = 32'h8e227a1a;
      expv[10] = 32'h8e2c1630;
      expv[11] = 32'h5a035e21;
      expv[12] = 32'h8e23121a;
      expv[13] = 32'h8e235615;
      expv[14] = 32'h8e2d661b;
      expv[15] = 32'h8e225611;
      expv[16] = 32'h8e2c3e3a;
      expv[17] = 32'h8e2d3a31;
      expv[18] = 32'h2212021a;
      expv[19] = 32'h8e2e4e30;
      expv[20] = 32'h5e100c01;
      expv[21] = 32'h42235411;
      expv[22] = 32'h8e2e6e30;
      expv[23] = 32'h8e233230;
      expv[24] = 32'h8e2d6a30;
      expv[25] = 32'h5e0a7e2a;
      expv[26] = 32'h8e2d363b;
      expv[27] = 32'h8e2d5a31;
      expv[28] = 32'h5e3e1630;
      expv[29] = 32'h76367635;
      expv[30] = 32'h8e224a1a;
      expv[31] = 32'h8e2f5e3b;
      expv[32] = 32'h8e2d4630;
      expv[33] = 32'h8e22621a;
      expv[34] = 32'h22077a2f;
      expv[35] = 32'h8e212235;
      expv[36] = 32'h8e215e30;
      expv[37] = 32'h5a2e4a25;
      expv[38] = 32'h8e2e3e1b;
      expv[39] = 32'h8e202a30;
      expv[40] = 32'h8e2c1e30;
      expv[41] = 32'h4a22462a;
      expv[42] = 32'h4a224621;
      expv[43] = 32'h8e225a3b;
      expv[44] = 32'h8e2c623a;
      expv[45] = 32'h3e10421a;
      expv[46] = 32'h8e201a1b;
      expv[47] = 32'h1a02222a;
      expv[48] = 32'h4a007a0a;
      expv[49] = 32'h8e220e10;
      expv[50] = 32'h8e210a15;
      expv[51] = 32'h06336cab;
      expv[52] = 32'h8e224a3a;
      expv[53] = 32'h3a336630;
      expv[54] = 32'h6624722a;
      expv[55] = 32'h8e2c1e3f;
      expv[56] = 32'h8e21463a;
      expv[57] = 32'h8e221a35;
      expv[58] = 32'h8e222a35;
      expv[59] = 32'h8e212231;
      expv[60] = 32'h8e230a1a;
      expv[61] = 32'h8e2f2235;
      expv[62] = 32'h8e223e3a;
      expv[63] = 32'h8e236a10;
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
