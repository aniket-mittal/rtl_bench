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

  autovcoder_061964 dut (
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
    stim[0] = 15'h5bea;
    stim[1] = 15'h46fa;
    stim[2] = 15'h4e9a;
    stim[3] = 15'h2c7a;
    stim[4] = 15'h17df;
    stim[5] = 15'h0cc7;
    stim[6] = 15'h5f9d;
    stim[7] = 15'h7cb9;
    stim[8] = 15'h320e;
    stim[9] = 15'h601d;
    stim[10] = 15'h01e9;
    stim[11] = 15'h3dd6;
    stim[12] = 15'h7885;
    stim[13] = 15'h70a0;
    stim[14] = 15'h4e88;
    stim[15] = 15'h44ac;
    stim[16] = 15'h2ca4;
    stim[17] = 15'h75ff;
    stim[18] = 15'h0b8d;
    stim[19] = 15'h47b5;
    stim[20] = 15'h13bf;
    stim[21] = 15'h0251;
    stim[22] = 15'h1497;
    stim[23] = 15'h5161;
    stim[24] = 15'h0db0;
    stim[25] = 15'h77c4;
    stim[26] = 15'h4c79;
    stim[27] = 15'h1071;
    stim[28] = 15'h127c;
    stim[29] = 15'h5c65;
    stim[30] = 15'h503a;
    stim[31] = 15'h0a0a;
    stim[32] = 15'h339a;
    stim[33] = 15'h5895;
    stim[34] = 15'h1aa3;
    stim[35] = 15'h2540;
    stim[36] = 15'h76c3;
    stim[37] = 15'h72cb;
    stim[38] = 15'h6085;
    stim[39] = 15'h5006;
    stim[40] = 15'h09ae;
    stim[41] = 15'h1792;
    stim[42] = 15'h2da3;
    stim[43] = 15'h4bea;
    stim[44] = 15'h7795;
    stim[45] = 15'h09ba;
    stim[46] = 15'h21b0;
    stim[47] = 15'h557a;
    stim[48] = 15'h00d4;
    stim[49] = 15'h0cd4;
    stim[50] = 15'h06b1;
    stim[51] = 15'h7415;
    stim[52] = 15'h7acd;
    stim[53] = 15'h09bb;
    stim[54] = 15'h6e86;
    stim[55] = 15'h34fb;
    stim[56] = 15'h7b42;
    stim[57] = 15'h360f;
    stim[58] = 15'h092a;
    stim[59] = 15'h108a;
    stim[60] = 15'h2b0c;
    stim[61] = 15'h26e6;
    stim[62] = 15'h7b08;
    stim[63] = 15'h40c4;
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
      expv[1] = 15'h5bea;
      expv[2] = 15'h46fa;
      expv[3] = 15'h4e9a;
      expv[4] = 15'h2c7a;
      expv[5] = 15'h17df;
      expv[6] = 15'h0cc7;
      expv[7] = 15'h5f9d;
      expv[8] = 15'h7cb9;
      expv[9] = 15'h320e;
      expv[10] = 15'h601d;
      expv[11] = 15'h01e9;
      expv[12] = 15'h3dd6;
      expv[13] = 15'h7885;
      expv[14] = 15'h70a0;
      expv[15] = 15'h4e88;
      expv[16] = 15'h44ac;
      expv[17] = 15'h2ca4;
      expv[18] = 15'h75ff;
      expv[19] = 15'h0b8d;
      expv[20] = 15'h47b5;
      expv[21] = 15'h13bf;
      expv[22] = 15'h0251;
      expv[23] = 15'h1497;
      expv[24] = 15'h5161;
      expv[25] = 15'h0db0;
      expv[26] = 15'h77c4;
      expv[27] = 15'h4c79;
      expv[28] = 15'h1071;
      expv[29] = 15'h127c;
      expv[30] = 15'h5c65;
      expv[31] = 15'h503a;
      expv[32] = 15'h0a0a;
      expv[33] = 15'h339a;
      expv[34] = 15'h5895;
      expv[35] = 15'h1aa3;
      expv[36] = 15'h2540;
      expv[37] = 15'h76c3;
      expv[38] = 15'h72cb;
      expv[39] = 15'h6085;
      expv[40] = 15'h5006;
      expv[41] = 15'h09ae;
      expv[42] = 15'h1792;
      expv[43] = 15'h2da3;
      expv[44] = 15'h4bea;
      expv[45] = 15'h7795;
      expv[46] = 15'h09ba;
      expv[47] = 15'h21b0;
      expv[48] = 15'h557a;
      expv[49] = 15'h00d4;
      expv[50] = 15'h0cd4;
      expv[51] = 15'h06b1;
      expv[52] = 15'h7415;
      expv[53] = 15'h7acd;
      expv[54] = 15'h09bb;
      expv[55] = 15'h6e86;
      expv[56] = 15'h34fb;
      expv[57] = 15'h7b42;
      expv[58] = 15'h360f;
      expv[59] = 15'h092a;
      expv[60] = 15'h108a;
      expv[61] = 15'h2b0c;
      expv[62] = 15'h26e6;
      expv[63] = 15'h7b08;
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
