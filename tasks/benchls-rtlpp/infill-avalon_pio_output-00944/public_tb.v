// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00944 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0dcf90f1bc;
    stim[1] = 37'h01a853dc82;
    stim[2] = 37'h1aab75b67f;
    stim[3] = 37'h1e0c1eda78;
    stim[4] = 37'h03d38223ec;
    stim[5] = 37'h1a8dd6b464;
    stim[6] = 37'h16b0261fda;
    stim[7] = 37'h0659007a19;
    stim[8] = 37'h0a8159ea17;
    stim[9] = 37'h1ec157a24a;
    stim[10] = 37'h1309c90f01;
    stim[11] = 37'h07c614fde9;
    stim[12] = 37'h074903df46;
    stim[13] = 37'h0ea0f2f47d;
    stim[14] = 37'h16cdf84ff7;
    stim[15] = 37'h1648accf08;
    stim[16] = 37'h1a5326ad2b;
    stim[17] = 37'h0753458283;
    stim[18] = 37'h0f901985f2;
    stim[19] = 37'h16bc4dd769;
    stim[20] = 37'h1f852658a7;
    stim[21] = 37'h0271f8ba7f;
    stim[22] = 37'h13d5c1e643;
    stim[23] = 37'h026490eee8;
    stim[24] = 37'h0648f45f1f;
    stim[25] = 37'h0707764137;
    stim[26] = 37'h0e6c6817ab;
    stim[27] = 37'h06a224ce9f;
    stim[28] = 37'h17be573e3e;
    stim[29] = 37'h16eee636a4;
    stim[30] = 37'h1aa843ff67;
    stim[31] = 37'h1369428918;
    stim[32] = 37'h029a7395d6;
    stim[33] = 37'h1ec153a979;
    stim[34] = 37'h0625668dcf;
    stim[35] = 37'h1e59cb0c0e;
    stim[36] = 37'h1b85eb315b;
    stim[37] = 37'h1de5ebd632;
    stim[38] = 37'h0a0865f42f;
    stim[39] = 37'h14e50a0fe8;
    stim[40] = 37'h1b8953d763;
    stim[41] = 37'h075923fe17;
    stim[42] = 37'h0ae7eb9dc5;
    stim[43] = 37'h02977b679f;
    stim[44] = 37'h0ec7f0ab12;
    stim[45] = 37'h176325db42;
    stim[46] = 37'h1a8814f2b5;
    stim[47] = 37'h0263a6c8a3;
    stim[48] = 37'h0350bda58a;
    stim[49] = 37'h1ee298f58d;
    stim[50] = 37'h1e156f4ec4;
    stim[51] = 37'h0e45643804;
    stim[52] = 37'h1794affe34;
    stim[53] = 37'h16ea368bbe;
    stim[54] = 37'h03863f0333;
    stim[55] = 37'h0f6cc9ddfa;
    stim[56] = 37'h1ae4cb0855;
    stim[57] = 37'h1204bb1274;
    stim[58] = 37'h12edc81bec;
    stim[59] = 37'h1232c053f3;
    stim[60] = 37'h0a0a0b260a;
    stim[61] = 37'h078a92d536;
    stim[62] = 37'h13c3fa34d6;
    stim[63] = 37'h0e5f7034d2;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h1900000000;
      expv[9] = 40'h1900000000;
      expv[10] = 40'h1900000000;
      expv[11] = 40'h1900000019;
      expv[12] = 40'h1900000019;
      expv[13] = 40'h1900000000;
      expv[14] = 40'h1900000000;
      expv[15] = 40'h1900000000;
      expv[16] = 40'h1900000000;
      expv[17] = 40'h1900000019;
      expv[18] = 40'h1900000000;
      expv[19] = 40'h1900000000;
      expv[20] = 40'h1900000000;
      expv[21] = 40'h1900000019;
      expv[22] = 40'h1900000000;
      expv[23] = 40'h1900000019;
      expv[24] = 40'h1900000019;
      expv[25] = 40'h1f0000001f;
      expv[26] = 40'h1f00000000;
      expv[27] = 40'h1f0000001f;
      expv[28] = 40'h9f00000000;
      expv[29] = 40'h9f00000000;
      expv[30] = 40'h9f00000000;
      expv[31] = 40'h9f00000000;
      expv[32] = 40'h9f0000009f;
      expv[33] = 40'h9f00000000;
      expv[34] = 40'h9f0000009f;
      expv[35] = 40'hcf00000000;
      expv[36] = 40'hcf00000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000000000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
