// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147672 dut (
    .pll_inclk(clk),
    .cal_blk_clk(in_vec[20:20]),
    .gxb_powerdown(in_vec[19:19]),
    .pipe8b10binvpolarity(in_vec[18:18]),
    .powerdn(in_vec[17:17]),
    .rx_analogreset(in_vec[16:16]),
    .rx_cruclk(in_vec[15:15]),
    .rx_datain(in_vec[14:14]),
    .rx_digitalreset(in_vec[13:13]),
    .tx_ctrlenable(in_vec[12:12]),
    .tx_datain(in_vec[11:4]),
    .tx_detectrxloop(in_vec[3:3]),
    .tx_digitalreset(in_vec[2:2]),
    .tx_forcedispcompliance(in_vec[1:1]),
    .tx_forceelecidle(in_vec[0:0]),
    .pipedatavalid(out_vec[21:21]),
    .pipeelecidle(out_vec[20:20]),
    .pipephydonestatus(out_vec[19:19]),
    .pipestatus(out_vec[18:16]),
    .pll_locked(out_vec[15:15]),
    .rx_ctrldetect(out_vec[14:14]),
    .rx_dataout(out_vec[13:6]),
    .rx_freqlocked(out_vec[5:5]),
    .rx_patterndetect(out_vec[4:4]),
    .rx_pll_locked(out_vec[3:3]),
    .rx_syncstatus(out_vec[2:2]),
    .tx_clkout(out_vec[1:1]),
    .tx_dataout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0128ac;
    stim[1] = 21'h1f3a24;
    stim[2] = 21'h18955c;
    stim[3] = 21'h007f28;
    stim[4] = 21'h02d575;
    stim[5] = 21'h087cde;
    stim[6] = 21'h1800e5;
    stim[7] = 21'h0a1a6d;
    stim[8] = 21'h18de7d;
    stim[9] = 21'h0e8c65;
    stim[10] = 21'h083b4a;
    stim[11] = 21'h1274da;
    stim[12] = 21'h0cd9a7;
    stim[13] = 21'h0e6503;
    stim[14] = 21'h02fdd6;
    stim[15] = 21'h129ffc;
    stim[16] = 21'h16ceb4;
    stim[17] = 21'h107a73;
    stim[18] = 21'h06cc48;
    stim[19] = 21'h164736;
    stim[20] = 21'h183c1f;
    stim[21] = 21'h0ac8dc;
    stim[22] = 21'h08ab94;
    stim[23] = 21'h146599;
    stim[24] = 21'h0a5d91;
    stim[25] = 21'h08f2bf;
    stim[26] = 21'h145f5e;
    stim[27] = 21'h0e70dd;
    stim[28] = 21'h180cc8;
    stim[29] = 21'h08793a;
    stim[30] = 21'h003a4f;
    stim[31] = 21'h1cd8dc;
    stim[32] = 21'h16186f;
    stim[33] = 21'h1981e2;
    stim[34] = 21'h1837ad;
    stim[35] = 21'h02f9ba;
    stim[36] = 21'h02fd8f;
    stim[37] = 21'h06306c;
    stim[38] = 21'h04c1ce;
    stim[39] = 21'h18772f;
    stim[40] = 21'h0c5c9d;
    stim[41] = 21'h1c4ed8;
    stim[42] = 21'h0a781e;
    stim[43] = 21'h14d81d;
    stim[44] = 21'h082f96;
    stim[45] = 21'h08741c;
    stim[46] = 21'h10519e;
    stim[47] = 21'h1c1fa5;
    stim[48] = 21'h0ec095;
    stim[49] = 21'h0cdc73;
    stim[50] = 21'h04f509;
    stim[51] = 21'h186960;
    stim[52] = 21'h1ed4a2;
    stim[53] = 21'h127492;
    stim[54] = 21'h0ca9b4;
    stim[55] = 21'h1cb71d;
    stim[56] = 21'h16ff17;
    stim[57] = 21'h17bbf5;
    stim[58] = 21'h1297ee;
    stim[59] = 21'h1ad006;
    stim[60] = 21'h1412cd;
    stim[61] = 21'h101f4d;
    stim[62] = 21'h0841e1;
    stim[63] = 21'h0405c7;
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
      expv[0] = 22'h2xxxxx;
      expv[1] = 22'h2xxxxx;
      expv[2] = 22'h2xxxxx;
      expv[3] = 22'h2xxxxx;
      expv[4] = 22'h1xxxxx;
      expv[5] = 22'h2xxxxx;
      expv[6] = 22'h1xxxxx;
      expv[7] = 22'h1xxxxx;
      expv[8] = 22'h1xxxxx;
      expv[9] = 22'h1xxxxx;
      expv[10] = 22'h2xxxxx;
      expv[11] = 22'h2xxxxx;
      expv[12] = 22'h1xxxxx;
      expv[13] = 22'h1xxxxx;
      expv[14] = 22'h2xxxxx;
      expv[15] = 22'h2xxxxx;
      expv[16] = 22'h2xxxxx;
      expv[17] = 22'h1xxxxx;
      expv[18] = 22'h2xxxxx;
      expv[19] = 22'h2xxxxx;
      expv[20] = 22'h1xxxxx;
      expv[21] = 22'h2xxxxx;
      expv[22] = 22'h2xxxxx;
      expv[23] = 22'h1xxxxx;
      expv[24] = 22'h1xxxxx;
      expv[25] = 22'h1xxxxx;
      expv[26] = 22'h2xxxxx;
      expv[27] = 22'h1xxxxx;
      expv[28] = 22'h2xxxxx;
      expv[29] = 22'h2xxxxx;
      expv[30] = 22'h1xxxxx;
      expv[31] = 22'h2xxxxx;
      expv[32] = 22'h1xxxxx;
      expv[33] = 22'h2xxxxx;
      expv[34] = 22'h1xxxxx;
      expv[35] = 22'h298028;
      expv[36] = 22'h198028;
      expv[37] = 22'h298028;
      expv[38] = 22'h298028;
      expv[39] = 22'h198028;
      expv[40] = 22'h198028;
      expv[41] = 22'h298028;
      expv[42] = 22'h298028;
      expv[43] = 22'h1bf02c;
      expv[44] = 22'h2bf02c;
      expv[45] = 22'h2bf02c;
      expv[46] = 22'h2bf02c;
      expv[47] = 22'h1bf02c;
      expv[48] = 22'h1bf02c;
      expv[49] = 22'h1bf02c;
      expv[50] = 22'h1bf02c;
      expv[51] = 22'h2bf02e;
      expv[52] = 22'h2bfc2e;
      expv[53] = 22'h2bfc2c;
      expv[54] = 22'h2bfc2c;
      expv[55] = 22'h1bfc2c;
      expv[56] = 22'h1bfc2c;
      expv[57] = 22'h1bfc2c;
      expv[58] = 22'h2bfc2c;
      expv[59] = 22'h2bfc2c;
      expv[60] = 22'h1bfc2c;
      expv[61] = 22'h1bfc2c;
      expv[62] = 22'h1bfc2c;
      expv[63] = 22'h1bfc2e;
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
