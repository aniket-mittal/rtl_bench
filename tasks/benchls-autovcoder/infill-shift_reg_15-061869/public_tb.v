// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061869 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h604d;
    stim[1] = 15'h1cc9;
    stim[2] = 15'h282d;
    stim[3] = 15'h578e;
    stim[4] = 15'h4fb0;
    stim[5] = 15'h3116;
    stim[6] = 15'h6422;
    stim[7] = 15'h7a73;
    stim[8] = 15'h3dc9;
    stim[9] = 15'h7a6c;
    stim[10] = 15'h3204;
    stim[11] = 15'h0f31;
    stim[12] = 15'h5d2e;
    stim[13] = 15'h3f5e;
    stim[14] = 15'h45a0;
    stim[15] = 15'h4feb;
    stim[16] = 15'h196f;
    stim[17] = 15'h11d3;
    stim[18] = 15'h0439;
    stim[19] = 15'h57f5;
    stim[20] = 15'h52cb;
    stim[21] = 15'h5784;
    stim[22] = 15'h6570;
    stim[23] = 15'h5761;
    stim[24] = 15'h4436;
    stim[25] = 15'h4b96;
    stim[26] = 15'h0827;
    stim[27] = 15'h6c72;
    stim[28] = 15'h65da;
    stim[29] = 15'h74ab;
    stim[30] = 15'h4f15;
    stim[31] = 15'h6bd1;
    stim[32] = 15'h2865;
    stim[33] = 15'h0249;
    stim[34] = 15'h52a0;
    stim[35] = 15'h4b12;
    stim[36] = 15'h662a;
    stim[37] = 15'h1ba2;
    stim[38] = 15'h3eb0;
    stim[39] = 15'h63c0;
    stim[40] = 15'h64b6;
    stim[41] = 15'h43eb;
    stim[42] = 15'h7b1c;
    stim[43] = 15'h726d;
    stim[44] = 15'h6ee5;
    stim[45] = 15'h3c63;
    stim[46] = 15'h399c;
    stim[47] = 15'h3af4;
    stim[48] = 15'h0e51;
    stim[49] = 15'h03bc;
    stim[50] = 15'h1c79;
    stim[51] = 15'h1125;
    stim[52] = 15'h4c2c;
    stim[53] = 15'h2c0b;
    stim[54] = 15'h40a4;
    stim[55] = 15'h286f;
    stim[56] = 15'h759c;
    stim[57] = 15'h0355;
    stim[58] = 15'h772f;
    stim[59] = 15'h4901;
    stim[60] = 15'h2449;
    stim[61] = 15'h3553;
    stim[62] = 15'h7e57;
    stim[63] = 15'h78a0;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h604d;
      expv[2] = 15'h1cc9;
      expv[3] = 15'h282d;
      expv[4] = 15'h578e;
      expv[5] = 15'h4fb0;
      expv[6] = 15'h3116;
      expv[7] = 15'h6422;
      expv[8] = 15'h7a73;
      expv[9] = 15'h3dc9;
      expv[10] = 15'h7a6c;
      expv[11] = 15'h3204;
      expv[12] = 15'h0f31;
      expv[13] = 15'h5d2e;
      expv[14] = 15'h3f5e;
      expv[15] = 15'h45a0;
      expv[16] = 15'h4feb;
      expv[17] = 15'h196f;
      expv[18] = 15'h11d3;
      expv[19] = 15'h0439;
      expv[20] = 15'h57f5;
      expv[21] = 15'h52cb;
      expv[22] = 15'h5784;
      expv[23] = 15'h6570;
      expv[24] = 15'h5761;
      expv[25] = 15'h4436;
      expv[26] = 15'h4b96;
      expv[27] = 15'h0827;
      expv[28] = 15'h6c72;
      expv[29] = 15'h65da;
      expv[30] = 15'h74ab;
      expv[31] = 15'h4f15;
      expv[32] = 15'h6bd1;
      expv[33] = 15'h2865;
      expv[34] = 15'h0249;
      expv[35] = 15'h52a0;
      expv[36] = 15'h4b12;
      expv[37] = 15'h662a;
      expv[38] = 15'h1ba2;
      expv[39] = 15'h3eb0;
      expv[40] = 15'h63c0;
      expv[41] = 15'h64b6;
      expv[42] = 15'h43eb;
      expv[43] = 15'h7b1c;
      expv[44] = 15'h726d;
      expv[45] = 15'h6ee5;
      expv[46] = 15'h3c63;
      expv[47] = 15'h399c;
      expv[48] = 15'h3af4;
      expv[49] = 15'h0e51;
      expv[50] = 15'h03bc;
      expv[51] = 15'h1c79;
      expv[52] = 15'h1125;
      expv[53] = 15'h4c2c;
      expv[54] = 15'h2c0b;
      expv[55] = 15'h40a4;
      expv[56] = 15'h286f;
      expv[57] = 15'h759c;
      expv[58] = 15'h0355;
      expv[59] = 15'h772f;
      expv[60] = 15'h4901;
      expv[61] = 15'h2449;
      expv[62] = 15'h3553;
      expv[63] = 15'h7e57;
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
