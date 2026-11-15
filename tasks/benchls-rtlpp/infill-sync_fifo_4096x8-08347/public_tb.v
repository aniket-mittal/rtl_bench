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

  rtlpp_08347 dut (
    .CLK(clk),
    .RESETn(in_vec[10:10]),
    .DATA_IN(in_vec[9:2]),
    .PUSH(in_vec[1:1]),
    .POP(in_vec[0:0]),
    .DATA_OUT(out_vec[9:2]),
    .FULL(out_vec[1:1]),
    .EMPTY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h3f0;
    stim[1] = 11'h3a6;
    stim[2] = 11'h73a;
    stim[3] = 11'h7ac;
    stim[4] = 11'h4b9;
    stim[5] = 11'h672;
    stim[6] = 11'h4fd;
    stim[7] = 11'h7c9;
    stim[8] = 11'h62b;
    stim[9] = 11'h667;
    stim[10] = 11'h4f6;
    stim[11] = 11'h559;
    stim[12] = 11'h446;
    stim[13] = 11'h5d2;
    stim[14] = 11'h67c;
    stim[15] = 11'h4dd;
    stim[16] = 11'h57a;
    stim[17] = 11'h755;
    stim[18] = 11'h7b5;
    stim[19] = 11'h5d9;
    stim[20] = 11'h47c;
    stim[21] = 11'h599;
    stim[22] = 11'h711;
    stim[23] = 11'h51e;
    stim[24] = 11'h486;
    stim[25] = 11'h76d;
    stim[26] = 11'h5cc;
    stim[27] = 11'h46e;
    stim[28] = 11'h485;
    stim[29] = 11'h7b8;
    stim[30] = 11'h4ed;
    stim[31] = 11'h035;
    stim[32] = 11'h684;
    stim[33] = 11'h7db;
    stim[34] = 11'h57e;
    stim[35] = 11'h711;
    stim[36] = 11'h46c;
    stim[37] = 11'h53e;
    stim[38] = 11'h7e1;
    stim[39] = 11'h7ca;
    stim[40] = 11'h638;
    stim[41] = 11'h79b;
    stim[42] = 11'h5a4;
    stim[43] = 11'h639;
    stim[44] = 11'h6f5;
    stim[45] = 11'h707;
    stim[46] = 11'h705;
    stim[47] = 11'h53d;
    stim[48] = 11'h71f;
    stim[49] = 11'h6d1;
    stim[50] = 11'h414;
    stim[51] = 11'h46f;
    stim[52] = 11'h7d7;
    stim[53] = 11'h7c5;
    stim[54] = 11'h796;
    stim[55] = 11'h4f6;
    stim[56] = 11'h72a;
    stim[57] = 11'h753;
    stim[58] = 11'h67a;
    stim[59] = 11'h533;
    stim[60] = 11'h56a;
    stim[61] = 11'h723;
    stim[62] = 11'h44c;
    stim[63] = 11'h6c3;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'h3a6;
      expv[4] = 10'h33a;
      expv[5] = 10'h338;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'hxxx;
      expv[19] = 10'hxxx;
      expv[20] = 10'hxxx;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'hxxx;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'h271;
      expv[34] = 10'h270;
      expv[35] = 10'h22a;
      expv[36] = 10'h17c;
      expv[37] = 10'h0f4;
      expv[38] = 10'h0f6;
      expv[39] = 10'h0f4;
      expv[40] = 10'h046;
      expv[41] = 10'h046;
      expv[42] = 10'h044;
      expv[43] = 10'h178;
      expv[44] = 10'h178;
      expv[45] = 10'h11c;
      expv[46] = 10'h11e;
      expv[47] = 10'h06c;
      expv[48] = 10'h06c;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxxx;
      expv[58] = 10'hxxx;
      expv[59] = 10'hxxx;
      expv[60] = 10'hxxx;
      expv[61] = 10'hxxx;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
