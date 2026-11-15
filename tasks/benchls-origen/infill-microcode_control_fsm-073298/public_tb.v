// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_073298 dut (
    .CLK(clk),
    .op(in_vec[11:1]),
    .CLR(in_vec[0:0]),
    .control(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc64;
    stim[1] = 12'hd16;
    stim[2] = 12'h059;
    stim[3] = 12'hcf5;
    stim[4] = 12'hfc0;
    stim[5] = 12'haad;
    stim[6] = 12'he69;
    stim[7] = 12'h071;
    stim[8] = 12'h083;
    stim[9] = 12'h019;
    stim[10] = 12'hdcd;
    stim[11] = 12'h087;
    stim[12] = 12'h215;
    stim[13] = 12'h35d;
    stim[14] = 12'hacb;
    stim[15] = 12'hb1d;
    stim[16] = 12'h3a1;
    stim[17] = 12'h18b;
    stim[18] = 12'h361;
    stim[19] = 12'h5c9;
    stim[20] = 12'h34d;
    stim[21] = 12'h639;
    stim[22] = 12'hb37;
    stim[23] = 12'h2d3;
    stim[24] = 12'h529;
    stim[25] = 12'h289;
    stim[26] = 12'h38d;
    stim[27] = 12'haa3;
    stim[28] = 12'hfaf;
    stim[29] = 12'h03d;
    stim[30] = 12'h80b;
    stim[31] = 12'h30d;
    stim[32] = 12'haff;
    stim[33] = 12'hf9d;
    stim[34] = 12'h5db;
    stim[35] = 12'h4e9;
    stim[36] = 12'he75;
    stim[37] = 12'ha6f;
    stim[38] = 12'h981;
    stim[39] = 12'ha1b;
    stim[40] = 12'hb73;
    stim[41] = 12'hff3;
    stim[42] = 12'h36d;
    stim[43] = 12'hff9;
    stim[44] = 12'he23;
    stim[45] = 12'h3cb;
    stim[46] = 12'h945;
    stim[47] = 12'h141;
    stim[48] = 12'hcf5;
    stim[49] = 12'hd5b;
    stim[50] = 12'hb69;
    stim[51] = 12'h34f;
    stim[52] = 12'h796;
    stim[53] = 12'h919;
    stim[54] = 12'h65f;
    stim[55] = 12'h4b1;
    stim[56] = 12'h6ed;
    stim[57] = 12'h505;
    stim[58] = 12'hb63;
    stim[59] = 12'h02f;
    stim[60] = 12'h2cb;
    stim[61] = 12'h069;
    stim[62] = 12'ha81;
    stim[63] = 12'h479;
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
      expv[0] = 16'h0001;
      expv[1] = 16'h0001;
      expv[2] = 16'h0001;
      expv[3] = 16'h0008;
      expv[4] = 16'h0001;
      expv[5] = 16'h0001;
      expv[6] = 16'h0008;
      expv[7] = 16'h0010;
      expv[8] = 16'h0010;
      expv[9] = 16'h0084;
      expv[10] = 16'h0084;
      expv[11] = 16'h0084;
      expv[12] = 16'h0084;
      expv[13] = 16'h0084;
      expv[14] = 16'h0084;
      expv[15] = 16'h0084;
      expv[16] = 16'h0084;
      expv[17] = 16'h0084;
      expv[18] = 16'h0084;
      expv[19] = 16'h0084;
      expv[20] = 16'h0084;
      expv[21] = 16'h0084;
      expv[22] = 16'h0084;
      expv[23] = 16'h0084;
      expv[24] = 16'h0084;
      expv[25] = 16'h0084;
      expv[26] = 16'h0084;
      expv[27] = 16'h0084;
      expv[28] = 16'h0084;
      expv[29] = 16'h0084;
      expv[30] = 16'h0084;
      expv[31] = 16'h0084;
      expv[32] = 16'h0084;
      expv[33] = 16'h0084;
      expv[34] = 16'h0084;
      expv[35] = 16'h0084;
      expv[36] = 16'h0084;
      expv[37] = 16'h0084;
      expv[38] = 16'h0084;
      expv[39] = 16'h0084;
      expv[40] = 16'h0084;
      expv[41] = 16'h0084;
      expv[42] = 16'h0084;
      expv[43] = 16'h0084;
      expv[44] = 16'h0084;
      expv[45] = 16'h0084;
      expv[46] = 16'h0084;
      expv[47] = 16'h0084;
      expv[48] = 16'h0084;
      expv[49] = 16'h0084;
      expv[50] = 16'h0084;
      expv[51] = 16'h0084;
      expv[52] = 16'h0001;
      expv[53] = 16'h0001;
      expv[54] = 16'h0008;
      expv[55] = 16'h0010;
      expv[56] = 16'h0010;
      expv[57] = 16'h0084;
      expv[58] = 16'h0084;
      expv[59] = 16'h0084;
      expv[60] = 16'h0084;
      expv[61] = 16'h0084;
      expv[62] = 16'h0084;
      expv[63] = 16'h0084;
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
