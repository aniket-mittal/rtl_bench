// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071244 dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .cenop(in_vec[11:11]),
    .zero(in_vec[10:10]),
    .start_value(in_vec[9:2]),
    .load(in_vec[1:1]),
    .clr_flag(in_vec[0:0]),
    .flag(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1a78;
    stim[1] = 13'h1488;
    stim[2] = 13'h0198;
    stim[3] = 13'h0869;
    stim[4] = 13'h0ed8;
    stim[5] = 13'h04f3;
    stim[6] = 13'h00b6;
    stim[7] = 13'h0769;
    stim[8] = 13'h0931;
    stim[9] = 13'h014f;
    stim[10] = 13'h0a41;
    stim[11] = 13'h0966;
    stim[12] = 13'h0f5e;
    stim[13] = 13'h0a7a;
    stim[14] = 13'h025c;
    stim[15] = 13'h0041;
    stim[16] = 13'h040f;
    stim[17] = 13'h0afa;
    stim[18] = 13'h08ce;
    stim[19] = 13'h0784;
    stim[20] = 13'h027f;
    stim[21] = 13'h01fb;
    stim[22] = 13'h0041;
    stim[23] = 13'h0aec;
    stim[24] = 13'h0e72;
    stim[25] = 13'h088c;
    stim[26] = 13'h0cb1;
    stim[27] = 13'h0827;
    stim[28] = 13'h0b8c;
    stim[29] = 13'h0032;
    stim[30] = 13'h0030;
    stim[31] = 13'h006b;
    stim[32] = 13'h0c54;
    stim[33] = 13'h1edb;
    stim[34] = 13'h09bf;
    stim[35] = 13'h00df;
    stim[36] = 13'h0263;
    stim[37] = 13'h0040;
    stim[38] = 13'h0073;
    stim[39] = 13'h0dc9;
    stim[40] = 13'h018f;
    stim[41] = 13'h05d4;
    stim[42] = 13'h051f;
    stim[43] = 13'h0767;
    stim[44] = 13'h064e;
    stim[45] = 13'h0c5f;
    stim[46] = 13'h09ae;
    stim[47] = 13'h0c82;
    stim[48] = 13'h0441;
    stim[49] = 13'h0912;
    stim[50] = 13'h0970;
    stim[51] = 13'h0819;
    stim[52] = 13'h0682;
    stim[53] = 13'h00f7;
    stim[54] = 13'h0c0d;
    stim[55] = 13'h038f;
    stim[56] = 13'h0e1d;
    stim[57] = 13'h0e23;
    stim[58] = 13'h0dda;
    stim[59] = 13'h04f0;
    stim[60] = 13'h007b;
    stim[61] = 13'h08e8;
    stim[62] = 13'h0df0;
    stim[63] = 13'h0345;
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
      expv[0] = 2'hx;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
