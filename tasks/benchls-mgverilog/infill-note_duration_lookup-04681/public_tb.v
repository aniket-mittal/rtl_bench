// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04681 dut (
    .lookup(in_vec[3:0]),
    .duration(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h4;
    stim[1] = 4'h2;
    stim[2] = 4'hb;
    stim[3] = 4'hb;
    stim[4] = 4'h3;
    stim[5] = 4'hb;
    stim[6] = 4'hb;
    stim[7] = 4'h5;
    stim[8] = 4'h1;
    stim[9] = 4'ha;
    stim[10] = 4'h8;
    stim[11] = 4'h6;
    stim[12] = 4'hf;
    stim[13] = 4'ha;
    stim[14] = 4'hf;
    stim[15] = 4'hc;
    stim[16] = 4'h0;
    stim[17] = 4'h0;
    stim[18] = 4'h2;
    stim[19] = 4'h7;
    stim[20] = 4'he;
    stim[21] = 4'h2;
    stim[22] = 4'h3;
    stim[23] = 4'h7;
    stim[24] = 4'hd;
    stim[25] = 4'hd;
    stim[26] = 4'hc;
    stim[27] = 4'h3;
    stim[28] = 4'hd;
    stim[29] = 4'h3;
    stim[30] = 4'hf;
    stim[31] = 4'he;
    stim[32] = 4'hf;
    stim[33] = 4'h8;
    stim[34] = 4'hc;
    stim[35] = 4'h8;
    stim[36] = 4'h9;
    stim[37] = 4'hc;
    stim[38] = 4'h5;
    stim[39] = 4'h7;
    stim[40] = 4'h8;
    stim[41] = 4'hd;
    stim[42] = 4'h4;
    stim[43] = 4'ha;
    stim[44] = 4'hf;
    stim[45] = 4'h8;
    stim[46] = 4'h7;
    stim[47] = 4'h5;
    stim[48] = 4'h6;
    stim[49] = 4'h7;
    stim[50] = 4'h8;
    stim[51] = 4'h7;
    stim[52] = 4'h1;
    stim[53] = 4'h9;
    stim[54] = 4'h1;
    stim[55] = 4'hb;
    stim[56] = 4'he;
    stim[57] = 4'he;
    stim[58] = 4'ha;
    stim[59] = 4'he;
    stim[60] = 4'hd;
    stim[61] = 4'hb;
    stim[62] = 4'h1;
    stim[63] = 4'hf;
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
      expv[0] = 16'h1194;
      expv[1] = 16'h07d0;
      expv[2] = 16'h03e8;
      expv[3] = 16'h03e8;
      expv[4] = 16'h0bb8;
      expv[5] = 16'h03e8;
      expv[6] = 16'h03e8;
      expv[7] = 16'h1770;
      expv[8] = 16'h05dc;
      expv[9] = 16'hbb80;
      expv[10] = 16'h4650;
      expv[11] = 16'h2328;
      expv[12] = 16'h03e8;
      expv[13] = 16'hbb80;
      expv[14] = 16'h03e8;
      expv[15] = 16'h03e8;
      expv[16] = 16'h03e8;
      expv[17] = 16'h03e8;
      expv[18] = 16'h07d0;
      expv[19] = 16'h2ee0;
      expv[20] = 16'h03e8;
      expv[21] = 16'h07d0;
      expv[22] = 16'h0bb8;
      expv[23] = 16'h2ee0;
      expv[24] = 16'h03e8;
      expv[25] = 16'h03e8;
      expv[26] = 16'h03e8;
      expv[27] = 16'h0bb8;
      expv[28] = 16'h03e8;
      expv[29] = 16'h0bb8;
      expv[30] = 16'h03e8;
      expv[31] = 16'h03e8;
      expv[32] = 16'h03e8;
      expv[33] = 16'h4650;
      expv[34] = 16'h03e8;
      expv[35] = 16'h4650;
      expv[36] = 16'h5dc0;
      expv[37] = 16'h03e8;
      expv[38] = 16'h1770;
      expv[39] = 16'h2ee0;
      expv[40] = 16'h4650;
      expv[41] = 16'h03e8;
      expv[42] = 16'h1194;
      expv[43] = 16'hbb80;
      expv[44] = 16'h03e8;
      expv[45] = 16'h4650;
      expv[46] = 16'h2ee0;
      expv[47] = 16'h1770;
      expv[48] = 16'h2328;
      expv[49] = 16'h2ee0;
      expv[50] = 16'h4650;
      expv[51] = 16'h2ee0;
      expv[52] = 16'h05dc;
      expv[53] = 16'h5dc0;
      expv[54] = 16'h05dc;
      expv[55] = 16'h03e8;
      expv[56] = 16'h03e8;
      expv[57] = 16'h03e8;
      expv[58] = 16'hbb80;
      expv[59] = 16'h03e8;
      expv[60] = 16'h03e8;
      expv[61] = 16'h03e8;
      expv[62] = 16'h05dc;
      expv[63] = 16'h03e8;
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
