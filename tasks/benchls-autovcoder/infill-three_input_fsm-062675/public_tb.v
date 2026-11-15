// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062675 dut (
    .clk(clk),
    .rst_n(in_vec[3:3]),
    .in1(in_vec[2:2]),
    .in2(in_vec[1:1]),
    .in3(in_vec[0:0]),
    .out1(out_vec[2:2]),
    .out2(out_vec[1:1]),
    .out3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h7;
    stim[1] = 4'h3;
    stim[2] = 4'hc;
    stim[3] = 4'hd;
    stim[4] = 4'hc;
    stim[5] = 4'h3;
    stim[6] = 4'ha;
    stim[7] = 4'h1;
    stim[8] = 4'ha;
    stim[9] = 4'hf;
    stim[10] = 4'hc;
    stim[11] = 4'hb;
    stim[12] = 4'ha;
    stim[13] = 4'hf;
    stim[14] = 4'hb;
    stim[15] = 4'hd;
    stim[16] = 4'hc;
    stim[17] = 4'hb;
    stim[18] = 4'h9;
    stim[19] = 4'h9;
    stim[20] = 4'hc;
    stim[21] = 4'he;
    stim[22] = 4'he;
    stim[23] = 4'hb;
    stim[24] = 4'h9;
    stim[25] = 4'he;
    stim[26] = 4'hb;
    stim[27] = 4'hf;
    stim[28] = 4'hd;
    stim[29] = 4'hf;
    stim[30] = 4'h8;
    stim[31] = 4'hc;
    stim[32] = 4'hb;
    stim[33] = 4'hc;
    stim[34] = 4'hf;
    stim[35] = 4'he;
    stim[36] = 4'h9;
    stim[37] = 4'hc;
    stim[38] = 4'h8;
    stim[39] = 4'h8;
    stim[40] = 4'he;
    stim[41] = 4'hb;
    stim[42] = 4'ha;
    stim[43] = 4'hc;
    stim[44] = 4'ha;
    stim[45] = 4'hc;
    stim[46] = 4'hd;
    stim[47] = 4'hc;
    stim[48] = 4'hf;
    stim[49] = 4'hc;
    stim[50] = 4'he;
    stim[51] = 4'h9;
    stim[52] = 4'hd;
    stim[53] = 4'hd;
    stim[54] = 4'hc;
    stim[55] = 4'hb;
    stim[56] = 4'ha;
    stim[57] = 4'hd;
    stim[58] = 4'hc;
    stim[59] = 4'hb;
    stim[60] = 4'hd;
    stim[61] = 4'hd;
    stim[62] = 4'h8;
    stim[63] = 4'h9;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'hx;
      expv[8] = 3'hx;
      expv[9] = 3'hx;
      expv[10] = 3'hx;
      expv[11] = 3'hx;
      expv[12] = 3'h7;
      expv[13] = 3'h7;
      expv[14] = 3'h7;
      expv[15] = 3'h7;
      expv[16] = 3'h7;
      expv[17] = 3'h7;
      expv[18] = 3'h7;
      expv[19] = 3'h7;
      expv[20] = 3'h7;
      expv[21] = 3'h7;
      expv[22] = 3'h7;
      expv[23] = 3'h7;
      expv[24] = 3'h7;
      expv[25] = 3'h7;
      expv[26] = 3'h7;
      expv[27] = 3'h7;
      expv[28] = 3'h7;
      expv[29] = 3'h7;
      expv[30] = 3'h7;
      expv[31] = 3'h7;
      expv[32] = 3'h7;
      expv[33] = 3'h7;
      expv[34] = 3'h7;
      expv[35] = 3'h7;
      expv[36] = 3'h7;
      expv[37] = 3'h7;
      expv[38] = 3'h7;
      expv[39] = 3'h7;
      expv[40] = 3'h7;
      expv[41] = 3'h7;
      expv[42] = 3'h7;
      expv[43] = 3'h7;
      expv[44] = 3'h7;
      expv[45] = 3'h7;
      expv[46] = 3'h7;
      expv[47] = 3'h7;
      expv[48] = 3'h7;
      expv[49] = 3'h7;
      expv[50] = 3'h7;
      expv[51] = 3'h7;
      expv[52] = 3'h7;
      expv[53] = 3'h7;
      expv[54] = 3'h7;
      expv[55] = 3'h7;
      expv[56] = 3'h7;
      expv[57] = 3'h7;
      expv[58] = 3'h7;
      expv[59] = 3'h7;
      expv[60] = 3'h7;
      expv[61] = 3'h7;
      expv[62] = 3'h7;
      expv[63] = 3'h7;
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
