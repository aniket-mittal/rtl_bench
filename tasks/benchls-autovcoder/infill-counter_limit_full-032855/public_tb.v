// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032855 dut (
    .toplevel_io_axiClk(clk),
    .io_tick(in_vec[18:18]),
    .io_clear(in_vec[17:17]),
    .io_limit(in_vec[16:1]),
    .toplevel_resetCtrl_axiReset(in_vec[0:0]),
    .io_full(out_vec[16:16]),
    .io_value(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h09a61;
    stim[1] = 19'h75ff5;
    stim[2] = 19'h5f054;
    stim[3] = 19'h14318;
    stim[4] = 19'h0e32a;
    stim[5] = 19'h3e554;
    stim[6] = 19'h42c36;
    stim[7] = 19'h48f68;
    stim[8] = 19'h0ce3e;
    stim[9] = 19'h6b9fe;
    stim[10] = 19'h78194;
    stim[11] = 19'h20d04;
    stim[12] = 19'h03d2c;
    stim[13] = 19'h05fae;
    stim[14] = 19'h687fa;
    stim[15] = 19'h0135e;
    stim[16] = 19'h65d32;
    stim[17] = 19'h6478c;
    stim[18] = 19'h49bff;
    stim[19] = 19'h133cc;
    stim[20] = 19'h0a06e;
    stim[21] = 19'h4543c;
    stim[22] = 19'h207a4;
    stim[23] = 19'h1ae88;
    stim[24] = 19'h7dbf5;
    stim[25] = 19'h005fa;
    stim[26] = 19'h28e02;
    stim[27] = 19'h4285a;
    stim[28] = 19'h7284e;
    stim[29] = 19'h263ca;
    stim[30] = 19'h5d32e;
    stim[31] = 19'h56050;
    stim[32] = 19'h09698;
    stim[33] = 19'h6d5ae;
    stim[34] = 19'h6d57a;
    stim[35] = 19'h6efde;
    stim[36] = 19'h6d5fe;
    stim[37] = 19'h172d8;
    stim[38] = 19'h0b1dc;
    stim[39] = 19'h32b04;
    stim[40] = 19'h3c5ca;
    stim[41] = 19'h599ae;
    stim[42] = 19'h433b0;
    stim[43] = 19'h62c7e;
    stim[44] = 19'h78ad6;
    stim[45] = 19'h43f98;
    stim[46] = 19'h3461e;
    stim[47] = 19'h1e718;
    stim[48] = 19'h6fcc2;
    stim[49] = 19'h17a46;
    stim[50] = 19'h77136;
    stim[51] = 19'h38b5e;
    stim[52] = 19'h66c14;
    stim[53] = 19'h7d500;
    stim[54] = 19'h0554a;
    stim[55] = 19'h138da;
    stim[56] = 19'h2aeb0;
    stim[57] = 19'h1804c;
    stim[58] = 19'h7cae4;
    stim[59] = 19'h37da2;
    stim[60] = 19'h5f006;
    stim[61] = 19'h478e8;
    stim[62] = 19'h3d38c;
    stim[63] = 19'h7f69a;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00001;
      expv[4] = 17'h00001;
      expv[5] = 17'h00001;
      expv[6] = 17'h00000;
      expv[7] = 17'h00001;
      expv[8] = 17'h00002;
      expv[9] = 17'h00002;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00001;
      expv[20] = 17'h00001;
      expv[21] = 17'h00001;
      expv[22] = 17'h00002;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00001;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00001;
      expv[32] = 17'h00002;
      expv[33] = 17'h00002;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00001;
      expv[43] = 17'h00002;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00001;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00001;
      expv[62] = 17'h00002;
      expv[63] = 17'h00000;
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
