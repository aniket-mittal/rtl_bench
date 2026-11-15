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

  mg_06458 dut (
    .Clock(clk),
    .NumberOfChars(in_vec[9:4]),
    .Reset(in_vec[3:3]),
    .Start(in_vec[2:2]),
    .tx_full(in_vec[1:1]),
    .uartClock(in_vec[0:0]),
    .RAMAddress(out_vec[7:2]),
    .Transmitting(out_vec[1:1]),
    .write_to_uart(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h019;
    stim[1] = 10'h11e;
    stim[2] = 10'h012;
    stim[3] = 10'h172;
    stim[4] = 10'h103;
    stim[5] = 10'h203;
    stim[6] = 10'h364;
    stim[7] = 10'h084;
    stim[8] = 10'h295;
    stim[9] = 10'h1ef;
    stim[10] = 10'h315;
    stim[11] = 10'h3d3;
    stim[12] = 10'h2d7;
    stim[13] = 10'h285;
    stim[14] = 10'h060;
    stim[15] = 10'h337;
    stim[16] = 10'h1f3;
    stim[17] = 10'h0e0;
    stim[18] = 10'h173;
    stim[19] = 10'h077;
    stim[20] = 10'h3b4;
    stim[21] = 10'h214;
    stim[22] = 10'h293;
    stim[23] = 10'h0d1;
    stim[24] = 10'h1f3;
    stim[25] = 10'h381;
    stim[26] = 10'h134;
    stim[27] = 10'h177;
    stim[28] = 10'h191;
    stim[29] = 10'h103;
    stim[30] = 10'h362;
    stim[31] = 10'h341;
    stim[32] = 10'h094;
    stim[33] = 10'h3c8;
    stim[34] = 10'h0b2;
    stim[35] = 10'h2c1;
    stim[36] = 10'h2b1;
    stim[37] = 10'h100;
    stim[38] = 10'h381;
    stim[39] = 10'h133;
    stim[40] = 10'h123;
    stim[41] = 10'h170;
    stim[42] = 10'h0c2;
    stim[43] = 10'h366;
    stim[44] = 10'h145;
    stim[45] = 10'h215;
    stim[46] = 10'h177;
    stim[47] = 10'h094;
    stim[48] = 10'h3a4;
    stim[49] = 10'h1c4;
    stim[50] = 10'h3a7;
    stim[51] = 10'h235;
    stim[52] = 10'h0e5;
    stim[53] = 10'h2b4;
    stim[54] = 10'h102;
    stim[55] = 10'h235;
    stim[56] = 10'h304;
    stim[57] = 10'h3c3;
    stim[58] = 10'h201;
    stim[59] = 10'h361;
    stim[60] = 10'h243;
    stim[61] = 10'h067;
    stim[62] = 10'h265;
    stim[63] = 10'h036;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h03;
      expv[8] = 8'h02;
      expv[9] = 8'h07;
      expv[10] = 8'h00;
      expv[11] = 8'h03;
      expv[12] = 8'h02;
      expv[13] = 8'h02;
      expv[14] = 8'h07;
      expv[15] = 8'h06;
      expv[16] = 8'h06;
      expv[17] = 8'h06;
      expv[18] = 8'h06;
      expv[19] = 8'h06;
      expv[20] = 8'h06;
      expv[21] = 8'h06;
      expv[22] = 8'h06;
      expv[23] = 8'h06;
      expv[24] = 8'h0b;
      expv[25] = 8'h0a;
      expv[26] = 8'h0f;
      expv[27] = 8'h0e;
      expv[28] = 8'h0e;
      expv[29] = 8'h13;
      expv[30] = 8'h12;
      expv[31] = 8'h12;
      expv[32] = 8'h17;
      expv[33] = 8'h16;
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
      expv[44] = 8'h03;
      expv[45] = 8'h07;
      expv[46] = 8'h0b;
      expv[47] = 8'h0a;
      expv[48] = 8'h0a;
      expv[49] = 8'h0a;
      expv[50] = 8'h0a;
      expv[51] = 8'h0a;
      expv[52] = 8'h0f;
      expv[53] = 8'h13;
      expv[54] = 8'h12;
      expv[55] = 8'h12;
      expv[56] = 8'h17;
      expv[57] = 8'h16;
      expv[58] = 8'h16;
      expv[59] = 8'h1b;
      expv[60] = 8'h1f;
      expv[61] = 8'h1e;
      expv[62] = 8'h1e;
      expv[63] = 8'h23;
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
