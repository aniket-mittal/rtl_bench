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

  mg_00839 dut (
    .clk(clk),
    .data_in(in_vec[8:1]),
    .we(in_vec[0:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0e1;
    stim[1] = 9'h0c9;
    stim[2] = 9'h0de;
    stim[3] = 9'h137;
    stim[4] = 9'h108;
    stim[5] = 9'h00e;
    stim[6] = 9'h006;
    stim[7] = 9'h087;
    stim[8] = 9'h0db;
    stim[9] = 9'h10c;
    stim[10] = 9'h0ef;
    stim[11] = 9'h134;
    stim[12] = 9'h010;
    stim[13] = 9'h03f;
    stim[14] = 9'h016;
    stim[15] = 9'h062;
    stim[16] = 9'h02c;
    stim[17] = 9'h1c7;
    stim[18] = 9'h144;
    stim[19] = 9'h024;
    stim[20] = 9'h1b9;
    stim[21] = 9'h097;
    stim[22] = 9'h0db;
    stim[23] = 9'h1e0;
    stim[24] = 9'h035;
    stim[25] = 9'h02f;
    stim[26] = 9'h13e;
    stim[27] = 9'h00b;
    stim[28] = 9'h158;
    stim[29] = 9'h0ac;
    stim[30] = 9'h19c;
    stim[31] = 9'h0bd;
    stim[32] = 9'h0d7;
    stim[33] = 9'h1ac;
    stim[34] = 9'h16c;
    stim[35] = 9'h19e;
    stim[36] = 9'h01e;
    stim[37] = 9'h071;
    stim[38] = 9'h11d;
    stim[39] = 9'h1d2;
    stim[40] = 9'h0c7;
    stim[41] = 9'h03b;
    stim[42] = 9'h1e8;
    stim[43] = 9'h103;
    stim[44] = 9'h00b;
    stim[45] = 9'h0bc;
    stim[46] = 9'h077;
    stim[47] = 9'h15a;
    stim[48] = 9'h12f;
    stim[49] = 9'h0a7;
    stim[50] = 9'h0ff;
    stim[51] = 9'h179;
    stim[52] = 9'h131;
    stim[53] = 9'h162;
    stim[54] = 9'h1ea;
    stim[55] = 9'h012;
    stim[56] = 9'h02c;
    stim[57] = 9'h1f8;
    stim[58] = 9'h11b;
    stim[59] = 9'h10f;
    stim[60] = 9'h187;
    stim[61] = 9'h1d6;
    stim[62] = 9'h005;
    stim[63] = 9'h17f;
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
      expv[1] = 8'h70;
      expv[2] = 8'h64;
      expv[3] = 8'h64;
      expv[4] = 8'h9b;
      expv[5] = 8'h9b;
      expv[6] = 8'h9b;
      expv[7] = 8'h9b;
      expv[8] = 8'h43;
      expv[9] = 8'h6d;
      expv[10] = 8'h6d;
      expv[11] = 8'h77;
      expv[12] = 8'h77;
      expv[13] = 8'h77;
      expv[14] = 8'h1f;
      expv[15] = 8'h1f;
      expv[16] = 8'h1f;
      expv[17] = 8'h1f;
      expv[18] = 8'he3;
      expv[19] = 8'he3;
      expv[20] = 8'he3;
      expv[21] = 8'hdc;
      expv[22] = 8'h4b;
      expv[23] = 8'h6d;
      expv[24] = 8'h6d;
      expv[25] = 8'h1a;
      expv[26] = 8'h17;
      expv[27] = 8'h17;
      expv[28] = 8'h05;
      expv[29] = 8'h05;
      expv[30] = 8'h05;
      expv[31] = 8'h05;
      expv[32] = 8'h5e;
      expv[33] = 8'h6b;
      expv[34] = 8'h6b;
      expv[35] = 8'h6b;
      expv[36] = 8'h6b;
      expv[37] = 8'h6b;
      expv[38] = 8'h38;
      expv[39] = 8'h8e;
      expv[40] = 8'h8e;
      expv[41] = 8'h63;
      expv[42] = 8'h1d;
      expv[43] = 8'h1d;
      expv[44] = 8'h81;
      expv[45] = 8'h05;
      expv[46] = 8'h05;
      expv[47] = 8'h3b;
      expv[48] = 8'h3b;
      expv[49] = 8'h97;
      expv[50] = 8'h53;
      expv[51] = 8'h7f;
      expv[52] = 8'hbc;
      expv[53] = 8'h98;
      expv[54] = 8'h98;
      expv[55] = 8'h98;
      expv[56] = 8'h98;
      expv[57] = 8'h98;
      expv[58] = 8'h98;
      expv[59] = 8'h8d;
      expv[60] = 8'h87;
      expv[61] = 8'hc3;
      expv[62] = 8'hc3;
      expv[63] = 8'h02;
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
