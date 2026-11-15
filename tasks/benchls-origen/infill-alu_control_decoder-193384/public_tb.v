// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_193384 dut (
    .ctrl_in(in_vec[3:0]),
    .arithmetic_negative(out_vec[10:10]),
    .logic_ctrl(out_vec[9:8]),
    .shift_ctrl(out_vec[7:6]),
    .comparer_signed_compare(out_vec[5:5]),
    .comparer_compare_select(out_vec[4:2]),
    .ALU_S_select(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h9;
    stim[1] = 4'h9;
    stim[2] = 4'hd;
    stim[3] = 4'h5;
    stim[4] = 4'h4;
    stim[5] = 4'h1;
    stim[6] = 4'hf;
    stim[7] = 4'h0;
    stim[8] = 4'h3;
    stim[9] = 4'h1;
    stim[10] = 4'hb;
    stim[11] = 4'h3;
    stim[12] = 4'h6;
    stim[13] = 4'h3;
    stim[14] = 4'h7;
    stim[15] = 4'hb;
    stim[16] = 4'ha;
    stim[17] = 4'hc;
    stim[18] = 4'h2;
    stim[19] = 4'h5;
    stim[20] = 4'he;
    stim[21] = 4'he;
    stim[22] = 4'he;
    stim[23] = 4'h4;
    stim[24] = 4'h2;
    stim[25] = 4'h0;
    stim[26] = 4'h9;
    stim[27] = 4'h9;
    stim[28] = 4'h9;
    stim[29] = 4'ha;
    stim[30] = 4'hc;
    stim[31] = 4'hb;
    stim[32] = 4'h0;
    stim[33] = 4'ha;
    stim[34] = 4'h9;
    stim[35] = 4'h9;
    stim[36] = 4'h6;
    stim[37] = 4'hb;
    stim[38] = 4'h7;
    stim[39] = 4'h2;
    stim[40] = 4'hb;
    stim[41] = 4'h2;
    stim[42] = 4'h7;
    stim[43] = 4'h5;
    stim[44] = 4'h4;
    stim[45] = 4'h8;
    stim[46] = 4'hb;
    stim[47] = 4'h0;
    stim[48] = 4'h1;
    stim[49] = 4'h9;
    stim[50] = 4'he;
    stim[51] = 4'h2;
    stim[52] = 4'hd;
    stim[53] = 4'he;
    stim[54] = 4'h5;
    stim[55] = 4'h0;
    stim[56] = 4'h9;
    stim[57] = 4'h0;
    stim[58] = 4'h6;
    stim[59] = 4'h1;
    stim[60] = 4'h0;
    stim[61] = 4'hd;
    stim[62] = 4'h6;
    stim[63] = 4'hb;
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
      expv[0] = 11'h004;
      expv[1] = 11'h004;
      expv[2] = 11'h004;
      expv[3] = 11'h305;
      expv[4] = 11'h205;
      expv[5] = 11'h404;
      expv[6] = 11'h004;
      expv[7] = 11'h004;
      expv[8] = 11'h105;
      expv[9] = 11'h404;
      expv[10] = 11'h004;
      expv[11] = 11'h105;
      expv[12] = 11'h006;
      expv[13] = 11'h105;
      expv[14] = 11'h046;
      expv[15] = 11'h004;
      expv[16] = 11'h027;
      expv[17] = 11'h004;
      expv[18] = 11'h005;
      expv[19] = 11'h305;
      expv[20] = 11'h004;
      expv[21] = 11'h004;
      expv[22] = 11'h004;
      expv[23] = 11'h205;
      expv[24] = 11'h005;
      expv[25] = 11'h004;
      expv[26] = 11'h004;
      expv[27] = 11'h004;
      expv[28] = 11'h004;
      expv[29] = 11'h027;
      expv[30] = 11'h004;
      expv[31] = 11'h004;
      expv[32] = 11'h004;
      expv[33] = 11'h027;
      expv[34] = 11'h004;
      expv[35] = 11'h004;
      expv[36] = 11'h006;
      expv[37] = 11'h004;
      expv[38] = 11'h046;
      expv[39] = 11'h005;
      expv[40] = 11'h004;
      expv[41] = 11'h005;
      expv[42] = 11'h046;
      expv[43] = 11'h305;
      expv[44] = 11'h205;
      expv[45] = 11'h086;
      expv[46] = 11'h004;
      expv[47] = 11'h004;
      expv[48] = 11'h404;
      expv[49] = 11'h004;
      expv[50] = 11'h004;
      expv[51] = 11'h005;
      expv[52] = 11'h004;
      expv[53] = 11'h004;
      expv[54] = 11'h305;
      expv[55] = 11'h004;
      expv[56] = 11'h004;
      expv[57] = 11'h004;
      expv[58] = 11'h006;
      expv[59] = 11'h404;
      expv[60] = 11'h004;
      expv[61] = 11'h004;
      expv[62] = 11'h006;
      expv[63] = 11'h004;
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
