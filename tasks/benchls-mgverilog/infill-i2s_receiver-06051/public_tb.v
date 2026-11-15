// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06051 dut (
    .clk(clk),
    .FRM(in_vec[2:2]),
    .BCK(in_vec[1:1]),
    .DIN(in_vec[0:0]),
    .out_L(out_vec[33:18]),
    .out_R(out_vec[17:2]),
    .ready_L(out_vec[1:1]),
    .ready_R(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h0;
    stim[1] = 3'h2;
    stim[2] = 3'h5;
    stim[3] = 3'h1;
    stim[4] = 3'h7;
    stim[5] = 3'h4;
    stim[6] = 3'h0;
    stim[7] = 3'h0;
    stim[8] = 3'h0;
    stim[9] = 3'h5;
    stim[10] = 3'h2;
    stim[11] = 3'h6;
    stim[12] = 3'h5;
    stim[13] = 3'h4;
    stim[14] = 3'h3;
    stim[15] = 3'h7;
    stim[16] = 3'h2;
    stim[17] = 3'h4;
    stim[18] = 3'h6;
    stim[19] = 3'h5;
    stim[20] = 3'h5;
    stim[21] = 3'h5;
    stim[22] = 3'h0;
    stim[23] = 3'h2;
    stim[24] = 3'h4;
    stim[25] = 3'h0;
    stim[26] = 3'h6;
    stim[27] = 3'h7;
    stim[28] = 3'h1;
    stim[29] = 3'h5;
    stim[30] = 3'h0;
    stim[31] = 3'h2;
    stim[32] = 3'h6;
    stim[33] = 3'h7;
    stim[34] = 3'h1;
    stim[35] = 3'h7;
    stim[36] = 3'h1;
    stim[37] = 3'h5;
    stim[38] = 3'h6;
    stim[39] = 3'h7;
    stim[40] = 3'h6;
    stim[41] = 3'h7;
    stim[42] = 3'h6;
    stim[43] = 3'h1;
    stim[44] = 3'h4;
    stim[45] = 3'h4;
    stim[46] = 3'h0;
    stim[47] = 3'h1;
    stim[48] = 3'h3;
    stim[49] = 3'h3;
    stim[50] = 3'h2;
    stim[51] = 3'h6;
    stim[52] = 3'h3;
    stim[53] = 3'h5;
    stim[54] = 3'h4;
    stim[55] = 3'h0;
    stim[56] = 3'h4;
    stim[57] = 3'h7;
    stim[58] = 3'h2;
    stim[59] = 3'h1;
    stim[60] = 3'h7;
    stim[61] = 3'h5;
    stim[62] = 3'h0;
    stim[63] = 3'h5;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'hxxxxxxxxx;
      expv[9] = 34'hxxxxxxxxx;
      expv[10] = 34'hxxxxxxxxx;
      expv[11] = 34'hxxxxxxxxx;
      expv[12] = 34'hxxxxxxxxx;
      expv[13] = 34'hxxxxxxxxx;
      expv[14] = 34'hxxxxxxxxx;
      expv[15] = 34'hxxxxxxxxx;
      expv[16] = 34'hxxxxxxxxx;
      expv[17] = 34'hxxxxxxxxx;
      expv[18] = 34'hxxxxxxxxx;
      expv[19] = 34'hxxxxxxxxx;
      expv[20] = 34'hxxxxxxxxx;
      expv[21] = 34'hxxxxxxxxx;
      expv[22] = 34'hxxxxxxxxx;
      expv[23] = 34'hxxxxxxxxx;
      expv[24] = 34'hxxxxxxxxx;
      expv[25] = 34'hxxxxxxxxx;
      expv[26] = 34'hxxxxxxxx8;
      expv[27] = 34'hxxxxxxxx8;
      expv[28] = 34'hxxxxxxxx9;
      expv[29] = 34'hxxxxxxxx8;
      expv[30] = 34'hxxxxxxxx8;
      expv[31] = 34'hxxx4xxxx8;
      expv[32] = 34'hxxx4xxxx8;
      expv[33] = 34'hxxx4xxxxa;
      expv[34] = 34'hxxx4xxxx8;
      expv[35] = 34'hxxx4xxxx4;
      expv[36] = 34'hxxx4xxxx4;
      expv[37] = 34'hxxx4xxxx5;
      expv[38] = 34'hxxx8xxxx4;
      expv[39] = 34'hxxx8xxxx4;
      expv[40] = 34'hxxx8xxxx6;
      expv[41] = 34'hxxx8xxxx4;
      expv[42] = 34'hxxx8xxxx4;
      expv[43] = 34'hxxx8xxxx4;
      expv[44] = 34'hxxx8xxxx4;
      expv[45] = 34'hxxx8xxxx4;
      expv[46] = 34'hxxx8xxxx4;
      expv[47] = 34'hxxx8xxxx4;
      expv[48] = 34'hxxx8xxxxc;
      expv[49] = 34'hxxx8xxxxc;
      expv[50] = 34'hxxx8xxxxc;
      expv[51] = 34'hxxx8xxxxc;
      expv[52] = 34'hxxx8xxxxc;
      expv[53] = 34'hxxx8xxxxc;
      expv[54] = 34'hxxx8xxxxc;
      expv[55] = 34'hxxx8xxxxc;
      expv[56] = 34'hxxx8xxxxc;
      expv[57] = 34'hxxx8xxxxc;
      expv[58] = 34'hxxx8xxxxc;
      expv[59] = 34'hxxx8xxxxd;
      expv[60] = 34'hxxx0xxxxc;
      expv[61] = 34'hxxx0xxxxc;
      expv[62] = 34'hxxx0xxxxe;
      expv[63] = 34'hxxx0xxxxc;
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
