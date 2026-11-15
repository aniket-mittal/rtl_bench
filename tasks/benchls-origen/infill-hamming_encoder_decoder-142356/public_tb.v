// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142356 dut (
    .data(in_vec[4:1]),
    .ctrl(in_vec[0:0]),
    .hamming(out_vec[10:4]),
    .corrected(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h11;
    stim[1] = 5'h04;
    stim[2] = 5'h1c;
    stim[3] = 5'h15;
    stim[4] = 5'h07;
    stim[5] = 5'h1f;
    stim[6] = 5'h0c;
    stim[7] = 5'h06;
    stim[8] = 5'h0f;
    stim[9] = 5'h12;
    stim[10] = 5'h15;
    stim[11] = 5'h17;
    stim[12] = 5'h07;
    stim[13] = 5'h12;
    stim[14] = 5'h03;
    stim[15] = 5'h01;
    stim[16] = 5'h13;
    stim[17] = 5'h06;
    stim[18] = 5'h18;
    stim[19] = 5'h05;
    stim[20] = 5'h10;
    stim[21] = 5'h16;
    stim[22] = 5'h1c;
    stim[23] = 5'h09;
    stim[24] = 5'h1e;
    stim[25] = 5'h01;
    stim[26] = 5'h1d;
    stim[27] = 5'h0d;
    stim[28] = 5'h16;
    stim[29] = 5'h0b;
    stim[30] = 5'h07;
    stim[31] = 5'h09;
    stim[32] = 5'h1e;
    stim[33] = 5'h13;
    stim[34] = 5'h03;
    stim[35] = 5'h16;
    stim[36] = 5'h17;
    stim[37] = 5'h09;
    stim[38] = 5'h1a;
    stim[39] = 5'h0d;
    stim[40] = 5'h0e;
    stim[41] = 5'h04;
    stim[42] = 5'h0f;
    stim[43] = 5'h09;
    stim[44] = 5'h04;
    stim[45] = 5'h17;
    stim[46] = 5'h02;
    stim[47] = 5'h04;
    stim[48] = 5'h10;
    stim[49] = 5'h19;
    stim[50] = 5'h1f;
    stim[51] = 5'h1c;
    stim[52] = 5'h1f;
    stim[53] = 5'h08;
    stim[54] = 5'h02;
    stim[55] = 5'h00;
    stim[56] = 5'h1d;
    stim[57] = 5'h17;
    stim[58] = 5'h02;
    stim[59] = 5'h0a;
    stim[60] = 5'h17;
    stim[61] = 5'h07;
    stim[62] = 5'h0e;
    stim[63] = 5'h1f;
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
      expv[0] = 11'h048;
      expv[1] = 11'h020;
      expv[2] = 11'h0e5;
      expv[3] = 11'h24a;
      expv[4] = 11'h603;
      expv[5] = 11'h74f;
      expv[6] = 11'h061;
      expv[7] = 11'h031;
      expv[8] = 11'h707;
      expv[9] = 11'h092;
      expv[10] = 11'h24a;
      expv[11] = 11'h64b;
      expv[12] = 11'h603;
      expv[13] = 11'h092;
      expv[14] = 11'h401;
      expv[15] = 11'h000;
      expv[16] = 11'h449;
      expv[17] = 11'h031;
      expv[18] = 11'h0c1;
      expv[19] = 11'h202;
      expv[20] = 11'h080;
      expv[21] = 11'h0b8;
      expv[22] = 11'h0e5;
      expv[23] = 11'h104;
      expv[24] = 11'h0f9;
      expv[25] = 11'h000;
      expv[26] = 11'h34e;
      expv[27] = 11'h306;
      expv[28] = 11'h0b8;
      expv[29] = 11'h505;
      expv[30] = 11'h603;
      expv[31] = 11'h104;
      expv[32] = 11'h0f9;
      expv[33] = 11'h449;
      expv[34] = 11'h401;
      expv[35] = 11'h0b8;
      expv[36] = 11'h64b;
      expv[37] = 11'h104;
      expv[38] = 11'h0d3;
      expv[39] = 11'h306;
      expv[40] = 11'h070;
      expv[41] = 11'h020;
      expv[42] = 11'h707;
      expv[43] = 11'h104;
      expv[44] = 11'h020;
      expv[45] = 11'h64b;
      expv[46] = 11'h010;
      expv[47] = 11'h020;
      expv[48] = 11'h080;
      expv[49] = 11'h14c;
      expv[50] = 11'h74f;
      expv[51] = 11'h0e5;
      expv[52] = 11'h74f;
      expv[53] = 11'h041;
      expv[54] = 11'h010;
      expv[55] = 11'h000;
      expv[56] = 11'h34e;
      expv[57] = 11'h64b;
      expv[58] = 11'h010;
      expv[59] = 11'h051;
      expv[60] = 11'h64b;
      expv[61] = 11'h603;
      expv[62] = 11'h070;
      expv[63] = 11'h74f;
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
