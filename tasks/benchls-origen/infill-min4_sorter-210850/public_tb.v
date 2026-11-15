// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210850 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .in_data(in_vec[8:1]),
    .isData(in_vec[0:0]),
    .out0(out_vec[31:24]),
    .out1(out_vec[23:16]),
    .out2(out_vec[15:8]),
    .out3(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h37e;
    stim[1] = 10'h36f;
    stim[2] = 10'h1e0;
    stim[3] = 10'h05f;
    stim[4] = 10'h1e9;
    stim[5] = 10'h166;
    stim[6] = 10'h05f;
    stim[7] = 10'h1ce;
    stim[8] = 10'h251;
    stim[9] = 10'h1fb;
    stim[10] = 10'h083;
    stim[11] = 10'h061;
    stim[12] = 10'h0e6;
    stim[13] = 10'h0a7;
    stim[14] = 10'h1af;
    stim[15] = 10'h19a;
    stim[16] = 10'h0f5;
    stim[17] = 10'h0db;
    stim[18] = 10'h0bc;
    stim[19] = 10'h13f;
    stim[20] = 10'h0e1;
    stim[21] = 10'h1b5;
    stim[22] = 10'h1dc;
    stim[23] = 10'h0a7;
    stim[24] = 10'h1b7;
    stim[25] = 10'h165;
    stim[26] = 10'h115;
    stim[27] = 10'h10a;
    stim[28] = 10'h0ce;
    stim[29] = 10'h0b3;
    stim[30] = 10'h071;
    stim[31] = 10'h052;
    stim[32] = 10'h171;
    stim[33] = 10'h12d;
    stim[34] = 10'h1d3;
    stim[35] = 10'h180;
    stim[36] = 10'h175;
    stim[37] = 10'h0d1;
    stim[38] = 10'h1bd;
    stim[39] = 10'h133;
    stim[40] = 10'h1ed;
    stim[41] = 10'h0d2;
    stim[42] = 10'h0bf;
    stim[43] = 10'h0ab;
    stim[44] = 10'h09a;
    stim[45] = 10'h176;
    stim[46] = 10'h071;
    stim[47] = 10'h0cb;
    stim[48] = 10'h1ed;
    stim[49] = 10'h0c6;
    stim[50] = 10'h098;
    stim[51] = 10'h051;
    stim[52] = 10'h0f5;
    stim[53] = 10'h11a;
    stim[54] = 10'h189;
    stim[55] = 10'h06c;
    stim[56] = 10'h019;
    stim[57] = 10'h0d9;
    stim[58] = 10'h028;
    stim[59] = 10'h1d2;
    stim[60] = 10'h303;
    stim[61] = 10'h0d0;
    stim[62] = 10'h159;
    stim[63] = 10'h13b;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'hffffffff;
      expv[2] = 32'hffffffff;
      expv[3] = 32'hffffffff;
      expv[4] = 32'hffffffff;
      expv[5] = 32'hffffffff;
      expv[6] = 32'hffffffff;
      expv[7] = 32'hffffffff;
      expv[8] = 32'hffffffff;
      expv[9] = 32'hffffffff;
      expv[10] = 32'hffffffff;
      expv[11] = 32'hffffffff;
      expv[12] = 32'hffffffff;
      expv[13] = 32'hffffffff;
      expv[14] = 32'hffffffff;
      expv[15] = 32'hffffffff;
      expv[16] = 32'hffffffff;
      expv[17] = 32'hffffffff;
      expv[18] = 32'hffffffff;
      expv[19] = 32'hffffffff;
      expv[20] = 32'hffffffff;
      expv[21] = 32'hffffffff;
      expv[22] = 32'hffffffff;
      expv[23] = 32'hffffffff;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'hffffffff;
      expv[27] = 32'hffffffff;
      expv[28] = 32'hffffffff;
      expv[29] = 32'hffffffff;
      expv[30] = 32'hffffffff;
      expv[31] = 32'hffffffff;
      expv[32] = 32'hffffffff;
      expv[33] = 32'hffffffff;
      expv[34] = 32'hffffffff;
      expv[35] = 32'hffffffff;
      expv[36] = 32'hffffffff;
      expv[37] = 32'hffffffff;
      expv[38] = 32'hffffffff;
      expv[39] = 32'hffffffff;
      expv[40] = 32'hffffffff;
      expv[41] = 32'hffffffff;
      expv[42] = 32'hffffffff;
      expv[43] = 32'hffffffff;
      expv[44] = 32'hffffffff;
      expv[45] = 32'hffffffff;
      expv[46] = 32'hffffffff;
      expv[47] = 32'hffffffff;
      expv[48] = 32'hffffffff;
      expv[49] = 32'hffffffff;
      expv[50] = 32'hffffffff;
      expv[51] = 32'hffffffff;
      expv[52] = 32'hffffffff;
      expv[53] = 32'hffffffff;
      expv[54] = 32'hffffffff;
      expv[55] = 32'hffffffff;
      expv[56] = 32'hffffffff;
      expv[57] = 32'hffffffff;
      expv[58] = 32'hffffffff;
      expv[59] = 32'hffffffff;
      expv[60] = 32'hffffffff;
      expv[61] = 32'hffffffff;
      expv[62] = 32'hffffffff;
      expv[63] = 32'hffffffff;
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
