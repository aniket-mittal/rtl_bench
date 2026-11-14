// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .do_sub(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[8:1]),
    .result_is_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h034b3;
    stim[1] = 17'h024d8;
    stim[2] = 17'h182f3;
    stim[3] = 17'h08b03;
    stim[4] = 17'h0c167;
    stim[5] = 17'h1549d;
    stim[6] = 17'h03dd4;
    stim[7] = 17'h16533;
    stim[8] = 17'h1b39e;
    stim[9] = 17'h09689;
    stim[10] = 17'h0e12a;
    stim[11] = 17'h0af6a;
    stim[12] = 17'h05940;
    stim[13] = 17'h01844;
    stim[14] = 17'h14ff9;
    stim[15] = 17'h04bdc;
    stim[16] = 17'h1c616;
    stim[17] = 17'h18be4;
    stim[18] = 17'h07c27;
    stim[19] = 17'h0bf48;
    stim[20] = 17'h1cc52;
    stim[21] = 17'h02332;
    stim[22] = 17'h1a9be;
    stim[23] = 17'h18143;
    stim[24] = 17'h1e5c1;
    stim[25] = 17'h0439c;
    stim[26] = 17'h1904a;
    stim[27] = 17'h13fa1;
    stim[28] = 17'h0e06e;
    stim[29] = 17'h1f558;
    stim[30] = 17'h0425d;
    stim[31] = 17'h1220d;
    stim[32] = 17'h056d4;
    stim[33] = 17'h0518f;
    stim[34] = 17'h18f73;
    stim[35] = 17'h191f2;
    stim[36] = 17'h157a7;
    stim[37] = 17'h05be6;
    stim[38] = 17'h1c091;
    stim[39] = 17'h1e6fe;
    stim[40] = 17'h098f1;
    stim[41] = 17'h17164;
    stim[42] = 17'h11d69;
    stim[43] = 17'h088fd;
    stim[44] = 17'h10e3f;
    stim[45] = 17'h03c0a;
    stim[46] = 17'h1bd37;
    stim[47] = 17'h1eeca;
    stim[48] = 17'h1a1ea;
    stim[49] = 17'h07b0b;
    stim[50] = 17'h04756;
    stim[51] = 17'h0dbd4;
    stim[52] = 17'h020d4;
    stim[53] = 17'h18b4f;
    stim[54] = 17'h0e5b3;
    stim[55] = 17'h0b9df;
    stim[56] = 17'h1265d;
    stim[57] = 17'h025db;
    stim[58] = 17'h1d2ba;
    stim[59] = 17'h0e8eb;
    stim[60] = 17'h08b3d;
    stim[61] = 17'h1337f;
    stim[62] = 17'h0a8f2;
    stim[63] = 17'h10023;
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
      expv[0] = 9'h1ce;
      expv[1] = 9'h1f8;
      expv[2] = 9'h11e;
      expv[3] = 9'h11c;
      expv[4] = 9'h050;
      expv[5] = 9'h16e;
      expv[6] = 9'h022;
      expv[7] = 9'h064;
      expv[8] = 9'h02a;
      expv[9] = 9'h03e;
      expv[10] = 9'h016;
      expv[11] = 9'h032;
      expv[12] = 9'h132;
      expv[13] = 9'h0b8;
      expv[14] = 9'h0ac;
      expv[15] = 9'h04e;
      expv[16] = 9'h161;
      expv[17] = 9'h14e;
      expv[18] = 9'h146;
      expv[19] = 9'h00e;
      expv[20] = 9'h0f4;
      expv[21] = 9'h0aa;
      expv[22] = 9'h1d6;
      expv[23] = 9'h07c;
      expv[24] = 9'h048;
      expv[25] = 9'h1be;
      expv[26] = 9'h08c;
      expv[27] = 9'h13c;
      expv[28] = 9'h09c;
      expv[29] = 9'h13a;
      expv[30] = 9'h13e;
      expv[31] = 9'h02a;
      expv[32] = 9'h054;
      expv[33] = 9'h1c1;
      expv[34] = 9'h038;
      expv[35] = 9'h13e;
      expv[36] = 9'h161;
      expv[37] = 9'h082;
      expv[38] = 9'h05e;
      expv[39] = 9'h1d0;
      expv[40] = 9'h112;
      expv[41] = 9'h01a;
      expv[42] = 9'h168;
      expv[43] = 9'h10a;
      expv[44] = 9'h19e;
      expv[45] = 9'h08c;
      expv[46] = 9'h10c;
      expv[47] = 9'h048;
      expv[48] = 9'h16e;
      expv[49] = 9'h10c;
      expv[50] = 9'h13a;
      expv[51] = 9'h15e;
      expv[52] = 9'h1e8;
      expv[53] = 9'h078;
      expv[54] = 9'h130;
      expv[55] = 9'h130;
      expv[56] = 9'h192;
      expv[57] = 9'h001;
      expv[58] = 9'h030;
      expv[59] = 9'h1a6;
      expv[60] = 9'h190;
      expv[61] = 9'h168;
      expv[62] = 9'h134;
      expv[63] = 9'h1ba;
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
