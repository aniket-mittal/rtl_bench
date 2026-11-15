// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_138280 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .compressed_out(out_vec[16:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1fb;
    stim[1] = 9'h11b;
    stim[2] = 9'h0e8;
    stim[3] = 9'h03e;
    stim[4] = 9'h018;
    stim[5] = 9'h002;
    stim[6] = 9'h064;
    stim[7] = 9'h071;
    stim[8] = 9'h0b1;
    stim[9] = 9'h0a4;
    stim[10] = 9'h194;
    stim[11] = 9'h07c;
    stim[12] = 9'h015;
    stim[13] = 9'h0ef;
    stim[14] = 9'h0f4;
    stim[15] = 9'h012;
    stim[16] = 9'h02d;
    stim[17] = 9'h0be;
    stim[18] = 9'h05a;
    stim[19] = 9'h0ff;
    stim[20] = 9'h0af;
    stim[21] = 9'h0ae;
    stim[22] = 9'h08a;
    stim[23] = 9'h09a;
    stim[24] = 9'h056;
    stim[25] = 9'h011;
    stim[26] = 9'h0ec;
    stim[27] = 9'h00b;
    stim[28] = 9'h097;
    stim[29] = 9'h0f3;
    stim[30] = 9'h062;
    stim[31] = 9'h031;
    stim[32] = 9'h06f;
    stim[33] = 9'h012;
    stim[34] = 9'h062;
    stim[35] = 9'h09a;
    stim[36] = 9'h079;
    stim[37] = 9'h0a8;
    stim[38] = 9'h0dc;
    stim[39] = 9'h08e;
    stim[40] = 9'h044;
    stim[41] = 9'h020;
    stim[42] = 9'h0ae;
    stim[43] = 9'h00a;
    stim[44] = 9'h07b;
    stim[45] = 9'h052;
    stim[46] = 9'h050;
    stim[47] = 9'h02e;
    stim[48] = 9'h071;
    stim[49] = 9'h05d;
    stim[50] = 9'h0eb;
    stim[51] = 9'h07c;
    stim[52] = 9'h008;
    stim[53] = 9'h00a;
    stim[54] = 9'h0df;
    stim[55] = 9'h0ff;
    stim[56] = 9'h072;
    stim[57] = 9'h0fe;
    stim[58] = 9'h0c0;
    stim[59] = 9'h058;
    stim[60] = 9'h0ca;
    stim[61] = 9'h08c;
    stim[62] = 9'h06b;
    stim[63] = 9'h0d1;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h1d07d;
      expv[6] = 17'h1d07d;
      expv[7] = 17'h1d07d;
      expv[8] = 17'h004c9;
      expv[9] = 17'h004c9;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h0f82b;
      expv[15] = 17'h0f82b;
      expv[16] = 17'h0f82b;
      expv[17] = 17'h1e825;
      expv[18] = 17'h1e825;
      expv[19] = 17'h1e825;
      expv[20] = 17'h17cb5;
      expv[21] = 17'h17cb5;
      expv[22] = 17'h17cb5;
      expv[23] = 17'h15f5d;
      expv[24] = 17'h15f5d;
      expv[25] = 17'h15f5d;
      expv[26] = 17'h134ad;
      expv[27] = 17'h134ad;
      expv[28] = 17'h134ad;
      expv[29] = 17'h1d817;
      expv[30] = 17'h1d817;
      expv[31] = 17'h1d817;
      expv[32] = 17'h1e6c5;
      expv[33] = 17'h1e6c5;
      expv[34] = 17'h1e6c5;
      expv[35] = 17'h0de25;
      expv[36] = 17'h0de25;
      expv[37] = 17'h0de25;
      expv[38] = 17'h134f3;
      expv[39] = 17'h134f3;
      expv[40] = 17'h134f3;
      expv[41] = 17'h1b91d;
      expv[42] = 17'h1b91d;
      expv[43] = 17'h1b91d;
      expv[44] = 17'h0415d;
      expv[45] = 17'h0415d;
      expv[46] = 17'h0415d;
      expv[47] = 17'h0f6a5;
      expv[48] = 17'h0f6a5;
      expv[49] = 17'h0f6a5;
      expv[50] = 17'h05ce3;
      expv[51] = 17'h05ce3;
      expv[52] = 17'h05ce3;
      expv[53] = 17'h1d6f9;
      expv[54] = 17'h1d6f9;
      expv[55] = 17'h1d6f9;
      expv[56] = 17'h015bf;
      expv[57] = 17'h015bf;
      expv[58] = 17'h015bf;
      expv[59] = 17'h0e5fd;
      expv[60] = 17'h0e5fd;
      expv[61] = 17'h0e5fd;
      expv[62] = 17'h0b195;
      expv[63] = 17'h0b195;
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
