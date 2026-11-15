// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06425 dut (
    .CLK(clk),
    .RESETn(in_vec[10:10]),
    .DATA_IN(in_vec[9:2]),
    .PUSH(in_vec[1:1]),
    .POP(in_vec[0:0]),
    .DATA_OUT(out_vec[9:2]),
    .FULL(out_vec[1:1]),
    .EMPTY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2e9;
    stim[1] = 11'h055;
    stim[2] = 11'h638;
    stim[3] = 11'h4b3;
    stim[4] = 11'h739;
    stim[5] = 11'h724;
    stim[6] = 11'h72f;
    stim[7] = 11'h4a8;
    stim[8] = 11'h487;
    stim[9] = 11'h6b2;
    stim[10] = 11'h4fc;
    stim[11] = 11'h6c1;
    stim[12] = 11'h722;
    stim[13] = 11'h53b;
    stim[14] = 11'h36c;
    stim[15] = 11'h5dd;
    stim[16] = 11'h555;
    stim[17] = 11'h648;
    stim[18] = 11'h767;
    stim[19] = 11'h7b9;
    stim[20] = 11'h407;
    stim[21] = 11'h56e;
    stim[22] = 11'h5d6;
    stim[23] = 11'h7ed;
    stim[24] = 11'h787;
    stim[25] = 11'h5c8;
    stim[26] = 11'h4cc;
    stim[27] = 11'h531;
    stim[28] = 11'h542;
    stim[29] = 11'h455;
    stim[30] = 11'h75c;
    stim[31] = 11'h479;
    stim[32] = 11'h65f;
    stim[33] = 11'h424;
    stim[34] = 11'h654;
    stim[35] = 11'h707;
    stim[36] = 11'h6af;
    stim[37] = 11'h6f4;
    stim[38] = 11'h77d;
    stim[39] = 11'h430;
    stim[40] = 11'h42f;
    stim[41] = 11'h7a0;
    stim[42] = 11'h4be;
    stim[43] = 11'h45c;
    stim[44] = 11'h75e;
    stim[45] = 11'h49e;
    stim[46] = 11'h526;
    stim[47] = 11'h7a6;
    stim[48] = 11'h26f;
    stim[49] = 11'h6e5;
    stim[50] = 11'h3a3;
    stim[51] = 11'h7b2;
    stim[52] = 11'h413;
    stim[53] = 11'h4b0;
    stim[54] = 11'h6dc;
    stim[55] = 11'h67c;
    stim[56] = 11'h582;
    stim[57] = 11'h59f;
    stim[58] = 11'h569;
    stim[59] = 11'h7f1;
    stim[60] = 11'h7a8;
    stim[61] = 11'h667;
    stim[62] = 11'h7dd;
    stim[63] = 11'h7c6;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'h2b2;
      expv[12] = 10'h2b0;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'h0b1;
      expv[17] = 10'h0b1;
      expv[18] = 10'h0b1;
      expv[19] = 10'h0b0;
      expv[20] = 10'h32d;
      expv[21] = 10'h32c;
      expv[22] = 10'h086;
      expv[23] = 10'h16e;
      expv[24] = 10'h16c;
      expv[25] = 10'h322;
      expv[26] = 10'h322;
      expv[27] = 10'h322;
      expv[28] = 10'h320;
      expv[29] = 10'h13a;
      expv[30] = 10'h138;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'hxxx;
      expv[49] = 10'hxxx;
      expv[50] = 10'h365;
      expv[51] = 10'h365;
      expv[52] = 10'h3a2;
      expv[53] = 10'h3b0;
      expv[54] = 10'h004;
      expv[55] = 10'h004;
      expv[56] = 10'h004;
      expv[57] = 10'h004;
      expv[58] = 10'h181;
      expv[59] = 10'h19d;
      expv[60] = 10'h19d;
      expv[61] = 10'h19d;
      expv[62] = 10'h19c;
      expv[63] = 10'h141;
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
