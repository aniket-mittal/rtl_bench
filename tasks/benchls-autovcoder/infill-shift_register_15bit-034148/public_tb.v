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

  autovcoder_034148 dut (
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
    stim[0] = 15'h6d03;
    stim[1] = 15'h1638;
    stim[2] = 15'h18fb;
    stim[3] = 15'h5ac7;
    stim[4] = 15'h019b;
    stim[5] = 15'h1e43;
    stim[6] = 15'h62d8;
    stim[7] = 15'h09d1;
    stim[8] = 15'h12bc;
    stim[9] = 15'h266e;
    stim[10] = 15'h7aba;
    stim[11] = 15'h230e;
    stim[12] = 15'h5873;
    stim[13] = 15'h2c0d;
    stim[14] = 15'h4a1a;
    stim[15] = 15'h6b9a;
    stim[16] = 15'h34ae;
    stim[17] = 15'h62b5;
    stim[18] = 15'h3d72;
    stim[19] = 15'h3221;
    stim[20] = 15'h371e;
    stim[21] = 15'h04b9;
    stim[22] = 15'h1eb7;
    stim[23] = 15'h36f4;
    stim[24] = 15'h78d4;
    stim[25] = 15'h177c;
    stim[26] = 15'h2b13;
    stim[27] = 15'h22c5;
    stim[28] = 15'h5f4f;
    stim[29] = 15'h7a98;
    stim[30] = 15'h0fa3;
    stim[31] = 15'h279e;
    stim[32] = 15'h65fa;
    stim[33] = 15'h5b1e;
    stim[34] = 15'h7ad4;
    stim[35] = 15'h4bfe;
    stim[36] = 15'h509a;
    stim[37] = 15'h0c49;
    stim[38] = 15'h49e7;
    stim[39] = 15'h706d;
    stim[40] = 15'h024b;
    stim[41] = 15'h4469;
    stim[42] = 15'h1e01;
    stim[43] = 15'h67fd;
    stim[44] = 15'h52c7;
    stim[45] = 15'h706e;
    stim[46] = 15'h28a1;
    stim[47] = 15'h5742;
    stim[48] = 15'h31ea;
    stim[49] = 15'h4470;
    stim[50] = 15'h7b73;
    stim[51] = 15'h1211;
    stim[52] = 15'h7bee;
    stim[53] = 15'h3460;
    stim[54] = 15'h4258;
    stim[55] = 15'h729a;
    stim[56] = 15'h2120;
    stim[57] = 15'h7438;
    stim[58] = 15'h7a92;
    stim[59] = 15'h7249;
    stim[60] = 15'h3661;
    stim[61] = 15'h68a9;
    stim[62] = 15'h73a3;
    stim[63] = 15'h4bbb;
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
      expv[1] = 15'h6d03;
      expv[2] = 15'h1638;
      expv[3] = 15'h18fb;
      expv[4] = 15'h5ac7;
      expv[5] = 15'h019b;
      expv[6] = 15'h1e43;
      expv[7] = 15'h62d8;
      expv[8] = 15'h09d1;
      expv[9] = 15'h12bc;
      expv[10] = 15'h266e;
      expv[11] = 15'h7aba;
      expv[12] = 15'h230e;
      expv[13] = 15'h5873;
      expv[14] = 15'h2c0d;
      expv[15] = 15'h4a1a;
      expv[16] = 15'h6b9a;
      expv[17] = 15'h34ae;
      expv[18] = 15'h62b5;
      expv[19] = 15'h3d72;
      expv[20] = 15'h3221;
      expv[21] = 15'h371e;
      expv[22] = 15'h04b9;
      expv[23] = 15'h1eb7;
      expv[24] = 15'h36f4;
      expv[25] = 15'h78d4;
      expv[26] = 15'h177c;
      expv[27] = 15'h2b13;
      expv[28] = 15'h22c5;
      expv[29] = 15'h5f4f;
      expv[30] = 15'h7a98;
      expv[31] = 15'h0fa3;
      expv[32] = 15'h279e;
      expv[33] = 15'h65fa;
      expv[34] = 15'h5b1e;
      expv[35] = 15'h7ad4;
      expv[36] = 15'h4bfe;
      expv[37] = 15'h509a;
      expv[38] = 15'h0c49;
      expv[39] = 15'h49e7;
      expv[40] = 15'h706d;
      expv[41] = 15'h024b;
      expv[42] = 15'h4469;
      expv[43] = 15'h1e01;
      expv[44] = 15'h67fd;
      expv[45] = 15'h52c7;
      expv[46] = 15'h706e;
      expv[47] = 15'h28a1;
      expv[48] = 15'h5742;
      expv[49] = 15'h31ea;
      expv[50] = 15'h4470;
      expv[51] = 15'h7b73;
      expv[52] = 15'h1211;
      expv[53] = 15'h7bee;
      expv[54] = 15'h3460;
      expv[55] = 15'h4258;
      expv[56] = 15'h729a;
      expv[57] = 15'h2120;
      expv[58] = 15'h7438;
      expv[59] = 15'h7a92;
      expv[60] = 15'h7249;
      expv[61] = 15'h3661;
      expv[62] = 15'h68a9;
      expv[63] = 15'h73a3;
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
