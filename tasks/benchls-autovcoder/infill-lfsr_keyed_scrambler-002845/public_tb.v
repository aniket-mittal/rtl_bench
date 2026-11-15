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

  autovcoder_002845 dut (
    .PinCLK(clk),
    .PinA(in_vec[9:2]),
    .PinOE(in_vec[1:1]),
    .PinCCLR(in_vec[0:0]),
    .PinSIN(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h18c;
    stim[1] = 10'h14e;
    stim[2] = 10'h2e7;
    stim[3] = 10'h1e3;
    stim[4] = 10'h223;
    stim[5] = 10'h0f0;
    stim[6] = 10'h3e1;
    stim[7] = 10'h39e;
    stim[8] = 10'h37a;
    stim[9] = 10'h21f;
    stim[10] = 10'h223;
    stim[11] = 10'h083;
    stim[12] = 10'h039;
    stim[13] = 10'h15d;
    stim[14] = 10'h223;
    stim[15] = 10'h399;
    stim[16] = 10'h155;
    stim[17] = 10'h1a3;
    stim[18] = 10'h0b5;
    stim[19] = 10'h005;
    stim[20] = 10'h04c;
    stim[21] = 10'h15e;
    stim[22] = 10'h0c4;
    stim[23] = 10'h23e;
    stim[24] = 10'h3e7;
    stim[25] = 10'h12a;
    stim[26] = 10'h271;
    stim[27] = 10'h399;
    stim[28] = 10'h30a;
    stim[29] = 10'h14c;
    stim[30] = 10'h33e;
    stim[31] = 10'h0c9;
    stim[32] = 10'h2b0;
    stim[33] = 10'h067;
    stim[34] = 10'h025;
    stim[35] = 10'h1c6;
    stim[36] = 10'h3f0;
    stim[37] = 10'h016;
    stim[38] = 10'h12c;
    stim[39] = 10'h10d;
    stim[40] = 10'h047;
    stim[41] = 10'h230;
    stim[42] = 10'h2a4;
    stim[43] = 10'h2fa;
    stim[44] = 10'h17d;
    stim[45] = 10'h135;
    stim[46] = 10'h2b1;
    stim[47] = 10'h08e;
    stim[48] = 10'h2c7;
    stim[49] = 10'h382;
    stim[50] = 10'h183;
    stim[51] = 10'h034;
    stim[52] = 10'h18f;
    stim[53] = 10'h344;
    stim[54] = 10'h1b0;
    stim[55] = 10'h0ab;
    stim[56] = 10'h06a;
    stim[57] = 10'h035;
    stim[58] = 10'h3eb;
    stim[59] = 10'h1cc;
    stim[60] = 10'h2eb;
    stim[61] = 10'h28e;
    stim[62] = 10'h27e;
    stim[63] = 10'h2f5;
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
      expv[0] = 8'hff;
      expv[1] = 8'hff;
      expv[2] = 8'hff;
      expv[3] = 8'hff;
      expv[4] = 8'hff;
      expv[5] = 8'hff;
      expv[6] = 8'hff;
      expv[7] = 8'hff;
      expv[8] = 8'hff;
      expv[9] = 8'hff;
      expv[10] = 8'hff;
      expv[11] = 8'hff;
      expv[12] = 8'hff;
      expv[13] = 8'hff;
      expv[14] = 8'hff;
      expv[15] = 8'hff;
      expv[16] = 8'hff;
      expv[17] = 8'hff;
      expv[18] = 8'hff;
      expv[19] = 8'h7f;
      expv[20] = 8'hbf;
      expv[21] = 8'hff;
      expv[22] = 8'hff;
      expv[23] = 8'hff;
      expv[24] = 8'hff;
      expv[25] = 8'hff;
      expv[26] = 8'hff;
      expv[27] = 8'hff;
      expv[28] = 8'hff;
      expv[29] = 8'hff;
      expv[30] = 8'hff;
      expv[31] = 8'hff;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hff;
      expv[35] = 8'hff;
      expv[36] = 8'hff;
      expv[37] = 8'hff;
      expv[38] = 8'hff;
      expv[39] = 8'hff;
      expv[40] = 8'hff;
      expv[41] = 8'hff;
      expv[42] = 8'hff;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hff;
      expv[46] = 8'hff;
      expv[47] = 8'hff;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hff;
      expv[54] = 8'hff;
      expv[55] = 8'hff;
      expv[56] = 8'hff;
      expv[57] = 8'hff;
      expv[58] = 8'hff;
      expv[59] = 8'hff;
      expv[60] = 8'hff;
      expv[61] = 8'hff;
      expv[62] = 8'hff;
      expv[63] = 8'hff;
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
