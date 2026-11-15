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
    stim[0] = 21'h0b56be;
    stim[1] = 21'h09f486;
    stim[2] = 21'h08c5d1;
    stim[3] = 21'h02c239;
    stim[4] = 21'h022579;
    stim[5] = 21'h1a4e10;
    stim[6] = 21'h16429e;
    stim[7] = 21'h0eacd1;
    stim[8] = 21'h14260c;
    stim[9] = 21'h04bcec;
    stim[10] = 21'h06a343;
    stim[11] = 21'h1a632d;
    stim[12] = 21'h126c91;
    stim[13] = 21'h0a26c6;
    stim[14] = 21'h161168;
    stim[15] = 21'h047af0;
    stim[16] = 21'h066428;
    stim[17] = 21'h1c0337;
    stim[18] = 21'h00f075;
    stim[19] = 21'h182bd9;
    stim[20] = 21'h1ce0ca;
    stim[21] = 21'h06a039;
    stim[22] = 21'h1e17f6;
    stim[23] = 21'h187a84;
    stim[24] = 21'h1a07a1;
    stim[25] = 21'h0e4cc8;
    stim[26] = 21'h1e8f92;
    stim[27] = 21'h1e5a4d;
    stim[28] = 21'h08ca55;
    stim[29] = 21'h1a1e84;
    stim[30] = 21'h0200b1;
    stim[31] = 21'h1c4b45;
    stim[32] = 21'h04d66d;
    stim[33] = 21'h143e85;
    stim[34] = 21'h0ea6ab;
    stim[35] = 21'h1b85a4;
    stim[36] = 21'h021b6f;
    stim[37] = 21'h08c435;
    stim[38] = 21'h02cb38;
    stim[39] = 21'h10ce0b;
    stim[40] = 21'h1019a8;
    stim[41] = 21'h1d5c41;
    stim[42] = 21'h1e5cba;
    stim[43] = 21'h10160d;
    stim[44] = 21'h14246f;
    stim[45] = 21'h186cd9;
    stim[46] = 21'h14a350;
    stim[47] = 21'h142eff;
    stim[48] = 21'h0211ae;
    stim[49] = 21'h16e843;
    stim[50] = 21'h0887ab;
    stim[51] = 21'h02ac2b;
    stim[52] = 21'h14d42f;
    stim[53] = 21'h1cbb59;
    stim[54] = 21'h1cc301;
    stim[55] = 21'h1c6a5f;
    stim[56] = 21'h027d93;
    stim[57] = 21'h02ad97;
    stim[58] = 21'h067b0e;
    stim[59] = 21'h1c921f;
    stim[60] = 21'h14c7e1;
    stim[61] = 21'h069a0a;
    stim[62] = 21'h16bfb1;
    stim[63] = 21'h067ac5;
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
      expv[2] = 22'h1xxxxx;
      expv[3] = 22'h1xxxxx;
      expv[4] = 22'h1xxxxx;
      expv[5] = 22'h2xxxxx;
      expv[6] = 22'h2xxxxx;
      expv[7] = 22'h198028;
      expv[8] = 22'h298028;
      expv[9] = 22'h298028;
      expv[10] = 22'h198028;
      expv[11] = 22'h19802a;
      expv[12] = 22'h19802a;
      expv[13] = 22'h298028;
      expv[14] = 22'h298028;
      expv[15] = 22'h29802a;
      expv[16] = 22'h29802a;
      expv[17] = 22'h198028;
      expv[18] = 22'h198028;
      expv[19] = 22'h198028;
      expv[20] = 22'h298028;
      expv[21] = 22'h19802a;
      expv[22] = 22'h29802a;
      expv[23] = 22'h298028;
      expv[24] = 22'h198028;
      expv[25] = 22'h29802a;
      expv[26] = 22'h29b02a;
      expv[27] = 22'h19b028;
      expv[28] = 22'h19b028;
      expv[29] = 22'h29b028;
      expv[30] = 22'h19b028;
      expv[31] = 22'h19b02a;
      expv[32] = 22'h19ec2a;
      expv[33] = 22'h19ec28;
      expv[34] = 22'h19ec28;
      expv[35] = 22'h29ec2a;
      expv[36] = 22'h19ec2a;
      expv[37] = 22'h1bdb2c;
      expv[38] = 22'h2bdb2c;
      expv[39] = 22'h1bdb2e;
      expv[40] = 22'h2bdb2e;
      expv[41] = 22'h1bdb2c;
      expv[42] = 22'h2bdb2c;
      expv[43] = 22'h1bdb2e;
      expv[44] = 22'h1bdb2e;
      expv[45] = 22'h1bdb2c;
      expv[46] = 22'h2bdb2c;
      expv[47] = 22'h1bdb2e;
      expv[48] = 22'h2bdb2e;
      expv[49] = 22'h198028;
      expv[50] = 22'h198028;
      expv[51] = 22'h19802a;
      expv[52] = 22'h19802a;
      expv[53] = 22'h198028;
      expv[54] = 22'h198028;
      expv[55] = 22'h19802a;
      expv[56] = 22'h19802a;
      expv[57] = 22'h198028;
      expv[58] = 22'h298028;
      expv[59] = 22'h1b95ac;
      expv[60] = 22'h1b95ac;
      expv[61] = 22'h2b95ae;
      expv[62] = 22'h1b95ae;
      expv[63] = 22'h1b95ac;
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
