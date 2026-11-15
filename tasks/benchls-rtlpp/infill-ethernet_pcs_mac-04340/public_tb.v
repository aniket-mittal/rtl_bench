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

  rtlpp_04340 dut (
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
    stim[0] = 52'h1fe0028a526c0;
    stim[1] = 52'h90f850998dd31;
    stim[2] = 52'h02891b08469b4;
    stim[3] = 52'h419767bf2c011;
    stim[4] = 52'h741a28f7393c1;
    stim[5] = 52'h5fcbec0e6d233;
    stim[6] = 52'he74af1324481c;
    stim[7] = 52'hf9e2f7a52d04c;
    stim[8] = 52'h9e426a2deeaec;
    stim[9] = 52'h4d14ebae2fb56;
    stim[10] = 52'h6014eac6561ad;
    stim[11] = 52'hf3f8197a9ab1d;
    stim[12] = 52'hd64550791426a;
    stim[13] = 52'hd6416d0bdc282;
    stim[14] = 52'h02b0c1b07aac0;
    stim[15] = 52'hccf61a7a3899f;
    stim[16] = 52'h5ceb902e4094c;
    stim[17] = 52'h260087b1ed860;
    stim[18] = 52'h5c465fff402e9;
    stim[19] = 52'hf5f282748914e;
    stim[20] = 52'hf419b2557638c;
    stim[21] = 52'hc635edb814a78;
    stim[22] = 52'h2fd2eb71df1bc;
    stim[23] = 52'h5924b46f6b3e3;
    stim[24] = 52'hb024af80d6069;
    stim[25] = 52'he1ce6c32c5a9c;
    stim[26] = 52'h21e3318e84a1f;
    stim[27] = 52'hffdd690d951b5;
    stim[28] = 52'h57e13d94ef9af;
    stim[29] = 52'h596d1a28c754d;
    stim[30] = 52'h600d719d782d0;
    stim[31] = 52'h987c30117da4e;
    stim[32] = 52'h29ae06572f3b7;
    stim[33] = 52'h9d7492507dafa;
    stim[34] = 52'hb06e304a91aa8;
    stim[35] = 52'hcc6aa6510595d;
    stim[36] = 52'hc1085f8d9f90f;
    stim[37] = 52'hfa0924cfe58d3;
    stim[38] = 52'hb94e2b630e210;
    stim[39] = 52'ha4c4a2ddbc26f;
    stim[40] = 52'h57da36a5e3123;
    stim[41] = 52'h41429e5825a2d;
    stim[42] = 52'ha5b0c4a5689ef;
    stim[43] = 52'h03f03dcaef8d5;
    stim[44] = 52'h8b23d0c837048;
    stim[45] = 52'h1504623bd510c;
    stim[46] = 52'h9e60ef865d951;
    stim[47] = 52'h5d39d7b57f81e;
    stim[48] = 52'hee3a69bdcb274;
    stim[49] = 52'hf4b5a3db92377;
    stim[50] = 52'h4348c54ae546b;
    stim[51] = 52'h63a47da4418d6;
    stim[52] = 52'haa79a1f7cc9b7;
    stim[53] = 52'h2957f4da8cb57;
    stim[54] = 52'h261ac28319165;
    stim[55] = 52'h2c26da49cc973;
    stim[56] = 52'h145f71a3e4b06;
    stim[57] = 52'h0428cec57dac5;
    stim[58] = 52'hbbadb7b9ba2ad;
    stim[59] = 52'h955a384aec265;
    stim[60] = 52'haa96f2dc69044;
    stim[61] = 52'h7c4f4f5dc520b;
    stim[62] = 52'h95fbcc0f55177;
    stim[63] = 52'hd1d0d97e28026;
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
