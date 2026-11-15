// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03034 dut (
    .clock50(clk),
    .keyboard_clk(in_vec[3:3]),
    .keyboard_data(in_vec[2:2]),
    .reset(in_vec[1:1]),
    .read(in_vec[0:0]),
    .scan_ready(out_vec[8:8]),
    .scan_code(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h2;
    stim[1] = 4'h6;
    stim[2] = 4'hc;
    stim[3] = 4'h8;
    stim[4] = 4'hc;
    stim[5] = 4'h4;
    stim[6] = 4'h8;
    stim[7] = 4'h8;
    stim[8] = 4'hc;
    stim[9] = 4'h4;
    stim[10] = 4'hd;
    stim[11] = 4'h9;
    stim[12] = 4'h1;
    stim[13] = 4'h0;
    stim[14] = 4'h8;
    stim[15] = 4'h8;
    stim[16] = 4'h1;
    stim[17] = 4'h0;
    stim[18] = 4'h8;
    stim[19] = 4'h8;
    stim[20] = 4'hd;
    stim[21] = 4'h1;
    stim[22] = 4'hd;
    stim[23] = 4'h0;
    stim[24] = 4'h4;
    stim[25] = 4'h8;
    stim[26] = 4'h5;
    stim[27] = 4'h4;
    stim[28] = 4'hd;
    stim[29] = 4'h8;
    stim[30] = 4'hd;
    stim[31] = 4'h8;
    stim[32] = 4'hd;
    stim[33] = 4'hc;
    stim[34] = 4'h0;
    stim[35] = 4'h4;
    stim[36] = 4'h1;
    stim[37] = 4'h1;
    stim[38] = 4'h4;
    stim[39] = 4'h1;
    stim[40] = 4'h8;
    stim[41] = 4'h5;
    stim[42] = 4'h8;
    stim[43] = 4'h5;
    stim[44] = 4'hc;
    stim[45] = 4'h9;
    stim[46] = 4'h9;
    stim[47] = 4'h0;
    stim[48] = 4'h5;
    stim[49] = 4'h0;
    stim[50] = 4'hb;
    stim[51] = 4'h5;
    stim[52] = 4'h0;
    stim[53] = 4'h1;
    stim[54] = 4'h4;
    stim[55] = 4'hd;
    stim[56] = 4'h9;
    stim[57] = 4'h1;
    stim[58] = 4'h1;
    stim[59] = 4'h9;
    stim[60] = 4'h8;
    stim[61] = 4'h0;
    stim[62] = 4'h4;
    stim[63] = 4'h5;
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
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'h0xx;
      expv[11] = 9'h0xx;
      expv[12] = 9'h0xx;
      expv[13] = 9'h0xx;
      expv[14] = 9'h0xx;
      expv[15] = 9'h0xx;
      expv[16] = 9'h0xx;
      expv[17] = 9'h0xx;
      expv[18] = 9'h0xx;
      expv[19] = 9'h0xx;
      expv[20] = 9'h0xx;
      expv[21] = 9'h0xx;
      expv[22] = 9'h0xx;
      expv[23] = 9'h0xx;
      expv[24] = 9'h0xx;
      expv[25] = 9'h0xx;
      expv[26] = 9'h0xx;
      expv[27] = 9'h0xx;
      expv[28] = 9'h0xx;
      expv[29] = 9'h0xx;
      expv[30] = 9'h0xx;
      expv[31] = 9'h0xx;
      expv[32] = 9'h0xx;
      expv[33] = 9'h0xx;
      expv[34] = 9'h0xx;
      expv[35] = 9'h0xx;
      expv[36] = 9'h0xx;
      expv[37] = 9'h0xx;
      expv[38] = 9'h0xx;
      expv[39] = 9'h0xx;
      expv[40] = 9'h0xx;
      expv[41] = 9'h0xx;
      expv[42] = 9'h0xx;
      expv[43] = 9'h0xx;
      expv[44] = 9'h0xx;
      expv[45] = 9'h0xx;
      expv[46] = 9'h0xx;
      expv[47] = 9'h0xx;
      expv[48] = 9'h0xx;
      expv[49] = 9'h0xx;
      expv[50] = 9'h0xx;
      expv[51] = 9'h0xx;
      expv[52] = 9'h0xx;
      expv[53] = 9'h0xx;
      expv[54] = 9'h0xx;
      expv[55] = 9'h0xx;
      expv[56] = 9'h0xx;
      expv[57] = 9'h0xx;
      expv[58] = 9'h0xx;
      expv[59] = 9'h0xx;
      expv[60] = 9'h0xx;
      expv[61] = 9'h0xx;
      expv[62] = 9'h0xx;
      expv[63] = 9'h0xx;
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
