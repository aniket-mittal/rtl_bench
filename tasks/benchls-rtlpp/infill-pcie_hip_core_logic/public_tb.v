// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 134;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pcie_hip_core_logic dut (
    .clk(clk),
    .free_100MHz(in_vec[49:49]),
    .local_rstn(in_vec[48:48]),
    .pcie_rstn(in_vec[47:47]),
    .pipe_mode(in_vec[46:46]),
    .pld_clk(in_vec[45:45]),
    .refclk(in_vec[44:44]),
    .rx_in0(in_vec[43:43]),
    .rx_in1(in_vec[42:42]),
    .rx_in2(in_vec[41:41]),
    .rx_in3(in_vec[40:40]),
    .test_in(in_vec[39:0]),
    .gen2_speed(out_vec[133:133]),
    .lane_width_code(out_vec[132:129]),
    .phy_sel_code(out_vec[128:125]),
    .phystatus_ext(out_vec[124:124]),
    .powerdown_ext(out_vec[123:122]),
    .ref_clk_sel_code(out_vec[121:118]),
    .rxdata0_ext(out_vec[117:110]),
    .rxdata1_ext(out_vec[109:102]),
    .rxdata2_ext(out_vec[101:94]),
    .rxdata3_ext(out_vec[93:86]),
    .rxdatak0_ext(out_vec[85:85]),
    .rxdatak1_ext(out_vec[84:84]),
    .rxdatak2_ext(out_vec[83:83]),
    .rxdatak3_ext(out_vec[82:82]),
    .rxelecidle0_ext(out_vec[81:81]),
    .rxelecidle1_ext(out_vec[80:80]),
    .rxelecidle2_ext(out_vec[79:79]),
    .rxelecidle3_ext(out_vec[78:78]),
    .rxpolarity0_ext(out_vec[77:77]),
    .rxpolarity1_ext(out_vec[76:76]),
    .rxpolarity2_ext(out_vec[75:75]),
    .rxpolarity3_ext(out_vec[74:74]),
    .rxstatus0_ext(out_vec[73:71]),
    .rxstatus1_ext(out_vec[70:68]),
    .rxstatus2_ext(out_vec[67:65]),
    .rxstatus3_ext(out_vec[64:62]),
    .rxvalid0_ext(out_vec[61:61]),
    .rxvalid1_ext(out_vec[60:60]),
    .rxvalid2_ext(out_vec[59:59]),
    .rxvalid3_ext(out_vec[58:58]),
    .test_out_icm(out_vec[57:49]),
    .tx_out0(out_vec[48:48]),
    .tx_out1(out_vec[47:47]),
    .tx_out2(out_vec[46:46]),
    .tx_out3(out_vec[45:45]),
    .txcompl0_ext(out_vec[44:44]),
    .txcompl1_ext(out_vec[43:43]),
    .txcompl2_ext(out_vec[42:42]),
    .txcompl3_ext(out_vec[41:41]),
    .txdata0_ext(out_vec[40:33]),
    .txdata1_ext(out_vec[32:25]),
    .txdata2_ext(out_vec[24:17]),
    .txdata3_ext(out_vec[16:9]),
    .txdatak0_ext(out_vec[8:8]),
    .txdatak1_ext(out_vec[7:7]),
    .txdatak2_ext(out_vec[6:6]),
    .txdatak3_ext(out_vec[5:5]),
    .txdetectrx_ext(out_vec[4:4]),
    .txelecidle0_ext(out_vec[3:3]),
    .txelecidle1_ext(out_vec[2:2]),
    .txelecidle2_ext(out_vec[1:1]),
    .txelecidle3_ext(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h24c71a1e74aad;
    stim[1] = 50'h230fe916d8d9c;
    stim[2] = 50'h33b081b2d75d4;
    stim[3] = 50'h19969d6790330;
    stim[4] = 50'h0c7b28cd99b75;
    stim[5] = 50'h3012ac3c8b939;
    stim[6] = 50'h397ce0aefc2df;
    stim[7] = 50'h2d25d5498873f;
    stim[8] = 50'h2b0cc67ce0c5a;
    stim[9] = 50'h2a5a1dddc84fa;
    stim[10] = 50'h2f55b6d45f215;
    stim[11] = 50'h1a488bd185bbe;
    stim[12] = 50'h3c0d5376193f0;
    stim[13] = 50'h180060c44dd3b;
    stim[14] = 50'h0e59d93fa9088;
    stim[15] = 50'h1969321f218a0;
    stim[16] = 50'h18835db7745a6;
    stim[17] = 50'h1d684d5e55b2f;
    stim[18] = 50'h2d8580126e177;
    stim[19] = 50'h18f5eb4a74d90;
    stim[20] = 50'h193500dfea08c;
    stim[21] = 50'h3d93b5a4ab5cc;
    stim[22] = 50'h2ae2368d6622e;
    stim[23] = 50'h082f2f35f5284;
    stim[24] = 50'h39579a31336c2;
    stim[25] = 50'h1698bda91ef4f;
    stim[26] = 50'h1b47d4d5ffca3;
    stim[27] = 50'h0dbab12356bcc;
    stim[28] = 50'h2b8325e7aa1df;
    stim[29] = 50'h3b1434a45754a;
    stim[30] = 50'h3e888df80ef12;
    stim[31] = 50'h3fbba117421d6;
    stim[32] = 50'h0a1b6f871460a;
    stim[33] = 50'h09b52a8719775;
    stim[34] = 50'h2ed596e91e72c;
    stim[35] = 50'h3a50f187a780e;
    stim[36] = 50'h1c362c8edb1ef;
    stim[37] = 50'h2a210b1e9c22e;
    stim[38] = 50'h1fbcd59a2c36e;
    stim[39] = 50'h29c8b884de87b;
    stim[40] = 50'h1a7aa772842d1;
    stim[41] = 50'h3a0728ec9caea;
    stim[42] = 50'h1c16f7bff5cbd;
    stim[43] = 50'h288a1d7820af7;
    stim[44] = 50'h1864fb777527d;
    stim[45] = 50'h2dd6837cc0e5a;
    stim[46] = 50'h0b96883490ba1;
    stim[47] = 50'h1bf6975635f8a;
    stim[48] = 50'h2f2d97c89a6e0;
    stim[49] = 50'h0a3914cc75b44;
    stim[50] = 50'h2d37ea6d1da3d;
    stim[51] = 50'h0d24c748d5c17;
    stim[52] = 50'h1cdd785b40e47;
    stim[53] = 50'h0fa2fdcd4c25c;
    stim[54] = 50'h0fa8b2c149864;
    stim[55] = 50'h1b6c8355c8596;
    stim[56] = 50'h19a56ac4604b0;
    stim[57] = 50'h1c298a07d89a8;
    stim[58] = 50'h36b7fab0ac4f7;
    stim[59] = 50'h3bfa8befbb913;
    stim[60] = 50'h2aa4953dd4c5c;
    stim[61] = 50'h1afa4136c7405;
    stim[62] = 50'h0b8689f7b6397;
    stim[63] = 50'h0a4f9add9fbfa;
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
      expv[0] = 134'h0000000000000000000000000000000000;
      expv[1] = 134'h0000000000000000000000000000000000;
      expv[2] = 134'h0000000000000000000000000000000000;
      expv[3] = 134'h0000000000000000000000000000000000;
      expv[4] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[5] = 134'h0000000000000000000000000000000000;
      expv[6] = 134'h0000000000000000000000000000000000;
      expv[7] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[8] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[9] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[10] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[11] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[12] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[13] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[14] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[15] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[16] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[17] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[18] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[19] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[20] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[21] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[22] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[23] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[24] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[25] = 134'h0000000000000000000000000000000000;
      expv[26] = 134'h0000000000000000000000000000000000;
      expv[27] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[28] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[29] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[30] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[31] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[32] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[33] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[34] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[35] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[36] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[37] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[38] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[39] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[40] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[41] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[42] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[43] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[44] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[45] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[46] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[47] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[48] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[49] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[50] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[51] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[52] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[53] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[54] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[55] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[56] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[57] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[58] = 134'h0000000000000000000000000000000000;
      expv[59] = 134'h0000000000000000000000000000000000;
      expv[60] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[61] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[62] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
      expv[63] = 134'h3f5a7ffffffffc3ca73ffffffffffffff0;
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
