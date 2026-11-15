// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061503 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .uart_data(in_vec[7:0]),
    .btnAttack(out_vec[4:4]),
    .btnUp(out_vec[3:3]),
    .btnLeft(out_vec[2:2]),
    .btnRight(out_vec[1:1]),
    .btnDown(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h180;
    stim[1] = 9'h1d5;
    stim[2] = 9'h0f1;
    stim[3] = 9'h0f4;
    stim[4] = 9'h0b3;
    stim[5] = 9'h075;
    stim[6] = 9'h012;
    stim[7] = 9'h0f7;
    stim[8] = 9'h095;
    stim[9] = 9'h0c5;
    stim[10] = 9'h0a2;
    stim[11] = 9'h007;
    stim[12] = 9'h027;
    stim[13] = 9'h09b;
    stim[14] = 9'h019;
    stim[15] = 9'h062;
    stim[16] = 9'h0a3;
    stim[17] = 9'h06c;
    stim[18] = 9'h0e6;
    stim[19] = 9'h0b6;
    stim[20] = 9'h0de;
    stim[21] = 9'h0f6;
    stim[22] = 9'h0a8;
    stim[23] = 9'h098;
    stim[24] = 9'h0e5;
    stim[25] = 9'h092;
    stim[26] = 9'h0c9;
    stim[27] = 9'h072;
    stim[28] = 9'h052;
    stim[29] = 9'h088;
    stim[30] = 9'h0e6;
    stim[31] = 9'h0fb;
    stim[32] = 9'h0b1;
    stim[33] = 9'h004;
    stim[34] = 9'h024;
    stim[35] = 9'h0ca;
    stim[36] = 9'h027;
    stim[37] = 9'h059;
    stim[38] = 9'h033;
    stim[39] = 9'h096;
    stim[40] = 9'h02f;
    stim[41] = 9'h017;
    stim[42] = 9'h041;
    stim[43] = 9'h074;
    stim[44] = 9'h0a1;
    stim[45] = 9'h0ec;
    stim[46] = 9'h07c;
    stim[47] = 9'h08c;
    stim[48] = 9'h0d1;
    stim[49] = 9'h078;
    stim[50] = 9'h097;
    stim[51] = 9'h087;
    stim[52] = 9'h080;
    stim[53] = 9'h068;
    stim[54] = 9'h022;
    stim[55] = 9'h0a8;
    stim[56] = 9'h00f;
    stim[57] = 9'h0bf;
    stim[58] = 9'h0b2;
    stim[59] = 9'h0c4;
    stim[60] = 9'h08f;
    stim[61] = 9'h00a;
    stim[62] = 9'h092;
    stim[63] = 9'h073;
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
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
