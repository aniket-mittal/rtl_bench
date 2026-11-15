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

  rtlpp_01689 dut (
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
    stim[0] = 15'h6fd2;
    stim[1] = 15'h70c8;
    stim[2] = 15'h2ecb;
    stim[3] = 15'h20e4;
    stim[4] = 15'h19d7;
    stim[5] = 15'h29fb;
    stim[6] = 15'h3815;
    stim[7] = 15'h247a;
    stim[8] = 15'h23fe;
    stim[9] = 15'h1ac9;
    stim[10] = 15'h369f;
    stim[11] = 15'h0785;
    stim[12] = 15'h1f9f;
    stim[13] = 15'h29da;
    stim[14] = 15'h2aa4;
    stim[15] = 15'h3e85;
    stim[16] = 15'h3bc1;
    stim[17] = 15'h1749;
    stim[18] = 15'h2854;
    stim[19] = 15'h2694;
    stim[20] = 15'h18dc;
    stim[21] = 15'h2a7b;
    stim[22] = 15'h4465;
    stim[23] = 15'h0c19;
    stim[24] = 15'h27d7;
    stim[25] = 15'h3d66;
    stim[26] = 15'h3958;
    stim[27] = 15'h2f4b;
    stim[28] = 15'h09c3;
    stim[29] = 15'h28a6;
    stim[30] = 15'h0bbf;
    stim[31] = 15'h1558;
    stim[32] = 15'h10d3;
    stim[33] = 15'h20e5;
    stim[34] = 15'h1f14;
    stim[35] = 15'h1f59;
    stim[36] = 15'h0212;
    stim[37] = 15'h1386;
    stim[38] = 15'h31c9;
    stim[39] = 15'h38b2;
    stim[40] = 15'h3953;
    stim[41] = 15'h3cd1;
    stim[42] = 15'h3f97;
    stim[43] = 15'h3963;
    stim[44] = 15'h1ed9;
    stim[45] = 15'h2028;
    stim[46] = 15'h3ed7;
    stim[47] = 15'h30ce;
    stim[48] = 15'h30b9;
    stim[49] = 15'h3b7b;
    stim[50] = 15'h3fdf;
    stim[51] = 15'h303b;
    stim[52] = 15'h1963;
    stim[53] = 15'h3978;
    stim[54] = 15'h01f5;
    stim[55] = 15'h2c05;
    stim[56] = 15'h2301;
    stim[57] = 15'h2b78;
    stim[58] = 15'h3261;
    stim[59] = 15'h310d;
    stim[60] = 15'h1bf6;
    stim[61] = 15'h3849;
    stim[62] = 15'h2746;
    stim[63] = 15'h039e;
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
      expv[1] = 22'h0xx000;
      expv[2] = 22'h0xx000;
      expv[3] = 22'h0xx000;
      expv[4] = 22'h0xx000;
      expv[5] = 22'h0xx000;
      expv[6] = 22'h0xx000;
      expv[7] = 22'h0xx000;
      expv[8] = 22'h0xx000;
      expv[9] = 22'h0xx000;
      expv[10] = 22'h0xx000;
      expv[11] = 22'h0xx000;
      expv[12] = 22'h0xx000;
      expv[13] = 22'h0xx000;
      expv[14] = 22'h0xx000;
      expv[15] = 22'h0xx000;
      expv[16] = 22'h0xx000;
      expv[17] = 22'h0xx000;
      expv[18] = 22'h0xx000;
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
      expv[36] = 22'h0xx000;
      expv[37] = 22'h0xx000;
      expv[38] = 22'h0xx000;
      expv[39] = 22'h0xx000;
      expv[40] = 22'h0xx000;
      expv[41] = 22'h0xx000;
      expv[42] = 22'h0xx000;
      expv[43] = 22'h0xx000;
      expv[44] = 22'h0xx000;
      expv[45] = 22'h0xx000;
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
