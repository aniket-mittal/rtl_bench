// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_119896 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .start(in_vec[8:8]),
    .A(in_vec[7:0]),
    .result(out_vec[4:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h20a;
    stim[1] = 10'h383;
    stim[2] = 10'h016;
    stim[3] = 10'h04e;
    stim[4] = 10'h0d4;
    stim[5] = 10'h14a;
    stim[6] = 10'h132;
    stim[7] = 10'h171;
    stim[8] = 10'h1f0;
    stim[9] = 10'h0a4;
    stim[10] = 10'h057;
    stim[11] = 10'h1ca;
    stim[12] = 10'h1a5;
    stim[13] = 10'h19d;
    stim[14] = 10'h05d;
    stim[15] = 10'h1a0;
    stim[16] = 10'h051;
    stim[17] = 10'h07e;
    stim[18] = 10'h0e0;
    stim[19] = 10'h01b;
    stim[20] = 10'h15b;
    stim[21] = 10'h0cc;
    stim[22] = 10'h079;
    stim[23] = 10'h074;
    stim[24] = 10'h055;
    stim[25] = 10'h15d;
    stim[26] = 10'h15a;
    stim[27] = 10'h17d;
    stim[28] = 10'h1bc;
    stim[29] = 10'h11b;
    stim[30] = 10'h118;
    stim[31] = 10'h1be;
    stim[32] = 10'h12e;
    stim[33] = 10'h0a7;
    stim[34] = 10'h07a;
    stim[35] = 10'h311;
    stim[36] = 10'h136;
    stim[37] = 10'h19f;
    stim[38] = 10'h1b3;
    stim[39] = 10'h002;
    stim[40] = 10'h05a;
    stim[41] = 10'h134;
    stim[42] = 10'h020;
    stim[43] = 10'h060;
    stim[44] = 10'h0b4;
    stim[45] = 10'h002;
    stim[46] = 10'h0b9;
    stim[47] = 10'h107;
    stim[48] = 10'h18e;
    stim[49] = 10'h0dd;
    stim[50] = 10'h13e;
    stim[51] = 10'h184;
    stim[52] = 10'h0f4;
    stim[53] = 10'h1cd;
    stim[54] = 10'h1be;
    stim[55] = 10'h02b;
    stim[56] = 10'h049;
    stim[57] = 10'h142;
    stim[58] = 10'h0f9;
    stim[59] = 10'h145;
    stim[60] = 10'h004;
    stim[61] = 10'h079;
    stim[62] = 10'h07b;
    stim[63] = 10'h00b;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h02;
      expv[10] = 5'h02;
      expv[11] = 5'h04;
      expv[12] = 5'h04;
      expv[13] = 5'h06;
      expv[14] = 5'h08;
      expv[15] = 5'h09;
      expv[16] = 5'h09;
      expv[17] = 5'h08;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h02;
      expv[23] = 5'h04;
      expv[24] = 5'h04;
      expv[25] = 5'h06;
      expv[26] = 5'h08;
      expv[27] = 5'h09;
      expv[28] = 5'h09;
      expv[29] = 5'h09;
      expv[30] = 5'h09;
      expv[31] = 5'h09;
      expv[32] = 5'h09;
      expv[33] = 5'h09;
      expv[34] = 5'h08;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h01;
      expv[39] = 5'h01;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h02;
      expv[45] = 5'h02;
      expv[46] = 5'h04;
      expv[47] = 5'h06;
      expv[48] = 5'h06;
      expv[49] = 5'h08;
      expv[50] = 5'h09;
      expv[51] = 5'h09;
      expv[52] = 5'h09;
      expv[53] = 5'h08;
      expv[54] = 5'h00;
      expv[55] = 5'h01;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h02;
      expv[60] = 5'h02;
      expv[61] = 5'h02;
      expv[62] = 5'h04;
      expv[63] = 5'h04;
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
