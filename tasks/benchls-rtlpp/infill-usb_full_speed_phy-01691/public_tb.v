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

  rtlpp_01691 dut (
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
    stim[0] = 15'h4482;
    stim[1] = 15'h791a;
    stim[2] = 15'h314a;
    stim[3] = 15'h2573;
    stim[4] = 15'h00a0;
    stim[5] = 15'h522e;
    stim[6] = 15'h1e76;
    stim[7] = 15'h1140;
    stim[8] = 15'h0b7c;
    stim[9] = 15'h16ab;
    stim[10] = 15'h1fa5;
    stim[11] = 15'h3eb6;
    stim[12] = 15'h36de;
    stim[13] = 15'h3302;
    stim[14] = 15'h1e0c;
    stim[15] = 15'h0343;
    stim[16] = 15'h01c1;
    stim[17] = 15'h0c26;
    stim[18] = 15'h32eb;
    stim[19] = 15'h2f46;
    stim[20] = 15'h2308;
    stim[21] = 15'h37a7;
    stim[22] = 15'h2026;
    stim[23] = 15'h3ceb;
    stim[24] = 15'h2183;
    stim[25] = 15'h1458;
    stim[26] = 15'h1d6e;
    stim[27] = 15'h26bf;
    stim[28] = 15'h374a;
    stim[29] = 15'h0035;
    stim[30] = 15'h0bd5;
    stim[31] = 15'h2a9b;
    stim[32] = 15'h303f;
    stim[33] = 15'h307c;
    stim[34] = 15'h0aa0;
    stim[35] = 15'h18d8;
    stim[36] = 15'h6a0a;
    stim[37] = 15'h2c84;
    stim[38] = 15'h3690;
    stim[39] = 15'h5185;
    stim[40] = 15'h3c2d;
    stim[41] = 15'h2f66;
    stim[42] = 15'h3025;
    stim[43] = 15'h2d09;
    stim[44] = 15'h0c32;
    stim[45] = 15'h2d72;
    stim[46] = 15'h2121;
    stim[47] = 15'h2062;
    stim[48] = 15'h049a;
    stim[49] = 15'h1494;
    stim[50] = 15'h3279;
    stim[51] = 15'h235f;
    stim[52] = 15'h1609;
    stim[53] = 15'h108c;
    stim[54] = 15'h5663;
    stim[55] = 15'h2453;
    stim[56] = 15'h1523;
    stim[57] = 15'h1300;
    stim[58] = 15'h10cb;
    stim[59] = 15'h0509;
    stim[60] = 15'h69f8;
    stim[61] = 15'h3ebb;
    stim[62] = 15'h182a;
    stim[63] = 15'h3475;
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
      expv[0] = 22'hxxx001;
      expv[1] = 22'hxxx002;
      expv[2] = 22'hxxx000;
      expv[3] = 22'h0xx001;
      expv[4] = 22'hxxx000;
      expv[5] = 22'hxxx000;
      expv[6] = 22'hxxx003;
      expv[7] = 22'hxxx000;
      expv[8] = 22'hxxx002;
      expv[9] = 22'hxxx001;
      expv[10] = 22'hxxx003;
      expv[11] = 22'hxxx003;
      expv[12] = 22'hxxx001;
      expv[13] = 22'hxxx000;
      expv[14] = 22'hxxx003;
      expv[15] = 22'hxxx000;
      expv[16] = 22'hxxx000;
      expv[17] = 22'hxxx003;
      expv[18] = 22'h0xx000;
      expv[19] = 22'hxxx003;
      expv[20] = 22'hxxx000;
      expv[21] = 22'h1xx001;
      expv[22] = 22'hxxx000;
      expv[23] = 22'h1xx003;
      expv[24] = 22'h1xx000;
      expv[25] = 22'hxxx001;
      expv[26] = 22'hxxx003;
      expv[27] = 22'h1xx001;
      expv[28] = 22'hxxx001;
      expv[29] = 22'hxxx000;
      expv[30] = 22'hxxx002;
      expv[31] = 22'h0xx002;
      expv[32] = 22'h1xx000;
      expv[33] = 22'hxxx000;
      expv[34] = 22'hxxx002;
      expv[35] = 22'hxxx002;
      expv[36] = 22'hxxx002;
      expv[37] = 22'hxxx003;
      expv[38] = 22'hxxx001;
      expv[39] = 22'hxxx000;
      expv[40] = 22'h0xx003;
      expv[41] = 22'hxxx003;
      expv[42] = 22'h0xx000;
      expv[43] = 22'h0xx003;
      expv[44] = 22'hxxx003;
      expv[45] = 22'hxxx003;
      expv[46] = 22'h0xx000;
      expv[47] = 22'hxxx000;
      expv[48] = 22'hxxx001;
      expv[49] = 22'hxxx001;
      expv[50] = 22'h0xx000;
      expv[51] = 22'h0xx000;
      expv[52] = 22'hxxx001;
      expv[53] = 22'hxxx000;
      expv[54] = 22'hxxx001;
      expv[55] = 22'h0xx001;
      expv[56] = 22'hxxx001;
      expv[57] = 22'hxxx000;
      expv[58] = 22'hxxx000;
      expv[59] = 22'hxxx001;
      expv[60] = 22'hxxx002;
      expv[61] = 22'h0xx003;
      expv[62] = 22'hxxx002;
      expv[63] = 22'h1xx001;
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
