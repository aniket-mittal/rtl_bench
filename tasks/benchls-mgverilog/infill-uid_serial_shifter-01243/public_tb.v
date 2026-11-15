// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01243 dut (
    .uidbitclk(clk),
    .reset(in_vec[8:8]),
    .uid_byte_in(in_vec[7:0]),
    .uidbitout(out_vec[6:6]),
    .uidbitdone(out_vec[5:5]),
    .uid_addr_out(out_vec[4:1]),
    .uid_clk_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1a1;
    stim[1] = 9'h1e4;
    stim[2] = 9'h029;
    stim[3] = 9'h0c6;
    stim[4] = 9'h025;
    stim[5] = 9'h038;
    stim[6] = 9'h004;
    stim[7] = 9'h0c7;
    stim[8] = 9'h0a4;
    stim[9] = 9'h041;
    stim[10] = 9'h094;
    stim[11] = 9'h0f2;
    stim[12] = 9'h0ab;
    stim[13] = 9'h0e7;
    stim[14] = 9'h024;
    stim[15] = 9'h02a;
    stim[16] = 9'h0d1;
    stim[17] = 9'h09d;
    stim[18] = 9'h02b;
    stim[19] = 9'h000;
    stim[20] = 9'h088;
    stim[21] = 9'h003;
    stim[22] = 9'h0ed;
    stim[23] = 9'h0a8;
    stim[24] = 9'h0dc;
    stim[25] = 9'h0b3;
    stim[26] = 9'h0fd;
    stim[27] = 9'h09f;
    stim[28] = 9'h0c8;
    stim[29] = 9'h096;
    stim[30] = 9'h0ba;
    stim[31] = 9'h0bf;
    stim[32] = 9'h0a4;
    stim[33] = 9'h09a;
    stim[34] = 9'h003;
    stim[35] = 9'h0ff;
    stim[36] = 9'h063;
    stim[37] = 9'h057;
    stim[38] = 9'h06d;
    stim[39] = 9'h064;
    stim[40] = 9'h006;
    stim[41] = 9'h068;
    stim[42] = 9'h07c;
    stim[43] = 9'h0fd;
    stim[44] = 9'h093;
    stim[45] = 9'h086;
    stim[46] = 9'h0cb;
    stim[47] = 9'h004;
    stim[48] = 9'h0d9;
    stim[49] = 9'h000;
    stim[50] = 9'h095;
    stim[51] = 9'h030;
    stim[52] = 9'h028;
    stim[53] = 9'h017;
    stim[54] = 9'h038;
    stim[55] = 9'h025;
    stim[56] = 9'h004;
    stim[57] = 9'h012;
    stim[58] = 9'h0f9;
    stim[59] = 9'h081;
    stim[60] = 9'h07f;
    stim[61] = 9'h0df;
    stim[62] = 9'h0eb;
    stim[63] = 9'h00c;
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
      expv[0] = 7'h01;
      expv[1] = 7'h01;
      expv[2] = 7'h01;
      expv[3] = 7'h01;
      expv[4] = 7'h01;
      expv[5] = 7'h41;
      expv[6] = 7'h41;
      expv[7] = 7'h01;
      expv[8] = 7'h01;
      expv[9] = 7'h01;
      expv[10] = 7'h01;
      expv[11] = 7'h01;
      expv[12] = 7'h01;
      expv[13] = 7'h01;
      expv[14] = 7'h01;
      expv[15] = 7'h01;
      expv[16] = 7'h01;
      expv[17] = 7'h01;
      expv[18] = 7'h01;
      expv[19] = 7'h01;
      expv[20] = 7'h01;
      expv[21] = 7'h01;
      expv[22] = 7'h01;
      expv[23] = 7'h41;
      expv[24] = 7'h41;
      expv[25] = 7'h41;
      expv[26] = 7'h41;
      expv[27] = 7'h43;
      expv[28] = 7'h43;
      expv[29] = 7'h03;
      expv[30] = 7'h43;
      expv[31] = 7'h43;
      expv[32] = 7'h43;
      expv[33] = 7'h43;
      expv[34] = 7'h43;
      expv[35] = 7'h45;
      expv[36] = 7'h45;
      expv[37] = 7'h05;
      expv[38] = 7'h05;
      expv[39] = 7'h05;
      expv[40] = 7'h45;
      expv[41] = 7'h05;
      expv[42] = 7'h05;
      expv[43] = 7'h47;
      expv[44] = 7'h07;
      expv[45] = 7'h07;
      expv[46] = 7'h07;
      expv[47] = 7'h07;
      expv[48] = 7'h07;
      expv[49] = 7'h07;
      expv[50] = 7'h47;
      expv[51] = 7'h09;
      expv[52] = 7'h09;
      expv[53] = 7'h09;
      expv[54] = 7'h49;
      expv[55] = 7'h09;
      expv[56] = 7'h49;
      expv[57] = 7'h49;
      expv[58] = 7'h49;
      expv[59] = 7'h4b;
      expv[60] = 7'h4b;
      expv[61] = 7'h0b;
      expv[62] = 7'h0b;
      expv[63] = 7'h4b;
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
