// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094319 dut (
    .clk(clk),
    .new_in(in_vec[8:8]),
    .in(in_vec[7:0]),
    .out(out_vec[10:2]),
    .new_char(out_vec[1:1]),
    .jmpff00(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h02f;
    stim[1] = 9'h0ec;
    stim[2] = 9'h03c;
    stim[3] = 9'h018;
    stim[4] = 9'h005;
    stim[5] = 9'h195;
    stim[6] = 9'h0d4;
    stim[7] = 9'h02e;
    stim[8] = 9'h060;
    stim[9] = 9'h00b;
    stim[10] = 9'h0d1;
    stim[11] = 9'h090;
    stim[12] = 9'h1d0;
    stim[13] = 9'h150;
    stim[14] = 9'h086;
    stim[15] = 9'h1c0;
    stim[16] = 9'h0bf;
    stim[17] = 9'h09f;
    stim[18] = 9'h1e0;
    stim[19] = 9'h0fd;
    stim[20] = 9'h1e8;
    stim[21] = 9'h058;
    stim[22] = 9'h0d3;
    stim[23] = 9'h118;
    stim[24] = 9'h115;
    stim[25] = 9'h017;
    stim[26] = 9'h128;
    stim[27] = 9'h01c;
    stim[28] = 9'h05c;
    stim[29] = 9'h0b0;
    stim[30] = 9'h01b;
    stim[31] = 9'h010;
    stim[32] = 9'h0d0;
    stim[33] = 9'h035;
    stim[34] = 9'h1c8;
    stim[35] = 9'h172;
    stim[36] = 9'h0e3;
    stim[37] = 9'h0b3;
    stim[38] = 9'h12b;
    stim[39] = 9'h14b;
    stim[40] = 9'h17f;
    stim[41] = 9'h01e;
    stim[42] = 9'h0a0;
    stim[43] = 9'h089;
    stim[44] = 9'h0e6;
    stim[45] = 9'h15b;
    stim[46] = 9'h0f1;
    stim[47] = 9'h0a0;
    stim[48] = 9'h16f;
    stim[49] = 9'h188;
    stim[50] = 9'h0da;
    stim[51] = 9'h0d1;
    stim[52] = 9'h011;
    stim[53] = 9'h0c7;
    stim[54] = 9'h070;
    stim[55] = 9'h159;
    stim[56] = 9'h156;
    stim[57] = 9'h0c1;
    stim[58] = 9'h1ca;
    stim[59] = 9'h173;
    stim[60] = 9'h045;
    stim[61] = 9'h100;
    stim[62] = 9'h02b;
    stim[63] = 9'h175;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hx02;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h002;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h002;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h002;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h002;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h002;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h002;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h19a;
      expv[40] = 11'h198;
      expv[41] = 11'h198;
      expv[42] = 11'h198;
      expv[43] = 11'h198;
      expv[44] = 11'h198;
      expv[45] = 11'h198;
      expv[46] = 11'h176;
      expv[47] = 11'h174;
      expv[48] = 11'h174;
      expv[49] = 11'h002;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h042;
      expv[57] = 11'h040;
      expv[58] = 11'h040;
      expv[59] = 11'h002;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h002;
      expv[63] = 11'h000;
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
