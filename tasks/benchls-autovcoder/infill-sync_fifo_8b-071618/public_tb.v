// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071618 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h9d0;
    stim[1] = 12'hf16;
    stim[2] = 12'h05a;
    stim[3] = 12'h3a1;
    stim[4] = 12'hbeb;
    stim[5] = 12'h322;
    stim[6] = 12'h46b;
    stim[7] = 12'h048;
    stim[8] = 12'h2ef;
    stim[9] = 12'h1fb;
    stim[10] = 12'hb61;
    stim[11] = 12'h4e9;
    stim[12] = 12'h41e;
    stim[13] = 12'h539;
    stim[14] = 12'h70d;
    stim[15] = 12'h43a;
    stim[16] = 12'h37a;
    stim[17] = 12'h2fc;
    stim[18] = 12'h7dc;
    stim[19] = 12'h06a;
    stim[20] = 12'h61d;
    stim[21] = 12'h1ee;
    stim[22] = 12'h1d5;
    stim[23] = 12'h189;
    stim[24] = 12'h1df;
    stim[25] = 12'h58a;
    stim[26] = 12'h3d0;
    stim[27] = 12'h321;
    stim[28] = 12'h716;
    stim[29] = 12'h52a;
    stim[30] = 12'h05d;
    stim[31] = 12'h54d;
    stim[32] = 12'h131;
    stim[33] = 12'h627;
    stim[34] = 12'h552;
    stim[35] = 12'h51f;
    stim[36] = 12'h166;
    stim[37] = 12'h5f6;
    stim[38] = 12'h4a3;
    stim[39] = 12'h7f5;
    stim[40] = 12'h39f;
    stim[41] = 12'h493;
    stim[42] = 12'h3cc;
    stim[43] = 12'h7d5;
    stim[44] = 12'h0b7;
    stim[45] = 12'h07c;
    stim[46] = 12'h778;
    stim[47] = 12'h5b5;
    stim[48] = 12'h5cf;
    stim[49] = 12'h620;
    stim[50] = 12'h1ba;
    stim[51] = 12'h51e;
    stim[52] = 12'h4f7;
    stim[53] = 12'h77f;
    stim[54] = 12'h2a6;
    stim[55] = 12'h0e1;
    stim[56] = 12'h5ba;
    stim[57] = 12'h099;
    stim[58] = 12'h187;
    stim[59] = 12'h528;
    stim[60] = 12'h084;
    stim[61] = 12'h4ae;
    stim[62] = 12'h49d;
    stim[63] = 12'h11e;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h116;
      expv[8] = 10'h116;
      expv[9] = 10'h116;
      expv[10] = 10'h116;
      expv[11] = 10'h100;
      expv[12] = 10'h116;
      expv[13] = 10'h116;
      expv[14] = 10'h116;
      expv[15] = 10'h339;
      expv[16] = 10'h339;
      expv[17] = 10'h339;
      expv[18] = 10'h339;
      expv[19] = 10'h30d;
      expv[20] = 10'h30d;
      expv[21] = 10'h3dc;
      expv[22] = 10'h3dc;
      expv[23] = 10'h3dc;
      expv[24] = 10'h3dc;
      expv[25] = 10'h3dc;
      expv[26] = 10'h3dc;
      expv[27] = 10'h3dc;
      expv[28] = 10'h3dc;
      expv[29] = 10'h38a;
      expv[30] = 10'h38a;
      expv[31] = 10'h38a;
      expv[32] = 10'h38a;
      expv[33] = 10'h38a;
      expv[34] = 10'h316;
      expv[35] = 10'h316;
      expv[36] = 10'h316;
      expv[37] = 10'h316;
      expv[38] = 10'h316;
      expv[39] = 10'h316;
      expv[40] = 10'h32a;
      expv[41] = 10'h32a;
      expv[42] = 10'h32a;
      expv[43] = 10'h32a;
      expv[44] = 10'h34d;
      expv[45] = 10'h34d;
      expv[46] = 10'h34d;
      expv[47] = 10'h352;
      expv[48] = 10'h352;
      expv[49] = 10'h352;
      expv[50] = 10'h31f;
      expv[51] = 10'h31f;
      expv[52] = 10'h31f;
      expv[53] = 10'h31f;
      expv[54] = 10'h3f6;
      expv[55] = 10'h3f6;
      expv[56] = 10'h3f6;
      expv[57] = 10'h3f6;
      expv[58] = 10'h3f6;
      expv[59] = 10'h3f6;
      expv[60] = 10'h3f6;
      expv[61] = 10'h3f6;
      expv[62] = 10'h3f6;
      expv[63] = 10'h3f6;
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
