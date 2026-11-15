// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05063 dut (
    .clock(clk),
    .reset(in_vec[13:13]),
    .enable(in_vec[12:12]),
    .adc(in_vec[11:0]),
    .rssi(out_vec[31:16]),
    .over_count(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3083;
    stim[1] = 14'h3689;
    stim[2] = 14'h1008;
    stim[3] = 14'h1df2;
    stim[4] = 14'h175a;
    stim[5] = 14'h03dc;
    stim[6] = 14'h1b1f;
    stim[7] = 14'h1486;
    stim[8] = 14'h0a49;
    stim[9] = 14'h134a;
    stim[10] = 14'h0881;
    stim[11] = 14'h1890;
    stim[12] = 14'h01df;
    stim[13] = 14'h0425;
    stim[14] = 14'h0449;
    stim[15] = 14'h0966;
    stim[16] = 14'h1629;
    stim[17] = 14'h1656;
    stim[18] = 14'h06b3;
    stim[19] = 14'h12e7;
    stim[20] = 14'h1b73;
    stim[21] = 14'h0f09;
    stim[22] = 14'h045a;
    stim[23] = 14'h184e;
    stim[24] = 14'h1ba8;
    stim[25] = 14'h114f;
    stim[26] = 14'h01d6;
    stim[27] = 14'h1209;
    stim[28] = 14'h085c;
    stim[29] = 14'h1ed5;
    stim[30] = 14'h019b;
    stim[31] = 14'h0251;
    stim[32] = 14'h0dad;
    stim[33] = 14'h0592;
    stim[34] = 14'h1172;
    stim[35] = 14'h17f2;
    stim[36] = 14'h12f6;
    stim[37] = 14'h165e;
    stim[38] = 14'h1fd1;
    stim[39] = 14'h0855;
    stim[40] = 14'h07a9;
    stim[41] = 14'h0035;
    stim[42] = 14'h156c;
    stim[43] = 14'h1ff7;
    stim[44] = 14'h09a6;
    stim[45] = 14'h0a7b;
    stim[46] = 14'h17d6;
    stim[47] = 14'h06bc;
    stim[48] = 14'h047b;
    stim[49] = 14'h0df5;
    stim[50] = 14'h1822;
    stim[51] = 14'h055a;
    stim[52] = 14'h07c6;
    stim[53] = 14'h15d7;
    stim[54] = 14'h01cf;
    stim[55] = 14'h0fc3;
    stim[56] = 14'h14b7;
    stim[57] = 14'h10d7;
    stim[58] = 14'h0f08;
    stim[59] = 14'h12f2;
    stim[60] = 14'h02af;
    stim[61] = 14'h059b;
    stim[62] = 14'h159c;
    stim[63] = 14'h0be7;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00020000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00010000;
      expv[8] = 32'h00020000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00010000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00010000;
      expv[18] = 32'h00030000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00010000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00010000;
      expv[25] = 32'h00030000;
      expv[26] = 32'h00030000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00020000;
      expv[37] = 32'h00030000;
      expv[38] = 32'h00040000;
      expv[39] = 32'h00040000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00010000;
      expv[44] = 32'h00010000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00010000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00010000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00010000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00010000;
      expv[58] = 32'h00010000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00010000;
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
