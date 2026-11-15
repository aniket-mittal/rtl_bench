// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_090848 dut (
    .CLK(clk),
    .RESET(in_vec[68:68]),
    .PUSH(in_vec[67:67]),
    .POP(in_vec[66:66]),
    .SAVE_RD_ADDR(in_vec[65:65]),
    .RESTORE_RD_ADDR(in_vec[64:64]),
    .DATA_IN(in_vec[63:0]),
    .DATA_OUT(out_vec[74:11]),
    .EMPTY(out_vec[10:10]),
    .FULL(out_vec[9:9]),
    .FIFO_COUNT(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h1ea8afb6932c29508b;
    stim[1] = 69'h10a523dd20370ee90b;
    stim[2] = 69'h05e66181657c1c149b;
    stim[3] = 69'h06dead9979610cf00a;
    stim[4] = 69'h07ee2add869904eeac;
    stim[5] = 69'h01ddce155944fc830c;
    stim[6] = 69'h0998e5b581e8bf25ab;
    stim[7] = 69'h127ee3dd9c1406e731;
    stim[8] = 69'h0632095fd07a70f682;
    stim[9] = 69'h07274fc530f954da2d;
    stim[10] = 69'h0a7cd4186e8231b972;
    stim[11] = 69'h0836f96c99353da594;
    stim[12] = 69'h1b5a57397b6637d93d;
    stim[13] = 69'h04fc87b5ec747bcec1;
    stim[14] = 69'h090e9105ed590e7cde;
    stim[15] = 69'h0bab1b146640af6057;
    stim[16] = 69'h0c9994c81d4f2c0e32;
    stim[17] = 69'h0fad595e6894102ee2;
    stim[18] = 69'h002fc083f950bcbd34;
    stim[19] = 69'h0c1e1c328d5de73735;
    stim[20] = 69'h030f5a164d0176cdd5;
    stim[21] = 69'h002a92794e610e9eba;
    stim[22] = 69'h0510f877dd91cad97d;
    stim[23] = 69'h09d15c34087f28bf49;
    stim[24] = 69'h0ca4c364be17aded04;
    stim[25] = 69'h0c057076f7ea9b5dc8;
    stim[26] = 69'h04fa8e5c69504e0c27;
    stim[27] = 69'h0512106f2cea4a763b;
    stim[28] = 69'h0426efb146b2e91e6e;
    stim[29] = 69'h0a8486e792f0d58abd;
    stim[30] = 69'h08394f145ffd900577;
    stim[31] = 69'h0877a1f69db7f26f8e;
    stim[32] = 69'h04c68a1cf4d624f1ae;
    stim[33] = 69'h0e601c9667f1089e0b;
    stim[34] = 69'h0c89ee624c89039b85;
    stim[35] = 69'h097ce3ff6178e96978;
    stim[36] = 69'h080adf43e9fc578e8e;
    stim[37] = 69'h019e89364e5f0d9c0b;
    stim[38] = 69'h091858178a8f615d06;
    stim[39] = 69'h0ec6f76568ec56d9a1;
    stim[40] = 69'h04e82f82a720635c2f;
    stim[41] = 69'h0e6cc59259d02ee3ab;
    stim[42] = 69'h0d54afe790ad404847;
    stim[43] = 69'h0acf3a95fa4af287c8;
    stim[44] = 69'h0fa75084faa76d5823;
    stim[45] = 69'h00a3eff543b72d69ba;
    stim[46] = 69'h0e1db2ed224cb37df2;
    stim[47] = 69'h0aa614b89168de7abd;
    stim[48] = 69'h0881be7db5fa554f4e;
    stim[49] = 69'h0042cd03e83ae047d6;
    stim[50] = 69'h041b3810a78ca67975;
    stim[51] = 69'h018125a6313535218a;
    stim[52] = 69'h07f2f5abe0430fe17c;
    stim[53] = 69'h04461f9fb5def5fe96;
    stim[54] = 69'h02d9449a7455a670f1;
    stim[55] = 69'h09e08ff04d652d711a;
    stim[56] = 69'h0f0ce5728b1c0e4689;
    stim[57] = 69'h0699748339bf9b8fb4;
    stim[58] = 69'h0ee2877afe6f947d3a;
    stim[59] = 69'h009b78f8eaba1f1648;
    stim[60] = 69'h014b8647c9963ac61f;
    stim[61] = 69'h0960a3defd676fc479;
    stim[62] = 69'h031ce705b15b0b4068;
    stim[63] = 69'h09381a63a64539ae1e;
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
      expv[0] = 75'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[2] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[3] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[4] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[5] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[6] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[7] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[8] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[9] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[10] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[11] = 75'hxxxxxxxxxxxxxxxxx01;
      expv[12] = 75'hxxxxxxxxxxxxxxxxx02;
      expv[13] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[14] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[15] = 75'hxxxxxxxxxxxxxxxxx00;
      expv[16] = 75'hxxxxxxxxxxxxxxxxx01;
      expv[17] = 75'h074882f6ac873e6f001;
      expv[18] = 75'h558d8a332057b02b802;
      expv[19] = 75'h558d8a332057b02b802;
      expv[20] = 75'h074882f6ac873e6f002;
      expv[21] = 75'h074882f6ac873e6f003;
      expv[22] = 75'h074882f6ac873e6f003;
      expv[23] = 75'h558d8a332057b02b802;
      expv[24] = 75'h558d8a332057b02b802;
      expv[25] = 75'h558d8a332057b02b802;
      expv[26] = 75'h4cca640ea7960719002;
      expv[27] = 75'h56acaf344a081771001;
      expv[28] = 75'h0f0e1946aef39b9a805;
      expv[29] = 75'h558d8a332057b02b804;
      expv[30] = 75'h558d8a332057b02b805;
      expv[31] = 75'h558d8a332057b02b806;
      expv[32] = 75'h558d8a332057b02b807;
      expv[33] = 75'h4cca640ea7960719006;
      expv[34] = 75'h56acaf344a081771006;
      expv[35] = 75'h0f0e1946aef39b9a806;
      expv[36] = 75'h0f0e1946aef39b9a808;
      expv[37] = 75'h0f0e1946aef39b9a809;
      expv[38] = 75'h0f0e1946aef39b9a80a;
      expv[39] = 75'h0f0e1946aef39b9a80a;
      expv[40] = 75'h56acaf344a08177100a;
      expv[41] = 75'h0f0e1946aef39b9a809;
      expv[42] = 75'h68ae1a043f945fa4809;
      expv[43] = 75'h5261b25f0bd6f68200a;
      expv[44] = 75'h5261b25f0bd6f68200b;
      expv[45] = 75'h68ae1a043f945fa480b;
      expv[46] = 75'h68ae1a043f945fa480b;
      expv[47] = 75'h68ae1a043f945fa480b;
      expv[48] = 75'h68ae1a043f945fa480c;
      expv[49] = 75'h68ae1a043f945fa480d;
      expv[50] = 75'h68ae1a043f945fa480d;
      expv[51] = 75'h5261b25f0bd6f68200c;
      expv[52] = 75'h5261b25f0bd6f68200d;
      expv[53] = 75'h5261b25f0bd6f68200d;
      expv[54] = 75'h5261b25f0bd6f68200c;
      expv[55] = 75'h5261b25f0bd6f68200c;
      expv[56] = 75'h5261b25f0bd6f68200c;
      expv[57] = 75'h02b83b7bf54daee400d;
      expv[58] = 75'h02b83b7bf54daee400c;
      expv[59] = 75'h424373c9786ac55e80c;
      expv[60] = 75'h424373c9786ac55e80c;
      expv[61] = 75'h424373c9786ac55e80d;
      expv[62] = 75'h424373c9786ac55e80d;
      expv[63] = 75'h424373c9786ac55e80e;
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
