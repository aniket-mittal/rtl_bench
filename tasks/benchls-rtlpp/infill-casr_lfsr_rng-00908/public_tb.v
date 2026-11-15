// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00908 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .loadseed_i(in_vec[32:32]),
    .seed_i(in_vec[31:0]),
    .number_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h346724cb9;
    stim[1] = 34'h28d10f7a0;
    stim[2] = 34'h05f49af12;
    stim[3] = 34'h10b7be69f;
    stim[4] = 34'h16efdcde2;
    stim[5] = 34'h07ae4cfa0;
    stim[6] = 34'h0f5e852f3;
    stim[7] = 34'h0cd766309;
    stim[8] = 34'h0c448d7f1;
    stim[9] = 34'h0e8178677;
    stim[10] = 34'h0181fefba;
    stim[11] = 34'h0c0b3e1d6;
    stim[12] = 34'h055cb3529;
    stim[13] = 34'h026094816;
    stim[14] = 34'h0292d586a;
    stim[15] = 34'h08eb3d097;
    stim[16] = 34'h08b78d431;
    stim[17] = 34'h076287532;
    stim[18] = 34'h0b58dd050;
    stim[19] = 34'h1c97d84f5;
    stim[20] = 34'h137e95df4;
    stim[21] = 34'h10e39de3e;
    stim[22] = 34'h0dd4839d1;
    stim[23] = 34'h1916ee2ae;
    stim[24] = 34'h1ec4f15cc;
    stim[25] = 34'h1610d89ca;
    stim[26] = 34'h1f9a8254f;
    stim[27] = 34'h1e2649f52;
    stim[28] = 34'h0ec8bb017;
    stim[29] = 34'h0fe24436a;
    stim[30] = 34'h13dc58c28;
    stim[31] = 34'h071cab972;
    stim[32] = 34'h10cedfc44;
    stim[33] = 34'h087e6c288;
    stim[34] = 34'h1b1ec32e1;
    stim[35] = 34'h093849638;
    stim[36] = 34'h19ab51a88;
    stim[37] = 34'h17178338f;
    stim[38] = 34'h0deef7b14;
    stim[39] = 34'h1527785df;
    stim[40] = 34'h13b57bcbb;
    stim[41] = 34'h1ece8cc58;
    stim[42] = 34'h0ee8e9612;
    stim[43] = 34'h190d65a76;
    stim[44] = 34'h07683952c;
    stim[45] = 34'h186e66669;
    stim[46] = 34'h0fba1a049;
    stim[47] = 34'h044344769;
    stim[48] = 34'h0f2d2860d;
    stim[49] = 34'h1e382bb2c;
    stim[50] = 34'h02f04ecad;
    stim[51] = 34'h1fa0043a8;
    stim[52] = 34'h0405f825b;
    stim[53] = 34'h097c40128;
    stim[54] = 34'h017e5d03d;
    stim[55] = 34'h19aefd143;
    stim[56] = 34'h18fd0b3b2;
    stim[57] = 34'h0249954a4;
    stim[58] = 34'h11e65da16;
    stim[59] = 34'h1e671ea1a;
    stim[60] = 34'h05a010211;
    stim[61] = 34'h186e61d9f;
    stim[62] = 34'h09ac3de0f;
    stim[63] = 34'h04ba13715;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
