// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133808 dut (
    .clk(clk),
    .rst_n(in_vec[8:8]),
    .binary_input(in_vec[7:0]),
    .bcd_output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0c0;
    stim[1] = 9'h0e6;
    stim[2] = 9'h19d;
    stim[3] = 9'h161;
    stim[4] = 9'h158;
    stim[5] = 9'h181;
    stim[6] = 9'h177;
    stim[7] = 9'h1d2;
    stim[8] = 9'h1a0;
    stim[9] = 9'h1f1;
    stim[10] = 9'h13d;
    stim[11] = 9'h12d;
    stim[12] = 9'h18a;
    stim[13] = 9'h10b;
    stim[14] = 9'h1af;
    stim[15] = 9'h15e;
    stim[16] = 9'h1dd;
    stim[17] = 9'h147;
    stim[18] = 9'h1d7;
    stim[19] = 9'h157;
    stim[20] = 9'h107;
    stim[21] = 9'h18a;
    stim[22] = 9'h1e6;
    stim[23] = 9'h1f0;
    stim[24] = 9'h109;
    stim[25] = 9'h1d4;
    stim[26] = 9'h15f;
    stim[27] = 9'h1cf;
    stim[28] = 9'h1ef;
    stim[29] = 9'h15a;
    stim[30] = 9'h1c9;
    stim[31] = 9'h119;
    stim[32] = 9'h171;
    stim[33] = 9'h103;
    stim[34] = 9'h186;
    stim[35] = 9'h142;
    stim[36] = 9'h1fe;
    stim[37] = 9'h121;
    stim[38] = 9'h10c;
    stim[39] = 9'h1c7;
    stim[40] = 9'h172;
    stim[41] = 9'h171;
    stim[42] = 9'h187;
    stim[43] = 9'h1e0;
    stim[44] = 9'h186;
    stim[45] = 9'h147;
    stim[46] = 9'h14b;
    stim[47] = 9'h1cc;
    stim[48] = 9'h1ec;
    stim[49] = 9'h1c9;
    stim[50] = 9'h1e2;
    stim[51] = 9'h1e6;
    stim[52] = 9'h1ef;
    stim[53] = 9'h153;
    stim[54] = 9'h140;
    stim[55] = 9'h137;
    stim[56] = 9'h1ce;
    stim[57] = 9'h1bb;
    stim[58] = 9'h18b;
    stim[59] = 9'h179;
    stim[60] = 9'h142;
    stim[61] = 9'h106;
    stim[62] = 9'h1d3;
    stim[63] = 9'h1cf;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h009d;
      expv[5] = 16'h00fc;
      expv[6] = 16'h0039;
      expv[7] = 16'h00d9;
      expv[8] = 16'h00f6;
      expv[9] = 16'h00a5;
      expv[10] = 16'h00a2;
      expv[11] = 16'h00a1;
      expv[12] = 16'h00cc;
      expv[13] = 16'h00c0;
      expv[14] = 16'h01a7;
      expv[15] = 16'h0181;
      expv[16] = 16'h01a4;
      expv[17] = 16'h01f1;
      expv[18] = 16'h0183;
      expv[19] = 16'h019a;
      expv[20] = 16'h0190;
      expv[21] = 16'h0180;
      expv[22] = 16'h0180;
      expv[23] = 16'h028d;
      expv[24] = 16'h028c;
      expv[25] = 16'h0286;
      expv[26] = 16'h02f9;
      expv[27] = 16'h02dd;
      expv[28] = 16'h028b;
      expv[29] = 16'h0290;
      expv[30] = 16'h0220;
      expv[31] = 16'h02b5;
      expv[32] = 16'h0293;
      expv[33] = 16'h03d0;
      expv[34] = 16'h03d8;
      expv[35] = 16'h03d2;
      expv[36] = 16'h0385;
      expv[37] = 16'h03c4;
      expv[38] = 16'h03bc;
      expv[39] = 16'h03df;
      expv[40] = 16'h032d;
      expv[41] = 16'h03cb;
      expv[42] = 16'h03b5;
      expv[43] = 16'h03b3;
      expv[44] = 16'h04f6;
      expv[45] = 16'h04f7;
      expv[46] = 16'h04f6;
      expv[47] = 16'h04c1;
      expv[48] = 16'h04cc;
      expv[49] = 16'h0487;
      expv[50] = 16'h0420;
      expv[51] = 16'h0425;
      expv[52] = 16'h042b;
      expv[53] = 16'h0424;
      expv[54] = 16'h0429;
      expv[55] = 16'h05bc;
      expv[56] = 16'h05b3;
      expv[57] = 16'h05b7;
      expv[58] = 16'h05f9;
      expv[59] = 16'h05f5;
      expv[60] = 16'h0530;
      expv[61] = 16'h05f2;
      expv[62] = 16'h053b;
      expv[63] = 16'h0634;
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
