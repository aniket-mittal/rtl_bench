// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11173 dut (
    .clk(clk),
    .gmii_tx_d(in_vec[51:44]),
    .gmii_tx_en(in_vec[43:43]),
    .gmii_tx_err(in_vec[42:42]),
    .mii_tx_d(in_vec[41:38]),
    .mii_tx_en(in_vec[37:37]),
    .mii_tx_err(in_vec[36:36]),
    .reset_tx_clk(in_vec[35:35]),
    .reset_rx_clk(in_vec[34:34]),
    .address(in_vec[33:29]),
    .read(in_vec[28:28]),
    .writedata(in_vec[27:12]),
    .write(in_vec[11:11]),
    .reset(in_vec[10:10]),
    .rxp(in_vec[9:9]),
    .ref_clk(in_vec[8:8]),
    .gxb_pwrdn_in(in_vec[7:7]),
    .gxb_cal_blk_clk(in_vec[6:6]),
    .reconfig_clk(in_vec[5:5]),
    .reconfig_togxb(in_vec[4:1]),
    .reconfig_busy(in_vec[0:0]),
    .gmii_rx_d(out_vec[68:61]),
    .gmii_rx_dv(out_vec[60:60]),
    .gmii_rx_err(out_vec[59:59]),
    .tx_clk(out_vec[58:58]),
    .rx_clk(out_vec[57:57]),
    .mii_rx_d(out_vec[56:53]),
    .mii_rx_dv(out_vec[52:52]),
    .mii_rx_err(out_vec[51:51]),
    .mii_col(out_vec[50:50]),
    .mii_crs(out_vec[49:49]),
    .set_10(out_vec[48:48]),
    .set_100(out_vec[47:47]),
    .set_1000(out_vec[46:46]),
    .hd_ena(out_vec[45:45]),
    .led_col(out_vec[44:44]),
    .led_crs(out_vec[43:43]),
    .led_an(out_vec[42:42]),
    .led_disp_err(out_vec[41:41]),
    .led_char_err(out_vec[40:40]),
    .led_link(out_vec[39:39]),
    .tx_clkena(out_vec[38:38]),
    .rx_clkena(out_vec[37:37]),
    .rx_recovclkout(out_vec[36:36]),
    .readdata(out_vec[35:20]),
    .waitrequest(out_vec[19:19]),
    .txp(out_vec[18:18]),
    .pcs_pwrdn_out(out_vec[17:17]),
    .reconfig_fromgxb(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'hdfac642498572;
    stim[1] = 52'h0e43232c53e3e;
    stim[2] = 52'h7243e316473db;
    stim[3] = 52'hbe97dd16158f0;
    stim[4] = 52'ha06765d74d34b;
    stim[5] = 52'h30249f998c1e1;
    stim[6] = 52'hcc22accb19adc;
    stim[7] = 52'h4111d9b7b2376;
    stim[8] = 52'h0280b1962899c;
    stim[9] = 52'h44e50e142e80d;
    stim[10] = 52'h4ec0636a0da99;
    stim[11] = 52'h86cd76b395353;
    stim[12] = 52'hd1b3d01b3e243;
    stim[13] = 52'h9542e6ca6b175;
    stim[14] = 52'h28f149da7c0ef;
    stim[15] = 52'h9a578e725f2cb;
    stim[16] = 52'h7df1a4c1353ad;
    stim[17] = 52'h35035781b190a;
    stim[18] = 52'h9f237e109d8a0;
    stim[19] = 52'ha50c9b44069a4;
    stim[20] = 52'h7187e1aebaa0c;
    stim[21] = 52'hb9f687558510d;
    stim[22] = 52'hadb5c26db4396;
    stim[23] = 52'h486923ce3619f;
    stim[24] = 52'hdd9f040f5a99a;
    stim[25] = 52'h259ccd35c13fd;
    stim[26] = 52'h74fca14f1b27d;
    stim[27] = 52'hf06dbfb73492c;
    stim[28] = 52'ha7dc6ac6f58a4;
    stim[29] = 52'h26967595a50f7;
    stim[30] = 52'hbd916ec7ff292;
    stim[31] = 52'h821b80162d1de;
    stim[32] = 52'h6d3f2d2a5f9b0;
    stim[33] = 52'h553bfc158a2ee;
    stim[34] = 52'h437734a11d867;
    stim[35] = 52'h1c11cd7f519cd;
    stim[36] = 52'h8c30af50ccabc;
    stim[37] = 52'h6163d6f07d3bf;
    stim[38] = 52'hbf0ddb43fc229;
    stim[39] = 52'h818ebc84b1247;
    stim[40] = 52'hcb8a190609315;
    stim[41] = 52'h6b0430ef4926e;
    stim[42] = 52'h0599413cd13ec;
    stim[43] = 52'h83d81300e097c;
    stim[44] = 52'h413e7e378197d;
    stim[45] = 52'h416a13e24a17f;
    stim[46] = 52'h54b04c6afd9c2;
    stim[47] = 52'h5fe40f6514821;
    stim[48] = 52'h40435fd2ef74d;
    stim[49] = 52'h4d36e19313342;
    stim[50] = 52'hdcfc23d8001c5;
    stim[51] = 52'h56af8d713c893;
    stim[52] = 52'hc96ccf067a940;
    stim[53] = 52'h049b9441ad2bd;
    stim[54] = 52'ha33e750c3882a;
    stim[55] = 52'h8ca9baaba6845;
    stim[56] = 52'h3ddbbf5c6810f;
    stim[57] = 52'h076cd28265ae2;
    stim[58] = 52'h6c6ba9d0e91e0;
    stim[59] = 52'hb0bd5f884097d;
    stim[60] = 52'hf23e071b46bc0;
    stim[61] = 52'h8466bf61400ad;
    stim[62] = 52'h927f52007e255;
    stim[63] = 52'h610ce841df035;
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
      expv[0] = 69'h000000000000000000;
      expv[1] = 69'h000000000000000000;
      expv[2] = 69'h000000000000000000;
      expv[3] = 69'h000000000000000000;
      expv[4] = 69'h000000000000000000;
      expv[5] = 69'h000000000000000000;
      expv[6] = 69'h000000000000000000;
      expv[7] = 69'h000000000000000000;
      expv[8] = 69'h000000000000000000;
      expv[9] = 69'h000000000000000000;
      expv[10] = 69'h000000000000000000;
      expv[11] = 69'h000000000000000000;
      expv[12] = 69'h000000000000000000;
      expv[13] = 69'h000000000000000000;
      expv[14] = 69'h000000000000000000;
      expv[15] = 69'h000000000000000000;
      expv[16] = 69'h000000000000000000;
      expv[17] = 69'h000000000000000000;
      expv[18] = 69'h000000000000000000;
      expv[19] = 69'h000000000000000000;
      expv[20] = 69'h000000000000000000;
      expv[21] = 69'h000000000000000000;
      expv[22] = 69'h000000000000000000;
      expv[23] = 69'h000000000000000000;
      expv[24] = 69'h000000000000000000;
      expv[25] = 69'h000000000000000000;
      expv[26] = 69'h000000000000000000;
      expv[27] = 69'h000000000000000000;
      expv[28] = 69'h000000000000000000;
      expv[29] = 69'h000000000000000000;
      expv[30] = 69'h000000000000000000;
      expv[31] = 69'h000000000000000000;
      expv[32] = 69'h000000000000000000;
      expv[33] = 69'h000000000000000000;
      expv[34] = 69'h000000000000000000;
      expv[35] = 69'h000000000000000000;
      expv[36] = 69'h000000000000000000;
      expv[37] = 69'h000000000000000000;
      expv[38] = 69'h000000000000000000;
      expv[39] = 69'h000000000000000000;
      expv[40] = 69'h000000000000000000;
      expv[41] = 69'h000000000000000000;
      expv[42] = 69'h000000000000000000;
      expv[43] = 69'h000000000000000000;
      expv[44] = 69'h000000000000000000;
      expv[45] = 69'h000000000000000000;
      expv[46] = 69'h000000000000000000;
      expv[47] = 69'h000000000000000000;
      expv[48] = 69'h000000000000000000;
      expv[49] = 69'h000000000000000000;
      expv[50] = 69'h000000000000000000;
      expv[51] = 69'h000000000000000000;
      expv[52] = 69'h000000000000000000;
      expv[53] = 69'h000000000000000000;
      expv[54] = 69'h000000000000000000;
      expv[55] = 69'h000000000000000000;
      expv[56] = 69'h000000000000000000;
      expv[57] = 69'h000000000000000000;
      expv[58] = 69'h000000000000000000;
      expv[59] = 69'h000000000000000000;
      expv[60] = 69'h000000000000000000;
      expv[61] = 69'h000000000000000000;
      expv[62] = 69'h000000000000000000;
      expv[63] = 69'h000000000000000000;
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
