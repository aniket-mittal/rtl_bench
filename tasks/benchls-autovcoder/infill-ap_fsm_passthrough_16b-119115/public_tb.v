// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119115 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[18:18]),
    .ap_start(in_vec[17:17]),
    .ap_continue(in_vec[16:16]),
    .tmp(in_vec[15:0]),
    .ap_done(out_vec[18:18]),
    .ap_idle(out_vec[17:17]),
    .ap_ready(out_vec[16:16]),
    .ap_return(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h5b710;
    stim[1] = 19'h77c7d;
    stim[2] = 19'h30993;
    stim[3] = 19'h026a4;
    stim[4] = 19'h3d6c1;
    stim[5] = 19'h2cd93;
    stim[6] = 19'h021b6;
    stim[7] = 19'h11ca9;
    stim[8] = 19'h2c0df;
    stim[9] = 19'h23a32;
    stim[10] = 19'h2b2e1;
    stim[11] = 19'h02acb;
    stim[12] = 19'h103e8;
    stim[13] = 19'h16620;
    stim[14] = 19'h0ab2c;
    stim[15] = 19'h149e4;
    stim[16] = 19'h3ca07;
    stim[17] = 19'h09860;
    stim[18] = 19'h32579;
    stim[19] = 19'h7975b;
    stim[20] = 19'h3c8ee;
    stim[21] = 19'h13d92;
    stim[22] = 19'h3e1c6;
    stim[23] = 19'h0240d;
    stim[24] = 19'h1a605;
    stim[25] = 19'h2189b;
    stim[26] = 19'h096eb;
    stim[27] = 19'h038a8;
    stim[28] = 19'h00b9d;
    stim[29] = 19'h0f741;
    stim[30] = 19'h2dc14;
    stim[31] = 19'h27e79;
    stim[32] = 19'h120d2;
    stim[33] = 19'h218df;
    stim[34] = 19'h0f32f;
    stim[35] = 19'h270de;
    stim[36] = 19'h1765f;
    stim[37] = 19'h14088;
    stim[38] = 19'h05197;
    stim[39] = 19'h2c58d;
    stim[40] = 19'h2c27a;
    stim[41] = 19'h20ae7;
    stim[42] = 19'h38a21;
    stim[43] = 19'h19305;
    stim[44] = 19'h3fb45;
    stim[45] = 19'h08b95;
    stim[46] = 19'h2e86c;
    stim[47] = 19'h1dc74;
    stim[48] = 19'h13b9a;
    stim[49] = 19'h29729;
    stim[50] = 19'h2e832;
    stim[51] = 19'h3c36c;
    stim[52] = 19'h01687;
    stim[53] = 19'h0e960;
    stim[54] = 19'h3e967;
    stim[55] = 19'h1ed0c;
    stim[56] = 19'h0b99e;
    stim[57] = 19'h1aa85;
    stim[58] = 19'h378b7;
    stim[59] = 19'h2609f;
    stim[60] = 19'h0573f;
    stim[61] = 19'h0c198;
    stim[62] = 19'h16d18;
    stim[63] = 19'h280b5;
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
      expv[0] = 19'h20000;
      expv[1] = 19'h57c7d;
      expv[2] = 19'h50993;
      expv[3] = 19'h20993;
      expv[4] = 19'h5d6c1;
      expv[5] = 19'h5cd93;
      expv[6] = 19'h6cd93;
      expv[7] = 19'h6cd93;
      expv[8] = 19'h5c0df;
      expv[9] = 19'h4c0df;
      expv[10] = 19'h4c0df;
      expv[11] = 19'h6c0df;
      expv[12] = 19'h6c0df;
      expv[13] = 19'h2c0df;
      expv[14] = 19'h2c0df;
      expv[15] = 19'h2c0df;
      expv[16] = 19'h5ca07;
      expv[17] = 19'h2ca07;
      expv[18] = 19'h52579;
      expv[19] = 19'h5975b;
      expv[20] = 19'h5c8ee;
      expv[21] = 19'h2c8ee;
      expv[22] = 19'h5e1c6;
      expv[23] = 19'h2e1c6;
      expv[24] = 19'h2e1c6;
      expv[25] = 19'h5189b;
      expv[26] = 19'h6189b;
      expv[27] = 19'h6189b;
      expv[28] = 19'h6189b;
      expv[29] = 19'h6189b;
      expv[30] = 19'h4189b;
      expv[31] = 19'h4189b;
      expv[32] = 19'h6189b;
      expv[33] = 19'h518df;
      expv[34] = 19'h618df;
      expv[35] = 19'h418df;
      expv[36] = 19'h618df;
      expv[37] = 19'h218df;
      expv[38] = 19'h218df;
      expv[39] = 19'h5c58d;
      expv[40] = 19'h4c58d;
      expv[41] = 19'h4c58d;
      expv[42] = 19'h4c58d;
      expv[43] = 19'h2c58d;
      expv[44] = 19'h5fb45;
      expv[45] = 19'h2fb45;
      expv[46] = 19'h5e86c;
      expv[47] = 19'h6e86c;
      expv[48] = 19'h2e86c;
      expv[49] = 19'h59729;
      expv[50] = 19'h49729;
      expv[51] = 19'h49729;
      expv[52] = 19'h29729;
      expv[53] = 19'h29729;
      expv[54] = 19'h5e967;
      expv[55] = 19'h2e967;
      expv[56] = 19'h2e967;
      expv[57] = 19'h2e967;
      expv[58] = 19'h578b7;
      expv[59] = 19'h5609f;
      expv[60] = 19'h6609f;
      expv[61] = 19'h6609f;
      expv[62] = 19'h6609f;
      expv[63] = 19'h580b5;
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
