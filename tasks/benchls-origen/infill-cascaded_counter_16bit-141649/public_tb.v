// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141649 dut (
    .clk(clk),
    .reset(in_vec[3:3]),
    .enable_1(in_vec[2:2]),
    .enable_2(in_vec[1:1]),
    .enable_3(in_vec[0:0]),
    .count(out_vec[19:4]),
    .overflow_count(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hc;
    stim[1] = 4'he;
    stim[2] = 4'h1;
    stim[3] = 4'h2;
    stim[4] = 4'h5;
    stim[5] = 4'h7;
    stim[6] = 4'h1;
    stim[7] = 4'h1;
    stim[8] = 4'h7;
    stim[9] = 4'h3;
    stim[10] = 4'h0;
    stim[11] = 4'h3;
    stim[12] = 4'h1;
    stim[13] = 4'h7;
    stim[14] = 4'h0;
    stim[15] = 4'h6;
    stim[16] = 4'h3;
    stim[17] = 4'h3;
    stim[18] = 4'h2;
    stim[19] = 4'h7;
    stim[20] = 4'h2;
    stim[21] = 4'h2;
    stim[22] = 4'h1;
    stim[23] = 4'h3;
    stim[24] = 4'h0;
    stim[25] = 4'h1;
    stim[26] = 4'h2;
    stim[27] = 4'h7;
    stim[28] = 4'h3;
    stim[29] = 4'h2;
    stim[30] = 4'h4;
    stim[31] = 4'h5;
    stim[32] = 4'h4;
    stim[33] = 4'h2;
    stim[34] = 4'h1;
    stim[35] = 4'h4;
    stim[36] = 4'h0;
    stim[37] = 4'h0;
    stim[38] = 4'h3;
    stim[39] = 4'h1;
    stim[40] = 4'h0;
    stim[41] = 4'h0;
    stim[42] = 4'h1;
    stim[43] = 4'h4;
    stim[44] = 4'he;
    stim[45] = 4'h4;
    stim[46] = 4'h3;
    stim[47] = 4'h3;
    stim[48] = 4'h4;
    stim[49] = 4'h7;
    stim[50] = 4'h5;
    stim[51] = 4'h2;
    stim[52] = 4'h2;
    stim[53] = 4'h4;
    stim[54] = 4'h7;
    stim[55] = 4'h5;
    stim[56] = 4'h4;
    stim[57] = 4'h2;
    stim[58] = 4'h0;
    stim[59] = 4'h7;
    stim[60] = 4'h2;
    stim[61] = 4'h0;
    stim[62] = 4'h6;
    stim[63] = 4'h2;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h00010;
      expv[4] = 20'h00020;
      expv[5] = 20'h00030;
      expv[6] = 20'h00040;
      expv[7] = 20'h00050;
      expv[8] = 20'h00060;
      expv[9] = 20'h00070;
      expv[10] = 20'h00080;
      expv[11] = 20'h00090;
      expv[12] = 20'h000a0;
      expv[13] = 20'h000b0;
      expv[14] = 20'h000c0;
      expv[15] = 20'h000d0;
      expv[16] = 20'h000e0;
      expv[17] = 20'h000f0;
      expv[18] = 20'h00000;
      expv[19] = 20'h00010;
      expv[20] = 20'h00020;
      expv[21] = 20'h00030;
      expv[22] = 20'h00040;
      expv[23] = 20'h00050;
      expv[24] = 20'h00060;
      expv[25] = 20'h00070;
      expv[26] = 20'h00080;
      expv[27] = 20'h00090;
      expv[28] = 20'h000a0;
      expv[29] = 20'h000b0;
      expv[30] = 20'h000c0;
      expv[31] = 20'h000d0;
      expv[32] = 20'h000e0;
      expv[33] = 20'h000f0;
      expv[34] = 20'h00000;
      expv[35] = 20'h00010;
      expv[36] = 20'h00020;
      expv[37] = 20'h00030;
      expv[38] = 20'h00040;
      expv[39] = 20'h00050;
      expv[40] = 20'h00060;
      expv[41] = 20'h00070;
      expv[42] = 20'h00080;
      expv[43] = 20'h00090;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00010;
      expv[47] = 20'h00020;
      expv[48] = 20'h00030;
      expv[49] = 20'h00040;
      expv[50] = 20'h00050;
      expv[51] = 20'h00060;
      expv[52] = 20'h00070;
      expv[53] = 20'h00080;
      expv[54] = 20'h00090;
      expv[55] = 20'h000a0;
      expv[56] = 20'h000b0;
      expv[57] = 20'h000c0;
      expv[58] = 20'h000d0;
      expv[59] = 20'h000e0;
      expv[60] = 20'h000f0;
      expv[61] = 20'h00000;
      expv[62] = 20'h00010;
      expv[63] = 20'h00020;
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
