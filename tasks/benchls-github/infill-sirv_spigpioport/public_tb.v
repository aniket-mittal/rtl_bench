// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sirv_spigpioport dut (
    .clock(clk),
    .reset(in_vec[22:22]),
    .io_spi_sck(in_vec[21:21]),
    .io_spi_dq_0_o(in_vec[20:20]),
    .io_spi_dq_0_oe(in_vec[19:19]),
    .io_spi_dq_1_o(in_vec[18:18]),
    .io_spi_dq_1_oe(in_vec[17:17]),
    .io_spi_dq_2_o(in_vec[16:16]),
    .io_spi_dq_2_oe(in_vec[15:15]),
    .io_spi_dq_3_o(in_vec[14:14]),
    .io_spi_dq_3_oe(in_vec[13:13]),
    .io_spi_cs_0(in_vec[12:12]),
    .io_spi_cs_1(in_vec[11:11]),
    .io_spi_cs_2(in_vec[10:10]),
    .io_spi_cs_3(in_vec[9:9]),
    .io_pins_sck_i_ival(in_vec[8:8]),
    .io_pins_dq_0_i_ival(in_vec[7:7]),
    .io_pins_dq_1_i_ival(in_vec[6:6]),
    .io_pins_dq_2_i_ival(in_vec[5:5]),
    .io_pins_dq_3_i_ival(in_vec[4:4]),
    .io_pins_cs_0_i_ival(in_vec[3:3]),
    .io_pins_cs_1_i_ival(in_vec[2:2]),
    .io_pins_cs_2_i_ival(in_vec[1:1]),
    .io_pins_cs_3_i_ival(in_vec[0:0]),
    .io_spi_dq_0_i(out_vec[48:48]),
    .io_spi_dq_1_i(out_vec[47:47]),
    .io_spi_dq_2_i(out_vec[46:46]),
    .io_spi_dq_3_i(out_vec[45:45]),
    .io_pins_sck_o_oval(out_vec[44:44]),
    .io_pins_sck_o_oe(out_vec[43:43]),
    .io_pins_sck_o_ie(out_vec[42:42]),
    .io_pins_sck_o_pue(out_vec[41:41]),
    .io_pins_sck_o_ds(out_vec[40:40]),
    .io_pins_dq_0_o_oval(out_vec[39:39]),
    .io_pins_dq_0_o_oe(out_vec[38:38]),
    .io_pins_dq_0_o_ie(out_vec[37:37]),
    .io_pins_dq_0_o_pue(out_vec[36:36]),
    .io_pins_dq_0_o_ds(out_vec[35:35]),
    .io_pins_dq_1_o_oval(out_vec[34:34]),
    .io_pins_dq_1_o_oe(out_vec[33:33]),
    .io_pins_dq_1_o_ie(out_vec[32:32]),
    .io_pins_dq_1_o_pue(out_vec[31:31]),
    .io_pins_dq_1_o_ds(out_vec[30:30]),
    .io_pins_dq_2_o_oval(out_vec[29:29]),
    .io_pins_dq_2_o_oe(out_vec[28:28]),
    .io_pins_dq_2_o_ie(out_vec[27:27]),
    .io_pins_dq_2_o_pue(out_vec[26:26]),
    .io_pins_dq_2_o_ds(out_vec[25:25]),
    .io_pins_dq_3_o_oval(out_vec[24:24]),
    .io_pins_dq_3_o_oe(out_vec[23:23]),
    .io_pins_dq_3_o_ie(out_vec[22:22]),
    .io_pins_dq_3_o_pue(out_vec[21:21]),
    .io_pins_dq_3_o_ds(out_vec[20:20]),
    .io_pins_cs_0_o_oval(out_vec[19:19]),
    .io_pins_cs_0_o_oe(out_vec[18:18]),
    .io_pins_cs_0_o_ie(out_vec[17:17]),
    .io_pins_cs_0_o_pue(out_vec[16:16]),
    .io_pins_cs_0_o_ds(out_vec[15:15]),
    .io_pins_cs_1_o_oval(out_vec[14:14]),
    .io_pins_cs_1_o_oe(out_vec[13:13]),
    .io_pins_cs_1_o_ie(out_vec[12:12]),
    .io_pins_cs_1_o_pue(out_vec[11:11]),
    .io_pins_cs_1_o_ds(out_vec[10:10]),
    .io_pins_cs_2_o_oval(out_vec[9:9]),
    .io_pins_cs_2_o_oe(out_vec[8:8]),
    .io_pins_cs_2_o_ie(out_vec[7:7]),
    .io_pins_cs_2_o_pue(out_vec[6:6]),
    .io_pins_cs_2_o_ds(out_vec[5:5]),
    .io_pins_cs_3_o_oval(out_vec[4:4]),
    .io_pins_cs_3_o_oe(out_vec[3:3]),
    .io_pins_cs_3_o_ie(out_vec[2:2]),
    .io_pins_cs_3_o_pue(out_vec[1:1]),
    .io_pins_cs_3_o_ds(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h4bb810;
    stim[1] = 23'h67447d;
    stim[2] = 23'h388d58;
    stim[3] = 23'h0305e5;
    stim[4] = 23'h67f3ea;
    stim[5] = 23'h3cc160;
    stim[6] = 23'h3ab581;
    stim[7] = 23'h2880c0;
    stim[8] = 23'h03b48b;
    stim[9] = 23'h29f79b;
    stim[10] = 23'h2e2ec6;
    stim[11] = 23'h2a294b;
    stim[12] = 23'h2cd1ee;
    stim[13] = 23'h08136b;
    stim[14] = 23'h043d56;
    stim[15] = 23'h3181eb;
    stim[16] = 23'h21797d;
    stim[17] = 23'h2a87aa;
    stim[18] = 23'h331d1c;
    stim[19] = 23'h1a65e0;
    stim[20] = 23'h0422a4;
    stim[21] = 23'h0ef699;
    stim[22] = 23'h043cec;
    stim[23] = 23'h039962;
    stim[24] = 23'h173e19;
    stim[25] = 23'h135b8c;
    stim[26] = 23'h214b60;
    stim[27] = 23'h2fba83;
    stim[28] = 23'h1dfb4a;
    stim[29] = 23'h2fa6c2;
    stim[30] = 23'h250a67;
    stim[31] = 23'h09a068;
    stim[32] = 23'h01df75;
    stim[33] = 23'h1dabd7;
    stim[34] = 23'h387c09;
    stim[35] = 23'h23c769;
    stim[36] = 23'h37cc16;
    stim[37] = 23'h1d02f6;
    stim[38] = 23'h15b513;
    stim[39] = 23'h127789;
    stim[40] = 23'h30cc89;
    stim[41] = 23'h3a0f6e;
    stim[42] = 23'h15522d;
    stim[43] = 23'h1b2755;
    stim[44] = 23'h20e1d7;
    stim[45] = 23'h15f9e8;
    stim[46] = 23'h2ecd54;
    stim[47] = 23'h3f7911;
    stim[48] = 23'h287900;
    stim[49] = 23'h17cfba;
    stim[50] = 23'h0d5594;
    stim[51] = 23'h0674d1;
    stim[52] = 23'h124613;
    stim[53] = 23'h0e0d09;
    stim[54] = 23'h2b2bc5;
    stim[55] = 23'h260eb1;
    stim[56] = 23'h3eba97;
    stim[57] = 23'h04e6b3;
    stim[58] = 23'h082009;
    stim[59] = 23'h03a605;
    stim[60] = 23'h300c92;
    stim[61] = 23'h20186c;
    stim[62] = 23'h3531d5;
    stim[63] = 23'h3ac840;
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
      expv[0] = 49'h02852b4ac6108;
      expv[1] = 49'h0f836ad642308;
      expv[2] = 49'h0b8d194646308;
      expv[3] = 49'h1c832ac642308;
      expv[4] = 49'h1d836b5ac2118;
      expv[5] = 49'h0d8d595642108;
      expv[6] = 49'h118d294ac2308;
      expv[7] = 49'h1985194642108;
      expv[8] = 49'h10832b4ac2308;
      expv[9] = 49'h13851b5ac2318;
      expv[10] = 49'h198568ca46318;
      expv[11] = 49'h098528ca46108;
      expv[12] = 49'h1d855956c2108;
      expv[13] = 49'h0c8518c6c2118;
      expv[14] = 49'h0a8358cac6308;
      expv[15] = 49'h1d8b1b4642108;
      expv[16] = 49'h0f831adac6108;
      expv[17] = 49'h1585294642318;
      expv[18] = 49'h038b2ac6c6308;
      expv[19] = 49'h1c8d28da42308;
      expv[20] = 49'h148358ca42118;
      expv[21] = 49'h1285695ac2318;
      expv[22] = 49'h1c8358cac6308;
      expv[23] = 49'h0c832b46c6108;
      expv[24] = 49'h028b6acac6318;
      expv[25] = 49'h108b2ad6c6118;
      expv[26] = 49'h0d831ad646118;
      expv[27] = 49'h11856b4ac6118;
      expv[28] = 49'h088d5b5ac6118;
      expv[29] = 49'h19856b4a42318;
      expv[30] = 49'h0d835ac646118;
      expv[31] = 49'h0c851b4a42108;
      expv[32] = 49'h0e831b56c6318;
      expv[33] = 49'h1a8d5b4a46118;
      expv[34] = 49'h018d18dac6308;
      expv[35] = 49'h0d832b5642318;
      expv[36] = 49'h038b6b5646308;
      expv[37] = 49'h1e8d5ac642118;
      expv[38] = 49'h028b5b4ac2308;
      expv[39] = 49'h108b28dac2318;
      expv[40] = 49'h118b195646308;
      expv[41] = 49'h0d8d28c646318;
      expv[42] = 49'h048b5ad6c2118;
      expv[43] = 49'h0a8d2aca42318;
      expv[44] = 49'h1b83195a42108;
      expv[45] = 49'h1c8b5b5ac6108;
      expv[46] = 49'h0b85695646308;
      expv[47] = 49'h038d6adac6108;
      expv[48] = 49'h018518dac6108;
      expv[49] = 49'h168b6b5646318;
      expv[50] = 49'h12855ad6c2308;
      expv[51] = 49'h1a8368dac2308;
      expv[52] = 49'h028b28d642318;
      expv[53] = 49'h008568c646308;
      expv[54] = 49'h19852aca46118;
      expv[55] = 49'h178368c646318;
      expv[56] = 49'h138d694ac6118;
      expv[57] = 49'h1683595a42318;
      expv[58] = 49'h008518ca42108;
      expv[59] = 49'h00832b4a42318;
      expv[60] = 49'h138b18c646308;
      expv[61] = 49'h0d8318c6c6108;
      expv[62] = 49'h1b8b5acac2108;
      expv[63] = 49'h098d295646108;
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
