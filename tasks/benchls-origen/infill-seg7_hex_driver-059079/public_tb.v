// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059079 dut (
    .clk(clk),
    .x(in_vec[16:1]),
    .rst(in_vec[0:0]),
    .a_to_g(out_vec[10:4]),
    .an(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h13899;
    stim[1] = 17'h1114b;
    stim[2] = 17'h140a2;
    stim[3] = 17'h16db2;
    stim[4] = 17'h12eb6;
    stim[5] = 17'h0eb84;
    stim[6] = 17'h0f45c;
    stim[7] = 17'h12c0e;
    stim[8] = 17'h1c9b0;
    stim[9] = 17'h17bba;
    stim[10] = 17'h188ec;
    stim[11] = 17'h02cd4;
    stim[12] = 17'h01008;
    stim[13] = 17'h0c314;
    stim[14] = 17'h17de6;
    stim[15] = 17'h11af8;
    stim[16] = 17'h04a94;
    stim[17] = 17'h12c50;
    stim[18] = 17'h0b5c4;
    stim[19] = 17'h1aa0e;
    stim[20] = 17'h06e22;
    stim[21] = 17'h04eba;
    stim[22] = 17'h0b7ce;
    stim[23] = 17'h0011e;
    stim[24] = 17'h0fa14;
    stim[25] = 17'h0332e;
    stim[26] = 17'h15b22;
    stim[27] = 17'h1b42e;
    stim[28] = 17'h0e548;
    stim[29] = 17'h18992;
    stim[30] = 17'h0116c;
    stim[31] = 17'h000ee;
    stim[32] = 17'h187ac;
    stim[33] = 17'h021a0;
    stim[34] = 17'h1c166;
    stim[35] = 17'h146cc;
    stim[36] = 17'h0d938;
    stim[37] = 17'h0dfbc;
    stim[38] = 17'h19688;
    stim[39] = 17'h0783c;
    stim[40] = 17'h1185a;
    stim[41] = 17'h17364;
    stim[42] = 17'h1b0ca;
    stim[43] = 17'h1d2de;
    stim[44] = 17'h04794;
    stim[45] = 17'h1bc54;
    stim[46] = 17'h08da6;
    stim[47] = 17'h0e9dc;
    stim[48] = 17'h18110;
    stim[49] = 17'h028ac;
    stim[50] = 17'h0c646;
    stim[51] = 17'h1c0a6;
    stim[52] = 17'h1c606;
    stim[53] = 17'h00da8;
    stim[54] = 17'h02642;
    stim[55] = 17'h16f3c;
    stim[56] = 17'h15440;
    stim[57] = 17'h041a6;
    stim[58] = 17'h0765a;
    stim[59] = 17'h19e88;
    stim[60] = 17'h01efe;
    stim[61] = 17'h1ba64;
    stim[62] = 17'h1ef1e;
    stim[63] = 17'h0036a;
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
      expv[0] = 11'h46e;
      expv[1] = 11'h12e;
      expv[2] = 11'h79e;
      expv[3] = 11'h10e;
      expv[4] = 11'h03e;
      expv[5] = 11'h24e;
      expv[6] = 11'h06e;
      expv[7] = 11'h78e;
      expv[8] = 11'h00e;
      expv[9] = 11'h21e;
      expv[10] = 11'h02e;
      expv[11] = 11'h08e;
      expv[12] = 11'h19e;
      expv[13] = 11'h08e;
      expv[14] = 11'h30e;
      expv[15] = 11'h46e;
      expv[16] = 11'h08e;
      expv[17] = 11'h00e;
      expv[18] = 11'h24e;
      expv[19] = 11'h78e;
      expv[20] = 11'h79e;
      expv[21] = 11'h21e;
      expv[22] = 11'h78e;
      expv[23] = 11'h0ee;
      expv[24] = 11'h08e;
      expv[25] = 11'h78e;
      expv[26] = 11'h79e;
      expv[27] = 11'h78e;
      expv[28] = 11'h19e;
      expv[29] = 11'h10e;
      expv[30] = 11'h02e;
      expv[31] = 11'h78e;
      expv[32] = 11'h02e;
      expv[33] = 11'h40e;
      expv[34] = 11'h30e;
      expv[35] = 11'h02e;
      expv[36] = 11'h46e;
      expv[37] = 11'h06e;
      expv[38] = 11'h19e;
      expv[39] = 11'h06e;
      expv[40] = 11'h21e;
      expv[41] = 11'h24e;
      expv[42] = 11'h12e;
      expv[43] = 11'h0ee;
      expv[44] = 11'h08e;
      expv[45] = 11'h08e;
      expv[46] = 11'h30e;
      expv[47] = 11'h06e;
      expv[48] = 11'h00e;
      expv[49] = 11'h02e;
      expv[50] = 11'h30e;
      expv[51] = 11'h30e;
      expv[52] = 11'h30e;
      expv[53] = 11'h19e;
      expv[54] = 11'h79e;
      expv[55] = 11'h06e;
      expv[56] = 11'h40e;
      expv[57] = 11'h30e;
      expv[58] = 11'h21e;
      expv[59] = 11'h19e;
      expv[60] = 11'h0ee;
      expv[61] = 11'h24e;
      expv[62] = 11'h0ee;
      expv[63] = 11'h12e;
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
