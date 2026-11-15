// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05106 dut (
    .CLK(clk),
    .nRST(in_vec[34:34]),
    .request$say__ENA(in_vec[33:33]),
    .request$say$v(in_vec[32:1]),
    .indication$heard__RDY(in_vec[0:0]),
    .request$say__RDY(out_vec[33:33]),
    .indication$heard__ENA(out_vec[32:32]),
    .indication$heard$v(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h600cba820;
    stim[1] = 35'h4f0879164;
    stim[2] = 35'h1ba9d12f6;
    stim[3] = 35'h37835cf84;
    stim[4] = 35'h05302f2ee;
    stim[5] = 35'h2683ae5f9;
    stim[6] = 35'h20ac93c7d;
    stim[7] = 35'h1b7c505c6;
    stim[8] = 35'h0862c65eb;
    stim[9] = 35'h3e284d42f;
    stim[10] = 35'h0becb83b7;
    stim[11] = 35'h3e00111a8;
    stim[12] = 35'h112cc90a8;
    stim[13] = 35'h317318820;
    stim[14] = 35'h0854b9cfb;
    stim[15] = 35'h25e655558;
    stim[16] = 35'h1a0dc0731;
    stim[17] = 35'h38d40759c;
    stim[18] = 35'h3de01ce1a;
    stim[19] = 35'h2c7057c95;
    stim[20] = 35'h27f38bbe6;
    stim[21] = 35'h32f5e6a23;
    stim[22] = 35'h145ee6b00;
    stim[23] = 35'h25e221c0f;
    stim[24] = 35'h064b817e6;
    stim[25] = 35'h33a4523ec;
    stim[26] = 35'h309dd3b38;
    stim[27] = 35'h2bcaadf8e;
    stim[28] = 35'h26f24d8f0;
    stim[29] = 35'h3c8979ca3;
    stim[30] = 35'h1ab487fa1;
    stim[31] = 35'h38b98bccb;
    stim[32] = 35'h3c4da7f60;
    stim[33] = 35'h08b6ea2b4;
    stim[34] = 35'h1e28da0b2;
    stim[35] = 35'h1e2112a34;
    stim[36] = 35'h37167ca2f;
    stim[37] = 35'h32cb23d48;
    stim[38] = 35'h37887ebe8;
    stim[39] = 35'h1196c6207;
    stim[40] = 35'h0e0b2c9b4;
    stim[41] = 35'h0c9de266f;
    stim[42] = 35'h2a03536f4;
    stim[43] = 35'h09309b265;
    stim[44] = 35'h2a9cbf360;
    stim[45] = 35'h20862afc0;
    stim[46] = 35'h118b10c8a;
    stim[47] = 35'h247202d7f;
    stim[48] = 35'h3c2f74887;
    stim[49] = 35'h31bf94a54;
    stim[50] = 35'h2cca94081;
    stim[51] = 35'h1bece9a2d;
    stim[52] = 35'h4c066ce48;
    stim[53] = 35'h0659421bb;
    stim[54] = 35'h121dd9400;
    stim[55] = 35'h2c4de717c;
    stim[56] = 35'h08511aa3b;
    stim[57] = 35'h25e5f3fcb;
    stim[58] = 35'h2fa91619f;
    stim[59] = 35'h17ebc5fbc;
    stim[60] = 35'h1f1321bed;
    stim[61] = 35'h1d4a96853;
    stim[62] = 35'h39b37d036;
    stim[63] = 35'h0259112e1;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h200000000;
      expv[22] = 34'h200000000;
      expv[23] = 34'h200000000;
      expv[24] = 34'h200000000;
      expv[25] = 34'h200000000;
      expv[26] = 34'h200000000;
      expv[27] = 34'h200000000;
      expv[28] = 34'h200000000;
      expv[29] = 34'h200000000;
      expv[30] = 34'h200000000;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h200000000;
      expv[35] = 34'h200000000;
      expv[36] = 34'h200000000;
      expv[37] = 34'h200000000;
      expv[38] = 34'h200000000;
      expv[39] = 34'h200000000;
      expv[40] = 34'h200000000;
      expv[41] = 34'h200000000;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h200000000;
      expv[46] = 34'h200000000;
      expv[47] = 34'h200000000;
      expv[48] = 34'h200000000;
      expv[49] = 34'h200000000;
      expv[50] = 34'h200000000;
      expv[51] = 34'h200000000;
      expv[52] = 34'h200000000;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
