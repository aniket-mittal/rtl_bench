// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144596 dut (
    .A(in_vec[9:6]),
    .B(in_vec[5:2]),
    .shift(in_vec[1:0]),
    .OUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h21c;
    stim[1] = 10'h3f4;
    stim[2] = 10'h2c8;
    stim[3] = 10'h38f;
    stim[4] = 10'h3ef;
    stim[5] = 10'h361;
    stim[6] = 10'h18d;
    stim[7] = 10'h34c;
    stim[8] = 10'h27b;
    stim[9] = 10'h2cf;
    stim[10] = 10'h114;
    stim[11] = 10'h39d;
    stim[12] = 10'h10f;
    stim[13] = 10'h020;
    stim[14] = 10'h1e6;
    stim[15] = 10'h128;
    stim[16] = 10'h072;
    stim[17] = 10'h308;
    stim[18] = 10'h21c;
    stim[19] = 10'h2e5;
    stim[20] = 10'h038;
    stim[21] = 10'h309;
    stim[22] = 10'h070;
    stim[23] = 10'h324;
    stim[24] = 10'h07f;
    stim[25] = 10'h20f;
    stim[26] = 10'h327;
    stim[27] = 10'h12c;
    stim[28] = 10'h360;
    stim[29] = 10'h04e;
    stim[30] = 10'h376;
    stim[31] = 10'h17a;
    stim[32] = 10'h29c;
    stim[33] = 10'h2bf;
    stim[34] = 10'h1c9;
    stim[35] = 10'h1ae;
    stim[36] = 10'h14b;
    stim[37] = 10'h041;
    stim[38] = 10'h1cd;
    stim[39] = 10'h2af;
    stim[40] = 10'h078;
    stim[41] = 10'h07e;
    stim[42] = 10'h3eb;
    stim[43] = 10'h094;
    stim[44] = 10'h231;
    stim[45] = 10'h2eb;
    stim[46] = 10'h106;
    stim[47] = 10'h169;
    stim[48] = 10'h1b5;
    stim[49] = 10'h0d6;
    stim[50] = 10'h1a8;
    stim[51] = 10'h041;
    stim[52] = 10'h185;
    stim[53] = 10'h184;
    stim[54] = 10'h040;
    stim[55] = 10'h3f1;
    stim[56] = 10'h365;
    stim[57] = 10'h028;
    stim[58] = 10'h0c1;
    stim[59] = 10'h07b;
    stim[60] = 10'h107;
    stim[61] = 10'h03d;
    stim[62] = 10'h244;
    stim[63] = 10'h3bf;
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
      expv[0] = 8'h38;
      expv[1] = 8'hc3;
      expv[2] = 8'h16;
      expv[3] = 8'h15;
      expv[4] = 8'hd2;
      expv[5] = 8'hd0;
      expv[6] = 8'h24;
      expv[7] = 8'h27;
      expv[8] = 8'h3f;
      expv[9] = 8'h90;
      expv[10] = 8'h14;
      expv[11] = 8'hc4;
      expv[12] = 8'h06;
      expv[13] = 8'h00;
      expv[14] = 8'hfc;
      expv[15] = 8'h28;
      expv[16] = 8'h30;
      expv[17] = 8'h18;
      expv[18] = 8'h38;
      expv[19] = 8'hc6;
      expv[20] = 8'h00;
      expv[21] = 8'h30;
      expv[22] = 8'h0c;
      expv[23] = 8'h6c;
      expv[24] = 8'h87;
      expv[25] = 8'h0c;
      expv[26] = 8'h36;
      expv[27] = 8'h2c;
      expv[28] = 8'h68;
      expv[29] = 8'h0c;
      expv[30] = 8'ha6;
      expv[31] = 8'h19;
      expv[32] = 8'h46;
      expv[33] = 8'h4b;
      expv[34] = 8'h1c;
      expv[35] = 8'h09;
      expv[36] = 8'h05;
      expv[37] = 8'h00;
      expv[38] = 8'h2a;
      expv[39] = 8'h37;
      expv[40] = 8'h0e;
      expv[41] = 8'h3c;
      expv[42] = 8'h4b;
      expv[43] = 8'h0a;
      expv[44] = 8'hc0;
      expv[45] = 8'h37;
      expv[46] = 8'h10;
      expv[47] = 8'h64;
      expv[48] = 8'h9c;
      expv[49] = 8'h3c;
      expv[50] = 8'h3c;
      expv[51] = 8'h00;
      expv[52] = 8'h0c;
      expv[53] = 8'h06;
      expv[54] = 8'h00;
      expv[55] = 8'h69;
      expv[56] = 8'hea;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h07;
      expv[60] = 8'h02;
      expv[61] = 8'h00;
      expv[62] = 8'h09;
      expv[63] = 8'h69;
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
