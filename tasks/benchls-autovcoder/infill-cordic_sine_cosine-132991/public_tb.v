// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_132991 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .angle(in_vec[15:0]),
    .sine(out_vec[31:16]),
    .cosine(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1f44b;
    stim[1] = 17'h14e71;
    stim[2] = 17'h071b0;
    stim[3] = 17'h09b98;
    stim[4] = 17'h03aa3;
    stim[5] = 17'h08203;
    stim[6] = 17'h02b9a;
    stim[7] = 17'h04618;
    stim[8] = 17'h0b94e;
    stim[9] = 17'h0b126;
    stim[10] = 17'h08ab8;
    stim[11] = 17'h04793;
    stim[12] = 17'h0c620;
    stim[13] = 17'h09c57;
    stim[14] = 17'h071e8;
    stim[15] = 17'h0010a;
    stim[16] = 17'h02d54;
    stim[17] = 17'h014eb;
    stim[18] = 17'h09961;
    stim[19] = 17'h050de;
    stim[20] = 17'h0de14;
    stim[21] = 17'h08d77;
    stim[22] = 17'h0cdac;
    stim[23] = 17'h0fb71;
    stim[24] = 17'h0df1d;
    stim[25] = 17'h07242;
    stim[26] = 17'h0a9a8;
    stim[27] = 17'h0aaae;
    stim[28] = 17'h0a66e;
    stim[29] = 17'h00ff6;
    stim[30] = 17'h03c93;
    stim[31] = 17'h09fb2;
    stim[32] = 17'h0375a;
    stim[33] = 17'h028ea;
    stim[34] = 17'h0ea54;
    stim[35] = 17'h083f4;
    stim[36] = 17'h0a144;
    stim[37] = 17'h02f5a;
    stim[38] = 17'h01e4e;
    stim[39] = 17'h025cc;
    stim[40] = 17'h0be13;
    stim[41] = 17'h05cc9;
    stim[42] = 17'h0e69b;
    stim[43] = 17'h0d2ea;
    stim[44] = 17'h06bc5;
    stim[45] = 17'h01b56;
    stim[46] = 17'h0c37e;
    stim[47] = 17'h0bc24;
    stim[48] = 17'h0c77b;
    stim[49] = 17'h09b4f;
    stim[50] = 17'h01021;
    stim[51] = 17'h097ed;
    stim[52] = 17'h0ad1c;
    stim[53] = 17'h056b5;
    stim[54] = 17'h08783;
    stim[55] = 17'h066a1;
    stim[56] = 17'h06471;
    stim[57] = 17'h0a2ca;
    stim[58] = 17'h0935f;
    stim[59] = 17'h0f01d;
    stim[60] = 17'h0fd76;
    stim[61] = 17'h070c5;
    stim[62] = 17'h0dbd8;
    stim[63] = 17'h038ce;
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
