// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_085096 dut (
    .SW(in_vec[9:0]),
    .LEDR(out_vec[30:21]),
    .HEX0(out_vec[20:14]),
    .HEX1(out_vec[13:7]),
    .HEX2(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0dd;
    stim[1] = 10'h3dd;
    stim[2] = 10'h16e;
    stim[3] = 10'h3bc;
    stim[4] = 10'h009;
    stim[5] = 10'h1fa;
    stim[6] = 10'h305;
    stim[7] = 10'h38c;
    stim[8] = 10'h0fa;
    stim[9] = 10'h0ff;
    stim[10] = 10'h2b5;
    stim[11] = 10'h0d7;
    stim[12] = 10'h2fd;
    stim[13] = 10'h1fe;
    stim[14] = 10'h214;
    stim[15] = 10'h25d;
    stim[16] = 10'h30a;
    stim[17] = 10'h24c;
    stim[18] = 10'h1d9;
    stim[19] = 10'h0b6;
    stim[20] = 10'h0f3;
    stim[21] = 10'h17a;
    stim[22] = 10'h020;
    stim[23] = 10'h21f;
    stim[24] = 10'h2ab;
    stim[25] = 10'h1fb;
    stim[26] = 10'h2ec;
    stim[27] = 10'h251;
    stim[28] = 10'h07e;
    stim[29] = 10'h2dc;
    stim[30] = 10'h1ae;
    stim[31] = 10'h258;
    stim[32] = 10'h1b0;
    stim[33] = 10'h2ac;
    stim[34] = 10'h250;
    stim[35] = 10'h30e;
    stim[36] = 10'h1de;
    stim[37] = 10'h2fc;
    stim[38] = 10'h229;
    stim[39] = 10'h0ab;
    stim[40] = 10'h23d;
    stim[41] = 10'h2c1;
    stim[42] = 10'h0c7;
    stim[43] = 10'h0fd;
    stim[44] = 10'h053;
    stim[45] = 10'h03e;
    stim[46] = 10'h173;
    stim[47] = 10'h1bc;
    stim[48] = 10'h30c;
    stim[49] = 10'h3c7;
    stim[50] = 10'h2a1;
    stim[51] = 10'h153;
    stim[52] = 10'h399;
    stim[53] = 10'h2c6;
    stim[54] = 10'h27d;
    stim[55] = 10'h3ec;
    stim[56] = 10'h1f5;
    stim[57] = 10'h35f;
    stim[58] = 10'h00d;
    stim[59] = 10'h049;
    stim[60] = 10'h306;
    stim[61] = 10'h054;
    stim[62] = 10'h28e;
    stim[63] = 10'h047;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 31'h1ba20408;
      expv[1] = 31'h7ba20408;
      expv[2] = 31'h2dc3870e;
      expv[3] = 31'h7783870e;
      expv[4] = 31'h01220408;
      expv[5] = 31'h3f51a346;
      expv[6] = 31'h60b060c1;
      expv[7] = 31'h719060c1;
      expv[8] = 31'h1f51a346;
      expv[9] = 31'h1fe3870e;
      expv[10] = 31'h56a20408;
      expv[11] = 31'h1ae3870e;
      expv[12] = 31'h5fa20408;
      expv[13] = 31'h3fc3870e;
      expv[14] = 31'h429060c1;
      expv[15] = 31'h4ba20408;
      expv[16] = 31'h615060c1;
      expv[17] = 31'h499060c1;
      expv[18] = 31'h3b31a346;
      expv[19] = 31'h16d1a346;
      expv[20] = 31'h1e63870e;
      expv[21] = 31'h2f51a346;
      expv[22] = 31'h041060c1;
      expv[23] = 31'h43e3870e;
      expv[24] = 31'h5563870e;
      expv[25] = 31'h3f71a346;
      expv[26] = 31'h5d9060c1;
      expv[27] = 31'h4a220408;
      expv[28] = 31'h0fd1a346;
      expv[29] = 31'h5b9060c1;
      expv[30] = 31'h35c3870e;
      expv[31] = 31'h4b1060c1;
      expv[32] = 31'h361060c1;
      expv[33] = 31'h559060c1;
      expv[34] = 31'h4a1060c1;
      expv[35] = 31'h61d060c1;
      expv[36] = 31'h3bc3870e;
      expv[37] = 31'h5f9060c1;
      expv[38] = 31'h45220408;
      expv[39] = 31'h1563870e;
      expv[40] = 31'h47a20408;
      expv[41] = 31'h58220408;
      expv[42] = 31'h18e3870e;
      expv[43] = 31'h1fa20408;
      expv[44] = 31'h0a63870e;
      expv[45] = 31'h07d1a346;
      expv[46] = 31'h2e7060c1;
      expv[47] = 31'h3783870e;
      expv[48] = 31'h619060c1;
      expv[49] = 31'h78f060c1;
      expv[50] = 31'h54220408;
      expv[51] = 31'h2a7060c1;
      expv[52] = 31'h73220408;
      expv[53] = 31'h58d1a346;
      expv[54] = 31'h4fa20408;
      expv[55] = 31'h7d91a346;
      expv[56] = 31'h3ea20408;
      expv[57] = 31'h6be20408;
      expv[58] = 31'h01a20408;
      expv[59] = 31'h09220408;
      expv[60] = 31'h60d060c1;
      expv[61] = 31'h0a9060c1;
      expv[62] = 31'h51d1a346;
      expv[63] = 31'h08e3870e;
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
