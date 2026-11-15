// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_117258 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .sample_data(in_vec[17:2]),
    .sample_valid(in_vec[1:1]),
    .fifo_ready(in_vec[0:0]),
    .fifo_data(out_vec[17:2]),
    .fifo_overflow(out_vec[1:1]),
    .fifo_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h5b9f4;
    stim[1] = 19'h46419;
    stim[2] = 19'h1c215;
    stim[3] = 19'h15288;
    stim[4] = 19'h02bb8;
    stim[5] = 19'h31334;
    stim[6] = 19'h226da;
    stim[7] = 19'h2c7c6;
    stim[8] = 19'h16319;
    stim[9] = 19'h11994;
    stim[10] = 19'h01809;
    stim[11] = 19'h02b8f;
    stim[12] = 19'h01e6b;
    stim[13] = 19'h26e82;
    stim[14] = 19'h28879;
    stim[15] = 19'h01bc8;
    stim[16] = 19'h2ba90;
    stim[17] = 19'h1cf4d;
    stim[18] = 19'h22ad8;
    stim[19] = 19'h2e968;
    stim[20] = 19'h1bb55;
    stim[21] = 19'h0443b;
    stim[22] = 19'h351ea;
    stim[23] = 19'h2c5bb;
    stim[24] = 19'h04966;
    stim[25] = 19'h1900f;
    stim[26] = 19'h20b42;
    stim[27] = 19'h386a2;
    stim[28] = 19'h03cd3;
    stim[29] = 19'h2b09f;
    stim[30] = 19'h1d22c;
    stim[31] = 19'h1fbed;
    stim[32] = 19'h2ae3f;
    stim[33] = 19'h3bfb3;
    stim[34] = 19'h1d998;
    stim[35] = 19'h35af8;
    stim[36] = 19'h0124c;
    stim[37] = 19'h07984;
    stim[38] = 19'h26188;
    stim[39] = 19'h3cc56;
    stim[40] = 19'h11336;
    stim[41] = 19'h371f1;
    stim[42] = 19'h0e54b;
    stim[43] = 19'h1aeab;
    stim[44] = 19'h3e558;
    stim[45] = 19'h3ca9f;
    stim[46] = 19'h386df;
    stim[47] = 19'h1a913;
    stim[48] = 19'h2d2fb;
    stim[49] = 19'h26b9b;
    stim[50] = 19'h051ae;
    stim[51] = 19'h17612;
    stim[52] = 19'h1f91d;
    stim[53] = 19'h052c0;
    stim[54] = 19'h3a6ed;
    stim[55] = 19'h1d094;
    stim[56] = 19'h147be;
    stim[57] = 19'h29c28;
    stim[58] = 19'h341c0;
    stim[59] = 19'h2ea92;
    stim[60] = 19'h1c823;
    stim[61] = 19'h13343;
    stim[62] = 19'h32f42;
    stim[63] = 19'h0b76c;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h1c214;
      expv[4] = 18'h15288;
      expv[5] = 18'h02bb8;
      expv[6] = 18'h31334;
      expv[7] = 18'h226d9;
      expv[8] = 18'h00007;
      expv[9] = 18'h0000b;
      expv[10] = 18'h11994;
      expv[11] = 18'h01808;
      expv[12] = 18'h02b8d;
      expv[13] = 18'h01e69;
      expv[14] = 18'h26e81;
      expv[15] = 18'h00007;
      expv[16] = 18'h01bc8;
      expv[17] = 18'h2ba90;
      expv[18] = 18'h1cf4c;
      expv[19] = 18'h22ad8;
      expv[20] = 18'h2e968;
      expv[21] = 18'h1bb54;
      expv[22] = 18'h04439;
      expv[23] = 18'h351e9;
      expv[24] = 18'h00007;
      expv[25] = 18'h04965;
      expv[26] = 18'h00007;
      expv[27] = 18'h20b41;
      expv[28] = 18'h00007;
      expv[29] = 18'h0000b;
      expv[30] = 18'h2b09d;
      expv[31] = 18'h1d22c;
      expv[32] = 18'h1fbec;
      expv[33] = 18'h2ae3d;
      expv[34] = 18'h3bfb1;
      expv[35] = 18'h1d998;
      expv[36] = 18'h35af8;
      expv[37] = 18'h0124c;
      expv[38] = 18'h07984;
      expv[39] = 18'h26188;
      expv[40] = 18'h3cc55;
      expv[41] = 18'h00007;
      expv[42] = 18'h0000b;
      expv[43] = 18'h0e549;
      expv[44] = 18'h1aea9;
      expv[45] = 18'h3e558;
      expv[46] = 18'h3ca9d;
      expv[47] = 18'h386dd;
      expv[48] = 18'h1a911;
      expv[49] = 18'h2d2f9;
      expv[50] = 18'h26b99;
      expv[51] = 18'h051ad;
      expv[52] = 18'h00007;
      expv[53] = 18'h0000b;
      expv[54] = 18'h052c0;
      expv[55] = 18'h3a6ec;
      expv[56] = 18'h1d094;
      expv[57] = 18'h147bd;
      expv[58] = 18'h00007;
      expv[59] = 18'h00007;
      expv[60] = 18'h00007;
      expv[61] = 18'h0000b;
      expv[62] = 18'h13341;
      expv[63] = 18'h32f41;
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
