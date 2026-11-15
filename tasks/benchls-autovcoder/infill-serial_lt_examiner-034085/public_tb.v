// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034085 dut (
    .clk(clk),
    .reset(in_vec[18:18]),
    .rd(in_vec[17:17]),
    .examine(in_vec[16:16]),
    .lo_addr(in_vec[15:8]),
    .hi_addr(in_vec[7:0]),
    .data_out(out_vec[8:1]),
    .examine_latch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h5dbf4;
    stim[1] = 19'h59c0d;
    stim[2] = 19'h0bdc7;
    stim[3] = 19'h3d798;
    stim[4] = 19'h07315;
    stim[5] = 19'h28e0b;
    stim[6] = 19'h277f7;
    stim[7] = 19'h2e7bb;
    stim[8] = 19'h27b66;
    stim[9] = 19'h06ae3;
    stim[10] = 19'h03c65;
    stim[11] = 19'h3a18b;
    stim[12] = 19'h1d404;
    stim[13] = 19'h21b23;
    stim[14] = 19'h30163;
    stim[15] = 19'h10afe;
    stim[16] = 19'h03e7c;
    stim[17] = 19'h1f05e;
    stim[18] = 19'h27de3;
    stim[19] = 19'h373eb;
    stim[20] = 19'h0f435;
    stim[21] = 19'h1411e;
    stim[22] = 19'h2adaf;
    stim[23] = 19'h2520e;
    stim[24] = 19'h262fb;
    stim[25] = 19'h3c80f;
    stim[26] = 19'h03ece;
    stim[27] = 19'h018a6;
    stim[28] = 19'h13257;
    stim[29] = 19'h0f80d;
    stim[30] = 19'h177c4;
    stim[31] = 19'h07018;
    stim[32] = 19'h0718d;
    stim[33] = 19'h33235;
    stim[34] = 19'h0a381;
    stim[35] = 19'h3870b;
    stim[36] = 19'h1202a;
    stim[37] = 19'h17d50;
    stim[38] = 19'h073e0;
    stim[39] = 19'h038c5;
    stim[40] = 19'h04a59;
    stim[41] = 19'h1728e;
    stim[42] = 19'h3d70e;
    stim[43] = 19'h22931;
    stim[44] = 19'h2e144;
    stim[45] = 19'h03d52;
    stim[46] = 19'h09697;
    stim[47] = 19'h00457;
    stim[48] = 19'h2e63c;
    stim[49] = 19'h00ad5;
    stim[50] = 19'h3edf1;
    stim[51] = 19'h28642;
    stim[52] = 19'h0b514;
    stim[53] = 19'h36107;
    stim[54] = 19'h10e86;
    stim[55] = 19'h3392c;
    stim[56] = 19'h107cd;
    stim[57] = 19'h3315a;
    stim[58] = 19'h3532a;
    stim[59] = 19'h32e58;
    stim[60] = 19'h3e74f;
    stim[61] = 19'h3113d;
    stim[62] = 19'h0b931;
    stim[63] = 19'h08d85;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'hxxx;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'hxxx;
      expv[12] = 9'hxxx;
      expv[13] = 9'hxxx;
      expv[14] = 9'hxxx;
      expv[15] = 9'hxxx;
      expv[16] = 9'hxxx;
      expv[17] = 9'hxxx;
      expv[18] = 9'hxxx;
      expv[19] = 9'hxxx;
      expv[20] = 9'hxxx;
      expv[21] = 9'hxxx;
      expv[22] = 9'hxxx;
      expv[23] = 9'hxxx;
      expv[24] = 9'hxxx;
      expv[25] = 9'hxxx;
      expv[26] = 9'hxxx;
      expv[27] = 9'hxxx;
      expv[28] = 9'hxxx;
      expv[29] = 9'hxxx;
      expv[30] = 9'hxxx;
      expv[31] = 9'hxxx;
      expv[32] = 9'hxxx;
      expv[33] = 9'hxxx;
      expv[34] = 9'hxxx;
      expv[35] = 9'hxxx;
      expv[36] = 9'hxxx;
      expv[37] = 9'hxxx;
      expv[38] = 9'hxxx;
      expv[39] = 9'hxxx;
      expv[40] = 9'hxxx;
      expv[41] = 9'hxxx;
      expv[42] = 9'hxxx;
      expv[43] = 9'hxxx;
      expv[44] = 9'hxxx;
      expv[45] = 9'hxxx;
      expv[46] = 9'hxxx;
      expv[47] = 9'hxxx;
      expv[48] = 9'hxxx;
      expv[49] = 9'h187;
      expv[50] = 9'h187;
      expv[51] = 9'h187;
      expv[52] = 9'h187;
      expv[53] = 9'h187;
      expv[54] = 9'h187;
      expv[55] = 9'h187;
      expv[56] = 9'h187;
      expv[57] = 9'h187;
      expv[58] = 9'h187;
      expv[59] = 9'h187;
      expv[60] = 9'h187;
      expv[61] = 9'h187;
      expv[62] = 9'h187;
      expv[63] = 9'h187;
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
