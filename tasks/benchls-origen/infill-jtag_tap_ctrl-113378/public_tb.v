// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_113378 dut (
    .TCLK(clk),
    .TRST(in_vec[2:2]),
    .TMS(in_vec[1:1]),
    .TDI(in_vec[0:0]),
    .TDO(out_vec[40:40]),
    .clk(out_vec[39:39]),
    .reset(out_vec[38:38]),
    .data_reg(out_vec[37:6]),
    .data_reg_valid(out_vec[5:5]),
    .inst_reg(out_vec[4:1]),
    .inst_reg_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h6;
    stim[1] = 3'h5;
    stim[2] = 3'h0;
    stim[3] = 3'h1;
    stim[4] = 3'h3;
    stim[5] = 3'h0;
    stim[6] = 3'h2;
    stim[7] = 3'h2;
    stim[8] = 3'h0;
    stim[9] = 3'h3;
    stim[10] = 3'h1;
    stim[11] = 3'h2;
    stim[12] = 3'h0;
    stim[13] = 3'h2;
    stim[14] = 3'h3;
    stim[15] = 3'h1;
    stim[16] = 3'h0;
    stim[17] = 3'h3;
    stim[18] = 3'h3;
    stim[19] = 3'h1;
    stim[20] = 3'h1;
    stim[21] = 3'h1;
    stim[22] = 3'h2;
    stim[23] = 3'h1;
    stim[24] = 3'h0;
    stim[25] = 3'h2;
    stim[26] = 3'h7;
    stim[27] = 3'h0;
    stim[28] = 3'h2;
    stim[29] = 3'h1;
    stim[30] = 3'h2;
    stim[31] = 3'h0;
    stim[32] = 3'h2;
    stim[33] = 3'h3;
    stim[34] = 3'h3;
    stim[35] = 3'h2;
    stim[36] = 3'h2;
    stim[37] = 3'h0;
    stim[38] = 3'h0;
    stim[39] = 3'h3;
    stim[40] = 3'h3;
    stim[41] = 3'h2;
    stim[42] = 3'h0;
    stim[43] = 3'h1;
    stim[44] = 3'h3;
    stim[45] = 3'h3;
    stim[46] = 3'h1;
    stim[47] = 3'h1;
    stim[48] = 3'h1;
    stim[49] = 3'h1;
    stim[50] = 3'h3;
    stim[51] = 3'h1;
    stim[52] = 3'h2;
    stim[53] = 3'h1;
    stim[54] = 3'h2;
    stim[55] = 3'h1;
    stim[56] = 3'h0;
    stim[57] = 3'h2;
    stim[58] = 3'h1;
    stim[59] = 3'h2;
    stim[60] = 3'h2;
    stim[61] = 3'h0;
    stim[62] = 3'h0;
    stim[63] = 3'h0;
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
      expv[0] = 41'h04000000000;
      expv[1] = 41'h14000000000;
      expv[2] = 41'h00000000000;
      expv[3] = 41'h10000000000;
      expv[4] = 41'h10000000000;
      expv[5] = 41'h00000000000;
      expv[6] = 41'h00000000000;
      expv[7] = 41'h00000000000;
      expv[8] = 41'h00000000000;
      expv[9] = 41'h10000000020;
      expv[10] = 41'h10000000000;
      expv[11] = 41'h00000000000;
      expv[12] = 41'h00000000000;
      expv[13] = 41'h00000000000;
      expv[14] = 41'h10000000000;
      expv[15] = 41'h10000000000;
      expv[16] = 41'h00000000020;
      expv[17] = 41'h10000000000;
      expv[18] = 41'h10000000000;
      expv[19] = 41'h10000000000;
      expv[20] = 41'h10000000000;
      expv[21] = 41'h10000000000;
      expv[22] = 41'h00000000010;
      expv[23] = 41'h10000000008;
      expv[24] = 41'h00000000008;
      expv[25] = 41'h00000000008;
      expv[26] = 41'h14000000000;
      expv[27] = 41'h00000000000;
      expv[28] = 41'h00000000000;
      expv[29] = 41'h10000000000;
      expv[30] = 41'h00000000000;
      expv[31] = 41'h00000000000;
      expv[32] = 41'h00000000000;
      expv[33] = 41'h10000000000;
      expv[34] = 41'h10000000000;
      expv[35] = 41'h00000000020;
      expv[36] = 41'h00000000000;
      expv[37] = 41'h00000000000;
      expv[38] = 41'h00000000000;
      expv[39] = 41'h10000000000;
      expv[40] = 41'h10000000000;
      expv[41] = 41'h00000000000;
      expv[42] = 41'h00000000000;
      expv[43] = 41'h10000000000;
      expv[44] = 41'h10000000000;
      expv[45] = 41'h10000000000;
      expv[46] = 41'h10000000000;
      expv[47] = 41'h10000000000;
      expv[48] = 41'h10000000000;
      expv[49] = 41'h10000000010;
      expv[50] = 41'h10000000018;
      expv[51] = 41'h1000000001c;
      expv[52] = 41'h0000000001c;
      expv[53] = 41'h1000000001c;
      expv[54] = 41'h0000000001c;
      expv[55] = 41'h1000000000e;
      expv[56] = 41'h0000000000e;
      expv[57] = 41'h0000000000e;
      expv[58] = 41'h1000000000e;
      expv[59] = 41'h0000000000e;
      expv[60] = 41'h00000000006;
      expv[61] = 41'h00000000006;
      expv[62] = 41'h00000000007;
      expv[63] = 41'h00000000006;
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
