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

  rtlpp_04861 dut (
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
    stim[0] = 52'h0a458f27b4672;
    stim[1] = 52'hd578bd03a1f84;
    stim[2] = 52'h31bcfc7abc371;
    stim[3] = 52'h9d62965710bdc;
    stim[4] = 52'hc8c9d46014177;
    stim[5] = 52'hdf3144ccd21f0;
    stim[6] = 52'h14b117b7cf080;
    stim[7] = 52'h7c3622ae882e9;
    stim[8] = 52'ha72fa1cabca83;
    stim[9] = 52'h28a99858f49ee;
    stim[10] = 52'h1d2dd2bdf821f;
    stim[11] = 52'h27ef51ecde8d1;
    stim[12] = 52'h797774bdcd866;
    stim[13] = 52'ha93c50258713a;
    stim[14] = 52'h61ad5b18602cb;
    stim[15] = 52'h66819475839b9;
    stim[16] = 52'h57a8c1dad3887;
    stim[17] = 52'h65e1e02f1209a;
    stim[18] = 52'hcdbfe7be6dbdf;
    stim[19] = 52'hbfe0205f57bad;
    stim[20] = 52'h7f94ce92800b3;
    stim[21] = 52'h6e257ef395083;
    stim[22] = 52'hbf3557480f88f;
    stim[23] = 52'hae9b71d1cea64;
    stim[24] = 52'ha08319b62913e;
    stim[25] = 52'h8b48ce196d158;
    stim[26] = 52'h521a510615100;
    stim[27] = 52'h75138d82f40a1;
    stim[28] = 52'h2587e28e9442b;
    stim[29] = 52'hfb50a0e012133;
    stim[30] = 52'h145f99088e103;
    stim[31] = 52'h059cf765ab076;
    stim[32] = 52'hc896580df0b0e;
    stim[33] = 52'hdd515449e108d;
    stim[34] = 52'h8c74784f121e4;
    stim[35] = 52'h0106cc2b3126d;
    stim[36] = 52'hf06ee7e4c91db;
    stim[37] = 52'h70ed29dd1c15c;
    stim[38] = 52'hc2e5d8a0be957;
    stim[39] = 52'ha79f18edb5969;
    stim[40] = 52'h31f2487da0178;
    stim[41] = 52'h3ec4e491053f3;
    stim[42] = 52'hb587274af9039;
    stim[43] = 52'h4eae89710f3fe;
    stim[44] = 52'he551358f710d4;
    stim[45] = 52'h09002720cc34d;
    stim[46] = 52'h40e79f23eca77;
    stim[47] = 52'h075fce7bda361;
    stim[48] = 52'he6e3c42e57a68;
    stim[49] = 52'h9f242b99080bf;
    stim[50] = 52'hf12cfa7033246;
    stim[51] = 52'h6c042f6a9625c;
    stim[52] = 52'h99f9cd4d0a2d1;
    stim[53] = 52'h2b3f5fd2ba3c3;
    stim[54] = 52'h2da5aeef8632f;
    stim[55] = 52'hf90752525c204;
    stim[56] = 52'h6a0c087329897;
    stim[57] = 52'h3ca2dd6655824;
    stim[58] = 52'h8c64e5129ea28;
    stim[59] = 52'h8f0d7c3cb10d1;
    stim[60] = 52'h8b60b51c36224;
    stim[61] = 52'h9ab4c56ba6aba;
    stim[62] = 52'h253621a5b9174;
    stim[63] = 52'h25fa6ac9ea26f;
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
