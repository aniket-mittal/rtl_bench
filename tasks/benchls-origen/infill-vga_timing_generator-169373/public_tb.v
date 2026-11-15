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

  origen_169373 dut (
    .clk(clk),
    .reset(in_vec[0:0]),
    .vga_clk(out_vec[23:23]),
    .hsync(out_vec[22:22]),
    .vsync(out_vec[21:21]),
    .pixel_x(out_vec[20:11]),
    .pixel_y(out_vec[10:1]),
    .video_on(out_vec[0:0])
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
    stim[47] = 1'h0;
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
      expv[0] = 24'h7b8fba;
      expv[1] = 24'h7b8fba;
      expv[2] = 24'h7b8fba;
      expv[3] = 24'hfb97ba;
      expv[4] = 24'h7b97ba;
      expv[5] = 24'hfb9fba;
      expv[6] = 24'h7b9fba;
      expv[7] = 24'hfba7ba;
      expv[8] = 24'h7ba7ba;
      expv[9] = 24'hfbafba;
      expv[10] = 24'h7bafba;
      expv[11] = 24'hfbb7ba;
      expv[12] = 24'h7bb7ba;
      expv[13] = 24'hfbbfba;
      expv[14] = 24'h7bbfba;
      expv[15] = 24'hfbc7ba;
      expv[16] = 24'h7bc7ba;
      expv[17] = 24'hfbcfba;
      expv[18] = 24'h7bcfba;
      expv[19] = 24'hfbd7ba;
      expv[20] = 24'h7bd7ba;
      expv[21] = 24'hfbdfba;
      expv[22] = 24'h7bdfba;
      expv[23] = 24'hfbe7ba;
      expv[24] = 24'h7be7ba;
      expv[25] = 24'hfbefba;
      expv[26] = 24'h7befba;
      expv[27] = 24'hfbf7ba;
      expv[28] = 24'h7bf7ba;
      expv[29] = 24'hfbffba;
      expv[30] = 24'h7bffba;
      expv[31] = 24'hfc07ba;
      expv[32] = 24'h7c07ba;
      expv[33] = 24'hfc0fba;
      expv[34] = 24'h7c0fba;
      expv[35] = 24'hfc17ba;
      expv[36] = 24'h7c17ba;
      expv[37] = 24'hfc1fba;
      expv[38] = 24'h7c1fba;
      expv[39] = 24'hfc27ba;
      expv[40] = 24'h7c27ba;
      expv[41] = 24'hfc2fba;
      expv[42] = 24'h7c2fba;
      expv[43] = 24'hfc37ba;
      expv[44] = 24'h7c37ba;
      expv[45] = 24'hfc3fba;
      expv[46] = 24'h7c3fba;
      expv[47] = 24'hfc47ba;
      expv[48] = 24'h7c47ba;
      expv[49] = 24'hfc4fba;
      expv[50] = 24'h7c4fba;
      expv[51] = 24'hfc57ba;
      expv[52] = 24'h7c57ba;
      expv[53] = 24'hfc5fba;
      expv[54] = 24'h7c5fba;
      expv[55] = 24'hfc67ba;
      expv[56] = 24'h7c67ba;
      expv[57] = 24'hfc6fba;
      expv[58] = 24'h7c6fba;
      expv[59] = 24'hfc77ba;
      expv[60] = 24'h7c77ba;
      expv[61] = 24'hfc7fba;
      expv[62] = 24'h7c7fba;
      expv[63] = 24'hfc87ba;
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
