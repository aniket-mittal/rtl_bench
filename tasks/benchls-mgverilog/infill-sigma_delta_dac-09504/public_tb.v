// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09504 dut (
    .clk(clk),
    .level(in_vec[15:0]),
    .O(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h5e0a;
    stim[1] = 16'h56b4;
    stim[2] = 16'hc1a2;
    stim[3] = 16'hce8e;
    stim[4] = 16'hd841;
    stim[5] = 16'hc71d;
    stim[6] = 16'h6e41;
    stim[7] = 16'hcd78;
    stim[8] = 16'h4257;
    stim[9] = 16'h923c;
    stim[10] = 16'hcf3d;
    stim[11] = 16'ha3c2;
    stim[12] = 16'h51d2;
    stim[13] = 16'hf90b;
    stim[14] = 16'h6854;
    stim[15] = 16'he722;
    stim[16] = 16'h080e;
    stim[17] = 16'h95f5;
    stim[18] = 16'h17a3;
    stim[19] = 16'h96d8;
    stim[20] = 16'h6db7;
    stim[21] = 16'hca2d;
    stim[22] = 16'h8d1f;
    stim[23] = 16'hee76;
    stim[24] = 16'h4ae5;
    stim[25] = 16'hd134;
    stim[26] = 16'h7a36;
    stim[27] = 16'h1831;
    stim[28] = 16'hf971;
    stim[29] = 16'h8d18;
    stim[30] = 16'h7e00;
    stim[31] = 16'he0a1;
    stim[32] = 16'h0b3a;
    stim[33] = 16'hb35d;
    stim[34] = 16'h5efc;
    stim[35] = 16'hdb01;
    stim[36] = 16'h7d49;
    stim[37] = 16'h7020;
    stim[38] = 16'hb516;
    stim[39] = 16'h9534;
    stim[40] = 16'hd281;
    stim[41] = 16'h0c1d;
    stim[42] = 16'h9181;
    stim[43] = 16'h8a51;
    stim[44] = 16'h42e2;
    stim[45] = 16'h3441;
    stim[46] = 16'h2ac3;
    stim[47] = 16'h54ed;
    stim[48] = 16'h1cc0;
    stim[49] = 16'h9da9;
    stim[50] = 16'h2fc3;
    stim[51] = 16'h0212;
    stim[52] = 16'h01aa;
    stim[53] = 16'h71c8;
    stim[54] = 16'h9086;
    stim[55] = 16'h4f39;
    stim[56] = 16'hbd9e;
    stim[57] = 16'h2cc2;
    stim[58] = 16'h6823;
    stim[59] = 16'hd37e;
    stim[60] = 16'h07ec;
    stim[61] = 16'he8f7;
    stim[62] = 16'h3848;
    stim[63] = 16'hb481;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
