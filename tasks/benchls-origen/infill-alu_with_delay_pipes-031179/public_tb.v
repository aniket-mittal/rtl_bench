// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_031179 dut (
    .clk(clk),
    .A(in_vec[20:13]),
    .B(in_vec[12:5]),
    .op(in_vec[4:2]),
    .reset_n(in_vec[1:1]),
    .start(in_vec[0:0]),
    .done(out_vec[16:16]),
    .result(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1b00d9;
    stim[1] = 21'h13f3b1;
    stim[2] = 21'h122c5e;
    stim[3] = 21'h1b45d7;
    stim[4] = 21'h0beec2;
    stim[5] = 21'h05455a;
    stim[6] = 21'h0aa373;
    stim[7] = 21'h1fed67;
    stim[8] = 21'h03e25f;
    stim[9] = 21'h0e80bb;
    stim[10] = 21'h1cef7b;
    stim[11] = 21'h1ab3f6;
    stim[12] = 21'h06ac5e;
    stim[13] = 21'h0dc4ce;
    stim[14] = 21'h0ec32f;
    stim[15] = 21'h0b88ee;
    stim[16] = 21'h14c5de;
    stim[17] = 21'h11662a;
    stim[18] = 21'h1f63b7;
    stim[19] = 21'h1aea6f;
    stim[20] = 21'h0be2ba;
    stim[21] = 21'h0df0eb;
    stim[22] = 21'h18be17;
    stim[23] = 21'h1dc86a;
    stim[24] = 21'h0090fb;
    stim[25] = 21'h02e132;
    stim[26] = 21'h1d9f4e;
    stim[27] = 21'h0ef2ab;
    stim[28] = 21'h0cc5de;
    stim[29] = 21'h1963ca;
    stim[30] = 21'h185fae;
    stim[31] = 21'h06e04b;
    stim[32] = 21'h0640de;
    stim[33] = 21'h16cf47;
    stim[34] = 21'h021007;
    stim[35] = 21'h03ac57;
    stim[36] = 21'h15eae2;
    stim[37] = 21'h0f764a;
    stim[38] = 21'h155ead;
    stim[39] = 21'h0e5daf;
    stim[40] = 21'h04ba2b;
    stim[41] = 21'h14184f;
    stim[42] = 21'h16f22b;
    stim[43] = 21'h173a9b;
    stim[44] = 21'h00285b;
    stim[45] = 21'h0898ab;
    stim[46] = 21'h1fda17;
    stim[47] = 21'h16c2ff;
    stim[48] = 21'h035bbf;
    stim[49] = 21'h1de6bf;
    stim[50] = 21'h03d18b;
    stim[51] = 21'h12cc56;
    stim[52] = 21'h17791e;
    stim[53] = 21'h0b3f0b;
    stim[54] = 21'h1939b7;
    stim[55] = 21'h0ac906;
    stim[56] = 21'h19b32f;
    stim[57] = 21'h1a3fdf;
    stim[58] = 21'h12bb3a;
    stim[59] = 21'h134da6;
    stim[60] = 21'h0463ae;
    stim[61] = 21'h1e76af;
    stim[62] = 21'h09c64a;
    stim[63] = 21'h06f48b;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h1006a;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h10030;
      expv[35] = 17'h10090;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
