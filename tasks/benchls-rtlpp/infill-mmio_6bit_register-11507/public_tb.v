// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11507 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[37:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1db541f91b;
    stim[1] = 37'h0864ba4ec0;
    stim[2] = 37'h1e590c91d2;
    stim[3] = 37'h1eb5760d76;
    stim[4] = 37'h0732c269e0;
    stim[5] = 37'h03a8e97a12;
    stim[6] = 37'h1605ed42c8;
    stim[7] = 37'h170ade02e1;
    stim[8] = 37'h163ea61bbf;
    stim[9] = 37'h1e0bbd767e;
    stim[10] = 37'h0b15face34;
    stim[11] = 37'h0b9a6d2169;
    stim[12] = 37'h1f82b3ac6b;
    stim[13] = 37'h0a111285f1;
    stim[14] = 37'h07417b8f30;
    stim[15] = 37'h0f6377d665;
    stim[16] = 37'h16c8e3f50f;
    stim[17] = 37'h0e0c615248;
    stim[18] = 37'h066e6c4b9d;
    stim[19] = 37'h07b0e2207c;
    stim[20] = 37'h12a18aac2b;
    stim[21] = 37'h1f2f21d0e2;
    stim[22] = 37'h0e2c75b8f6;
    stim[23] = 37'h0a13527cb4;
    stim[24] = 37'h1a59bd55fe;
    stim[25] = 37'h036f122e45;
    stim[26] = 37'h0783bc4a4e;
    stim[27] = 37'h13764f0b32;
    stim[28] = 37'h13af3bfbe0;
    stim[29] = 37'h07ea04a000;
    stim[30] = 37'h1346583bd8;
    stim[31] = 37'h121e984165;
    stim[32] = 37'h1e3de7860c;
    stim[33] = 37'h0a70484a5b;
    stim[34] = 37'h0f7b053bc0;
    stim[35] = 37'h0754b86483;
    stim[36] = 37'h0e868e3618;
    stim[37] = 37'h17b11c0db0;
    stim[38] = 37'h1f46614c73;
    stim[39] = 37'h063c83a859;
    stim[40] = 37'h0f17566011;
    stim[41] = 37'h0f31c096dc;
    stim[42] = 37'h0b1e16f5bc;
    stim[43] = 37'h13ae4cffae;
    stim[44] = 37'h0796a4b69c;
    stim[45] = 37'h02586e2d76;
    stim[46] = 37'h03bf21c494;
    stim[47] = 37'h0f99614f74;
    stim[48] = 37'h0e1d7235e0;
    stim[49] = 37'h16b6763e36;
    stim[50] = 37'h06534a78c7;
    stim[51] = 37'h161fffbfde;
    stim[52] = 37'h122d8014b4;
    stim[53] = 37'h02bc632fa6;
    stim[54] = 37'h1683365520;
    stim[55] = 37'h0bba7dc0a6;
    stim[56] = 37'h12f4244ebb;
    stim[57] = 37'h1f69d34ab4;
    stim[58] = 37'h1e367608f1;
    stim[59] = 37'h0363df0cb9;
    stim[60] = 37'h12c96ba8a3;
    stim[61] = 37'h17c59393b8;
    stim[62] = 37'h12a9ffa5bb;
    stim[63] = 37'h0be8f68446;
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
      expv[0] = 38'h0000000000;
      expv[1] = 38'h0000000000;
      expv[2] = 38'h0000000000;
      expv[3] = 38'h0000000000;
      expv[4] = 38'h0000000000;
      expv[5] = 38'h0000000000;
      expv[6] = 38'h0000000000;
      expv[7] = 38'h0000000000;
      expv[8] = 38'h0000000000;
      expv[9] = 38'h0000000000;
      expv[10] = 38'h0000000000;
      expv[11] = 38'h0000000000;
      expv[12] = 38'h0000000000;
      expv[13] = 38'h0000000000;
      expv[14] = 38'h0000000000;
      expv[15] = 38'h0000000000;
      expv[16] = 38'h0000000000;
      expv[17] = 38'h0000000000;
      expv[18] = 38'h0000000000;
      expv[19] = 38'h1d0000001d;
      expv[20] = 38'h1d00000000;
      expv[21] = 38'h1d00000000;
      expv[22] = 38'h1d00000000;
      expv[23] = 38'h1d00000000;
      expv[24] = 38'h1d00000000;
      expv[25] = 38'h1d0000001d;
      expv[26] = 38'h1d0000001d;
      expv[27] = 38'h1d00000000;
      expv[28] = 38'h1d00000000;
      expv[29] = 38'h1d0000001d;
      expv[30] = 38'h1d00000000;
      expv[31] = 38'h1d00000000;
      expv[32] = 38'h1d00000000;
      expv[33] = 38'h1d00000000;
      expv[34] = 38'h1d00000000;
      expv[35] = 38'h1d0000001d;
      expv[36] = 38'h1d00000000;
      expv[37] = 38'h1d00000000;
      expv[38] = 38'h1d00000000;
      expv[39] = 38'h1d0000001d;
      expv[40] = 38'h1900000000;
      expv[41] = 38'h1900000000;
      expv[42] = 38'h1900000000;
      expv[43] = 38'h1900000000;
      expv[44] = 38'h1900000019;
      expv[45] = 38'h1900000019;
      expv[46] = 38'h1900000019;
      expv[47] = 38'h1900000000;
      expv[48] = 38'h1900000000;
      expv[49] = 38'h1900000000;
      expv[50] = 38'h1900000019;
      expv[51] = 38'h0700000000;
      expv[52] = 38'h0700000000;
      expv[53] = 38'h0700000007;
      expv[54] = 38'h0700000000;
      expv[55] = 38'h0700000000;
      expv[56] = 38'h0700000000;
      expv[57] = 38'h0700000000;
      expv[58] = 38'h0700000000;
      expv[59] = 38'h0700000007;
      expv[60] = 38'h0700000000;
      expv[61] = 38'h0700000000;
      expv[62] = 38'h0700000000;
      expv[63] = 38'h0700000000;
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
