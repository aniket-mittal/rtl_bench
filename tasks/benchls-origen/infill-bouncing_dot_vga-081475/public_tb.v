// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081475 dut (
    .CLK(clk),
    .DEN(in_vec[22:22]),
    .X(in_vec[21:11]),
    .Y(in_vec[10:0]),
    .R(out_vec[23:16]),
    .G(out_vec[15:8]),
    .B(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h4e9039;
    stim[1] = 23'h64456c;
    stim[2] = 23'h561bc5;
    stim[3] = 23'h02ac91;
    stim[4] = 23'h7e9448;
    stim[5] = 23'h0f4764;
    stim[6] = 23'h6200e0;
    stim[7] = 23'h6218cb;
    stim[8] = 23'h2a8a64;
    stim[9] = 23'h4d2325;
    stim[10] = 23'h52cbe6;
    stim[11] = 23'h0a5a22;
    stim[12] = 23'h77037f;
    stim[13] = 23'h477b85;
    stim[14] = 23'h1b25dc;
    stim[15] = 23'h4b74d2;
    stim[16] = 23'h03913d;
    stim[17] = 23'h3f67cc;
    stim[18] = 23'h35d208;
    stim[19] = 23'h211129;
    stim[20] = 23'h2e4036;
    stim[21] = 23'h04e09b;
    stim[22] = 23'h6640f2;
    stim[23] = 23'h75e807;
    stim[24] = 23'h218212;
    stim[25] = 23'h18fe07;
    stim[26] = 23'h144028;
    stim[27] = 23'h25ea33;
    stim[28] = 23'h22b11d;
    stim[29] = 23'h253c72;
    stim[30] = 23'h34117b;
    stim[31] = 23'h4ebbd0;
    stim[32] = 23'h3cf7b2;
    stim[33] = 23'h34f270;
    stim[34] = 23'h0691b8;
    stim[35] = 23'h6cc9e1;
    stim[36] = 23'h7a9d66;
    stim[37] = 23'h7f5d74;
    stim[38] = 23'h66dd29;
    stim[39] = 23'h780286;
    stim[40] = 23'h6d4b47;
    stim[41] = 23'h3ca938;
    stim[42] = 23'h61bc63;
    stim[43] = 23'h3463c2;
    stim[44] = 23'h4f01d5;
    stim[45] = 23'h3f6fcf;
    stim[46] = 23'h0ed0bb;
    stim[47] = 23'h6c6ade;
    stim[48] = 23'h1a7bde;
    stim[49] = 23'h6ae740;
    stim[50] = 23'h66785e;
    stim[51] = 23'h0d1685;
    stim[52] = 23'h11cef9;
    stim[53] = 23'h434c9d;
    stim[54] = 23'h782769;
    stim[55] = 23'h64e118;
    stim[56] = 23'h0be620;
    stim[57] = 23'h2cf86a;
    stim[58] = 23'h781ecd;
    stim[59] = 23'h50cba6;
    stim[60] = 23'h0a195a;
    stim[61] = 23'h250667;
    stim[62] = 23'h7934f1;
    stim[63] = 23'h774b89;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'h0000ff;
      expv[3] = 24'h0000ff;
      expv[4] = 24'h0000ff;
      expv[5] = 24'h000000;
      expv[6] = 24'h0000ff;
      expv[7] = 24'h000000;
      expv[8] = 24'h0000ff;
      expv[9] = 24'h0000ff;
      expv[10] = 24'h000000;
      expv[11] = 24'h0000ff;
      expv[12] = 24'h0000ff;
      expv[13] = 24'h000000;
      expv[14] = 24'h0000ff;
      expv[15] = 24'h00ff00;
      expv[16] = 24'h000000;
      expv[17] = 24'h0000ff;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h0000ff;
      expv[25] = 24'h0000ff;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h0000ff;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h0000ff;
      expv[38] = 24'h0000ff;
      expv[39] = 24'h0000ff;
      expv[40] = 24'h0000ff;
      expv[41] = 24'h0000ff;
      expv[42] = 24'h0000ff;
      expv[43] = 24'h000000;
      expv[44] = 24'h0000ff;
      expv[45] = 24'h000000;
      expv[46] = 24'h0000ff;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h0000ff;
      expv[50] = 24'h000000;
      expv[51] = 24'h0000ff;
      expv[52] = 24'h0000ff;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'hff0000;
      expv[56] = 24'h0000ff;
      expv[57] = 24'h0000ff;
      expv[58] = 24'h000000;
      expv[59] = 24'h000000;
      expv[60] = 24'h0000ff;
      expv[61] = 24'h0000ff;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
