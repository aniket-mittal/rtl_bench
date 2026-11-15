// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140433 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .in1(in_vec[15:8]),
    .in2(in_vec[7:0]),
    .out(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1f5cf;
    stim[1] = 17'h1fbb6;
    stim[2] = 17'h042c2;
    stim[3] = 17'h0873f;
    stim[4] = 17'h0dd29;
    stim[5] = 17'h08dd5;
    stim[6] = 17'h0892a;
    stim[7] = 17'h0cb62;
    stim[8] = 17'h0a484;
    stim[9] = 17'h0fc8a;
    stim[10] = 17'h0a4dc;
    stim[11] = 17'h08f23;
    stim[12] = 17'h08443;
    stim[13] = 17'h00d9a;
    stim[14] = 17'h02276;
    stim[15] = 17'h08181;
    stim[16] = 17'h0f331;
    stim[17] = 17'h08881;
    stim[18] = 17'h0aed2;
    stim[19] = 17'h043eb;
    stim[20] = 17'h0c281;
    stim[21] = 17'h0717e;
    stim[22] = 17'h06518;
    stim[23] = 17'h0959f;
    stim[24] = 17'h06d4d;
    stim[25] = 17'h0211c;
    stim[26] = 17'h09cd9;
    stim[27] = 17'h00ef4;
    stim[28] = 17'h0dbf6;
    stim[29] = 17'h04c23;
    stim[30] = 17'h08c47;
    stim[31] = 17'h0f569;
    stim[32] = 17'h0229e;
    stim[33] = 17'h0380f;
    stim[34] = 17'h0e51a;
    stim[35] = 17'h0ab2c;
    stim[36] = 17'h07430;
    stim[37] = 17'h02b40;
    stim[38] = 17'h07908;
    stim[39] = 17'h0846a;
    stim[40] = 17'h03d4f;
    stim[41] = 17'h0d3f1;
    stim[42] = 17'h05438;
    stim[43] = 17'h0671c;
    stim[44] = 17'h0f82f;
    stim[45] = 17'h0d4a7;
    stim[46] = 17'h0de55;
    stim[47] = 17'h094c6;
    stim[48] = 17'h05873;
    stim[49] = 17'h04008;
    stim[50] = 17'h08af8;
    stim[51] = 17'h04be2;
    stim[52] = 17'h0a068;
    stim[53] = 17'h04613;
    stim[54] = 17'h0c2b9;
    stim[55] = 17'h0921e;
    stim[56] = 17'h03fae;
    stim[57] = 17'h0809e;
    stim[58] = 17'h048ea;
    stim[59] = 17'h0af1a;
    stim[60] = 17'h0af8b;
    stim[61] = 17'h0f850;
    stim[62] = 17'h00905;
    stim[63] = 17'h004b4;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h7;
      expv[7] = 3'h7;
      expv[8] = 3'h7;
      expv[9] = 3'h7;
      expv[10] = 3'h7;
      expv[11] = 3'h7;
      expv[12] = 3'h7;
      expv[13] = 3'h7;
      expv[14] = 3'h7;
      expv[15] = 3'h7;
      expv[16] = 3'h7;
      expv[17] = 3'h7;
      expv[18] = 3'h6;
      expv[19] = 3'h7;
      expv[20] = 3'h7;
      expv[21] = 3'h7;
      expv[22] = 3'h7;
      expv[23] = 3'h7;
      expv[24] = 3'h7;
      expv[25] = 3'h6;
      expv[26] = 3'h6;
      expv[27] = 3'h7;
      expv[28] = 3'h6;
      expv[29] = 3'h5;
      expv[30] = 3'h7;
      expv[31] = 3'h7;
      expv[32] = 3'h7;
      expv[33] = 3'h6;
      expv[34] = 3'h7;
      expv[35] = 3'h7;
      expv[36] = 3'h7;
      expv[37] = 3'h5;
      expv[38] = 3'h7;
      expv[39] = 3'h7;
      expv[40] = 3'h6;
      expv[41] = 3'h6;
      expv[42] = 3'h6;
      expv[43] = 3'h7;
      expv[44] = 3'h6;
      expv[45] = 3'h7;
      expv[46] = 3'h6;
      expv[47] = 3'h6;
      expv[48] = 3'h7;
      expv[49] = 3'h7;
      expv[50] = 3'h7;
      expv[51] = 3'h7;
      expv[52] = 3'h6;
      expv[53] = 3'h6;
      expv[54] = 3'h7;
      expv[55] = 3'h7;
      expv[56] = 3'h7;
      expv[57] = 3'h6;
      expv[58] = 3'h7;
      expv[59] = 3'h7;
      expv[60] = 3'h7;
      expv[61] = 3'h7;
      expv[62] = 3'h7;
      expv[63] = 3'h7;
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
