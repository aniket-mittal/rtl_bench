// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11441 dut (
    .clk(clk),
    .address(in_vec[12:11]),
    .chipselect(in_vec[10:10]),
    .in_port(in_vec[9:6]),
    .reset_n(in_vec[5:5]),
    .write_n(in_vec[4:4]),
    .writedata(in_vec[3:0]),
    .irq(out_vec[4:4]),
    .readdata(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1ac7;
    stim[1] = 13'h170e;
    stim[2] = 13'h0fa4;
    stim[3] = 13'h1ab9;
    stim[4] = 13'h0574;
    stim[5] = 13'h06fb;
    stim[6] = 13'h1a2c;
    stim[7] = 13'h1234;
    stim[8] = 13'h036e;
    stim[9] = 13'h0bbb;
    stim[10] = 13'h1122;
    stim[11] = 13'h017e;
    stim[12] = 13'h0826;
    stim[13] = 13'h137a;
    stim[14] = 13'h03e7;
    stim[15] = 13'h00ef;
    stim[16] = 13'h12fb;
    stim[17] = 13'h0268;
    stim[18] = 13'h132c;
    stim[19] = 13'h1677;
    stim[20] = 13'h1ba5;
    stim[21] = 13'h09fc;
    stim[22] = 13'h12b6;
    stim[23] = 13'h18e2;
    stim[24] = 13'h09ef;
    stim[25] = 13'h012f;
    stim[26] = 13'h1ee1;
    stim[27] = 13'h003e;
    stim[28] = 13'h177d;
    stim[29] = 13'h1271;
    stim[30] = 13'h08a2;
    stim[31] = 13'h0ebe;
    stim[32] = 13'h1dbd;
    stim[33] = 13'h0229;
    stim[34] = 13'h1e79;
    stim[35] = 13'h17a7;
    stim[36] = 13'h1066;
    stim[37] = 13'h0da7;
    stim[38] = 13'h1528;
    stim[39] = 13'h02ea;
    stim[40] = 13'h051d;
    stim[41] = 13'h06a6;
    stim[42] = 13'h1727;
    stim[43] = 13'h196d;
    stim[44] = 13'h16a3;
    stim[45] = 13'h1424;
    stim[46] = 13'h02ad;
    stim[47] = 13'h0c6b;
    stim[48] = 13'h14b6;
    stim[49] = 13'h0207;
    stim[50] = 13'h13a4;
    stim[51] = 13'h0367;
    stim[52] = 13'h05aa;
    stim[53] = 13'h10e7;
    stim[54] = 13'h00ff;
    stim[55] = 13'h0ab6;
    stim[56] = 13'h0df1;
    stim[57] = 13'h0afd;
    stim[58] = 13'h0627;
    stim[59] = 13'h1469;
    stim[60] = 13'h03f7;
    stim[61] = 13'h0a3a;
    stim[62] = 13'h1667;
    stim[63] = 13'h0eb3;
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
      expv[5] = 5'h05;
      expv[6] = 5'h0b;
      expv[7] = 5'h0e;
      expv[8] = 5'h00;
      expv[9] = 5'h0d;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h05;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h0f;
      expv[16] = 5'h03;
      expv[17] = 5'h00;
      expv[18] = 5'h09;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h0f;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h0f;
      expv[25] = 5'h00;
      expv[26] = 5'h04;
      expv[27] = 5'h0f;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h0f;
      expv[34] = 5'h08;
      expv[35] = 5'h0f;
      expv[36] = 5'h00;
      expv[37] = 5'h17;
      expv[38] = 5'h10;
      expv[39] = 5'h17;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h0a;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h17;
      expv[46] = 5'h13;
      expv[47] = 5'h1a;
      expv[48] = 5'h10;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h0d;
      expv[53] = 5'h06;
      expv[54] = 5'h00;
      expv[55] = 5'h03;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h08;
      expv[60] = 5'h00;
      expv[61] = 5'h1f;
      expv[62] = 5'h10;
      expv[63] = 5'h19;
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
