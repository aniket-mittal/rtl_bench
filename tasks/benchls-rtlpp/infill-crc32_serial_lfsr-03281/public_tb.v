// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03281 dut (
    .clk(clk),
    .rstn(in_vec[4:4]),
    .data(in_vec[3:3]),
    .enable(in_vec[2:2]),
    .shift(in_vec[1:1]),
    .clr(in_vec[0:0]),
    .crc_out(out_vec[32:1]),
    .serial_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0c;
    stim[1] = 5'h07;
    stim[2] = 5'h13;
    stim[3] = 5'h16;
    stim[4] = 5'h1c;
    stim[5] = 5'h1a;
    stim[6] = 5'h11;
    stim[7] = 5'h1e;
    stim[8] = 5'h1d;
    stim[9] = 5'h14;
    stim[10] = 5'h14;
    stim[11] = 5'h1e;
    stim[12] = 5'h1e;
    stim[13] = 5'h1f;
    stim[14] = 5'h1d;
    stim[15] = 5'h19;
    stim[16] = 5'h16;
    stim[17] = 5'h16;
    stim[18] = 5'h1a;
    stim[19] = 5'h0d;
    stim[20] = 5'h15;
    stim[21] = 5'h15;
    stim[22] = 5'h1d;
    stim[23] = 5'h1f;
    stim[24] = 5'h10;
    stim[25] = 5'h05;
    stim[26] = 5'h1d;
    stim[27] = 5'h13;
    stim[28] = 5'h13;
    stim[29] = 5'h15;
    stim[30] = 5'h1d;
    stim[31] = 5'h19;
    stim[32] = 5'h1d;
    stim[33] = 5'h10;
    stim[34] = 5'h13;
    stim[35] = 5'h11;
    stim[36] = 5'h1f;
    stim[37] = 5'h0e;
    stim[38] = 5'h1d;
    stim[39] = 5'h1b;
    stim[40] = 5'h07;
    stim[41] = 5'h10;
    stim[42] = 5'h18;
    stim[43] = 5'h15;
    stim[44] = 5'h12;
    stim[45] = 5'h19;
    stim[46] = 5'h1e;
    stim[47] = 5'h15;
    stim[48] = 5'h13;
    stim[49] = 5'h1c;
    stim[50] = 5'h1b;
    stim[51] = 5'h13;
    stim[52] = 5'h13;
    stim[53] = 5'h16;
    stim[54] = 5'h17;
    stim[55] = 5'h1f;
    stim[56] = 5'h1a;
    stim[57] = 5'h1d;
    stim[58] = 5'h14;
    stim[59] = 5'h18;
    stim[60] = 5'h1f;
    stim[61] = 5'h1c;
    stim[62] = 5'h13;
    stim[63] = 5'h15;
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
      expv[0] = 33'h1ffffffff;
      expv[1] = 33'h1ffffffff;
      expv[2] = 33'h1ffffffff;
      expv[3] = 33'h1ffffffff;
      expv[4] = 33'h1248ef9bf;
      expv[5] = 33'h092477cdf;
      expv[6] = 33'h04923be6f;
      expv[7] = 33'h1ffffffff;
      expv[8] = 33'h0ffffffff;
      expv[9] = 33'h1ffffffff;
      expv[10] = 33'h1248ef9bf;
      expv[11] = 33'h149367a9f;
      expv[12] = 33'h0a49b3d4f;
      expv[13] = 33'h0524d9ea7;
      expv[14] = 33'h1ffffffff;
      expv[15] = 33'h1ffffffff;
      expv[16] = 33'h1ffffffff;
      expv[17] = 33'h1248ef9bf;
      expv[18] = 33'h149367a9f;
      expv[19] = 33'h1ffffffff;
      expv[20] = 33'h1ffffffff;
      expv[21] = 33'h1ffffffff;
      expv[22] = 33'h1ffffffff;
      expv[23] = 33'h1ffffffff;
      expv[24] = 33'h1ffffffff;
      expv[25] = 33'h1ffffffff;
      expv[26] = 33'h1ffffffff;
      expv[27] = 33'h1ffffffff;
      expv[28] = 33'h1ffffffff;
      expv[29] = 33'h1ffffffff;
      expv[30] = 33'h1ffffffff;
      expv[31] = 33'h1ffffffff;
      expv[32] = 33'h1ffffffff;
      expv[33] = 33'h1ffffffff;
      expv[34] = 33'h1ffffffff;
      expv[35] = 33'h1ffffffff;
      expv[36] = 33'h1ffffffff;
      expv[37] = 33'h1ffffffff;
      expv[38] = 33'h1ffffffff;
      expv[39] = 33'h1ffffffff;
      expv[40] = 33'h1ffffffff;
      expv[41] = 33'h1ffffffff;
      expv[42] = 33'h1ffffffff;
      expv[43] = 33'h1ffffffff;
      expv[44] = 33'h1ffffffff;
      expv[45] = 33'h0ffffffff;
      expv[46] = 33'h1ffffffff;
      expv[47] = 33'h0ffffffff;
      expv[48] = 33'h1ffffffff;
      expv[49] = 33'h1ffffffff;
      expv[50] = 33'h0ffffffff;
      expv[51] = 33'h1ffffffff;
      expv[52] = 33'h1ffffffff;
      expv[53] = 33'h1ffffffff;
      expv[54] = 33'h1248ef9bf;
      expv[55] = 33'h1ffffffff;
      expv[56] = 33'h1ffffffff;
      expv[57] = 33'h0ffffffff;
      expv[58] = 33'h1ffffffff;
      expv[59] = 33'h1248ef9bf;
      expv[60] = 33'h1248ef9bf;
      expv[61] = 33'h1ffffffff;
      expv[62] = 33'h0ffffffff;
      expv[63] = 33'h1ffffffff;
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
