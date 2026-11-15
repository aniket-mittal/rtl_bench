// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_073720 dut (
    .tone_idx(in_vec[4:0]),
    .tone(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h05;
    stim[1] = 5'h14;
    stim[2] = 5'h07;
    stim[3] = 5'h18;
    stim[4] = 5'h08;
    stim[5] = 5'h06;
    stim[6] = 5'h0d;
    stim[7] = 5'h07;
    stim[8] = 5'h0b;
    stim[9] = 5'h15;
    stim[10] = 5'h1a;
    stim[11] = 5'h15;
    stim[12] = 5'h15;
    stim[13] = 5'h1b;
    stim[14] = 5'h1f;
    stim[15] = 5'h06;
    stim[16] = 5'h1d;
    stim[17] = 5'h02;
    stim[18] = 5'h1a;
    stim[19] = 5'h03;
    stim[20] = 5'h01;
    stim[21] = 5'h12;
    stim[22] = 5'h1e;
    stim[23] = 5'h00;
    stim[24] = 5'h1a;
    stim[25] = 5'h1e;
    stim[26] = 5'h0a;
    stim[27] = 5'h1e;
    stim[28] = 5'h04;
    stim[29] = 5'h02;
    stim[30] = 5'h13;
    stim[31] = 5'h0f;
    stim[32] = 5'h00;
    stim[33] = 5'h07;
    stim[34] = 5'h1b;
    stim[35] = 5'h1d;
    stim[36] = 5'h1a;
    stim[37] = 5'h0a;
    stim[38] = 5'h01;
    stim[39] = 5'h0c;
    stim[40] = 5'h16;
    stim[41] = 5'h18;
    stim[42] = 5'h08;
    stim[43] = 5'h16;
    stim[44] = 5'h17;
    stim[45] = 5'h0d;
    stim[46] = 5'h18;
    stim[47] = 5'h19;
    stim[48] = 5'h0d;
    stim[49] = 5'h0d;
    stim[50] = 5'h16;
    stim[51] = 5'h11;
    stim[52] = 5'h15;
    stim[53] = 5'h10;
    stim[54] = 5'h18;
    stim[55] = 5'h1f;
    stim[56] = 5'h18;
    stim[57] = 5'h10;
    stim[58] = 5'h0c;
    stim[59] = 5'h19;
    stim[60] = 5'h19;
    stim[61] = 5'h18;
    stim[62] = 5'h01;
    stim[63] = 5'h0d;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h000001b8;
      expv[1] = 32'h000007b8;
      expv[2] = 32'h0000020c;
      expv[3] = 32'h00000ae8;
      expv[4] = 32'h0000024c;
      expv[5] = 32'h000001ee;
      expv[6] = 32'h000003dc;
      expv[7] = 32'h0000020c;
      expv[8] = 32'h00000310;
      expv[9] = 32'h00000830;
      expv[10] = 32'h00000dc0;
      expv[11] = 32'h00000830;
      expv[12] = 32'h00000830;
      expv[13] = 32'h00000f70;
      expv[14] = 32'h00002710;
      expv[15] = 32'h000001ee;
      expv[16] = 32'h00002710;
      expv[17] = 32'h0000014a;
      expv[18] = 32'h00000dc0;
      expv[19] = 32'h0000015d;
      expv[20] = 32'h00000126;
      expv[21] = 32'h00000620;
      expv[22] = 32'h00002710;
      expv[23] = 32'h00000106;
      expv[24] = 32'h00000dc0;
      expv[25] = 32'h00002710;
      expv[26] = 32'h000002ba;
      expv[27] = 32'h00002710;
      expv[28] = 32'h00000188;
      expv[29] = 32'h0000014a;
      expv[30] = 32'h000006e0;
      expv[31] = 32'h00000498;
      expv[32] = 32'h00000106;
      expv[33] = 32'h0000020c;
      expv[34] = 32'h00000f70;
      expv[35] = 32'h00002710;
      expv[36] = 32'h00000dc0;
      expv[37] = 32'h000002ba;
      expv[38] = 32'h00000126;
      expv[39] = 32'h00000370;
      expv[40] = 32'h00000930;
      expv[41] = 32'h00000ae8;
      expv[42] = 32'h0000024c;
      expv[43] = 32'h00000930;
      expv[44] = 32'h00000a50;
      expv[45] = 32'h000003dc;
      expv[46] = 32'h00000ae8;
      expv[47] = 32'h00000c40;
      expv[48] = 32'h000003dc;
      expv[49] = 32'h000003dc;
      expv[50] = 32'h00000930;
      expv[51] = 32'h00000574;
      expv[52] = 32'h00000830;
      expv[53] = 32'h00000528;
      expv[54] = 32'h00000ae8;
      expv[55] = 32'h00002710;
      expv[56] = 32'h00000ae8;
      expv[57] = 32'h00000528;
      expv[58] = 32'h00000370;
      expv[59] = 32'h00000c40;
      expv[60] = 32'h00000c40;
      expv[61] = 32'h00000ae8;
      expv[62] = 32'h00000126;
      expv[63] = 32'h000003dc;
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
