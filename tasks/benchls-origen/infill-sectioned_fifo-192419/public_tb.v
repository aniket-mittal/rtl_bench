// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_192419 dut (
    .CLK(clk),
    .RESET(in_vec[12:12]),
    .SECTION_SEL(in_vec[11:10]),
    .RD_ENB(in_vec[9:9]),
    .WR_ENB(in_vec[8:8]),
    .DATA_IN(in_vec[7:0]),
    .DATA_OUT(out_vec[9:2]),
    .EMPTY(out_vec[1:1]),
    .FULL(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1148;
    stim[1] = 13'h1e2c;
    stim[2] = 13'h0b56;
    stim[3] = 13'h0ed0;
    stim[4] = 13'h0258;
    stim[5] = 13'h0af7;
    stim[6] = 13'h0d06;
    stim[7] = 13'h071d;
    stim[8] = 13'h0647;
    stim[9] = 13'h0fb7;
    stim[10] = 13'h0edb;
    stim[11] = 13'h03d4;
    stim[12] = 13'h0755;
    stim[13] = 13'h067c;
    stim[14] = 13'h04a7;
    stim[15] = 13'h0da8;
    stim[16] = 13'h0c1f;
    stim[17] = 13'h0f73;
    stim[18] = 13'h0042;
    stim[19] = 13'h0240;
    stim[20] = 13'h09ef;
    stim[21] = 13'h0555;
    stim[22] = 13'h0433;
    stim[23] = 13'h0586;
    stim[24] = 13'h0ff0;
    stim[25] = 13'h03f7;
    stim[26] = 13'h001a;
    stim[27] = 13'h0aa3;
    stim[28] = 13'h0408;
    stim[29] = 13'h0163;
    stim[30] = 13'h030c;
    stim[31] = 13'h01cb;
    stim[32] = 13'h0d7f;
    stim[33] = 13'h0ac7;
    stim[34] = 13'h0b81;
    stim[35] = 13'h0f5f;
    stim[36] = 13'h0a25;
    stim[37] = 13'h0e05;
    stim[38] = 13'h02b3;
    stim[39] = 13'h05d1;
    stim[40] = 13'h06de;
    stim[41] = 13'h0206;
    stim[42] = 13'h0232;
    stim[43] = 13'h0cda;
    stim[44] = 13'h049d;
    stim[45] = 13'h0735;
    stim[46] = 13'h0799;
    stim[47] = 13'h0d01;
    stim[48] = 13'h01e1;
    stim[49] = 13'h01fc;
    stim[50] = 13'h08da;
    stim[51] = 13'h0405;
    stim[52] = 13'h00cb;
    stim[53] = 13'h044a;
    stim[54] = 13'h0089;
    stim[55] = 13'h0a5b;
    stim[56] = 13'h0851;
    stim[57] = 13'h0520;
    stim[58] = 13'h0fb3;
    stim[59] = 13'h0cc5;
    stim[60] = 13'h07f9;
    stim[61] = 13'h041e;
    stim[62] = 13'h0f1d;
    stim[63] = 13'h0d45;
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
      expv[8] = 10'h074;
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
      expv[26] = 10'h3dc;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'h18c;
      expv[31] = 10'h030;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'h1fc;
      expv[36] = 10'h204;
      expv[37] = 10'h17c;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'h1cc;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'hxxx;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'h154;
      expv[52] = 10'hxxx;
      expv[53] = 10'h154;
      expv[54] = 10'hxxx;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'h218;
      expv[58] = 10'hxxx;
      expv[59] = 10'h3c0;
      expv[60] = 10'hxxx;
      expv[61] = 10'hxxx;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
