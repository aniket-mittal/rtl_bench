// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_120381 dut (
    .i_CLK(clk),
    .i_RST(in_vec[3:3]),
    .i_SET(in_vec[2:2]),
    .i_HR_INCR(in_vec[1:1]),
    .i_MN_INCR(in_vec[0:0]),
    .o_HR_U(out_vec[14:11]),
    .o_HR_T(out_vec[10:9]),
    .o_MN_U(out_vec[8:5]),
    .o_MN_T(out_vec[4:2]),
    .o_SEC(out_vec[1:1]),
    .o_VALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'h9;
    stim[2] = 4'h4;
    stim[3] = 4'h7;
    stim[4] = 4'h6;
    stim[5] = 4'h5;
    stim[6] = 4'h4;
    stim[7] = 4'h5;
    stim[8] = 4'h4;
    stim[9] = 4'h1;
    stim[10] = 4'h2;
    stim[11] = 4'h5;
    stim[12] = 4'h3;
    stim[13] = 4'h7;
    stim[14] = 4'h2;
    stim[15] = 4'h3;
    stim[16] = 4'h6;
    stim[17] = 4'h2;
    stim[18] = 4'h4;
    stim[19] = 4'h7;
    stim[20] = 4'h1;
    stim[21] = 4'h6;
    stim[22] = 4'h7;
    stim[23] = 4'h4;
    stim[24] = 4'h6;
    stim[25] = 4'h3;
    stim[26] = 4'h4;
    stim[27] = 4'h1;
    stim[28] = 4'h2;
    stim[29] = 4'h7;
    stim[30] = 4'h3;
    stim[31] = 4'h4;
    stim[32] = 4'h2;
    stim[33] = 4'h4;
    stim[34] = 4'h2;
    stim[35] = 4'h6;
    stim[36] = 4'h5;
    stim[37] = 4'h4;
    stim[38] = 4'h1;
    stim[39] = 4'h1;
    stim[40] = 4'h3;
    stim[41] = 4'h2;
    stim[42] = 4'h2;
    stim[43] = 4'h7;
    stim[44] = 4'h5;
    stim[45] = 4'h0;
    stim[46] = 4'h0;
    stim[47] = 4'h6;
    stim[48] = 4'h5;
    stim[49] = 4'h0;
    stim[50] = 4'h3;
    stim[51] = 4'h0;
    stim[52] = 4'h0;
    stim[53] = 4'h7;
    stim[54] = 4'h5;
    stim[55] = 4'h3;
    stim[56] = 4'h3;
    stim[57] = 4'h1;
    stim[58] = 4'h0;
    stim[59] = 4'h3;
    stim[60] = 4'h3;
    stim[61] = 4'h2;
    stim[62] = 4'h2;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0820;
      expv[5] = 15'h0820;
      expv[6] = 15'h0840;
      expv[7] = 15'h0840;
      expv[8] = 15'h0860;
      expv[9] = 15'h0860;
      expv[10] = 15'h0860;
      expv[11] = 15'h0860;
      expv[12] = 15'h0880;
      expv[13] = 15'h0880;
      expv[14] = 15'h1080;
      expv[15] = 15'h1080;
      expv[16] = 15'h1080;
      expv[17] = 15'h1080;
      expv[18] = 15'h1080;
      expv[19] = 15'h1080;
      expv[20] = 15'h18a0;
      expv[21] = 15'h18a0;
      expv[22] = 15'h18a0;
      expv[23] = 15'h18c0;
      expv[24] = 15'h18c0;
      expv[25] = 15'h20c0;
      expv[26] = 15'h20c0;
      expv[27] = 15'h20c0;
      expv[28] = 15'h20c0;
      expv[29] = 15'h20c0;
      expv[30] = 15'h28e0;
      expv[31] = 15'h28e0;
      expv[32] = 15'h28e0;
      expv[33] = 15'h28e0;
      expv[34] = 15'h28e0;
      expv[35] = 15'h28e0;
      expv[36] = 15'h30e0;
      expv[37] = 15'h3100;
      expv[38] = 15'h3100;
      expv[39] = 15'h3100;
      expv[40] = 15'h3100;
      expv[41] = 15'h3100;
      expv[42] = 15'h3100;
      expv[43] = 15'h3100;
      expv[44] = 15'h3920;
      expv[45] = 15'h3920;
      expv[46] = 15'h3920;
      expv[47] = 15'h3920;
      expv[48] = 15'h4120;
      expv[49] = 15'h4004;
      expv[50] = 15'h4004;
      expv[51] = 15'h4004;
      expv[52] = 15'h4004;
      expv[53] = 15'h4004;
      expv[54] = 15'h4804;
      expv[55] = 15'h4804;
      expv[56] = 15'h4804;
      expv[57] = 15'h4804;
      expv[58] = 15'h4804;
      expv[59] = 15'h4804;
      expv[60] = 15'h4804;
      expv[61] = 15'h4804;
      expv[62] = 15'h4804;
      expv[63] = 15'h4804;
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
