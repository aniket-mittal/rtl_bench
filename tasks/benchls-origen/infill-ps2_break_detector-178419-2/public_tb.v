// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178419 dut (
    .clk(clk),
    .ready(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .datain(in_vec[7:0]),
    .dataout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h187;
    stim[1] = 10'h16b;
    stim[2] = 10'h06b;
    stim[3] = 10'h0f7;
    stim[4] = 10'h07e;
    stim[5] = 10'h012;
    stim[6] = 10'h04f;
    stim[7] = 10'h0c4;
    stim[8] = 10'h088;
    stim[9] = 10'h063;
    stim[10] = 10'h0ae;
    stim[11] = 10'h24f;
    stim[12] = 10'h2ef;
    stim[13] = 10'h0d7;
    stim[14] = 10'h01c;
    stim[15] = 10'h264;
    stim[16] = 10'h2b1;
    stim[17] = 10'h0f7;
    stim[18] = 10'h0dd;
    stim[19] = 10'h1a8;
    stim[20] = 10'h203;
    stim[21] = 10'h05d;
    stim[22] = 10'h089;
    stim[23] = 10'h028;
    stim[24] = 10'h01f;
    stim[25] = 10'h2a5;
    stim[26] = 10'h00c;
    stim[27] = 10'h0b1;
    stim[28] = 10'h081;
    stim[29] = 10'h042;
    stim[30] = 10'h06a;
    stim[31] = 10'h239;
    stim[32] = 10'h2aa;
    stim[33] = 10'h2f2;
    stim[34] = 10'h02f;
    stim[35] = 10'h010;
    stim[36] = 10'h046;
    stim[37] = 10'h092;
    stim[38] = 10'h22e;
    stim[39] = 10'h26a;
    stim[40] = 10'h041;
    stim[41] = 10'h2dd;
    stim[42] = 10'h03f;
    stim[43] = 10'h023;
    stim[44] = 10'h0b3;
    stim[45] = 10'h296;
    stim[46] = 10'h080;
    stim[47] = 10'h272;
    stim[48] = 10'h25c;
    stim[49] = 10'h012;
    stim[50] = 10'h0fb;
    stim[51] = 10'h051;
    stim[52] = 10'h2ad;
    stim[53] = 10'h255;
    stim[54] = 10'h258;
    stim[55] = 10'h0a7;
    stim[56] = 10'h248;
    stim[57] = 10'h221;
    stim[58] = 10'h28e;
    stim[59] = 10'h08e;
    stim[60] = 10'h2e4;
    stim[61] = 10'h2a7;
    stim[62] = 10'h26f;
    stim[63] = 10'h064;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
