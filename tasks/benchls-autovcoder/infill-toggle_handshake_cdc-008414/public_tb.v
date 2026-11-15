// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_008414 dut (
    .clka(clk),
    .rst_n(in_vec[39:39]),
    .wvalida(in_vec[38:38]),
    .waddra(in_vec[37:34]),
    .wdataa(in_vec[33:2]),
    .clkb(in_vec[1:1]),
    .wreadyb(in_vec[0:0]),
    .wreadya(out_vec[37:37]),
    .wvalidb(out_vec[36:36]),
    .waddrb(out_vec[35:32]),
    .wdatab(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h1fcba76d53;
    stim[1] = 40'h653fa2bc1c;
    stim[2] = 40'h9f75dc43f4;
    stim[3] = 40'hb454e6360c;
    stim[4] = 40'h8ee84ca8f6;
    stim[5] = 40'hf7aa944cb9;
    stim[6] = 40'hac77fab9a6;
    stim[7] = 40'h900cda8348;
    stim[8] = 40'hee5fa17804;
    stim[9] = 40'ha09cbdca1d;
    stim[10] = 40'hd59e5a0630;
    stim[11] = 40'hc9c63d8f95;
    stim[12] = 40'hbc559a47b2;
    stim[13] = 40'hf02521c73f;
    stim[14] = 40'haca02e4eda;
    stim[15] = 40'h8aa3cff8c3;
    stim[16] = 40'hfeb08821d9;
    stim[17] = 40'hcf1f3e5769;
    stim[18] = 40'hc662f5e110;
    stim[19] = 40'hbb547df29f;
    stim[20] = 40'hcd88730c22;
    stim[21] = 40'h9cb37e8146;
    stim[22] = 40'hf75171b504;
    stim[23] = 40'h9d4fab4ed9;
    stim[24] = 40'he06fbaa2b2;
    stim[25] = 40'hd20d5b7a60;
    stim[26] = 40'hd0b037e16c;
    stim[27] = 40'he81da53b7a;
    stim[28] = 40'h9ab1a8ae02;
    stim[29] = 40'hce5fbfcc54;
    stim[30] = 40'hb2aa5ba8dc;
    stim[31] = 40'hcd1599be65;
    stim[32] = 40'heb2fe992da;
    stim[33] = 40'hee1189e717;
    stim[34] = 40'h93165acc63;
    stim[35] = 40'hed18429814;
    stim[36] = 40'h9ba9f7804b;
    stim[37] = 40'ha264e0c3a2;
    stim[38] = 40'hd0d62ccee8;
    stim[39] = 40'hf163337b5f;
    stim[40] = 40'h8bd5a5591b;
    stim[41] = 40'he4a793eb87;
    stim[42] = 40'h865f0d08a0;
    stim[43] = 40'hf884a08ba8;
    stim[44] = 40'h433bd11179;
    stim[45] = 40'hb33cd3d629;
    stim[46] = 40'hd4f46180cd;
    stim[47] = 40'h8f3b9012ff;
    stim[48] = 40'h88952bcf40;
    stim[49] = 40'he6e55856e3;
    stim[50] = 40'hde6cf40749;
    stim[51] = 40'hd745afecde;
    stim[52] = 40'he09d3e8efe;
    stim[53] = 40'h997ec42a76;
    stim[54] = 40'ha43ff89edd;
    stim[55] = 40'hcbb8053920;
    stim[56] = 40'hc0faa89bd4;
    stim[57] = 40'hc2d7545afd;
    stim[58] = 40'hb938494557;
    stim[59] = 40'hb33de4068e;
    stim[60] = 40'hb847e5be49;
    stim[61] = 40'h9917e4d8f6;
    stim[62] = 40'hd44e590d44;
    stim[63] = 40'h98d02224a9;
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
      expv[0] = 38'h2xxxxxxxxx;
      expv[1] = 38'h2xxxxxxxxx;
      expv[2] = 38'h2xxxxxxxxx;
      expv[3] = 38'h2xxxxxxxxx;
      expv[4] = 38'h2xxxxxxxxx;
      expv[5] = 38'h2xxxxxxxxx;
      expv[6] = 38'h0deaa5132e;
      expv[7] = 38'h0deaa5132e;
      expv[8] = 38'h0deaa5132e;
      expv[9] = 38'h0deaa5132e;
      expv[10] = 38'h0deaa5132e;
      expv[11] = 38'h0deaa5132e;
      expv[12] = 38'h1deaa5132e;
      expv[13] = 38'h1deaa5132e;
      expv[14] = 38'h1deaa5132e;
      expv[15] = 38'h1deaa5132e;
      expv[16] = 38'h1deaa5132e;
      expv[17] = 38'h1deaa5132e;
      expv[18] = 38'h1deaa5132e;
      expv[19] = 38'h0deaa5132e;
      expv[20] = 38'h0deaa5132e;
      expv[21] = 38'h2deaa5132e;
      expv[22] = 38'h2deaa5132e;
      expv[23] = 38'h0dd45c6d41;
      expv[24] = 38'h0dd45c6d41;
      expv[25] = 38'h0dd45c6d41;
      expv[26] = 38'h0dd45c6d41;
      expv[27] = 38'h1dd45c6d41;
      expv[28] = 38'h1dd45c6d41;
      expv[29] = 38'h1dd45c6d41;
      expv[30] = 38'h1dd45c6d41;
      expv[31] = 38'h1dd45c6d41;
      expv[32] = 38'h1dd45c6d41;
      expv[33] = 38'h1dd45c6d41;
      expv[34] = 38'h1dd45c6d41;
      expv[35] = 38'h1dd45c6d41;
      expv[36] = 38'h0dd45c6d41;
      expv[37] = 38'h0dd45c6d41;
      expv[38] = 38'h2dd45c6d41;
      expv[39] = 38'h04358b33ba;
      expv[40] = 38'h04358b33ba;
      expv[41] = 38'h04358b33ba;
      expv[42] = 38'h04358b33ba;
      expv[43] = 38'h04358b33ba;
      expv[44] = 38'h24358b33ba;
      expv[45] = 38'h24358b33ba;
      expv[46] = 38'h24358b33ba;
      expv[47] = 38'h053d186033;
      expv[48] = 38'h053d186033;
      expv[49] = 38'h153d186033;
      expv[50] = 38'h153d186033;
      expv[51] = 38'h153d186033;
      expv[52] = 38'h153d186033;
      expv[53] = 38'h153d186033;
      expv[54] = 38'h153d186033;
      expv[55] = 38'h153d186033;
      expv[56] = 38'h153d186033;
      expv[57] = 38'h153d186033;
      expv[58] = 38'h053d186033;
      expv[59] = 38'h053d186033;
      expv[60] = 38'h253d186033;
      expv[61] = 38'h253d186033;
      expv[62] = 38'h253d186033;
      expv[63] = 38'h0513964351;
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
