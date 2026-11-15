// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11714 dut (
    .CLK_IN(clk),
    .RESETn(in_vec[0:0]),
    .CLK_by_1(out_vec[11:11]),
    .CLK_by_1_EN(out_vec[10:10]),
    .CLK_by_2(out_vec[9:9]),
    .CLK_by_2_EN(out_vec[8:8]),
    .CLK_by_4(out_vec[7:7]),
    .CLK_by_4_EN(out_vec[6:6]),
    .CLK_by_8(out_vec[5:5]),
    .CLK_by_8_EN(out_vec[4:4]),
    .CLK_by_16(out_vec[3:3]),
    .CLK_by_16_EN(out_vec[2:2]),
    .CLK_by_32(out_vec[1:1]),
    .CLK_by_32_EN(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h0;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h0;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 12'h400;
      expv[1] = 12'h400;
      expv[2] = 12'h400;
      expv[3] = 12'h700;
      expv[4] = 12'h4c0;
      expv[5] = 12'h7c0;
      expv[6] = 12'h430;
      expv[7] = 12'h730;
      expv[8] = 12'h4f0;
      expv[9] = 12'h400;
      expv[10] = 12'h400;
      expv[11] = 12'h700;
      expv[12] = 12'h4c0;
      expv[13] = 12'h7c0;
      expv[14] = 12'h430;
      expv[15] = 12'h730;
      expv[16] = 12'h4f0;
      expv[17] = 12'h7f0;
      expv[18] = 12'h40c;
      expv[19] = 12'h70c;
      expv[20] = 12'h4cc;
      expv[21] = 12'h7cc;
      expv[22] = 12'h43c;
      expv[23] = 12'h400;
      expv[24] = 12'h400;
      expv[25] = 12'h700;
      expv[26] = 12'h4c0;
      expv[27] = 12'h7c0;
      expv[28] = 12'h430;
      expv[29] = 12'h730;
      expv[30] = 12'h4f0;
      expv[31] = 12'h7f0;
      expv[32] = 12'h40c;
      expv[33] = 12'h70c;
      expv[34] = 12'h4cc;
      expv[35] = 12'h7cc;
      expv[36] = 12'h43c;
      expv[37] = 12'h73c;
      expv[38] = 12'h4fc;
      expv[39] = 12'h7fc;
      expv[40] = 12'h403;
      expv[41] = 12'h703;
      expv[42] = 12'h4c3;
      expv[43] = 12'h7c3;
      expv[44] = 12'h433;
      expv[45] = 12'h733;
      expv[46] = 12'h4f3;
      expv[47] = 12'h7f3;
      expv[48] = 12'h40f;
      expv[49] = 12'h70f;
      expv[50] = 12'h4cf;
      expv[51] = 12'h7cf;
      expv[52] = 12'h43f;
      expv[53] = 12'h73f;
      expv[54] = 12'h4ff;
      expv[55] = 12'h7ff;
      expv[56] = 12'h400;
      expv[57] = 12'h700;
      expv[58] = 12'h4c0;
      expv[59] = 12'h7c0;
      expv[60] = 12'h430;
      expv[61] = 12'h730;
      expv[62] = 12'h4f0;
      expv[63] = 12'h7f0;
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
