// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135309 dut (
    .cal_blk_clk(in_vec[22:22]),
    .gxb_powerdown(in_vec[21:21]),
    .pipe8b10binvpolarity(in_vec[20:20]),
    .pll_inclk(in_vec[19:19]),
    .powerdn(in_vec[18:17]),
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
    stim[0] = 23'h734c53;
    stim[1] = 23'h2106f9;
    stim[2] = 23'h0c01f3;
    stim[3] = 23'h60e536;
    stim[4] = 23'h46259d;
    stim[5] = 23'h14b9bb;
    stim[6] = 23'h3cef6d;
    stim[7] = 23'h34f0f9;
    stim[8] = 23'h423d3e;
    stim[9] = 23'h5ab033;
    stim[10] = 23'h1e988c;
    stim[11] = 23'h2a0de4;
    stim[12] = 23'h5063e9;
    stim[13] = 23'h766bf2;
    stim[14] = 23'h6326d1;
    stim[15] = 23'h22f39e;
    stim[16] = 23'h60d957;
    stim[17] = 23'h583a2c;
    stim[18] = 23'h2a4fbe;
    stim[19] = 23'h2c79b6;
    stim[20] = 23'h4873bd;
    stim[21] = 23'h7a77f8;
    stim[22] = 23'h58476b;
    stim[23] = 23'h38380c;
    stim[24] = 23'h6cf2db;
    stim[25] = 23'h50155b;
    stim[26] = 23'h5a8a71;
    stim[27] = 23'h324971;
    stim[28] = 23'h7298f7;
    stim[29] = 23'h488d36;
    stim[30] = 23'h5e735a;
    stim[31] = 23'h2a8896;
    stim[32] = 23'h609b51;
    stim[33] = 23'h426dca;
    stim[34] = 23'h42c1d3;
    stim[35] = 23'h48ded3;
    stim[36] = 23'h58ac5e;
    stim[37] = 23'h2e83e0;
    stim[38] = 23'h72e8be;
    stim[39] = 23'h4acb4a;
    stim[40] = 23'h2e40ac;
    stim[41] = 23'h34a39f;
    stim[42] = 23'h54c845;
    stim[43] = 23'h10aee0;
    stim[44] = 23'h1e3625;
    stim[45] = 23'h1e0b2b;
    stim[46] = 23'h747cb7;
    stim[47] = 23'h1286de;
    stim[48] = 23'h7a0f88;
    stim[49] = 23'h2626e9;
    stim[50] = 23'h4604cb;
    stim[51] = 23'h429955;
    stim[52] = 23'h1a832d;
    stim[53] = 23'h3af937;
    stim[54] = 23'h0c45f2;
    stim[55] = 23'h28825d;
    stim[56] = 23'h4c0321;
    stim[57] = 23'h30b20f;
    stim[58] = 23'h7d3ed5;
    stim[59] = 23'h3cbc10;
    stim[60] = 23'h52e89c;
    stim[61] = 23'h4a33fb;
    stim[62] = 23'h4c6fe8;
    stim[63] = 23'h5ca04a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h000000;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h000000;
      expv[7] = 22'h000000;
      expv[8] = 22'h000000;
      expv[9] = 22'h000000;
      expv[10] = 22'h000000;
      expv[11] = 22'h000000;
      expv[12] = 22'h000000;
      expv[13] = 22'h000000;
      expv[14] = 22'h000000;
      expv[15] = 22'h000000;
      expv[16] = 22'h000000;
      expv[17] = 22'h000000;
      expv[18] = 22'h000000;
      expv[19] = 22'h000000;
      expv[20] = 22'h000000;
      expv[21] = 22'h000000;
      expv[22] = 22'h000000;
      expv[23] = 22'h000000;
      expv[24] = 22'h000000;
      expv[25] = 22'h000000;
      expv[26] = 22'h000000;
      expv[27] = 22'h000000;
      expv[28] = 22'h000000;
      expv[29] = 22'h000000;
      expv[30] = 22'h000000;
      expv[31] = 22'h000000;
      expv[32] = 22'h000000;
      expv[33] = 22'h000000;
      expv[34] = 22'h000000;
      expv[35] = 22'h000000;
      expv[36] = 22'h000000;
      expv[37] = 22'h000000;
      expv[38] = 22'h000000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h000000;
      expv[42] = 22'h000000;
      expv[43] = 22'h000000;
      expv[44] = 22'h000000;
      expv[45] = 22'h000000;
      expv[46] = 22'h000000;
      expv[47] = 22'h000000;
      expv[48] = 22'h000000;
      expv[49] = 22'h000000;
      expv[50] = 22'h000000;
      expv[51] = 22'h000000;
      expv[52] = 22'h000000;
      expv[53] = 22'h000000;
      expv[54] = 22'h000000;
      expv[55] = 22'h000000;
      expv[56] = 22'h000000;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h000000;
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
