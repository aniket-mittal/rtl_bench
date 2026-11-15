// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134915 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .a(in_vec[32:17]),
    .b(in_vec[16:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[16:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3d1a17fb6;
    stim[1] = 34'h2d7cbe2ed;
    stim[2] = 34'h0850693cb;
    stim[3] = 34'h10a368d2f;
    stim[4] = 34'h1979c82ee;
    stim[5] = 34'h0c18ce144;
    stim[6] = 34'h0b68aa7cb;
    stim[7] = 34'h197ca8b19;
    stim[8] = 34'h18e3b69c4;
    stim[9] = 34'h191fac3df;
    stim[10] = 34'h0f870753f;
    stim[11] = 34'h0d82f7ac2;
    stim[12] = 34'h1e10aab20;
    stim[13] = 34'h173656b0d;
    stim[14] = 34'h1f83c9cbf;
    stim[15] = 34'h0f66cc4be;
    stim[16] = 34'h0b7ce5dcd;
    stim[17] = 34'h14d9223b5;
    stim[18] = 34'h006780d95;
    stim[19] = 34'h178b14c60;
    stim[20] = 34'h0888c5635;
    stim[21] = 34'h3484a4dd5;
    stim[22] = 34'h09dfbf738;
    stim[23] = 34'h1a22d623a;
    stim[24] = 34'h092628446;
    stim[25] = 34'h07ddee039;
    stim[26] = 34'h12c0a8e85;
    stim[27] = 34'h0d6a3dadb;
    stim[28] = 34'h12fb64f9c;
    stim[29] = 34'h033e353eb;
    stim[30] = 34'h060ef6299;
    stim[31] = 34'h1c735b930;
    stim[32] = 34'h0f51643c3;
    stim[33] = 34'h1af6af1a1;
    stim[34] = 34'h1bc7fa4d2;
    stim[35] = 34'h06546dc5b;
    stim[36] = 34'h090a5f2dc;
    stim[37] = 34'h0a535b928;
    stim[38] = 34'h063a6bed3;
    stim[39] = 34'h08a937f26;
    stim[40] = 34'h0aec4a13c;
    stim[41] = 34'h1ac2cdecc;
    stim[42] = 34'h02155ffe0;
    stim[43] = 34'h07a9293a2;
    stim[44] = 34'h122aa603a;
    stim[45] = 34'h0dcf5c187;
    stim[46] = 34'h109bf74f9;
    stim[47] = 34'h0a2d68972;
    stim[48] = 34'h10b5bee9f;
    stim[49] = 34'h1ce2f928e;
    stim[50] = 34'h1508b553d;
    stim[51] = 34'h0bbb54479;
    stim[52] = 34'h1be357214;
    stim[53] = 34'h03a77ba65;
    stim[54] = 34'h19a59b750;
    stim[55] = 34'h1a32a3ef5;
    stim[56] = 34'h064f3aca5;
    stim[57] = 34'h0aa3529df;
    stim[58] = 34'h0ca8d5739;
    stim[59] = 34'h112b7717e;
    stim[60] = 34'h1e633f08d;
    stim[61] = 34'h1bc0f8266;
    stim[62] = 34'h18882dbf1;
    stim[63] = 34'h1e6ab58f4;
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
      expv[4] = 17'h1e8d3;
      expv[5] = 17'h0ff67;
      expv[6] = 17'h0a28b;
      expv[7] = 17'h072d0;
      expv[8] = 17'h1b457;
      expv[9] = 17'h106e5;
      expv[10] = 17'h0f7ff;
      expv[11] = 17'h02ddb;
      expv[12] = 17'h11fb1;
      expv[13] = 17'h142f1;
      expv[14] = 17'h0b42b;
      expv[15] = 17'h15073;
      expv[16] = 17'h192fd;
      expv[17] = 17'h0e52b;
      expv[18] = 17'h0af9c;
      expv[19] = 17'h0b948;
      expv[20] = 17'h0220f;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h1c533;
      expv[25] = 17'h16c67;
      expv[26] = 17'h1bea8;
      expv[27] = 17'h17419;
      expv[28] = 17'h04c91;
      expv[29] = 17'h02f7f;
      expv[30] = 17'h0cf52;
      expv[31] = 17'h155ce;
      expv[32] = 17'h14d89;
      expv[33] = 17'h1e265;
      expv[34] = 17'h012da;
      expv[35] = 17'h1ad0d;
      expv[36] = 17'h0b351;
      expv[37] = 17'h0e3a3;
      expv[38] = 17'h00381;
      expv[39] = 17'h0b85d;
      expv[40] = 17'h19c7b;
      expv[41] = 17'h1c3b9;
      expv[42] = 17'h14e01;
      expv[43] = 17'h184f9;
      expv[44] = 17'h15335;
      expv[45] = 17'h14235;
      expv[46] = 17'h068e5;
      expv[47] = 17'h1187d;
      expv[48] = 17'h136b9;
      expv[49] = 17'h17449;
      expv[50] = 17'h0f5fb;
      expv[51] = 17'h01cbd;
      expv[52] = 17'h06dc9;
      expv[53] = 17'h02c2e;
      expv[54] = 17'h17a49;
      expv[55] = 17'h0d0dd;
      expv[56] = 17'h0f9a9;
      expv[57] = 17'h00020;
      expv[58] = 17'h1ab99;
      expv[59] = 17'h1e615;
      expv[60] = 17'h1e9c7;
      expv[61] = 17'h0b635;
      expv[62] = 17'h098c1;
      expv[63] = 17'h1b275;
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
