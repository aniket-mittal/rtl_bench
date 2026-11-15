// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09985 dut (
    .clk(clk),
    .reset_n(in_vec[10:10]),
    .in_valid(in_vec[9:9]),
    .in_data(in_vec[8:1]),
    .out_ready(in_vec[0:0]),
    .out_valid(out_vec[8:8]),
    .out_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h062;
    stim[1] = 11'h09a;
    stim[2] = 11'h470;
    stim[3] = 11'h5f2;
    stim[4] = 11'h598;
    stim[5] = 11'h721;
    stim[6] = 11'h6a0;
    stim[7] = 11'h660;
    stim[8] = 11'h7f8;
    stim[9] = 11'h5a8;
    stim[10] = 11'h668;
    stim[11] = 11'h520;
    stim[12] = 11'h4e1;
    stim[13] = 11'h654;
    stim[14] = 11'h7a6;
    stim[15] = 11'h506;
    stim[16] = 11'h59c;
    stim[17] = 11'h59d;
    stim[18] = 11'h750;
    stim[19] = 11'h6c1;
    stim[20] = 11'h66d;
    stim[21] = 11'h610;
    stim[22] = 11'h529;
    stim[23] = 11'h6b3;
    stim[24] = 11'h604;
    stim[25] = 11'h646;
    stim[26] = 11'h7f2;
    stim[27] = 11'h400;
    stim[28] = 11'h519;
    stim[29] = 11'h553;
    stim[30] = 11'h4e4;
    stim[31] = 11'h6b1;
    stim[32] = 11'h656;
    stim[33] = 11'h5bc;
    stim[34] = 11'h60a;
    stim[35] = 11'h7b6;
    stim[36] = 11'h4fe;
    stim[37] = 11'h5ab;
    stim[38] = 11'h73a;
    stim[39] = 11'h5b7;
    stim[40] = 11'h461;
    stim[41] = 11'h6e1;
    stim[42] = 11'h5ac;
    stim[43] = 11'h5e8;
    stim[44] = 11'h745;
    stim[45] = 11'h748;
    stim[46] = 11'h6d6;
    stim[47] = 11'h605;
    stim[48] = 11'h5aa;
    stim[49] = 11'h5dc;
    stim[50] = 11'h46d;
    stim[51] = 11'h695;
    stim[52] = 11'h495;
    stim[53] = 11'h770;
    stim[54] = 11'h78f;
    stim[55] = 11'h5b2;
    stim[56] = 11'h547;
    stim[57] = 11'h7b0;
    stim[58] = 11'h75a;
    stim[59] = 11'h74e;
    stim[60] = 11'h68b;
    stim[61] = 11'h780;
    stim[62] = 11'h405;
    stim[63] = 11'h550;
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
      expv[0] = 9'h031;
      expv[1] = 9'h04d;
      expv[2] = 9'h038;
      expv[3] = 9'h0f9;
      expv[4] = 9'h0cc;
      expv[5] = 9'h190;
      expv[6] = 9'h150;
      expv[7] = 9'h130;
      expv[8] = 9'h1fc;
      expv[9] = 9'h0d4;
      expv[10] = 9'h134;
      expv[11] = 9'h090;
      expv[12] = 9'h070;
      expv[13] = 9'h12a;
      expv[14] = 9'h1d3;
      expv[15] = 9'h083;
      expv[16] = 9'h0ce;
      expv[17] = 9'h0ce;
      expv[18] = 9'h1a8;
      expv[19] = 9'h160;
      expv[20] = 9'h136;
      expv[21] = 9'h108;
      expv[22] = 9'h094;
      expv[23] = 9'h159;
      expv[24] = 9'h102;
      expv[25] = 9'h123;
      expv[26] = 9'h1f9;
      expv[27] = 9'h000;
      expv[28] = 9'h08c;
      expv[29] = 9'h0a9;
      expv[30] = 9'h072;
      expv[31] = 9'h158;
      expv[32] = 9'h12b;
      expv[33] = 9'h0de;
      expv[34] = 9'h105;
      expv[35] = 9'h1db;
      expv[36] = 9'h07f;
      expv[37] = 9'h0d5;
      expv[38] = 9'h19d;
      expv[39] = 9'h0db;
      expv[40] = 9'h030;
      expv[41] = 9'h170;
      expv[42] = 9'h0d6;
      expv[43] = 9'h0f4;
      expv[44] = 9'h1a2;
      expv[45] = 9'h1a4;
      expv[46] = 9'h16b;
      expv[47] = 9'h102;
      expv[48] = 9'h0d5;
      expv[49] = 9'h0ee;
      expv[50] = 9'h036;
      expv[51] = 9'h14a;
      expv[52] = 9'h04a;
      expv[53] = 9'h1b8;
      expv[54] = 9'h1c7;
      expv[55] = 9'h0d9;
      expv[56] = 9'h0a3;
      expv[57] = 9'h1d8;
      expv[58] = 9'h1ad;
      expv[59] = 9'h1a7;
      expv[60] = 9'h145;
      expv[61] = 9'h1c0;
      expv[62] = 9'h002;
      expv[63] = 9'h0a8;
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
