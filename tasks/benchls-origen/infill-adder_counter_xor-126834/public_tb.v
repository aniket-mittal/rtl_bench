// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_126834 dut (
    .clk(clk),
    .A(in_vec[10:7]),
    .B(in_vec[6:3]),
    .reset(in_vec[2:2]),
    .select(in_vec[1:0]),
    .result(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2a6;
    stim[1] = 11'h315;
    stim[2] = 11'h4e1;
    stim[3] = 11'h6e2;
    stim[4] = 11'h799;
    stim[5] = 11'h110;
    stim[6] = 11'h200;
    stim[7] = 11'h471;
    stim[8] = 11'h503;
    stim[9] = 11'h01b;
    stim[10] = 11'h661;
    stim[11] = 11'h0c0;
    stim[12] = 11'h618;
    stim[13] = 11'h7f8;
    stim[14] = 11'h07c;
    stim[15] = 11'h563;
    stim[16] = 11'h363;
    stim[17] = 11'h353;
    stim[18] = 11'h2fb;
    stim[19] = 11'h670;
    stim[20] = 11'h423;
    stim[21] = 11'h772;
    stim[22] = 11'h460;
    stim[23] = 11'h551;
    stim[24] = 11'h132;
    stim[25] = 11'h0b2;
    stim[26] = 11'h579;
    stim[27] = 11'h6d1;
    stim[28] = 11'h30a;
    stim[29] = 11'h5a8;
    stim[30] = 11'h781;
    stim[31] = 11'h54a;
    stim[32] = 11'h021;
    stim[33] = 11'h18b;
    stim[34] = 11'h3c8;
    stim[35] = 11'h71a;
    stim[36] = 11'h210;
    stim[37] = 11'h40b;
    stim[38] = 11'h082;
    stim[39] = 11'h360;
    stim[40] = 11'h2e0;
    stim[41] = 11'h2f9;
    stim[42] = 11'h392;
    stim[43] = 11'h332;
    stim[44] = 11'h77f;
    stim[45] = 11'h023;
    stim[46] = 11'h2c2;
    stim[47] = 11'h621;
    stim[48] = 11'h459;
    stim[49] = 11'h1f2;
    stim[50] = 11'h278;
    stim[51] = 11'h232;
    stim[52] = 11'h7c3;
    stim[53] = 11'h6f2;
    stim[54] = 11'h3ab;
    stim[55] = 11'h630;
    stim[56] = 11'h761;
    stim[57] = 11'h373;
    stim[58] = 11'h100;
    stim[59] = 11'h17a;
    stim[60] = 11'h3aa;
    stim[61] = 11'h3d1;
    stim[62] = 11'h688;
    stim[63] = 11'h492;
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
      expv[0] = 16'h0009;
      expv[1] = 16'h0008;
      expv[2] = 16'h0005;
      expv[3] = 16'h0008;
      expv[4] = 16'h0000;
      expv[5] = 16'h0007;
      expv[6] = 16'h0000;
      expv[7] = 16'h0003;
      expv[8] = 16'h000c;
      expv[9] = 16'h0004;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0005;
      expv[13] = 16'h0005;
      expv[14] = 16'h000f;
      expv[15] = 16'h0006;
      expv[16] = 16'h0003;
      expv[17] = 16'h0002;
      expv[18] = 16'h0007;
      expv[19] = 16'h000e;
      expv[20] = 16'h0009;
      expv[21] = 16'h000a;
      expv[22] = 16'h0003;
      expv[23] = 16'h000c;
      expv[24] = 16'h0001;
      expv[25] = 16'h000d;
      expv[26] = 16'h0002;
      expv[27] = 16'h000b;
      expv[28] = 16'h000a;
      expv[29] = 16'h000e;
      expv[30] = 16'h0000;
      expv[31] = 16'h0003;
      expv[32] = 16'h0005;
      expv[33] = 16'h0006;
      expv[34] = 16'h0003;
      expv[35] = 16'h0005;
      expv[36] = 16'h0003;
      expv[37] = 16'h000f;
      expv[38] = 16'h0006;
      expv[39] = 16'h000a;
      expv[40] = 16'h0008;
      expv[41] = 16'h000e;
      expv[42] = 16'h0002;
      expv[43] = 16'h0000;
      expv[44] = 16'h000d;
      expv[45] = 16'h0004;
      expv[46] = 16'h000c;
      expv[47] = 16'h0002;
      expv[48] = 16'h0000;
      expv[49] = 16'h0005;
      expv[50] = 16'h0006;
      expv[51] = 16'h000c;
      expv[52] = 16'h0000;
      expv[53] = 16'h0003;
      expv[54] = 16'h0005;
      expv[55] = 16'h0008;
      expv[56] = 16'h0001;
      expv[57] = 16'h0008;
      expv[58] = 16'h000f;
      expv[59] = 16'h000f;
      expv[60] = 16'h0003;
      expv[61] = 16'h0001;
      expv[62] = 16'h000f;
      expv[63] = 16'h0009;
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
