// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04094 dut (
    .address(in_vec[22:0]),
    .flash_addr(out_vec[22:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h7255d6;
    stim[1] = 23'h178477;
    stim[2] = 23'h75c81b;
    stim[3] = 23'h1625d8;
    stim[4] = 23'h2777e8;
    stim[5] = 23'h2b1dbd;
    stim[6] = 23'h7ce64f;
    stim[7] = 23'h470ecc;
    stim[8] = 23'h187156;
    stim[9] = 23'h5943f2;
    stim[10] = 23'h390536;
    stim[11] = 23'h743810;
    stim[12] = 23'h3c0adf;
    stim[13] = 23'h6b1f29;
    stim[14] = 23'h7f4747;
    stim[15] = 23'h1d36d4;
    stim[16] = 23'h504388;
    stim[17] = 23'h6f8f23;
    stim[18] = 23'h472ddb;
    stim[19] = 23'h0e6f2b;
    stim[20] = 23'h0f512b;
    stim[21] = 23'h46442d;
    stim[22] = 23'h427b47;
    stim[23] = 23'h79a7b2;
    stim[24] = 23'h7fccd4;
    stim[25] = 23'h780cc1;
    stim[26] = 23'h3a1105;
    stim[27] = 23'h711141;
    stim[28] = 23'h4d4186;
    stim[29] = 23'h718eba;
    stim[30] = 23'h76fe0b;
    stim[31] = 23'h113a60;
    stim[32] = 23'h620dbf;
    stim[33] = 23'h74b1a7;
    stim[34] = 23'h7d553c;
    stim[35] = 23'h1e2f56;
    stim[36] = 23'h0d3077;
    stim[37] = 23'h039221;
    stim[38] = 23'h1ff27c;
    stim[39] = 23'h7124da;
    stim[40] = 23'h3fc4df;
    stim[41] = 23'h621fb8;
    stim[42] = 23'h7340d8;
    stim[43] = 23'h103f15;
    stim[44] = 23'h66e517;
    stim[45] = 23'h56e7bc;
    stim[46] = 23'h460b71;
    stim[47] = 23'h021a09;
    stim[48] = 23'h096fe5;
    stim[49] = 23'h04b9a5;
    stim[50] = 23'h4d3a46;
    stim[51] = 23'h4addcb;
    stim[52] = 23'h570ded;
    stim[53] = 23'h118b1b;
    stim[54] = 23'h70c2c2;
    stim[55] = 23'h1afac6;
    stim[56] = 23'h63cd61;
    stim[57] = 23'h666d37;
    stim[58] = 23'h1b3736;
    stim[59] = 23'h6348f4;
    stim[60] = 23'h67451e;
    stim[61] = 23'h56bdf4;
    stim[62] = 23'h1215bb;
    stim[63] = 23'h4bee87;
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
      expv[0] = 23'h7255d7;
      expv[1] = 23'h178478;
      expv[2] = 23'h75c81c;
      expv[3] = 23'h1625d9;
      expv[4] = 23'h2777e9;
      expv[5] = 23'h2b1dbe;
      expv[6] = 23'h7ce650;
      expv[7] = 23'h470ecd;
      expv[8] = 23'h187157;
      expv[9] = 23'h5943f3;
      expv[10] = 23'h390537;
      expv[11] = 23'h743811;
      expv[12] = 23'h3c0ae0;
      expv[13] = 23'h6b1f2a;
      expv[14] = 23'h7f4748;
      expv[15] = 23'h1d36d5;
      expv[16] = 23'h504389;
      expv[17] = 23'h6f8f24;
      expv[18] = 23'h472ddc;
      expv[19] = 23'h0e6f2c;
      expv[20] = 23'h0f512c;
      expv[21] = 23'h46442e;
      expv[22] = 23'h427b48;
      expv[23] = 23'h79a7b3;
      expv[24] = 23'h7fccd5;
      expv[25] = 23'h780cc2;
      expv[26] = 23'h3a1106;
      expv[27] = 23'h711142;
      expv[28] = 23'h4d4187;
      expv[29] = 23'h718ebb;
      expv[30] = 23'h76fe0c;
      expv[31] = 23'h113a61;
      expv[32] = 23'h620dc0;
      expv[33] = 23'h74b1a8;
      expv[34] = 23'h7d553d;
      expv[35] = 23'h1e2f57;
      expv[36] = 23'h0d3078;
      expv[37] = 23'h039222;
      expv[38] = 23'h1ff27d;
      expv[39] = 23'h7124db;
      expv[40] = 23'h3fc4e0;
      expv[41] = 23'h621fb9;
      expv[42] = 23'h7340d9;
      expv[43] = 23'h103f16;
      expv[44] = 23'h66e518;
      expv[45] = 23'h56e7bd;
      expv[46] = 23'h460b72;
      expv[47] = 23'h021a0a;
      expv[48] = 23'h096fe6;
      expv[49] = 23'h04b9a6;
      expv[50] = 23'h4d3a47;
      expv[51] = 23'h4addcc;
      expv[52] = 23'h570dee;
      expv[53] = 23'h118b1c;
      expv[54] = 23'h70c2c3;
      expv[55] = 23'h1afac7;
      expv[56] = 23'h63cd62;
      expv[57] = 23'h666d38;
      expv[58] = 23'h1b3737;
      expv[59] = 23'h6348f5;
      expv[60] = 23'h67451f;
      expv[61] = 23'h56bdf5;
      expv[62] = 23'h1215bc;
      expv[63] = 23'h4bee88;
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
