// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162495 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .conf_in_valid(in_vec[9:8]),
    .conf_in_data(in_vec[7:0]),
    .conf_out_valid(out_vec[9:9]),
    .conf_out_data(out_vec[8:1]),
    .conf_reset_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7fe;
    stim[1] = 11'h750;
    stim[2] = 11'h2ef;
    stim[3] = 11'h277;
    stim[4] = 11'h153;
    stim[5] = 11'h1e0;
    stim[6] = 11'h0da;
    stim[7] = 11'h0bb;
    stim[8] = 11'h3af;
    stim[9] = 11'h047;
    stim[10] = 11'h2ad;
    stim[11] = 11'h28f;
    stim[12] = 11'h23e;
    stim[13] = 11'h2c8;
    stim[14] = 11'h127;
    stim[15] = 11'h307;
    stim[16] = 11'h1ef;
    stim[17] = 11'h3cf;
    stim[18] = 11'h3c6;
    stim[19] = 11'h2af;
    stim[20] = 11'h27b;
    stim[21] = 11'h328;
    stim[22] = 11'h173;
    stim[23] = 11'h05e;
    stim[24] = 11'h2ed;
    stim[25] = 11'h2ca;
    stim[26] = 11'h159;
    stim[27] = 11'h2c6;
    stim[28] = 11'h1a7;
    stim[29] = 11'h234;
    stim[30] = 11'h329;
    stim[31] = 11'h105;
    stim[32] = 11'h270;
    stim[33] = 11'h3ce;
    stim[34] = 11'h054;
    stim[35] = 11'h1e7;
    stim[36] = 11'h0a3;
    stim[37] = 11'h1b0;
    stim[38] = 11'h133;
    stim[39] = 11'h2b5;
    stim[40] = 11'h101;
    stim[41] = 11'h146;
    stim[42] = 11'h068;
    stim[43] = 11'h31e;
    stim[44] = 11'h01d;
    stim[45] = 11'h371;
    stim[46] = 11'h0e1;
    stim[47] = 11'h2bf;
    stim[48] = 11'h0c0;
    stim[49] = 11'h3d9;
    stim[50] = 11'h3da;
    stim[51] = 11'h358;
    stim[52] = 11'h30a;
    stim[53] = 11'h384;
    stim[54] = 11'h158;
    stim[55] = 11'h029;
    stim[56] = 11'h2f3;
    stim[57] = 11'h165;
    stim[58] = 11'h360;
    stim[59] = 11'h243;
    stim[60] = 11'h037;
    stim[61] = 11'h315;
    stim[62] = 11'h342;
    stim[63] = 11'h318;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'hxxx;
      expv[19] = 10'hxxx;
      expv[20] = 10'hxxx;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'hxxx;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'h1c3;
      expv[48] = 10'h1c2;
      expv[49] = 10'h3c2;
      expv[50] = 10'h3c2;
      expv[51] = 10'h3c2;
      expv[52] = 10'h3c2;
      expv[53] = 10'h3c2;
      expv[54] = 10'h3c2;
      expv[55] = 10'h3c2;
      expv[56] = 10'h3c2;
      expv[57] = 10'h3c2;
      expv[58] = 10'h3c2;
      expv[59] = 10'h3c2;
      expv[60] = 10'h3c2;
      expv[61] = 10'h3c2;
      expv[62] = 10'h3c2;
      expv[63] = 10'h3c2;
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
