// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  regn dut (
    .Clock(clk),
    .R(in_vec[8:1]),
    .L(in_vec[0:0]),
    .Q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h180;
    stim[1] = 9'h161;
    stim[2] = 9'h0c2;
    stim[3] = 9'h0b3;
    stim[4] = 9'h12b;
    stim[5] = 9'h1ac;
    stim[6] = 9'h08b;
    stim[7] = 9'h148;
    stim[8] = 9'h1a6;
    stim[9] = 9'h016;
    stim[10] = 9'h077;
    stim[11] = 9'h0af;
    stim[12] = 9'h07e;
    stim[13] = 9'h1e8;
    stim[14] = 9'h0ab;
    stim[15] = 9'h02d;
    stim[16] = 9'h0fa;
    stim[17] = 9'h109;
    stim[18] = 9'h15e;
    stim[19] = 9'h071;
    stim[20] = 9'h05f;
    stim[21] = 9'h1d3;
    stim[22] = 9'h0c6;
    stim[23] = 9'h14a;
    stim[24] = 9'h044;
    stim[25] = 9'h1f6;
    stim[26] = 9'h05b;
    stim[27] = 9'h0f1;
    stim[28] = 9'h0e2;
    stim[29] = 9'h0ce;
    stim[30] = 9'h1eb;
    stim[31] = 9'h1a5;
    stim[32] = 9'h019;
    stim[33] = 9'h144;
    stim[34] = 9'h021;
    stim[35] = 9'h0ce;
    stim[36] = 9'h08e;
    stim[37] = 9'h1cc;
    stim[38] = 9'h147;
    stim[39] = 9'h071;
    stim[40] = 9'h126;
    stim[41] = 9'h199;
    stim[42] = 9'h1ad;
    stim[43] = 9'h0ec;
    stim[44] = 9'h1d5;
    stim[45] = 9'h034;
    stim[46] = 9'h028;
    stim[47] = 9'h12e;
    stim[48] = 9'h19f;
    stim[49] = 9'h1ce;
    stim[50] = 9'h124;
    stim[51] = 9'h0bb;
    stim[52] = 9'h0a2;
    stim[53] = 9'h09f;
    stim[54] = 9'h049;
    stim[55] = 9'h165;
    stim[56] = 9'h127;
    stim[57] = 9'h1ea;
    stim[58] = 9'h131;
    stim[59] = 9'h1e9;
    stim[60] = 9'h10c;
    stim[61] = 9'h0f6;
    stim[62] = 9'h0e9;
    stim[63] = 9'h1d7;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hb0;
      expv[3] = 8'hb0;
      expv[4] = 8'h59;
      expv[5] = 8'h95;
      expv[6] = 8'h95;
      expv[7] = 8'h45;
      expv[8] = 8'h45;
      expv[9] = 8'h45;
      expv[10] = 8'h45;
      expv[11] = 8'h3b;
      expv[12] = 8'h57;
      expv[13] = 8'h57;
      expv[14] = 8'h57;
      expv[15] = 8'h55;
      expv[16] = 8'h16;
      expv[17] = 8'h16;
      expv[18] = 8'h84;
      expv[19] = 8'h84;
      expv[20] = 8'h38;
      expv[21] = 8'h2f;
      expv[22] = 8'he9;
      expv[23] = 8'he9;
      expv[24] = 8'he9;
      expv[25] = 8'he9;
      expv[26] = 8'he9;
      expv[27] = 8'h2d;
      expv[28] = 8'h78;
      expv[29] = 8'h78;
      expv[30] = 8'h78;
      expv[31] = 8'hf5;
      expv[32] = 8'hd2;
      expv[33] = 8'h0c;
      expv[34] = 8'h0c;
      expv[35] = 8'h10;
      expv[36] = 8'h10;
      expv[37] = 8'h10;
      expv[38] = 8'h10;
      expv[39] = 8'ha3;
      expv[40] = 8'h38;
      expv[41] = 8'h38;
      expv[42] = 8'hcc;
      expv[43] = 8'hd6;
      expv[44] = 8'hd6;
      expv[45] = 8'hea;
      expv[46] = 8'hea;
      expv[47] = 8'hea;
      expv[48] = 8'hea;
      expv[49] = 8'hcf;
      expv[50] = 8'hcf;
      expv[51] = 8'hcf;
      expv[52] = 8'h5d;
      expv[53] = 8'h5d;
      expv[54] = 8'h4f;
      expv[55] = 8'h24;
      expv[56] = 8'hb2;
      expv[57] = 8'h93;
      expv[58] = 8'h93;
      expv[59] = 8'h98;
      expv[60] = 8'hf4;
      expv[61] = 8'hf4;
      expv[62] = 8'hf4;
      expv[63] = 8'h74;
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
