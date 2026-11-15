// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04583 dut (
    .clock(clk),
    .nReset(in_vec[11:11]),
    .adc_databus(in_vec[10:1]),
    .testModeFlag(in_vec[0:0]),
    .dataOut(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb21;
    stim[1] = 12'ha3c;
    stim[2] = 12'h50e;
    stim[3] = 12'h0b2;
    stim[4] = 12'h786;
    stim[5] = 12'h021;
    stim[6] = 12'h79c;
    stim[7] = 12'h688;
    stim[8] = 12'h0eb;
    stim[9] = 12'h490;
    stim[10] = 12'h513;
    stim[11] = 12'h4d3;
    stim[12] = 12'h50e;
    stim[13] = 12'h1db;
    stim[14] = 12'h032;
    stim[15] = 12'h7a1;
    stim[16] = 12'h7f1;
    stim[17] = 12'h280;
    stim[18] = 12'h44b;
    stim[19] = 12'h326;
    stim[20] = 12'he3e;
    stim[21] = 12'h034;
    stim[22] = 12'h617;
    stim[23] = 12'h65c;
    stim[24] = 12'h19c;
    stim[25] = 12'h471;
    stim[26] = 12'h2be;
    stim[27] = 12'h4d9;
    stim[28] = 12'h451;
    stim[29] = 12'hd4e;
    stim[30] = 12'h355;
    stim[31] = 12'h697;
    stim[32] = 12'h582;
    stim[33] = 12'h1cd;
    stim[34] = 12'h57f;
    stim[35] = 12'h07b;
    stim[36] = 12'h25e;
    stim[37] = 12'h2eb;
    stim[38] = 12'h7ba;
    stim[39] = 12'h52c;
    stim[40] = 12'h722;
    stim[41] = 12'h0c9;
    stim[42] = 12'h6f8;
    stim[43] = 12'h476;
    stim[44] = 12'h36c;
    stim[45] = 12'h7e1;
    stim[46] = 12'h637;
    stim[47] = 12'h29b;
    stim[48] = 12'h3bb;
    stim[49] = 12'h390;
    stim[50] = 12'h218;
    stim[51] = 12'h06f;
    stim[52] = 12'h57c;
    stim[53] = 12'h52e;
    stim[54] = 12'h4ad;
    stim[55] = 12'h124;
    stim[56] = 12'h72b;
    stim[57] = 12'h277;
    stim[58] = 12'h388;
    stim[59] = 12'h0ae;
    stim[60] = 12'h0d7;
    stim[61] = 12'h753;
    stim[62] = 12'h0a0;
    stim[63] = 12'h350;
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
      expv[0] = 10'h000;
      expv[1] = 10'h190;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
