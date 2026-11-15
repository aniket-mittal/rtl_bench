// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_068841 dut (
    .CLK(clk),
    .clr(in_vec[0:0]),
    .hsync(out_vec[23:23]),
    .vsync(out_vec[22:22]),
    .PixelX(out_vec[21:12]),
    .PixelY(out_vec[11:2]),
    .vidon(out_vec[1:1]),
    .slw_clk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h1;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 24'hc00000;
      expv[1] = 24'hc00000;
      expv[2] = 24'hc00000;
      expv[3] = 24'h3d0f7d;
      expv[4] = 24'h3d0f7c;
      expv[5] = 24'h3d1f7d;
      expv[6] = 24'h3d1f7c;
      expv[7] = 24'h3d2f7d;
      expv[8] = 24'h3d2f7c;
      expv[9] = 24'h3d3f7d;
      expv[10] = 24'h3d3f7c;
      expv[11] = 24'h3d4f7d;
      expv[12] = 24'h3d4f7c;
      expv[13] = 24'h3d5f7d;
      expv[14] = 24'h3d5f7c;
      expv[15] = 24'h3d6f7d;
      expv[16] = 24'h3d6f7c;
      expv[17] = 24'h3d7f7d;
      expv[18] = 24'h3d7f7c;
      expv[19] = 24'h3d8f7d;
      expv[20] = 24'h3d8f7c;
      expv[21] = 24'h3d9f7d;
      expv[22] = 24'h3d9f7c;
      expv[23] = 24'h3daf7d;
      expv[24] = 24'h3daf7c;
      expv[25] = 24'h3dbf7d;
      expv[26] = 24'h3dbf7c;
      expv[27] = 24'h3dcf7d;
      expv[28] = 24'h3dcf7c;
      expv[29] = 24'h3ddf7d;
      expv[30] = 24'h3ddf7c;
      expv[31] = 24'h3def7d;
      expv[32] = 24'h3def7c;
      expv[33] = 24'h3dff7d;
      expv[34] = 24'h3dff7c;
      expv[35] = 24'h3e0f7d;
      expv[36] = 24'h3e0f7c;
      expv[37] = 24'h3e1f7d;
      expv[38] = 24'h3e1f7c;
      expv[39] = 24'h3e2f7d;
      expv[40] = 24'h3e2f7c;
      expv[41] = 24'h3e3f7d;
      expv[42] = 24'h3e3f7c;
      expv[43] = 24'h3e4f7d;
      expv[44] = 24'h3e4f7c;
      expv[45] = 24'h3e5f7d;
      expv[46] = 24'h3e5f7c;
      expv[47] = 24'hc00000;
      expv[48] = 24'hc00000;
      expv[49] = 24'h3d0f7d;
      expv[50] = 24'h3d0f7c;
      expv[51] = 24'h3d1f7d;
      expv[52] = 24'h3d1f7c;
      expv[53] = 24'h3d2f7d;
      expv[54] = 24'h3d2f7c;
      expv[55] = 24'h3d3f7d;
      expv[56] = 24'h3d3f7c;
      expv[57] = 24'h3d4f7d;
      expv[58] = 24'h3d4f7c;
      expv[59] = 24'h3d5f7d;
      expv[60] = 24'h3d5f7c;
      expv[61] = 24'h3d6f7d;
      expv[62] = 24'h3d6f7c;
      expv[63] = 24'h3d7f7d;
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
