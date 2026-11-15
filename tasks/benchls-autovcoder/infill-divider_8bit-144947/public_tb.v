// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_144947 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .start(in_vec[16:16]),
    .dividend(in_vec[15:8]),
    .divisor(in_vec[7:0]),
    .quotient(out_vec[17:10]),
    .remainder(out_vec[9:2]),
    .done(out_vec[1:1]),
    .error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h32250;
    stim[1] = 18'h29783;
    stim[2] = 18'h1da43;
    stim[3] = 18'h07d93;
    stim[4] = 18'h0fc93;
    stim[5] = 18'h17886;
    stim[6] = 18'h198d5;
    stim[7] = 18'h11403;
    stim[8] = 18'h1578d;
    stim[9] = 18'h13210;
    stim[10] = 18'h1729d;
    stim[11] = 18'h144a7;
    stim[12] = 18'h01298;
    stim[13] = 18'h17c82;
    stim[14] = 18'h1669e;
    stim[15] = 18'h034f3;
    stim[16] = 18'h0abee;
    stim[17] = 18'h05182;
    stim[18] = 18'h1bab0;
    stim[19] = 18'h081b3;
    stim[20] = 18'h1658f;
    stim[21] = 18'h1b9c7;
    stim[22] = 18'h0837d;
    stim[23] = 18'h010f6;
    stim[24] = 18'h15923;
    stim[25] = 18'h1b17a;
    stim[26] = 18'h19630;
    stim[27] = 18'h1c2f7;
    stim[28] = 18'h09500;
    stim[29] = 18'h0df9a;
    stim[30] = 18'h063e0;
    stim[31] = 18'h3874e;
    stim[32] = 18'h0b55c;
    stim[33] = 18'h0ba99;
    stim[34] = 18'h02f14;
    stim[35] = 18'h1a745;
    stim[36] = 18'h0deb3;
    stim[37] = 18'h0e673;
    stim[38] = 18'h1b78b;
    stim[39] = 18'h0a6d6;
    stim[40] = 18'h01cac;
    stim[41] = 18'h1e6a0;
    stim[42] = 18'h03f7b;
    stim[43] = 18'h0b4e5;
    stim[44] = 18'h083c1;
    stim[45] = 18'h0db4a;
    stim[46] = 18'h1a057;
    stim[47] = 18'h162e3;
    stim[48] = 18'h01ea5;
    stim[49] = 18'h0c096;
    stim[50] = 18'h0091a;
    stim[51] = 18'h06d62;
    stim[52] = 18'h0aa17;
    stim[53] = 18'h1fb64;
    stim[54] = 18'h1dd2e;
    stim[55] = 18'h0f2c1;
    stim[56] = 18'h0a9ae;
    stim[57] = 18'h0977f;
    stim[58] = 18'h11ab6;
    stim[59] = 18'h19d3f;
    stim[60] = 18'h00c7c;
    stim[61] = 18'h1ff62;
    stim[62] = 18'h17a5d;
    stim[63] = 18'h01ed4;
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
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00042;
      expv[34] = 18'h00042;
      expv[35] = 18'h00042;
      expv[36] = 18'h00040;
      expv[37] = 18'h00040;
      expv[38] = 18'h00040;
      expv[39] = 18'h00040;
      expv[40] = 18'h00040;
      expv[41] = 18'h00040;
      expv[42] = 18'h00040;
      expv[43] = 18'h00040;
      expv[44] = 18'h00040;
      expv[45] = 18'h00040;
      expv[46] = 18'h00040;
      expv[47] = 18'h00040;
      expv[48] = 18'h00040;
      expv[49] = 18'h00040;
      expv[50] = 18'h00040;
      expv[51] = 18'h00040;
      expv[52] = 18'h00040;
      expv[53] = 18'h00082;
      expv[54] = 18'h00080;
      expv[55] = 18'h00080;
      expv[56] = 18'h00080;
      expv[57] = 18'h00080;
      expv[58] = 18'h00080;
      expv[59] = 18'h00080;
      expv[60] = 18'h00080;
      expv[61] = 18'h00080;
      expv[62] = 18'h00080;
      expv[63] = 18'h00080;
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
