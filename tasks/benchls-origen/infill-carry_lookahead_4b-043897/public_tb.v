// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_043897 dut (
    .cin(in_vec[8:8]),
    .P(in_vec[7:4]),
    .G(in_vec[3:0]),
    .C(out_vec[5:2]),
    .GG(out_vec[1:1]),
    .PG(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0a2;
    stim[1] = 9'h022;
    stim[2] = 9'h043;
    stim[3] = 9'h1b4;
    stim[4] = 9'h140;
    stim[5] = 9'h17e;
    stim[6] = 9'h05f;
    stim[7] = 9'h179;
    stim[8] = 9'h04f;
    stim[9] = 9'h15b;
    stim[10] = 9'h0bb;
    stim[11] = 9'h180;
    stim[12] = 9'h147;
    stim[13] = 9'h184;
    stim[14] = 9'h02f;
    stim[15] = 9'h0d9;
    stim[16] = 9'h153;
    stim[17] = 9'h0ec;
    stim[18] = 9'h091;
    stim[19] = 9'h034;
    stim[20] = 9'h1a4;
    stim[21] = 9'h14e;
    stim[22] = 9'h01e;
    stim[23] = 9'h164;
    stim[24] = 9'h000;
    stim[25] = 9'h036;
    stim[26] = 9'h1f9;
    stim[27] = 9'h00c;
    stim[28] = 9'h002;
    stim[29] = 9'h15a;
    stim[30] = 9'h026;
    stim[31] = 9'h00c;
    stim[32] = 9'h05c;
    stim[33] = 9'h128;
    stim[34] = 9'h0ec;
    stim[35] = 9'h134;
    stim[36] = 9'h158;
    stim[37] = 9'h062;
    stim[38] = 9'h098;
    stim[39] = 9'h037;
    stim[40] = 9'h019;
    stim[41] = 9'h042;
    stim[42] = 9'h148;
    stim[43] = 9'h088;
    stim[44] = 9'h0b7;
    stim[45] = 9'h03b;
    stim[46] = 9'h1dd;
    stim[47] = 9'h1d8;
    stim[48] = 9'h161;
    stim[49] = 9'h072;
    stim[50] = 9'h0af;
    stim[51] = 9'h14c;
    stim[52] = 9'h110;
    stim[53] = 9'h037;
    stim[54] = 9'h0e7;
    stim[55] = 9'h017;
    stim[56] = 9'h0c3;
    stim[57] = 9'h090;
    stim[58] = 9'h1e1;
    stim[59] = 9'h16e;
    stim[60] = 9'h0d8;
    stim[61] = 9'h1c6;
    stim[62] = 9'h052;
    stim[63] = 9'h18c;
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
      expv[0] = 6'h08;
      expv[1] = 6'h08;
      expv[2] = 6'h1c;
      expv[3] = 6'h3e;
      expv[4] = 6'h00;
      expv[5] = 6'h3e;
      expv[6] = 6'h3e;
      expv[7] = 6'h3e;
      expv[8] = 6'h3e;
      expv[9] = 6'h3e;
      expv[10] = 6'h2e;
      expv[11] = 6'h00;
      expv[12] = 6'h1c;
      expv[13] = 6'h32;
      expv[14] = 6'h3e;
      expv[15] = 6'h26;
      expv[16] = 6'h1c;
      expv[17] = 6'h32;
      expv[18] = 6'h04;
      expv[19] = 6'h10;
      expv[20] = 6'h32;
      expv[21] = 6'h3a;
      expv[22] = 6'h3a;
      expv[23] = 6'h10;
      expv[24] = 6'h00;
      expv[25] = 6'h18;
      expv[26] = 6'h3f;
      expv[27] = 6'h32;
      expv[28] = 6'h08;
      expv[29] = 6'h3e;
      expv[30] = 6'h18;
      expv[31] = 6'h32;
      expv[32] = 6'h32;
      expv[33] = 6'h22;
      expv[34] = 6'h32;
      expv[35] = 6'h1c;
      expv[36] = 6'h26;
      expv[37] = 6'h18;
      expv[38] = 6'h22;
      expv[39] = 6'h1c;
      expv[40] = 6'h26;
      expv[41] = 6'h18;
      expv[42] = 6'h22;
      expv[43] = 6'h22;
      expv[44] = 6'h3e;
      expv[45] = 6'h2e;
      expv[46] = 6'h36;
      expv[47] = 6'h26;
      expv[48] = 6'h1c;
      expv[49] = 6'h18;
      expv[50] = 6'h3e;
      expv[51] = 6'h32;
      expv[52] = 6'h04;
      expv[53] = 6'h1c;
      expv[54] = 6'h3e;
      expv[55] = 6'h1c;
      expv[56] = 6'h3e;
      expv[57] = 6'h00;
      expv[58] = 6'h3e;
      expv[59] = 6'h3a;
      expv[60] = 6'h22;
      expv[61] = 6'h3a;
      expv[62] = 6'h18;
      expv[63] = 6'h32;
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
