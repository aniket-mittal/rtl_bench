// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_193077 dut (
    .state(in_vec[3:0]),
    .digit_0(out_vec[27:21]),
    .digit_1(out_vec[20:14]),
    .digit_2(out_vec[13:7]),
    .digit_3(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h3;
    stim[1] = 4'h2;
    stim[2] = 4'h3;
    stim[3] = 4'h8;
    stim[4] = 4'hd;
    stim[5] = 4'h7;
    stim[6] = 4'h2;
    stim[7] = 4'h8;
    stim[8] = 4'h7;
    stim[9] = 4'h3;
    stim[10] = 4'ha;
    stim[11] = 4'h3;
    stim[12] = 4'hc;
    stim[13] = 4'h2;
    stim[14] = 4'he;
    stim[15] = 4'h0;
    stim[16] = 4'h7;
    stim[17] = 4'hc;
    stim[18] = 4'h6;
    stim[19] = 4'h1;
    stim[20] = 4'h7;
    stim[21] = 4'hf;
    stim[22] = 4'hf;
    stim[23] = 4'hf;
    stim[24] = 4'hd;
    stim[25] = 4'ha;
    stim[26] = 4'hf;
    stim[27] = 4'hf;
    stim[28] = 4'h7;
    stim[29] = 4'h0;
    stim[30] = 4'h2;
    stim[31] = 4'h8;
    stim[32] = 4'h3;
    stim[33] = 4'h6;
    stim[34] = 4'h8;
    stim[35] = 4'ha;
    stim[36] = 4'h9;
    stim[37] = 4'hf;
    stim[38] = 4'hb;
    stim[39] = 4'he;
    stim[40] = 4'h7;
    stim[41] = 4'h3;
    stim[42] = 4'h8;
    stim[43] = 4'he;
    stim[44] = 4'h5;
    stim[45] = 4'h7;
    stim[46] = 4'hb;
    stim[47] = 4'h5;
    stim[48] = 4'h2;
    stim[49] = 4'he;
    stim[50] = 4'hb;
    stim[51] = 4'h9;
    stim[52] = 4'he;
    stim[53] = 4'hb;
    stim[54] = 4'hf;
    stim[55] = 4'h5;
    stim[56] = 4'h6;
    stim[57] = 4'ha;
    stim[58] = 4'h5;
    stim[59] = 4'h3;
    stim[60] = 4'hf;
    stim[61] = 4'h5;
    stim[62] = 4'h7;
    stim[63] = 4'h6;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 28'h0e304b0;
      expv[1] = 28'h80852a4;
      expv[2] = 28'h0e304b0;
      expv[3] = 28'h8000000;
      expv[4] = 28'h0000000;
      expv[5] = 28'h21e0000;
      expv[6] = 28'h80852a4;
      expv[7] = 28'h8000000;
      expv[8] = 28'h21e0000;
      expv[9] = 28'h0e304b0;
      expv[10] = 28'h0000000;
      expv[11] = 28'h0e304b0;
      expv[12] = 28'h0000000;
      expv[13] = 28'h80852a4;
      expv[14] = 28'h0000000;
      expv[15] = 28'h0000000;
      expv[16] = 28'h21e0000;
      expv[17] = 28'h0000000;
      expv[18] = 28'h4808000;
      expv[19] = 28'h8304079;
      expv[20] = 28'h21e0000;
      expv[21] = 28'h0000000;
      expv[22] = 28'h0000000;
      expv[23] = 28'h0000000;
      expv[24] = 28'h0000000;
      expv[25] = 28'h0000000;
      expv[26] = 28'h0000000;
      expv[27] = 28'h0000000;
      expv[28] = 28'h21e0000;
      expv[29] = 28'h0000000;
      expv[30] = 28'h80852a4;
      expv[31] = 28'h8000000;
      expv[32] = 28'h0e304b0;
      expv[33] = 28'h4808000;
      expv[34] = 28'h8000000;
      expv[35] = 28'h0000000;
      expv[36] = 28'h2040000;
      expv[37] = 28'h0000000;
      expv[38] = 28'h0000000;
      expv[39] = 28'h0000000;
      expv[40] = 28'h21e0000;
      expv[41] = 28'h0e304b0;
      expv[42] = 28'h8000000;
      expv[43] = 28'h0000000;
      expv[44] = 28'hf248000;
      expv[45] = 28'h21e0000;
      expv[46] = 28'h0000000;
      expv[47] = 28'hf248000;
      expv[48] = 28'h80852a4;
      expv[49] = 28'h0000000;
      expv[50] = 28'h0000000;
      expv[51] = 28'h2040000;
      expv[52] = 28'h0000000;
      expv[53] = 28'h0000000;
      expv[54] = 28'h0000000;
      expv[55] = 28'hf248000;
      expv[56] = 28'h4808000;
      expv[57] = 28'h0000000;
      expv[58] = 28'hf248000;
      expv[59] = 28'h0e304b0;
      expv[60] = 28'h0000000;
      expv[61] = 28'hf248000;
      expv[62] = 28'h21e0000;
      expv[63] = 28'h4808000;
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
