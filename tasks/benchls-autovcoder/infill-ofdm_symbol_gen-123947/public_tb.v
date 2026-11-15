// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_123947 dut (
    .clk(clk),
    .reset(in_vec[5:5]),
    .bit_stream(in_vec[4:1]),
    .valid(in_vec[0:0]),
    .ofdm_symbol(out_vec[8:1]),
    .symbol_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h26;
    stim[1] = 6'h34;
    stim[2] = 6'h09;
    stim[3] = 6'h07;
    stim[4] = 6'h12;
    stim[5] = 6'h1d;
    stim[6] = 6'h15;
    stim[7] = 6'h06;
    stim[8] = 6'h0b;
    stim[9] = 6'h0c;
    stim[10] = 6'h00;
    stim[11] = 6'h1c;
    stim[12] = 6'h07;
    stim[13] = 6'h1a;
    stim[14] = 6'h16;
    stim[15] = 6'h19;
    stim[16] = 6'h10;
    stim[17] = 6'h10;
    stim[18] = 6'h11;
    stim[19] = 6'h0b;
    stim[20] = 6'h02;
    stim[21] = 6'h0d;
    stim[22] = 6'h03;
    stim[23] = 6'h08;
    stim[24] = 6'h16;
    stim[25] = 6'h01;
    stim[26] = 6'h09;
    stim[27] = 6'h13;
    stim[28] = 6'h0e;
    stim[29] = 6'h15;
    stim[30] = 6'h10;
    stim[31] = 6'h05;
    stim[32] = 6'h1e;
    stim[33] = 6'h15;
    stim[34] = 6'h10;
    stim[35] = 6'h04;
    stim[36] = 6'h1d;
    stim[37] = 6'h1d;
    stim[38] = 6'h15;
    stim[39] = 6'h08;
    stim[40] = 6'h17;
    stim[41] = 6'h0c;
    stim[42] = 6'h16;
    stim[43] = 6'h0c;
    stim[44] = 6'h0c;
    stim[45] = 6'h19;
    stim[46] = 6'h11;
    stim[47] = 6'h08;
    stim[48] = 6'h11;
    stim[49] = 6'h13;
    stim[50] = 6'h1d;
    stim[51] = 6'h01;
    stim[52] = 6'h04;
    stim[53] = 6'h0a;
    stim[54] = 6'h1f;
    stim[55] = 6'h12;
    stim[56] = 6'h1b;
    stim[57] = 6'h1c;
    stim[58] = 6'h0b;
    stim[59] = 6'h1f;
    stim[60] = 6'h00;
    stim[61] = 6'h01;
    stim[62] = 6'h0b;
    stim[63] = 6'h14;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'hxxx;
      expv[8] = 9'h048;
      expv[9] = 9'h049;
      expv[10] = 9'h049;
      expv[11] = 9'h049;
      expv[12] = 9'h049;
      expv[13] = 9'h049;
      expv[14] = 9'h049;
      expv[15] = 9'h049;
      expv[16] = 9'h049;
      expv[17] = 9'h049;
      expv[18] = 9'h059;
      expv[19] = 9'h059;
      expv[20] = 9'h059;
      expv[21] = 9'h059;
      expv[22] = 9'h059;
      expv[23] = 9'h059;
      expv[24] = 9'h059;
      expv[25] = 9'h019;
      expv[26] = 9'h019;
      expv[27] = 9'h019;
      expv[28] = 9'h019;
      expv[29] = 9'h019;
      expv[30] = 9'h019;
      expv[31] = 9'h019;
      expv[32] = 9'h045;
      expv[33] = 9'h045;
      expv[34] = 9'h045;
      expv[35] = 9'h045;
      expv[36] = 9'h045;
      expv[37] = 9'h045;
      expv[38] = 9'h045;
      expv[39] = 9'h04d;
      expv[40] = 9'h04d;
      expv[41] = 9'h04d;
      expv[42] = 9'h04d;
      expv[43] = 9'h04d;
      expv[44] = 9'h04d;
      expv[45] = 9'h04d;
      expv[46] = 9'h03b;
      expv[47] = 9'h03b;
      expv[48] = 9'h03b;
      expv[49] = 9'h03b;
      expv[50] = 9'h03b;
      expv[51] = 9'h03b;
      expv[52] = 9'h03b;
      expv[53] = 9'h03b;
      expv[54] = 9'h033;
      expv[55] = 9'h033;
      expv[56] = 9'h033;
      expv[57] = 9'h033;
      expv[58] = 9'h033;
      expv[59] = 9'h033;
      expv[60] = 9'h033;
      expv[61] = 9'h033;
      expv[62] = 9'h045;
      expv[63] = 9'h045;
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
