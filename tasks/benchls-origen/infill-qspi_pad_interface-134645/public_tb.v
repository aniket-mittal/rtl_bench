// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134645 dut (
    .qspi_ui_dq_i(in_vec[13:10]),
    .dut_io_pads_qspi_cs_0_o_oval(in_vec[9:9]),
    .dut_io_pads_qspi_dq_3_o_oval(in_vec[8:8]),
    .dut_io_pads_qspi_dq_2_o_oval(in_vec[7:7]),
    .dut_io_pads_qspi_dq_1_o_oval(in_vec[6:6]),
    .dut_io_pads_qspi_dq_0_o_oval(in_vec[5:5]),
    .dut_io_pads_qspi_dq_3_o_oe(in_vec[4:4]),
    .dut_io_pads_qspi_dq_2_o_oe(in_vec[3:3]),
    .dut_io_pads_qspi_dq_1_o_oe(in_vec[2:2]),
    .dut_io_pads_qspi_dq_0_o_oe(in_vec[1:1]),
    .dut_io_pads_qspi_sck_o_oval(in_vec[0:0]),
    .reset_periph(out_vec[15:15]),
    .slowclk(out_vec[14:14]),
    .qspi_cs(out_vec[13:13]),
    .qspi_ui_dq_o(out_vec[12:9]),
    .qspi_ui_dq_oe(out_vec[8:5]),
    .dut_io_pads_qspi_dq_0_i_ival(out_vec[4:4]),
    .dut_io_pads_qspi_dq_1_i_ival(out_vec[3:3]),
    .dut_io_pads_qspi_dq_2_i_ival(out_vec[2:2]),
    .dut_io_pads_qspi_dq_3_i_ival(out_vec[1:1]),
    .qspi_sck(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h055d;
    stim[1] = 14'h3d86;
    stim[2] = 14'h00fe;
    stim[3] = 14'h1094;
    stim[4] = 14'h366f;
    stim[5] = 14'h3d07;
    stim[6] = 14'h2c84;
    stim[7] = 14'h2674;
    stim[8] = 14'h03b8;
    stim[9] = 14'h38c5;
    stim[10] = 14'h12f6;
    stim[11] = 14'h219f;
    stim[12] = 14'h12c2;
    stim[13] = 14'h0bd1;
    stim[14] = 14'h1f32;
    stim[15] = 14'h3976;
    stim[16] = 14'h0984;
    stim[17] = 14'h0a65;
    stim[18] = 14'h30f8;
    stim[19] = 14'h0e42;
    stim[20] = 14'h0a37;
    stim[21] = 14'h2f84;
    stim[22] = 14'h0c5d;
    stim[23] = 14'h2382;
    stim[24] = 14'h11be;
    stim[25] = 14'h0d14;
    stim[26] = 14'h3d5a;
    stim[27] = 14'h0c15;
    stim[28] = 14'h0361;
    stim[29] = 14'h001b;
    stim[30] = 14'h17ae;
    stim[31] = 14'h03ca;
    stim[32] = 14'h2a6a;
    stim[33] = 14'h2120;
    stim[34] = 14'h3f39;
    stim[35] = 14'h2a9d;
    stim[36] = 14'h36f7;
    stim[37] = 14'h06a3;
    stim[38] = 14'h218a;
    stim[39] = 14'h2f00;
    stim[40] = 14'h2c7d;
    stim[41] = 14'h322c;
    stim[42] = 14'h1b8d;
    stim[43] = 14'h059e;
    stim[44] = 14'h1bb5;
    stim[45] = 14'h32d2;
    stim[46] = 14'h2f68;
    stim[47] = 14'h16ef;
    stim[48] = 14'h00c4;
    stim[49] = 14'h1b47;
    stim[50] = 14'h030c;
    stim[51] = 14'h2ee4;
    stim[52] = 14'h14d0;
    stim[53] = 14'h08d9;
    stim[54] = 14'h0cab;
    stim[55] = 14'h22fd;
    stim[56] = 14'h2279;
    stim[57] = 14'h3547;
    stim[58] = 14'h18b3;
    stim[59] = 14'h33f3;
    stim[60] = 14'h3129;
    stim[61] = 14'h0092;
    stim[62] = 14'h07e4;
    stim[63] = 14'h0d33;
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
      expv[0] = 16'h55d1;
      expv[1] = 16'h587e;
      expv[2] = 16'h4fe0;
      expv[3] = 16'h4944;
      expv[4] = 16'h66f7;
      expv[5] = 16'h507f;
      expv[6] = 16'h485a;
      expv[7] = 16'h6752;
      expv[8] = 16'h7b80;
      expv[9] = 16'h4c4f;
      expv[10] = 16'h6f64;
      expv[11] = 16'h59e3;
      expv[12] = 16'h6c24;
      expv[13] = 16'h7d09;
      expv[14] = 16'h733c;
      expv[15] = 16'h576e;
      expv[16] = 16'h5848;
      expv[17] = 16'h6649;
      expv[18] = 16'h4f86;
      expv[19] = 16'h6438;
      expv[20] = 16'h6369;
      expv[21] = 16'h785a;
      expv[22] = 16'h45d9;
      expv[23] = 16'h7822;
      expv[24] = 16'h5be4;
      expv[25] = 16'h5158;
      expv[26] = 16'h55be;
      expv[27] = 16'h4159;
      expv[28] = 16'h7601;
      expv[29] = 16'h41a1;
      expv[30] = 16'h7af4;
      expv[31] = 16'h7ca0;
      expv[32] = 16'h66aa;
      expv[33] = 16'h5202;
      expv[34] = 16'h739f;
      expv[35] = 16'h69cb;
      expv[36] = 16'h6f77;
      expv[37] = 16'h6a31;
      expv[38] = 16'h58a2;
      expv[39] = 16'h701a;
      expv[40] = 16'h47db;
      expv[41] = 16'h62c6;
      expv[42] = 16'h78cd;
      expv[43] = 16'h59f0;
      expv[44] = 16'h7b4d;
      expv[45] = 16'h6d26;
      expv[46] = 16'h769a;
      expv[47] = 16'h6ef5;
      expv[48] = 16'h4c40;
      expv[49] = 16'h746d;
      expv[50] = 16'h70c0;
      expv[51] = 16'h6e5a;
      expv[52] = 16'h4d14;
      expv[53] = 16'h4d89;
      expv[54] = 16'h4ab9;
      expv[55] = 16'h6fc3;
      expv[56] = 16'h6783;
      expv[57] = 16'h5477;
      expv[58] = 16'h4b2d;
      expv[59] = 16'h7f27;
      expv[60] = 16'h5287;
      expv[61] = 16'h4920;
      expv[62] = 16'h7e50;
      expv[63] = 16'h5339;
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
