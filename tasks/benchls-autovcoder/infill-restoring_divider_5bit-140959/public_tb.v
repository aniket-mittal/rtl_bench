// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_140959 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .dividend(in_vec[9:5]),
    .divisor(in_vec[4:0]),
    .quotient(out_vec[10:6]),
    .remainder(out_vec[5:1]),
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
    stim[0] = 11'h7c3;
    stim[1] = 11'h712;
    stim[2] = 11'h288;
    stim[3] = 11'h2c3;
    stim[4] = 11'h1a2;
    stim[5] = 11'h297;
    stim[6] = 11'h11f;
    stim[7] = 11'h146;
    stim[8] = 11'h22d;
    stim[9] = 11'h20a;
    stim[10] = 11'h07e;
    stim[11] = 11'h0dd;
    stim[12] = 11'h102;
    stim[13] = 11'h251;
    stim[14] = 11'h048;
    stim[15] = 11'h2e5;
    stim[16] = 11'h252;
    stim[17] = 11'h2e0;
    stim[18] = 11'h3af;
    stim[19] = 11'h272;
    stim[20] = 11'h1c7;
    stim[21] = 11'h0ab;
    stim[22] = 11'h3e8;
    stim[23] = 11'h10c;
    stim[24] = 11'h0f7;
    stim[25] = 11'h12a;
    stim[26] = 11'h085;
    stim[27] = 11'h153;
    stim[28] = 11'h0fd;
    stim[29] = 11'h19e;
    stim[30] = 11'h081;
    stim[31] = 11'h120;
    stim[32] = 11'h105;
    stim[33] = 11'h13b;
    stim[34] = 11'h1a6;
    stim[35] = 11'h0cb;
    stim[36] = 11'h15b;
    stim[37] = 11'h0f7;
    stim[38] = 11'h2b0;
    stim[39] = 11'h3e9;
    stim[40] = 11'h0fb;
    stim[41] = 11'h16c;
    stim[42] = 11'h24b;
    stim[43] = 11'h13e;
    stim[44] = 11'h3ee;
    stim[45] = 11'h44a;
    stim[46] = 11'h186;
    stim[47] = 11'h2d2;
    stim[48] = 11'h076;
    stim[49] = 11'h183;
    stim[50] = 11'h024;
    stim[51] = 11'h211;
    stim[52] = 11'h17b;
    stim[53] = 11'h317;
    stim[54] = 11'h04b;
    stim[55] = 11'h355;
    stim[56] = 11'h108;
    stim[57] = 11'h29c;
    stim[58] = 11'h22d;
    stim[59] = 11'h09b;
    stim[60] = 11'h14e;
    stim[61] = 11'h089;
    stim[62] = 11'h14f;
    stim[63] = 11'h0d5;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h03d;
      expv[9] = 11'h03d;
      expv[10] = 11'h03d;
      expv[11] = 11'h03d;
      expv[12] = 11'h03d;
      expv[13] = 11'h03d;
      expv[14] = 11'h03d;
      expv[15] = 11'h03d;
      expv[16] = 11'h03d;
      expv[17] = 11'h03d;
      expv[18] = 11'h03d;
      expv[19] = 11'h03d;
      expv[20] = 11'h03d;
      expv[21] = 11'h03d;
      expv[22] = 11'h03d;
      expv[23] = 11'h03d;
      expv[24] = 11'h03d;
      expv[25] = 11'h03d;
      expv[26] = 11'h03d;
      expv[27] = 11'h03d;
      expv[28] = 11'h03d;
      expv[29] = 11'h03d;
      expv[30] = 11'h03d;
      expv[31] = 11'h03d;
      expv[32] = 11'h03d;
      expv[33] = 11'h03d;
      expv[34] = 11'h03d;
      expv[35] = 11'h03d;
      expv[36] = 11'h03d;
      expv[37] = 11'h03d;
      expv[38] = 11'h03d;
      expv[39] = 11'h03d;
      expv[40] = 11'h03d;
      expv[41] = 11'h03d;
      expv[42] = 11'h03d;
      expv[43] = 11'h03d;
      expv[44] = 11'h03d;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h017;
      expv[53] = 11'h017;
      expv[54] = 11'h017;
      expv[55] = 11'h017;
      expv[56] = 11'h017;
      expv[57] = 11'h017;
      expv[58] = 11'h017;
      expv[59] = 11'h017;
      expv[60] = 11'h017;
      expv[61] = 11'h017;
      expv[62] = 11'h017;
      expv[63] = 11'h017;
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
