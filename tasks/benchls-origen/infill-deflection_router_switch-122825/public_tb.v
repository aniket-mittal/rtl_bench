// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_122825 dut (
    .ppv_0(in_vec[10:7]),
    .ppv_1(in_vec[6:3]),
    .vld_0(in_vec[2:2]),
    .vld_1(in_vec[1:1]),
    .winner(in_vec[0:0]),
    .deflect_0(out_vec[2:2]),
    .deflect_1(out_vec[1:1]),
    .swap(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h124;
    stim[1] = 11'h096;
    stim[2] = 11'h3af;
    stim[3] = 11'h65b;
    stim[4] = 11'h084;
    stim[5] = 11'h748;
    stim[6] = 11'h00d;
    stim[7] = 11'h431;
    stim[8] = 11'h310;
    stim[9] = 11'h7aa;
    stim[10] = 11'h72e;
    stim[11] = 11'h45e;
    stim[12] = 11'h429;
    stim[13] = 11'h07d;
    stim[14] = 11'h378;
    stim[15] = 11'h6be;
    stim[16] = 11'h439;
    stim[17] = 11'h4e2;
    stim[18] = 11'h2fc;
    stim[19] = 11'h130;
    stim[20] = 11'h24a;
    stim[21] = 11'h27d;
    stim[22] = 11'h355;
    stim[23] = 11'h3ed;
    stim[24] = 11'h6fc;
    stim[25] = 11'h707;
    stim[26] = 11'h6d0;
    stim[27] = 11'h6c5;
    stim[28] = 11'h29b;
    stim[29] = 11'h2dc;
    stim[30] = 11'h142;
    stim[31] = 11'h3e5;
    stim[32] = 11'h3cd;
    stim[33] = 11'h084;
    stim[34] = 11'h357;
    stim[35] = 11'h662;
    stim[36] = 11'h38e;
    stim[37] = 11'h3ae;
    stim[38] = 11'h455;
    stim[39] = 11'h7bc;
    stim[40] = 11'h1ef;
    stim[41] = 11'h339;
    stim[42] = 11'h409;
    stim[43] = 11'h068;
    stim[44] = 11'h48a;
    stim[45] = 11'h056;
    stim[46] = 11'h64c;
    stim[47] = 11'h6bd;
    stim[48] = 11'h7e8;
    stim[49] = 11'h7b0;
    stim[50] = 11'h083;
    stim[51] = 11'h5b7;
    stim[52] = 11'h3d8;
    stim[53] = 11'h779;
    stim[54] = 11'h267;
    stim[55] = 11'h1ca;
    stim[56] = 11'h32d;
    stim[57] = 11'h3ad;
    stim[58] = 11'h085;
    stim[59] = 11'h34d;
    stim[60] = 11'h5f6;
    stim[61] = 11'h63b;
    stim[62] = 11'h4a8;
    stim[63] = 11'h67a;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h1;
      expv[3] = 3'h1;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h1;
      expv[8] = 3'h1;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h1;
      expv[12] = 3'h1;
      expv[13] = 3'h0;
      expv[14] = 3'h1;
      expv[15] = 3'h0;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h0;
      expv[20] = 3'h1;
      expv[21] = 3'h0;
      expv[22] = 3'h1;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h1;
      expv[28] = 3'h0;
      expv[29] = 3'h1;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h1;
      expv[33] = 3'h0;
      expv[34] = 3'h1;
      expv[35] = 3'h0;
      expv[36] = 3'h1;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h1;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h1;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h1;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h0;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h1;
      expv[62] = 3'h1;
      expv[63] = 3'h0;
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
