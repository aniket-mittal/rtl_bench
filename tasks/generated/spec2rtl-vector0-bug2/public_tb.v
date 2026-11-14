// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .vec(in_vec[2:0]),
    .outv(out_vec[5:3]),
    .o2(out_vec[2:2]),
    .o1(out_vec[1:1]),
    .o0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h5;
    stim[1] = 3'h1;
    stim[2] = 3'h2;
    stim[3] = 3'h5;
    stim[4] = 3'h6;
    stim[5] = 3'h3;
    stim[6] = 3'h2;
    stim[7] = 3'h5;
    stim[8] = 3'h3;
    stim[9] = 3'h3;
    stim[10] = 3'h1;
    stim[11] = 3'h0;
    stim[12] = 3'h7;
    stim[13] = 3'h6;
    stim[14] = 3'h0;
    stim[15] = 3'h2;
    stim[16] = 3'h0;
    stim[17] = 3'h4;
    stim[18] = 3'h4;
    stim[19] = 3'h5;
    stim[20] = 3'h6;
    stim[21] = 3'h1;
    stim[22] = 3'h1;
    stim[23] = 3'h2;
    stim[24] = 3'h7;
    stim[25] = 3'h1;
    stim[26] = 3'h0;
    stim[27] = 3'h0;
    stim[28] = 3'h2;
    stim[29] = 3'h5;
    stim[30] = 3'h3;
    stim[31] = 3'h7;
    stim[32] = 3'h6;
    stim[33] = 3'h7;
    stim[34] = 3'h2;
    stim[35] = 3'h4;
    stim[36] = 3'h3;
    stim[37] = 3'h7;
    stim[38] = 3'h7;
    stim[39] = 3'h1;
    stim[40] = 3'h2;
    stim[41] = 3'h1;
    stim[42] = 3'h1;
    stim[43] = 3'h4;
    stim[44] = 3'h2;
    stim[45] = 3'h6;
    stim[46] = 3'h4;
    stim[47] = 3'h7;
    stim[48] = 3'h4;
    stim[49] = 3'h0;
    stim[50] = 3'h4;
    stim[51] = 3'h6;
    stim[52] = 3'h0;
    stim[53] = 3'h7;
    stim[54] = 3'h1;
    stim[55] = 3'h1;
    stim[56] = 3'h0;
    stim[57] = 3'h7;
    stim[58] = 3'h0;
    stim[59] = 3'h7;
    stim[60] = 3'h3;
    stim[61] = 3'h0;
    stim[62] = 3'h5;
    stim[63] = 3'h0;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 6'h2d;
      expv[1] = 6'h09;
      expv[2] = 6'h13;
      expv[3] = 6'h2d;
      expv[4] = 6'h37;
      expv[5] = 6'h1b;
      expv[6] = 6'h13;
      expv[7] = 6'h2d;
      expv[8] = 6'h1b;
      expv[9] = 6'h1b;
      expv[10] = 6'h09;
      expv[11] = 6'h00;
      expv[12] = 6'h3f;
      expv[13] = 6'h37;
      expv[14] = 6'h00;
      expv[15] = 6'h13;
      expv[16] = 6'h00;
      expv[17] = 6'h25;
      expv[18] = 6'h25;
      expv[19] = 6'h2d;
      expv[20] = 6'h37;
      expv[21] = 6'h09;
      expv[22] = 6'h09;
      expv[23] = 6'h13;
      expv[24] = 6'h3f;
      expv[25] = 6'h09;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h13;
      expv[29] = 6'h2d;
      expv[30] = 6'h1b;
      expv[31] = 6'h3f;
      expv[32] = 6'h37;
      expv[33] = 6'h3f;
      expv[34] = 6'h13;
      expv[35] = 6'h25;
      expv[36] = 6'h1b;
      expv[37] = 6'h3f;
      expv[38] = 6'h3f;
      expv[39] = 6'h09;
      expv[40] = 6'h13;
      expv[41] = 6'h09;
      expv[42] = 6'h09;
      expv[43] = 6'h25;
      expv[44] = 6'h13;
      expv[45] = 6'h37;
      expv[46] = 6'h25;
      expv[47] = 6'h3f;
      expv[48] = 6'h25;
      expv[49] = 6'h00;
      expv[50] = 6'h25;
      expv[51] = 6'h37;
      expv[52] = 6'h00;
      expv[53] = 6'h3f;
      expv[54] = 6'h09;
      expv[55] = 6'h09;
      expv[56] = 6'h00;
      expv[57] = 6'h3f;
      expv[58] = 6'h00;
      expv[59] = 6'h3f;
      expv[60] = 6'h1b;
      expv[61] = 6'h00;
      expv[62] = 6'h2d;
      expv[63] = 6'h00;
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
