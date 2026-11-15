// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00583 dut (
    .CLK_I(clk),
    .RST_I(in_vec[33:33]),
    .ADR_I(in_vec[32:3]),
    .CYC_I(in_vec[2:2]),
    .STB_I(in_vec[1:1]),
    .WE_I(in_vec[0:0]),
    .RTY_O(out_vec[1:1]),
    .interrupt_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2db6f3183;
    stim[1] = 34'h20a87d262;
    stim[2] = 34'h001186c31;
    stim[3] = 34'h17de04a85;
    stim[4] = 34'h04c469cca;
    stim[5] = 34'h1d18379f2;
    stim[6] = 34'h1d24ab644;
    stim[7] = 34'h043df406d;
    stim[8] = 34'h15c7fee75;
    stim[9] = 34'h153fb3a23;
    stim[10] = 34'h0c77052b8;
    stim[11] = 34'h0745a0b7e;
    stim[12] = 34'h17c2c821c;
    stim[13] = 34'h0cc5aec66;
    stim[14] = 34'h03db212f4;
    stim[15] = 34'h15dc735c4;
    stim[16] = 34'h179e7c896;
    stim[17] = 34'h1e600a82b;
    stim[18] = 34'h0bcbb64b8;
    stim[19] = 34'h0eeedb2b2;
    stim[20] = 34'h183867ce0;
    stim[21] = 34'h03dec8751;
    stim[22] = 34'h11dca217e;
    stim[23] = 34'h05fce0625;
    stim[24] = 34'h0b32733b2;
    stim[25] = 34'h1a6a7994e;
    stim[26] = 34'h0a9ae4a52;
    stim[27] = 34'h0fe415e5c;
    stim[28] = 34'h170cd612f;
    stim[29] = 34'h001019ef2;
    stim[30] = 34'h022b79f41;
    stim[31] = 34'h114910c12;
    stim[32] = 34'h0d888f21d;
    stim[33] = 34'h0da8f9778;
    stim[34] = 34'h10c0d6e30;
    stim[35] = 34'h10d2814f5;
    stim[36] = 34'h0896048f9;
    stim[37] = 34'h115432153;
    stim[38] = 34'h11392f7f3;
    stim[39] = 34'h1d5d16867;
    stim[40] = 34'h1c8365321;
    stim[41] = 34'h06eaab733;
    stim[42] = 34'h09b09234c;
    stim[43] = 34'h0645b03b4;
    stim[44] = 34'h0c3bfa03b;
    stim[45] = 34'h0a0c03ccf;
    stim[46] = 34'h00bf99229;
    stim[47] = 34'h089e9cf39;
    stim[48] = 34'h166a05bbc;
    stim[49] = 34'h1f97df99f;
    stim[50] = 34'h08daddcb1;
    stim[51] = 34'h18600a1e6;
    stim[52] = 34'h08097a115;
    stim[53] = 34'h09ddb135e;
    stim[54] = 34'h13d22b0d8;
    stim[55] = 34'h1f477b364;
    stim[56] = 34'h14be1d045;
    stim[57] = 34'h0899d4501;
    stim[58] = 34'h052098c1d;
    stim[59] = 34'h096505dd4;
    stim[60] = 34'h0d82433f7;
    stim[61] = 34'h04c6ccffb;
    stim[62] = 34'h0a0674719;
    stim[63] = 34'h174639b3a;
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
      expv[0] = 2'hx;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
