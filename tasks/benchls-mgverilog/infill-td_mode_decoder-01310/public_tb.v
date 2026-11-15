// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01310 dut (
    .ctrl(in_vec[8:0]),
    .td_mode(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h010;
    stim[1] = 9'h016;
    stim[2] = 9'h174;
    stim[3] = 9'h01a;
    stim[4] = 9'h12a;
    stim[5] = 9'h041;
    stim[6] = 9'h115;
    stim[7] = 9'h1b5;
    stim[8] = 9'h0db;
    stim[9] = 9'h11d;
    stim[10] = 9'h150;
    stim[11] = 9'h18a;
    stim[12] = 9'h080;
    stim[13] = 9'h194;
    stim[14] = 9'h0e8;
    stim[15] = 9'h0a7;
    stim[16] = 9'h0fd;
    stim[17] = 9'h084;
    stim[18] = 9'h00b;
    stim[19] = 9'h134;
    stim[20] = 9'h03c;
    stim[21] = 9'h1ac;
    stim[22] = 9'h1e6;
    stim[23] = 9'h1fe;
    stim[24] = 9'h028;
    stim[25] = 9'h025;
    stim[26] = 9'h1f2;
    stim[27] = 9'h136;
    stim[28] = 9'h1c3;
    stim[29] = 9'h1ae;
    stim[30] = 9'h1c2;
    stim[31] = 9'h049;
    stim[32] = 9'h0f0;
    stim[33] = 9'h0e4;
    stim[34] = 9'h10d;
    stim[35] = 9'h1c3;
    stim[36] = 9'h1d0;
    stim[37] = 9'h1b4;
    stim[38] = 9'h167;
    stim[39] = 9'h0fc;
    stim[40] = 9'h032;
    stim[41] = 9'h0b0;
    stim[42] = 9'h15d;
    stim[43] = 9'h032;
    stim[44] = 9'h04e;
    stim[45] = 9'h13a;
    stim[46] = 9'h014;
    stim[47] = 9'h145;
    stim[48] = 9'h02e;
    stim[49] = 9'h197;
    stim[50] = 9'h09a;
    stim[51] = 9'h0ae;
    stim[52] = 9'h0d5;
    stim[53] = 9'h180;
    stim[54] = 9'h00e;
    stim[55] = 9'h185;
    stim[56] = 9'h070;
    stim[57] = 9'h19a;
    stim[58] = 9'h085;
    stim[59] = 9'h016;
    stim[60] = 9'h151;
    stim[61] = 9'h038;
    stim[62] = 9'h08e;
    stim[63] = 9'h1f9;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'hc;
      expv[3] = 4'h0;
      expv[4] = 4'h8;
      expv[5] = 4'h4;
      expv[6] = 4'h0;
      expv[7] = 4'ha;
      expv[8] = 4'h5;
      expv[9] = 4'h0;
      expv[10] = 4'h4;
      expv[11] = 4'h2;
      expv[12] = 4'h2;
      expv[13] = 4'h2;
      expv[14] = 4'hf;
      expv[15] = 4'ha;
      expv[16] = 4'hf;
      expv[17] = 4'h2;
      expv[18] = 4'h0;
      expv[19] = 4'h8;
      expv[20] = 4'h8;
      expv[21] = 4'ha;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'h8;
      expv[25] = 4'h8;
      expv[26] = 4'hf;
      expv[27] = 4'h8;
      expv[28] = 4'h5;
      expv[29] = 4'ha;
      expv[30] = 4'h5;
      expv[31] = 4'h4;
      expv[32] = 4'hf;
      expv[33] = 4'hf;
      expv[34] = 4'h0;
      expv[35] = 4'h5;
      expv[36] = 4'h5;
      expv[37] = 4'ha;
      expv[38] = 4'hc;
      expv[39] = 4'hf;
      expv[40] = 4'h8;
      expv[41] = 4'ha;
      expv[42] = 4'h4;
      expv[43] = 4'h8;
      expv[44] = 4'h4;
      expv[45] = 4'h8;
      expv[46] = 4'h0;
      expv[47] = 4'h4;
      expv[48] = 4'h8;
      expv[49] = 4'h2;
      expv[50] = 4'h2;
      expv[51] = 4'ha;
      expv[52] = 4'h5;
      expv[53] = 4'h2;
      expv[54] = 4'h0;
      expv[55] = 4'h2;
      expv[56] = 4'hc;
      expv[57] = 4'h2;
      expv[58] = 4'h2;
      expv[59] = 4'h0;
      expv[60] = 4'h4;
      expv[61] = 4'h8;
      expv[62] = 4'h2;
      expv[63] = 4'hf;
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
