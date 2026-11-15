// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00029 dut (
    .clk(clk),
    .rst(in_vec[14:14]),
    .phy_tx_mode(in_vec[13:13]),
    .rxd(in_vec[12:12]),
    .rxdp(in_vec[11:11]),
    .rxdn(in_vec[10:10]),
    .LineCtrl_i(in_vec[9:9]),
    .DataOut_i(in_vec[8:1]),
    .TxValid_i(in_vec[0:0]),
    .usb_rst(out_vec[21:21]),
    .txdp(out_vec[20:20]),
    .txdn(out_vec[19:19]),
    .txoe(out_vec[18:18]),
    .ce_o(out_vec[17:17]),
    .sync_err_o(out_vec[16:16]),
    .bit_stuff_err_o(out_vec[15:15]),
    .byte_err_o(out_vec[14:14]),
    .TxReady_o(out_vec[13:13]),
    .DataIn_o(out_vec[12:5]),
    .RxValid_o(out_vec[4:4]),
    .RxActive_o(out_vec[3:3]),
    .RxError_o(out_vec[2:2]),
    .LineState_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h68ab;
    stim[1] = 15'h779d;
    stim[2] = 15'h0252;
    stim[3] = 15'h21c3;
    stim[4] = 15'h1532;
    stim[5] = 15'h095c;
    stim[6] = 15'h3b49;
    stim[7] = 15'h1e02;
    stim[8] = 15'h051d;
    stim[9] = 15'h3051;
    stim[10] = 15'h0a8b;
    stim[11] = 15'h3564;
    stim[12] = 15'h0c56;
    stim[13] = 15'h3b51;
    stim[14] = 15'h158e;
    stim[15] = 15'h0e19;
    stim[16] = 15'h15ce;
    stim[17] = 15'h167f;
    stim[18] = 15'h3039;
    stim[19] = 15'h2ed6;
    stim[20] = 15'h3bcb;
    stim[21] = 15'h25c7;
    stim[22] = 15'h0343;
    stim[23] = 15'h2df6;
    stim[24] = 15'h136d;
    stim[25] = 15'h1435;
    stim[26] = 15'h0f9a;
    stim[27] = 15'h00bb;
    stim[28] = 15'h24ca;
    stim[29] = 15'h2c06;
    stim[30] = 15'h12fc;
    stim[31] = 15'h3b70;
    stim[32] = 15'h0718;
    stim[33] = 15'h3b72;
    stim[34] = 15'h1c63;
    stim[35] = 15'h08a7;
    stim[36] = 15'h2bf0;
    stim[37] = 15'h3a63;
    stim[38] = 15'h38ea;
    stim[39] = 15'h0434;
    stim[40] = 15'h22b4;
    stim[41] = 15'h7742;
    stim[42] = 15'h3006;
    stim[43] = 15'h38bf;
    stim[44] = 15'h3695;
    stim[45] = 15'h22fa;
    stim[46] = 15'h3c8e;
    stim[47] = 15'h3ed8;
    stim[48] = 15'h1a2a;
    stim[49] = 15'h0670;
    stim[50] = 15'h22d0;
    stim[51] = 15'h3dc2;
    stim[52] = 15'h3b2c;
    stim[53] = 15'h0040;
    stim[54] = 15'h2601;
    stim[55] = 15'h2c88;
    stim[56] = 15'h2860;
    stim[57] = 15'h1358;
    stim[58] = 15'h07cd;
    stim[59] = 15'h06aa;
    stim[60] = 15'h2194;
    stim[61] = 15'h20b9;
    stim[62] = 15'h2fe0;
    stim[63] = 15'h0972;
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
      expv[0] = 22'h0xx000;
      expv[1] = 22'h0xxffa;
      expv[2] = 22'h0xx000;
      expv[3] = 22'h0xx000;
      expv[4] = 22'h0xx000;
      expv[5] = 22'h0xx000;
      expv[6] = 22'h0xx000;
      expv[7] = 22'h0xx000;
      expv[8] = 22'h0xx000;
      expv[9] = 22'h1xx000;
      expv[10] = 22'h0xx000;
      expv[11] = 22'h0xx000;
      expv[12] = 22'h0xx000;
      expv[13] = 22'h0xx000;
      expv[14] = 22'h0xx000;
      expv[15] = 22'h0xx000;
      expv[16] = 22'h0xx000;
      expv[17] = 22'h0xx000;
      expv[18] = 22'h1xx000;
      expv[19] = 22'h0xx000;
      expv[20] = 22'h0xx000;
      expv[21] = 22'h0xx000;
      expv[22] = 22'h0xx000;
      expv[23] = 22'h0xx000;
      expv[24] = 22'h0xx000;
      expv[25] = 22'h0xx000;
      expv[26] = 22'h0xx000;
      expv[27] = 22'h0xx000;
      expv[28] = 22'h0xx000;
      expv[29] = 22'h0xx000;
      expv[30] = 22'h0xx000;
      expv[31] = 22'h0xx000;
      expv[32] = 22'h0xx000;
      expv[33] = 22'h0xx000;
      expv[34] = 22'h0xx000;
      expv[35] = 22'h0xx000;
      expv[36] = 22'h1xx000;
      expv[37] = 22'h0xx000;
      expv[38] = 22'h0xx000;
      expv[39] = 22'h0xx000;
      expv[40] = 22'h0xx000;
      expv[41] = 22'h0xx000;
      expv[42] = 22'h0xx000;
      expv[43] = 22'h0xx000;
      expv[44] = 22'h1xx000;
      expv[45] = 22'h1xx000;
      expv[46] = 22'h0xx000;
      expv[47] = 22'h0xx000;
      expv[48] = 22'h0xx000;
      expv[49] = 22'h0xx000;
      expv[50] = 22'h0xx000;
      expv[51] = 22'h0xx000;
      expv[52] = 22'h0xx000;
      expv[53] = 22'h0xx000;
      expv[54] = 22'h0xx000;
      expv[55] = 22'h0xx000;
      expv[56] = 22'h0xx000;
      expv[57] = 22'h0xx000;
      expv[58] = 22'h0xx000;
      expv[59] = 22'h0xx000;
      expv[60] = 22'h0xx000;
      expv[61] = 22'h0xx000;
      expv[62] = 22'h0xx000;
      expv[63] = 22'h0xx000;
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
