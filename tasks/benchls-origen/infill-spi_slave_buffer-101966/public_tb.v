// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_101966 dut (
    .i_SCK(clk),
    .i_NRESET(in_vec[10:10]),
    .i_NCE(in_vec[9:9]),
    .i_MOSI(in_vec[8:8]),
    .i_WriteData(in_vec[7:0]),
    .o_MISO(out_vec[8:8]),
    .o_ReadData(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7f3;
    stim[1] = 11'h76f;
    stim[2] = 11'h34f;
    stim[3] = 11'h350;
    stim[4] = 11'h01e;
    stim[5] = 11'h01e;
    stim[6] = 11'h255;
    stim[7] = 11'h00b;
    stim[8] = 11'h3d3;
    stim[9] = 11'h333;
    stim[10] = 11'h26b;
    stim[11] = 11'h1c1;
    stim[12] = 11'h0d4;
    stim[13] = 11'h2ad;
    stim[14] = 11'h006;
    stim[15] = 11'h24e;
    stim[16] = 11'h238;
    stim[17] = 11'h078;
    stim[18] = 11'h2e6;
    stim[19] = 11'h06d;
    stim[20] = 11'h0b6;
    stim[21] = 11'h22d;
    stim[22] = 11'h3b4;
    stim[23] = 11'h0a0;
    stim[24] = 11'h0ef;
    stim[25] = 11'h262;
    stim[26] = 11'h02b;
    stim[27] = 11'h3a3;
    stim[28] = 11'h074;
    stim[29] = 11'h05d;
    stim[30] = 11'h079;
    stim[31] = 11'h18c;
    stim[32] = 11'h307;
    stim[33] = 11'h335;
    stim[34] = 11'h09a;
    stim[35] = 11'h6cf;
    stim[36] = 11'h37f;
    stim[37] = 11'h316;
    stim[38] = 11'h290;
    stim[39] = 11'h3d9;
    stim[40] = 11'h3ad;
    stim[41] = 11'h026;
    stim[42] = 11'h114;
    stim[43] = 11'h3aa;
    stim[44] = 11'h26d;
    stim[45] = 11'h0de;
    stim[46] = 11'h1c4;
    stim[47] = 11'h154;
    stim[48] = 11'h009;
    stim[49] = 11'h13b;
    stim[50] = 11'h302;
    stim[51] = 11'h282;
    stim[52] = 11'h130;
    stim[53] = 11'h324;
    stim[54] = 11'h372;
    stim[55] = 11'h3c2;
    stim[56] = 11'h0e1;
    stim[57] = 11'h16c;
    stim[58] = 11'h243;
    stim[59] = 11'h29b;
    stim[60] = 11'h3ce;
    stim[61] = 11'h190;
    stim[62] = 11'h0a9;
    stim[63] = 11'h28f;
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
      expv[0] = 9'h0xx;
      expv[1] = 9'h000;
      expv[2] = 9'h0f3;
      expv[3] = 9'h0f3;
      expv[4] = 9'h0f3;
      expv[5] = 9'h0f3;
      expv[6] = 9'h0f3;
      expv[7] = 9'h0f3;
      expv[8] = 9'h0f3;
      expv[9] = 9'h0f3;
      expv[10] = 9'h0f3;
      expv[11] = 9'h0f3;
      expv[12] = 9'h0f3;
      expv[13] = 9'h0f3;
      expv[14] = 9'h0f3;
      expv[15] = 9'h0f3;
      expv[16] = 9'h0f3;
      expv[17] = 9'h0f3;
      expv[18] = 9'h0f3;
      expv[19] = 9'h0f3;
      expv[20] = 9'h0f3;
      expv[21] = 9'h0f3;
      expv[22] = 9'h0f3;
      expv[23] = 9'h0f3;
      expv[24] = 9'h0f3;
      expv[25] = 9'h0f3;
      expv[26] = 9'h0f3;
      expv[27] = 9'h0f3;
      expv[28] = 9'h0f3;
      expv[29] = 9'h0f3;
      expv[30] = 9'h0f3;
      expv[31] = 9'h0f3;
      expv[32] = 9'h0f3;
      expv[33] = 9'h0f3;
      expv[34] = 9'h0f3;
      expv[35] = 9'h0f3;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
