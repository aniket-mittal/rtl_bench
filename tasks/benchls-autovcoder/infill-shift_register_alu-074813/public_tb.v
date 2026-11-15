// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_074813 dut (
    .alu_clk(clk),
    .operation(in_vec[9:8]),
    .in(in_vec[7:0]),
    .out(out_vec[8:1]),
    .carry_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h032;
    stim[1] = 10'h018;
    stim[2] = 10'h219;
    stim[3] = 10'h1b1;
    stim[4] = 10'h054;
    stim[5] = 10'h0f7;
    stim[6] = 10'h140;
    stim[7] = 10'h19d;
    stim[8] = 10'h04c;
    stim[9] = 10'h002;
    stim[10] = 10'h068;
    stim[11] = 10'h32c;
    stim[12] = 10'h21c;
    stim[13] = 10'h188;
    stim[14] = 10'h140;
    stim[15] = 10'h072;
    stim[16] = 10'h391;
    stim[17] = 10'h0c3;
    stim[18] = 10'h372;
    stim[19] = 10'h36c;
    stim[20] = 10'h3a7;
    stim[21] = 10'h3c1;
    stim[22] = 10'h3e5;
    stim[23] = 10'h1ee;
    stim[24] = 10'h1d6;
    stim[25] = 10'h23c;
    stim[26] = 10'h2c3;
    stim[27] = 10'h387;
    stim[28] = 10'h137;
    stim[29] = 10'h248;
    stim[30] = 10'h184;
    stim[31] = 10'h266;
    stim[32] = 10'h390;
    stim[33] = 10'h1a3;
    stim[34] = 10'h02c;
    stim[35] = 10'h2b4;
    stim[36] = 10'h183;
    stim[37] = 10'h1d4;
    stim[38] = 10'h3f0;
    stim[39] = 10'h07d;
    stim[40] = 10'h08e;
    stim[41] = 10'h0fd;
    stim[42] = 10'h34c;
    stim[43] = 10'h346;
    stim[44] = 10'h339;
    stim[45] = 10'h1e9;
    stim[46] = 10'h165;
    stim[47] = 10'h35e;
    stim[48] = 10'h3b7;
    stim[49] = 10'h332;
    stim[50] = 10'h29c;
    stim[51] = 10'h27b;
    stim[52] = 10'h02c;
    stim[53] = 10'h1f8;
    stim[54] = 10'h205;
    stim[55] = 10'h1ae;
    stim[56] = 10'h04c;
    stim[57] = 10'h1b4;
    stim[58] = 10'h186;
    stim[59] = 10'h2f7;
    stim[60] = 10'h1de;
    stim[61] = 10'h004;
    stim[62] = 10'h2d8;
    stim[63] = 10'h27f;
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
      expv[0] = 9'h000;
      expv[1] = 9'h064;
      expv[2] = 9'h030;
      expv[3] = 9'h019;
      expv[4] = 9'h0c7;
      expv[5] = 9'h0a9;
      expv[6] = 9'h1ef;
      expv[7] = 9'h102;
      expv[8] = 9'h075;
      expv[9] = 9'h099;
      expv[10] = 9'h005;
      expv[11] = 9'h0d1;
      expv[12] = 9'h000;
      expv[13] = 9'h01c;
      expv[14] = 9'h021;
      expv[15] = 9'h102;
      expv[16] = 9'h0e4;
      expv[17] = 9'h000;
      expv[18] = 9'h186;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h1b9;
      expv[25] = 9'h15b;
      expv[26] = 9'h13c;
      expv[27] = 9'h0c3;
      expv[28] = 9'h000;
      expv[29] = 9'h0dc;
      expv[30] = 9'h048;
      expv[31] = 9'h011;
      expv[32] = 9'h166;
      expv[33] = 9'h000;
      expv[34] = 9'h08d;
      expv[35] = 9'h059;
      expv[36] = 9'h1b4;
      expv[37] = 9'h00d;
      expv[38] = 9'h153;
      expv[39] = 9'h000;
      expv[40] = 9'h0fa;
      expv[41] = 9'h11c;
      expv[42] = 9'h1fa;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h1a5;
      expv[47] = 9'h196;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h09c;
      expv[52] = 9'h07b;
      expv[53] = 9'h059;
      expv[54] = 9'h1e3;
      expv[55] = 9'h105;
      expv[56] = 9'h0bb;
      expv[57] = 9'h099;
      expv[58] = 9'h0d3;
      expv[59] = 9'h01b;
      expv[60] = 9'h1f7;
      expv[61] = 9'h17b;
      expv[62] = 9'h009;
      expv[63] = 9'h1d8;
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
