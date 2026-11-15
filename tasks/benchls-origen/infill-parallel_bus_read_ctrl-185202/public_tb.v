// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185202 dut (
    .clk(clk),
    .rst(in_vec[1:1]),
    .enable_leer(in_vec[0:0]),
    .CS_l(out_vec[10:10]),
    .RD_l(out_vec[9:9]),
    .WR_l(out_vec[8:8]),
    .A_D_l(out_vec[7:7]),
    .cont_lectura(out_vec[6:1]),
    .en_tri(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h2;
    stim[2] = 2'h1;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h1;
    stim[6] = 2'h0;
    stim[7] = 2'h1;
    stim[8] = 2'h0;
    stim[9] = 2'h0;
    stim[10] = 2'h0;
    stim[11] = 2'h1;
    stim[12] = 2'h0;
    stim[13] = 2'h0;
    stim[14] = 2'h1;
    stim[15] = 2'h0;
    stim[16] = 2'h3;
    stim[17] = 2'h1;
    stim[18] = 2'h0;
    stim[19] = 2'h0;
    stim[20] = 2'h1;
    stim[21] = 2'h1;
    stim[22] = 2'h0;
    stim[23] = 2'h3;
    stim[24] = 2'h0;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h1;
    stim[28] = 2'h0;
    stim[29] = 2'h1;
    stim[30] = 2'h1;
    stim[31] = 2'h0;
    stim[32] = 2'h1;
    stim[33] = 2'h1;
    stim[34] = 2'h1;
    stim[35] = 2'h0;
    stim[36] = 2'h0;
    stim[37] = 2'h2;
    stim[38] = 2'h0;
    stim[39] = 2'h0;
    stim[40] = 2'h0;
    stim[41] = 2'h1;
    stim[42] = 2'h1;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h1;
    stim[48] = 2'h0;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h0;
    stim[52] = 2'h1;
    stim[53] = 2'h0;
    stim[54] = 2'h0;
    stim[55] = 2'h1;
    stim[56] = 2'h0;
    stim[57] = 2'h1;
    stim[58] = 2'h0;
    stim[59] = 2'h0;
    stim[60] = 2'h0;
    stim[61] = 2'h1;
    stim[62] = 2'h0;
    stim[63] = 2'h1;
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
      expv[0] = 11'h7xx;
      expv[1] = 11'h7xx;
      expv[2] = 11'h7xx;
      expv[3] = 11'h780;
      expv[4] = 11'h780;
      expv[5] = 11'h780;
      expv[6] = 11'h782;
      expv[7] = 11'h782;
      expv[8] = 11'h384;
      expv[9] = 11'h384;
      expv[10] = 11'h384;
      expv[11] = 11'h384;
      expv[12] = 11'h286;
      expv[13] = 11'h286;
      expv[14] = 11'h286;
      expv[15] = 11'h288;
      expv[16] = 11'h788;
      expv[17] = 11'h788;
      expv[18] = 11'h780;
      expv[19] = 11'h780;
      expv[20] = 11'h780;
      expv[21] = 11'h782;
      expv[22] = 11'h384;
      expv[23] = 11'h784;
      expv[24] = 11'h784;
      expv[25] = 11'h784;
      expv[26] = 11'h784;
      expv[27] = 11'h784;
      expv[28] = 11'h780;
      expv[29] = 11'h780;
      expv[30] = 11'h782;
      expv[31] = 11'h384;
      expv[32] = 11'h384;
      expv[33] = 11'h286;
      expv[34] = 11'h288;
      expv[35] = 11'h28a;
      expv[36] = 11'h28a;
      expv[37] = 11'h78a;
      expv[38] = 11'h78a;
      expv[39] = 11'h78a;
      expv[40] = 11'h78a;
      expv[41] = 11'h78a;
      expv[42] = 11'h780;
      expv[43] = 11'h782;
      expv[44] = 11'h782;
      expv[45] = 11'h782;
      expv[46] = 11'h782;
      expv[47] = 11'h782;
      expv[48] = 11'h384;
      expv[49] = 11'h384;
      expv[50] = 11'h286;
      expv[51] = 11'h286;
      expv[52] = 11'h286;
      expv[53] = 11'h288;
      expv[54] = 11'h288;
      expv[55] = 11'h288;
      expv[56] = 11'h28a;
      expv[57] = 11'h28a;
      expv[58] = 11'h28c;
      expv[59] = 11'h28c;
      expv[60] = 11'h28c;
      expv[61] = 11'h28c;
      expv[62] = 11'h28e;
      expv[63] = 11'h28e;
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
