// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04754 dut (
    .clk(clk),
    .reset(in_vec[18:18]),
    .baud_div(in_vec[17:10]),
    .rx_in(in_vec[9:9]),
    .tx_latch(in_vec[8:8]),
    .tx_data(in_vec[7:0]),
    .tx_out(out_vec[10:10]),
    .tx_empty(out_vec[9:9]),
    .rx_data(out_vec[8:1]),
    .rx_latch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h603d5;
    stim[1] = 19'h61e41;
    stim[2] = 19'h1396e;
    stim[3] = 19'h083b2;
    stim[4] = 19'h166bc;
    stim[5] = 19'h3bbec;
    stim[6] = 19'h3e2a8;
    stim[7] = 19'h1ebff;
    stim[8] = 19'h1bf33;
    stim[9] = 19'h26037;
    stim[10] = 19'h0da10;
    stim[11] = 19'h3cee5;
    stim[12] = 19'h00d3b;
    stim[13] = 19'h0695b;
    stim[14] = 19'h2c938;
    stim[15] = 19'h38957;
    stim[16] = 19'h04538;
    stim[17] = 19'h24ef6;
    stim[18] = 19'h34eac;
    stim[19] = 19'h1d7f2;
    stim[20] = 19'h19696;
    stim[21] = 19'h31bb0;
    stim[22] = 19'h39467;
    stim[23] = 19'h13423;
    stim[24] = 19'h12843;
    stim[25] = 19'h38a36;
    stim[26] = 19'h0cdf3;
    stim[27] = 19'h3c639;
    stim[28] = 19'h1256a;
    stim[29] = 19'h0bbee;
    stim[30] = 19'h0d07e;
    stim[31] = 19'h12a3c;
    stim[32] = 19'h0ed4e;
    stim[33] = 19'h20eda;
    stim[34] = 19'h28805;
    stim[35] = 19'h2aa2c;
    stim[36] = 19'h3baa4;
    stim[37] = 19'h29e50;
    stim[38] = 19'h1cfa9;
    stim[39] = 19'h2feed;
    stim[40] = 19'h3a02f;
    stim[41] = 19'h05abf;
    stim[42] = 19'h05e93;
    stim[43] = 19'h27041;
    stim[44] = 19'h2f314;
    stim[45] = 19'h33255;
    stim[46] = 19'h3cbfd;
    stim[47] = 19'h164b6;
    stim[48] = 19'h36a2a;
    stim[49] = 19'h32282;
    stim[50] = 19'h2be49;
    stim[51] = 19'h33a08;
    stim[52] = 19'h341e2;
    stim[53] = 19'h143bb;
    stim[54] = 19'h2daf2;
    stim[55] = 19'h0176f;
    stim[56] = 19'h24872;
    stim[57] = 19'h27a65;
    stim[58] = 19'h33931;
    stim[59] = 19'h2f37b;
    stim[60] = 19'h2d1f5;
    stim[61] = 19'h26d2e;
    stim[62] = 19'h114f7;
    stim[63] = 19'h0bfb5;
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
      expv[0] = 11'hx00;
      expv[1] = 11'h600;
      expv[2] = 11'h600;
      expv[3] = 11'h400;
      expv[4] = 11'h400;
      expv[5] = 11'h400;
      expv[6] = 11'h400;
      expv[7] = 11'h400;
      expv[8] = 11'h400;
      expv[9] = 11'h400;
      expv[10] = 11'h400;
      expv[11] = 11'h400;
      expv[12] = 11'h400;
      expv[13] = 11'h400;
      expv[14] = 11'h400;
      expv[15] = 11'h400;
      expv[16] = 11'h400;
      expv[17] = 11'h400;
      expv[18] = 11'h400;
      expv[19] = 11'h400;
      expv[20] = 11'h400;
      expv[21] = 11'h400;
      expv[22] = 11'h400;
      expv[23] = 11'h400;
      expv[24] = 11'h400;
      expv[25] = 11'h400;
      expv[26] = 11'h400;
      expv[27] = 11'h400;
      expv[28] = 11'h400;
      expv[29] = 11'h400;
      expv[30] = 11'h400;
      expv[31] = 11'h400;
      expv[32] = 11'h400;
      expv[33] = 11'h400;
      expv[34] = 11'h400;
      expv[35] = 11'h400;
      expv[36] = 11'h400;
      expv[37] = 11'h400;
      expv[38] = 11'h400;
      expv[39] = 11'h400;
      expv[40] = 11'h400;
      expv[41] = 11'h400;
      expv[42] = 11'h400;
      expv[43] = 11'h400;
      expv[44] = 11'h400;
      expv[45] = 11'h400;
      expv[46] = 11'h400;
      expv[47] = 11'h400;
      expv[48] = 11'h400;
      expv[49] = 11'h400;
      expv[50] = 11'h400;
      expv[51] = 11'h400;
      expv[52] = 11'h400;
      expv[53] = 11'h400;
      expv[54] = 11'h400;
      expv[55] = 11'h400;
      expv[56] = 11'h400;
      expv[57] = 11'h400;
      expv[58] = 11'h400;
      expv[59] = 11'h400;
      expv[60] = 11'h400;
      expv[61] = 11'h400;
      expv[62] = 11'h400;
      expv[63] = 11'h400;
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
