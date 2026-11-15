// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070429 dut (
    .clk(clk),
    .rst_n(in_vec[14:14]),
    .i_addr(in_vec[13:0]),
    .o_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h1271;
    stim[1] = 15'h35e1;
    stim[2] = 15'h5cd6;
    stim[3] = 15'h7702;
    stim[4] = 15'h6ffe;
    stim[5] = 15'h7df2;
    stim[6] = 15'h5129;
    stim[7] = 15'h6a81;
    stim[8] = 15'h570b;
    stim[9] = 15'h7b55;
    stim[10] = 15'h422d;
    stim[11] = 15'h77e4;
    stim[12] = 15'h5a84;
    stim[13] = 15'h70b7;
    stim[14] = 15'h67f8;
    stim[15] = 15'h5f60;
    stim[16] = 15'h7e27;
    stim[17] = 15'h6198;
    stim[18] = 15'h5f8c;
    stim[19] = 15'h4461;
    stim[20] = 15'h497f;
    stim[21] = 15'h5e56;
    stim[22] = 15'h75ed;
    stim[23] = 15'h5f65;
    stim[24] = 15'h78bc;
    stim[25] = 15'h5a23;
    stim[26] = 15'h7402;
    stim[27] = 15'h7a2e;
    stim[28] = 15'h40df;
    stim[29] = 15'h6d06;
    stim[30] = 15'h5bac;
    stim[31] = 15'h6f0d;
    stim[32] = 15'h74b0;
    stim[33] = 15'h5280;
    stim[34] = 15'h7e74;
    stim[35] = 15'h6169;
    stim[36] = 15'h5c43;
    stim[37] = 15'h6812;
    stim[38] = 15'h4f30;
    stim[39] = 15'h59f9;
    stim[40] = 15'h46dd;
    stim[41] = 15'h59a0;
    stim[42] = 15'h46f0;
    stim[43] = 15'h6b03;
    stim[44] = 15'h486b;
    stim[45] = 15'h4568;
    stim[46] = 15'h52db;
    stim[47] = 15'h7d5d;
    stim[48] = 15'h5213;
    stim[49] = 15'h5460;
    stim[50] = 15'h5d8b;
    stim[51] = 15'h547f;
    stim[52] = 15'h4603;
    stim[53] = 15'h47de;
    stim[54] = 15'h56b0;
    stim[55] = 15'h6173;
    stim[56] = 15'h5cea;
    stim[57] = 15'h6449;
    stim[58] = 15'h5ea2;
    stim[59] = 15'h5596;
    stim[60] = 15'h663e;
    stim[61] = 15'h4163;
    stim[62] = 15'h57f5;
    stim[63] = 15'h6088;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
