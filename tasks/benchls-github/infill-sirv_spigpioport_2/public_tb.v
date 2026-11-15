// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sirv_spigpioport_2 dut (
    .clock(clk),
    .reset(in_vec[16:16]),
    .io_spi_sck(in_vec[15:15]),
    .io_spi_dq_0_o(in_vec[14:14]),
    .io_spi_dq_0_oe(in_vec[13:13]),
    .io_spi_dq_1_o(in_vec[12:12]),
    .io_spi_dq_1_oe(in_vec[11:11]),
    .io_spi_dq_2_o(in_vec[10:10]),
    .io_spi_dq_2_oe(in_vec[9:9]),
    .io_spi_dq_3_o(in_vec[8:8]),
    .io_spi_dq_3_oe(in_vec[7:7]),
    .io_spi_cs_0(in_vec[6:6]),
    .io_pins_sck_i_ival(in_vec[5:5]),
    .io_pins_dq_0_i_ival(in_vec[4:4]),
    .io_pins_dq_1_i_ival(in_vec[3:3]),
    .io_pins_dq_2_i_ival(in_vec[2:2]),
    .io_pins_dq_3_i_ival(in_vec[1:1]),
    .io_pins_cs_0_i_ival(in_vec[0:0]),
    .io_spi_dq_0_i(out_vec[33:33]),
    .io_spi_dq_1_i(out_vec[32:32]),
    .io_spi_dq_2_i(out_vec[31:31]),
    .io_spi_dq_3_i(out_vec[30:30]),
    .io_pins_sck_o_oval(out_vec[29:29]),
    .io_pins_sck_o_oe(out_vec[28:28]),
    .io_pins_sck_o_ie(out_vec[27:27]),
    .io_pins_sck_o_pue(out_vec[26:26]),
    .io_pins_sck_o_ds(out_vec[25:25]),
    .io_pins_dq_0_o_oval(out_vec[24:24]),
    .io_pins_dq_0_o_oe(out_vec[23:23]),
    .io_pins_dq_0_o_ie(out_vec[22:22]),
    .io_pins_dq_0_o_pue(out_vec[21:21]),
    .io_pins_dq_0_o_ds(out_vec[20:20]),
    .io_pins_dq_1_o_oval(out_vec[19:19]),
    .io_pins_dq_1_o_oe(out_vec[18:18]),
    .io_pins_dq_1_o_ie(out_vec[17:17]),
    .io_pins_dq_1_o_pue(out_vec[16:16]),
    .io_pins_dq_1_o_ds(out_vec[15:15]),
    .io_pins_dq_2_o_oval(out_vec[14:14]),
    .io_pins_dq_2_o_oe(out_vec[13:13]),
    .io_pins_dq_2_o_ie(out_vec[12:12]),
    .io_pins_dq_2_o_pue(out_vec[11:11]),
    .io_pins_dq_2_o_ds(out_vec[10:10]),
    .io_pins_dq_3_o_oval(out_vec[9:9]),
    .io_pins_dq_3_o_oe(out_vec[8:8]),
    .io_pins_dq_3_o_ie(out_vec[7:7]),
    .io_pins_dq_3_o_pue(out_vec[6:6]),
    .io_pins_dq_3_o_ds(out_vec[5:5]),
    .io_pins_cs_0_o_oval(out_vec[4:4]),
    .io_pins_cs_0_o_oe(out_vec[3:3]),
    .io_pins_cs_0_o_ie(out_vec[2:2]),
    .io_pins_cs_0_o_pue(out_vec[1:1]),
    .io_pins_cs_0_o_ds(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h106bf;
    stim[1] = 17'h184f3;
    stim[2] = 17'h09e77;
    stim[3] = 17'h0da5e;
    stim[4] = 17'h0d4a2;
    stim[5] = 17'h0017e;
    stim[6] = 17'h02ea3;
    stim[7] = 17'h0cd58;
    stim[8] = 17'h14bbb;
    stim[9] = 17'h0346b;
    stim[10] = 17'h0c3b2;
    stim[11] = 17'h01032;
    stim[12] = 17'h07d06;
    stim[13] = 17'h0b1ad;
    stim[14] = 17'h0e688;
    stim[15] = 17'h05907;
    stim[16] = 17'h08d5d;
    stim[17] = 17'h00f4f;
    stim[18] = 17'h0d936;
    stim[19] = 17'h0e3a3;
    stim[20] = 17'h0beac;
    stim[21] = 17'h09e19;
    stim[22] = 17'h0d793;
    stim[23] = 17'h00b3a;
    stim[24] = 17'h054b5;
    stim[25] = 17'h000c6;
    stim[26] = 17'h0a7fe;
    stim[27] = 17'h0fad2;
    stim[28] = 17'h0108e;
    stim[29] = 17'h02622;
    stim[30] = 17'h050a9;
    stim[31] = 17'h08505;
    stim[32] = 17'h0616e;
    stim[33] = 17'h0f626;
    stim[34] = 17'h0b5ed;
    stim[35] = 17'h09840;
    stim[36] = 17'h03bb6;
    stim[37] = 17'h08a37;
    stim[38] = 17'h0c303;
    stim[39] = 17'h07ce8;
    stim[40] = 17'h0c5f2;
    stim[41] = 17'h05a4a;
    stim[42] = 17'h0f99b;
    stim[43] = 17'h0510a;
    stim[44] = 17'h088da;
    stim[45] = 17'h0293d;
    stim[46] = 17'h0dce3;
    stim[47] = 17'h0c9b6;
    stim[48] = 17'h0a6b3;
    stim[49] = 17'h0bf42;
    stim[50] = 17'h061e0;
    stim[51] = 17'h0f6b3;
    stim[52] = 17'h018a5;
    stim[53] = 17'h08b04;
    stim[54] = 17'h0f314;
    stim[55] = 17'h0342d;
    stim[56] = 17'h045ed;
    stim[57] = 17'h03819;
    stim[58] = 17'h0235f;
    stim[59] = 17'h08acc;
    stim[60] = 17'h04f1a;
    stim[61] = 17'h0cddb;
    stim[62] = 17'h0a23a;
    stim[63] = 17'h00d95;
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
      expv[0] = 34'h01273ed69;
      expv[1] = 34'h03273dd79;
      expv[2] = 34'h0327decf9;
      expv[3] = 34'h0337dacf9;
      expv[4] = 34'h0337bdd69;
      expv[5] = 34'h2d2739ef9;
      expv[6] = 34'h3d2b5ed69;
      expv[7] = 34'h07375def9;
      expv[8] = 34'h01375af69;
      expv[9] = 34'h012bbdcf9;
      expv[10] = 34'h03373af69;
      expv[11] = 34'h0127b9ce9;
      expv[12] = 34'h153bddee9;
      expv[13] = 34'h272bb9f69;
      expv[14] = 34'h273b3ed69;
      expv[15] = 34'h0d37d9ee9;
      expv[16] = 34'h1b275def9;
      expv[17] = 34'h11275eef9;
      expv[18] = 34'h0f37d9ee9;
      expv[19] = 34'h3b3b3af69;
      expv[20] = 34'h1f2bded69;
      expv[21] = 34'h2f27dece9;
      expv[22] = 34'h0737bef69;
      expv[23] = 34'h19275aee9;
      expv[24] = 34'h3137bdd69;
      expv[25] = 34'h252739d79;
      expv[26] = 34'h372b3ef79;
      expv[27] = 34'h2b3bdad79;
      expv[28] = 34'h0d27b9d69;
      expv[29] = 34'h3d2b3ece9;
      expv[30] = 34'h2537b9d69;
      expv[31] = 34'h1f273dee9;
      expv[32] = 34'h053b39ef9;
      expv[33] = 34'h133bbece9;
      expv[34] = 34'h0b2bbdf79;
      expv[35] = 34'h1f27d9cf9;
      expv[36] = 34'h0d2bdaf69;
      expv[37] = 34'h1b275ace9;
      expv[38] = 34'h03373aee9;
      expv[39] = 34'h2d3bddd79;
      expv[40] = 34'h2f373df79;
      expv[41] = 34'h0537dacf9;
      expv[42] = 34'h133bd9f69;
      expv[43] = 34'h2537b9ee9;
      expv[44] = 34'h172759d79;
      expv[45] = 34'h352b59ee9;
      expv[46] = 34'h1737ddd79;
      expv[47] = 34'h373759f69;
      expv[48] = 34'h3b2b3ed69;
      expv[49] = 34'h072bdeef9;
      expv[50] = 34'h2d3b39f79;
      expv[51] = 34'h273bbed69;
      expv[52] = 34'h0527d9d69;
      expv[53] = 34'h03275aee9;
      expv[54] = 34'h273bbaee9;
      expv[55] = 34'h092bbdce9;
      expv[56] = 34'h09373df79;
      expv[57] = 34'h292bd9ce9;
      expv[58] = 34'h192b3aef9;
      expv[59] = 34'h1b275ad79;
      expv[60] = 34'h31375eee9;
      expv[61] = 34'h3f375df79;
      expv[62] = 34'h1b2b3ace9;
      expv[63] = 34'h35275df69;
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
