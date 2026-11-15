// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02197 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .push(in_vec[2:2]),
    .pop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4b1;
    stim[1] = 11'h727;
    stim[2] = 11'h698;
    stim[3] = 11'h5e4;
    stim[4] = 11'h6ae;
    stim[5] = 11'h4e8;
    stim[6] = 11'h55c;
    stim[7] = 11'h626;
    stim[8] = 11'h2fa;
    stim[9] = 11'h6b0;
    stim[10] = 11'h1a4;
    stim[11] = 11'h2c8;
    stim[12] = 11'h0c2;
    stim[13] = 11'h530;
    stim[14] = 11'h6d2;
    stim[15] = 11'h42a;
    stim[16] = 11'h0e8;
    stim[17] = 11'h154;
    stim[18] = 11'h0fc;
    stim[19] = 11'h3fe;
    stim[20] = 11'h4dc;
    stim[21] = 11'h082;
    stim[22] = 11'h4c6;
    stim[23] = 11'h20a;
    stim[24] = 11'h4f0;
    stim[25] = 11'h538;
    stim[26] = 11'h50c;
    stim[27] = 11'h75a;
    stim[28] = 11'h3ae;
    stim[29] = 11'h27e;
    stim[30] = 11'h17e;
    stim[31] = 11'h254;
    stim[32] = 11'h364;
    stim[33] = 11'h464;
    stim[34] = 11'h0fc;
    stim[35] = 11'h5cc;
    stim[36] = 11'h782;
    stim[37] = 11'h648;
    stim[38] = 11'h1ac;
    stim[39] = 11'h57a;
    stim[40] = 11'h01a;
    stim[41] = 11'h3bc;
    stim[42] = 11'h2c6;
    stim[43] = 11'h6de;
    stim[44] = 11'h3f4;
    stim[45] = 11'h106;
    stim[46] = 11'h65a;
    stim[47] = 11'h2a2;
    stim[48] = 11'h116;
    stim[49] = 11'h36a;
    stim[50] = 11'h7f6;
    stim[51] = 11'h48c;
    stim[52] = 11'h23e;
    stim[53] = 11'h7d6;
    stim[54] = 11'h29c;
    stim[55] = 11'h754;
    stim[56] = 11'h722;
    stim[57] = 11'h3e8;
    stim[58] = 11'h1ac;
    stim[59] = 11'h044;
    stim[60] = 11'h316;
    stim[61] = 11'h552;
    stim[62] = 11'h656;
    stim[63] = 11'h092;
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
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h2f0;
      expv[10] = 10'h2f0;
      expv[11] = 10'h2f0;
      expv[12] = 10'h2f0;
      expv[13] = 10'h2ac;
      expv[14] = 10'h2ac;
      expv[15] = 10'h0d2;
      expv[16] = 10'h0d2;
      expv[17] = 10'h0d2;
      expv[18] = 10'h0d0;
      expv[19] = 10'h0d0;
      expv[20] = 10'h0d0;
      expv[21] = 10'h0d0;
      expv[22] = 10'h0a8;
      expv[23] = 10'h0a8;
      expv[24] = 10'h07c;
      expv[25] = 10'h07c;
      expv[26] = 10'h07c;
      expv[27] = 10'h07c;
      expv[28] = 10'h26c;
      expv[29] = 10'h26c;
      expv[30] = 10'h26c;
      expv[31] = 10'h26c;
      expv[32] = 10'h26c;
      expv[33] = 10'h26c;
      expv[34] = 10'h26c;
      expv[35] = 10'h26c;
      expv[36] = 10'h26c;
      expv[37] = 10'h284;
      expv[38] = 10'h284;
      expv[39] = 10'h284;
      expv[40] = 10'h128;
      expv[41] = 10'h1b0;
      expv[42] = 10'h1b0;
      expv[43] = 10'h1b0;
      expv[44] = 10'h1b0;
      expv[45] = 10'h1b0;
      expv[46] = 10'h1b0;
      expv[47] = 10'h230;
      expv[48] = 10'h07c;
      expv[49] = 10'h07c;
      expv[50] = 10'h2e4;
      expv[51] = 10'h2e4;
      expv[52] = 10'h2e4;
      expv[53] = 10'h2e4;
      expv[54] = 10'h2e4;
      expv[55] = 10'h2e4;
      expv[56] = 10'h2e4;
      expv[57] = 10'h0d4;
      expv[58] = 10'h0d4;
      expv[59] = 10'h0d4;
      expv[60] = 10'h0d4;
      expv[61] = 10'h0d4;
      expv[62] = 10'h1dc;
      expv[63] = 10'h1dc;
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
