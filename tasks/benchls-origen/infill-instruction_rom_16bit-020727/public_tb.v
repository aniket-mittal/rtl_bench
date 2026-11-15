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

  origen_020727 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .addr(in_vec[7:0]),
    .inst_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h18f;
    stim[1] = 9'h1b9;
    stim[2] = 9'h00e;
    stim[3] = 9'h0ca;
    stim[4] = 9'h0ce;
    stim[5] = 9'h02e;
    stim[6] = 9'h09c;
    stim[7] = 9'h0a4;
    stim[8] = 9'h08a;
    stim[9] = 9'h17f;
    stim[10] = 9'h084;
    stim[11] = 9'h0da;
    stim[12] = 9'h0b3;
    stim[13] = 9'h0f5;
    stim[14] = 9'h005;
    stim[15] = 9'h02d;
    stim[16] = 9'h01b;
    stim[17] = 9'h02b;
    stim[18] = 9'h010;
    stim[19] = 9'h024;
    stim[20] = 9'h037;
    stim[21] = 9'h0ce;
    stim[22] = 9'h08e;
    stim[23] = 9'h08c;
    stim[24] = 9'h0da;
    stim[25] = 9'h032;
    stim[26] = 9'h016;
    stim[27] = 9'h0c6;
    stim[28] = 9'h0f6;
    stim[29] = 9'h0d1;
    stim[30] = 9'h064;
    stim[31] = 9'h00b;
    stim[32] = 9'h08d;
    stim[33] = 9'h040;
    stim[34] = 9'h1db;
    stim[35] = 9'h0e4;
    stim[36] = 9'h0a6;
    stim[37] = 9'h025;
    stim[38] = 9'h095;
    stim[39] = 9'h0e6;
    stim[40] = 9'h023;
    stim[41] = 9'h022;
    stim[42] = 9'h052;
    stim[43] = 9'h070;
    stim[44] = 9'h035;
    stim[45] = 9'h0b9;
    stim[46] = 9'h050;
    stim[47] = 9'h037;
    stim[48] = 9'h006;
    stim[49] = 9'h09b;
    stim[50] = 9'h007;
    stim[51] = 9'h0da;
    stim[52] = 9'h02a;
    stim[53] = 9'h037;
    stim[54] = 9'h059;
    stim[55] = 9'h088;
    stim[56] = 9'h0a2;
    stim[57] = 9'h030;
    stim[58] = 9'h0ef;
    stim[59] = 9'h0c0;
    stim[60] = 9'h014;
    stim[61] = 9'h0eb;
    stim[62] = 9'h0b3;
    stim[63] = 9'h0f4;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'h5678;
      expv[15] = 16'h6420;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'h2468;
      expv[19] = 16'h7531;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hdddd;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'h4444;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'h7531;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'h0000;
      expv[44] = 16'h1111;
      expv[45] = 16'hxxxx;
      expv[46] = 16'h8888;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'haaaa;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'h9753;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hace0;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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
