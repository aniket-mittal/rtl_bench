// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_129807 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .start(in_vec[8:8]),
    .dividend(in_vec[7:4]),
    .divisor(in_vec[3:0]),
    .quotient(out_vec[8:5]),
    .remainder(out_vec[4:1]),
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
    stim[0] = 10'h33c;
    stim[1] = 10'h235;
    stim[2] = 10'h165;
    stim[3] = 10'h0dd;
    stim[4] = 10'h0b9;
    stim[5] = 10'h0f5;
    stim[6] = 10'h31f;
    stim[7] = 10'h092;
    stim[8] = 10'h1fe;
    stim[9] = 10'h0eb;
    stim[10] = 10'h0c0;
    stim[11] = 10'h0fc;
    stim[12] = 10'h171;
    stim[13] = 10'h1aa;
    stim[14] = 10'h1c0;
    stim[15] = 10'h123;
    stim[16] = 10'h055;
    stim[17] = 10'h039;
    stim[18] = 10'h113;
    stim[19] = 10'h1d2;
    stim[20] = 10'h107;
    stim[21] = 10'h144;
    stim[22] = 10'h071;
    stim[23] = 10'h0e2;
    stim[24] = 10'h19d;
    stim[25] = 10'h307;
    stim[26] = 10'h056;
    stim[27] = 10'h196;
    stim[28] = 10'h1d8;
    stim[29] = 10'h0b0;
    stim[30] = 10'h08d;
    stim[31] = 10'h19d;
    stim[32] = 10'h0ee;
    stim[33] = 10'h0e9;
    stim[34] = 10'h13d;
    stim[35] = 10'h0d1;
    stim[36] = 10'h045;
    stim[37] = 10'h155;
    stim[38] = 10'h0cd;
    stim[39] = 10'h043;
    stim[40] = 10'h2c7;
    stim[41] = 10'h00f;
    stim[42] = 10'h003;
    stim[43] = 10'h115;
    stim[44] = 10'h0dc;
    stim[45] = 10'h155;
    stim[46] = 10'h1f3;
    stim[47] = 10'h094;
    stim[48] = 10'h184;
    stim[49] = 10'h14b;
    stim[50] = 10'h02a;
    stim[51] = 10'h0cc;
    stim[52] = 10'h078;
    stim[53] = 10'h07c;
    stim[54] = 10'h03c;
    stim[55] = 10'h040;
    stim[56] = 10'h1b5;
    stim[57] = 10'h043;
    stim[58] = 10'h194;
    stim[59] = 10'h16e;
    stim[60] = 10'h0df;
    stim[61] = 10'h149;
    stim[62] = 10'h076;
    stim[63] = 10'h031;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h06f;
      expv[15] = 9'h00e;
      expv[16] = 9'h00e;
      expv[17] = 9'h00e;
      expv[18] = 9'h00e;
      expv[19] = 9'h00e;
      expv[20] = 9'h06b;
      expv[21] = 9'h00a;
      expv[22] = 9'h00a;
      expv[23] = 9'h00a;
      expv[24] = 9'h00a;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h089;
      expv[34] = 9'h089;
      expv[35] = 9'h008;
      expv[36] = 9'h008;
      expv[37] = 9'h008;
      expv[38] = 9'h008;
      expv[39] = 9'h008;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h045;
      expv[50] = 9'h004;
      expv[51] = 9'h004;
      expv[52] = 9'h004;
      expv[53] = 9'h004;
      expv[54] = 9'h004;
      expv[55] = 9'h001;
      expv[56] = 9'h001;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h081;
      expv[63] = 9'h081;
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
