// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09365 dut (
    .clk(clk),
    .cnt(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 9'h001;
      expv[1] = 9'h002;
      expv[2] = 9'h003;
      expv[3] = 9'h004;
      expv[4] = 9'h005;
      expv[5] = 9'h006;
      expv[6] = 9'h007;
      expv[7] = 9'h008;
      expv[8] = 9'h009;
      expv[9] = 9'h00a;
      expv[10] = 9'h00b;
      expv[11] = 9'h00c;
      expv[12] = 9'h00d;
      expv[13] = 9'h00e;
      expv[14] = 9'h00f;
      expv[15] = 9'h010;
      expv[16] = 9'h011;
      expv[17] = 9'h012;
      expv[18] = 9'h013;
      expv[19] = 9'h014;
      expv[20] = 9'h015;
      expv[21] = 9'h016;
      expv[22] = 9'h017;
      expv[23] = 9'h018;
      expv[24] = 9'h019;
      expv[25] = 9'h01a;
      expv[26] = 9'h01b;
      expv[27] = 9'h01c;
      expv[28] = 9'h01d;
      expv[29] = 9'h01e;
      expv[30] = 9'h01f;
      expv[31] = 9'h020;
      expv[32] = 9'h021;
      expv[33] = 9'h022;
      expv[34] = 9'h023;
      expv[35] = 9'h024;
      expv[36] = 9'h025;
      expv[37] = 9'h026;
      expv[38] = 9'h027;
      expv[39] = 9'h028;
      expv[40] = 9'h029;
      expv[41] = 9'h02a;
      expv[42] = 9'h02b;
      expv[43] = 9'h02c;
      expv[44] = 9'h02d;
      expv[45] = 9'h02e;
      expv[46] = 9'h02f;
      expv[47] = 9'h030;
      expv[48] = 9'h031;
      expv[49] = 9'h032;
      expv[50] = 9'h033;
      expv[51] = 9'h034;
      expv[52] = 9'h035;
      expv[53] = 9'h036;
      expv[54] = 9'h037;
      expv[55] = 9'h038;
      expv[56] = 9'h039;
      expv[57] = 9'h03a;
      expv[58] = 9'h03b;
      expv[59] = 9'h03c;
      expv[60] = 9'h03d;
      expv[61] = 9'h03e;
      expv[62] = 9'h03f;
      expv[63] = 9'h040;
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
