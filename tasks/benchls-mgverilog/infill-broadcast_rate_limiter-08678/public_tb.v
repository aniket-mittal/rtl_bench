// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08678 dut (
    .Clk(clk),
    .Reset(in_vec[34:34]),
    .broadcast_ptr(in_vec[33:33]),
    .broadcast_filter_en(in_vec[32:32]),
    .broadcast_bucket_depth(in_vec[31:16]),
    .broadcast_bucket_interval(in_vec[15:0]),
    .broadcast_drop(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h5bbe275eb;
    stim[1] = 35'h64caf6b08;
    stim[2] = 35'h27f41d5a9;
    stim[3] = 35'h022baa9be;
    stim[4] = 35'h31a43cbee;
    stim[5] = 35'h261db4ba9;
    stim[6] = 35'h103e71c68;
    stim[7] = 35'h03eedc14a;
    stim[8] = 35'h0f8bc8a4e;
    stim[9] = 35'h068bd3ced;
    stim[10] = 35'h08afa19f4;
    stim[11] = 35'h2ad616de9;
    stim[12] = 35'h0edeab412;
    stim[13] = 35'h097460ab2;
    stim[14] = 35'h1d4b24bb5;
    stim[15] = 35'h24f1b7a1d;
    stim[16] = 35'h05c9325b4;
    stim[17] = 35'h2d71a0ae9;
    stim[18] = 35'h19465186b;
    stim[19] = 35'h372ab884b;
    stim[20] = 35'h0f89f82e4;
    stim[21] = 35'h272715bb0;
    stim[22] = 35'h3fe51060b;
    stim[23] = 35'h01be617d7;
    stim[24] = 35'h2115312c9;
    stim[25] = 35'h3e0d69053;
    stim[26] = 35'h2dff63106;
    stim[27] = 35'h3357cfa0a;
    stim[28] = 35'h0804e030f;
    stim[29] = 35'h11179c842;
    stim[30] = 35'h180583cd8;
    stim[31] = 35'h04129e06b;
    stim[32] = 35'h0db6e3c7e;
    stim[33] = 35'h506ab7942;
    stim[34] = 35'h069b66aef;
    stim[35] = 35'h02d9d92a5;
    stim[36] = 35'h09c7ba06c;
    stim[37] = 35'h32c1a5633;
    stim[38] = 35'h05bb09b79;
    stim[39] = 35'h12ed7e77f;
    stim[40] = 35'h0948214e0;
    stim[41] = 35'h079649fa8;
    stim[42] = 35'h054771751;
    stim[43] = 35'h31ac4299e;
    stim[44] = 35'h0b094b1af;
    stim[45] = 35'h3547f5b0a;
    stim[46] = 35'h1590b1f5b;
    stim[47] = 35'h29beaea50;
    stim[48] = 35'h36c4e1749;
    stim[49] = 35'h134486fb0;
    stim[50] = 35'h3fbc9c032;
    stim[51] = 35'h2192c9c35;
    stim[52] = 35'h0f3143a5b;
    stim[53] = 35'h31974fc3b;
    stim[54] = 35'h334786ed5;
    stim[55] = 35'h37593e6e1;
    stim[56] = 35'h047da2d44;
    stim[57] = 35'h2905a1056;
    stim[58] = 35'h306c0f33c;
    stim[59] = 35'h3a4552dca;
    stim[60] = 35'h0ddb596b6;
    stim[61] = 35'h042499a1c;
    stim[62] = 35'h00035ae5c;
    stim[63] = 35'h255b151b9;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
