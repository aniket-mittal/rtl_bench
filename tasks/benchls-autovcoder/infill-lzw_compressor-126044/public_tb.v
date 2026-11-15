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

  autovcoder_126044 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .compressed_out(out_vec[16:1]),
    .valid_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h11b;
    stim[1] = 9'h17e;
    stim[2] = 9'h00c;
    stim[3] = 9'h08c;
    stim[4] = 9'h04e;
    stim[5] = 9'h051;
    stim[6] = 9'h02a;
    stim[7] = 9'h047;
    stim[8] = 9'h010;
    stim[9] = 9'h03d;
    stim[10] = 9'h04b;
    stim[11] = 9'h018;
    stim[12] = 9'h0a4;
    stim[13] = 9'h04f;
    stim[14] = 9'h0d1;
    stim[15] = 9'h099;
    stim[16] = 9'h009;
    stim[17] = 9'h0c5;
    stim[18] = 9'h021;
    stim[19] = 9'h08b;
    stim[20] = 9'h0ea;
    stim[21] = 9'h022;
    stim[22] = 9'h0f2;
    stim[23] = 9'h0d2;
    stim[24] = 9'h07a;
    stim[25] = 9'h0fe;
    stim[26] = 9'h0fe;
    stim[27] = 9'h056;
    stim[28] = 9'h00f;
    stim[29] = 9'h079;
    stim[30] = 9'h0f6;
    stim[31] = 9'h0ab;
    stim[32] = 9'h0ca;
    stim[33] = 9'h08e;
    stim[34] = 9'h0e4;
    stim[35] = 9'h004;
    stim[36] = 9'h0b8;
    stim[37] = 9'h082;
    stim[38] = 9'h018;
    stim[39] = 9'h071;
    stim[40] = 9'h01d;
    stim[41] = 9'h0e4;
    stim[42] = 9'h0b6;
    stim[43] = 9'h051;
    stim[44] = 9'h008;
    stim[45] = 9'h038;
    stim[46] = 9'h0b4;
    stim[47] = 9'h046;
    stim[48] = 9'h00d;
    stim[49] = 9'h0c6;
    stim[50] = 9'h066;
    stim[51] = 9'h0e1;
    stim[52] = 9'h008;
    stim[53] = 9'h044;
    stim[54] = 9'h08f;
    stim[55] = 9'h02c;
    stim[56] = 9'h0dd;
    stim[57] = 9'h008;
    stim[58] = 9'h0c1;
    stim[59] = 9'h038;
    stim[60] = 9'h0da;
    stim[61] = 9'h05a;
    stim[62] = 9'h0f5;
    stim[63] = 9'h020;
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
      expv[5] = 17'h00000;
      expv[6] = 17'h00001;
      expv[7] = 17'h00001;
      expv[8] = 17'h00001;
      expv[9] = 17'h00001;
      expv[10] = 17'h00201;
      expv[11] = 17'h00201;
      expv[12] = 17'h00201;
      expv[13] = 17'h00201;
      expv[14] = 17'h00401;
      expv[15] = 17'h00401;
      expv[16] = 17'h00401;
      expv[17] = 17'h00401;
      expv[18] = 17'h00601;
      expv[19] = 17'h00601;
      expv[20] = 17'h00601;
      expv[21] = 17'h00601;
      expv[22] = 17'h00801;
      expv[23] = 17'h00801;
      expv[24] = 17'h00801;
      expv[25] = 17'h00801;
      expv[26] = 17'h00a01;
      expv[27] = 17'h00a01;
      expv[28] = 17'h00a01;
      expv[29] = 17'h00a01;
      expv[30] = 17'h00c01;
      expv[31] = 17'h00c01;
      expv[32] = 17'h00c01;
      expv[33] = 17'h00c01;
      expv[34] = 17'h00e01;
      expv[35] = 17'h00e01;
      expv[36] = 17'h00e01;
      expv[37] = 17'h00e01;
      expv[38] = 17'h01001;
      expv[39] = 17'h01001;
      expv[40] = 17'h01001;
      expv[41] = 17'h01001;
      expv[42] = 17'h01201;
      expv[43] = 17'h01201;
      expv[44] = 17'h01201;
      expv[45] = 17'h01201;
      expv[46] = 17'h01401;
      expv[47] = 17'h01401;
      expv[48] = 17'h01401;
      expv[49] = 17'h01401;
      expv[50] = 17'h01601;
      expv[51] = 17'h01601;
      expv[52] = 17'h01601;
      expv[53] = 17'h01601;
      expv[54] = 17'h01801;
      expv[55] = 17'h01801;
      expv[56] = 17'h01801;
      expv[57] = 17'h01801;
      expv[58] = 17'h01a01;
      expv[59] = 17'h01a01;
      expv[60] = 17'h01a01;
      expv[61] = 17'h01a01;
      expv[62] = 17'h01c01;
      expv[63] = 17'h01c01;
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
