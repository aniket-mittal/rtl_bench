// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071910 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2c6339be5b;
    stim[1] = 38'h3b7c2aa63c;
    stim[2] = 38'h1e566b656b;
    stim[3] = 38'h11d22623de;
    stim[4] = 38'h19c857f3df;
    stim[5] = 38'h0316cbe90d;
    stim[6] = 38'h0da62dc511;
    stim[7] = 38'h045c3a2aba;
    stim[8] = 38'h16c88ed050;
    stim[9] = 38'h1133270420;
    stim[10] = 38'h07d39051ca;
    stim[11] = 38'h0a88636f4b;
    stim[12] = 38'h01ab639d80;
    stim[13] = 38'h1861f8231e;
    stim[14] = 38'h0c7ae6ea0d;
    stim[15] = 38'h09b0bbb332;
    stim[16] = 38'h1aced7386a;
    stim[17] = 38'h1e4920f24b;
    stim[18] = 38'h0b37e334f6;
    stim[19] = 38'h150e7ab691;
    stim[20] = 38'h0cee006b41;
    stim[21] = 38'h0c5c05a9c4;
    stim[22] = 38'h112c1f91fe;
    stim[23] = 38'h03232430ec;
    stim[24] = 38'h1d587855d8;
    stim[25] = 38'h1a4c981b93;
    stim[26] = 38'h185127d887;
    stim[27] = 38'h029b98883c;
    stim[28] = 38'h18b79121d8;
    stim[29] = 38'h1c70a7277e;
    stim[30] = 38'h0e03cca2b4;
    stim[31] = 38'h107544b1e9;
    stim[32] = 38'h1568e445a2;
    stim[33] = 38'h165c599172;
    stim[34] = 38'h0ce14e3497;
    stim[35] = 38'h1affd05b35;
    stim[36] = 38'h1e25984e83;
    stim[37] = 38'h084fcecdbd;
    stim[38] = 38'h17b5d74ba2;
    stim[39] = 38'h18eac03ee8;
    stim[40] = 38'h01cb73fc3d;
    stim[41] = 38'h01de4eeac6;
    stim[42] = 38'h08fcd82150;
    stim[43] = 38'h1be5f18c97;
    stim[44] = 38'h0962335c25;
    stim[45] = 38'h047796d50b;
    stim[46] = 38'h049a2f3370;
    stim[47] = 38'h0d13bb5d7a;
    stim[48] = 38'h0d1c867f63;
    stim[49] = 38'h0e426c0042;
    stim[50] = 38'h184c617afb;
    stim[51] = 38'h1310e06bf2;
    stim[52] = 38'h1db0d7b17a;
    stim[53] = 38'h08c358b9c2;
    stim[54] = 38'h13f8d4016f;
    stim[55] = 38'h1f671f6274;
    stim[56] = 38'h0a0143e938;
    stim[57] = 38'h18516cc5ed;
    stim[58] = 38'h1cdbbf0da5;
    stim[59] = 38'h1372138363;
    stim[60] = 38'h14814c90af;
    stim[61] = 38'h1fed057dd8;
    stim[62] = 38'h1b335838c6;
    stim[63] = 38'h09da1d5ec6;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h3959ad95a;
      expv[5] = 34'h2959ad95a;
      expv[6] = 34'h2959ad95a;
      expv[7] = 34'h2959ad95a;
      expv[8] = 34'h2959ad95a;
      expv[9] = 34'h2959ad95a;
      expv[10] = 34'h2959ad95a;
      expv[11] = 34'h2959ad95a;
      expv[12] = 34'h2959ad95a;
      expv[13] = 34'h2959ad95a;
      expv[14] = 34'h2959ad95a;
      expv[15] = 34'h2959ad95a;
      expv[16] = 34'h2959ad95a;
      expv[17] = 34'h2959ad95a;
      expv[18] = 34'h2959ad95a;
      expv[19] = 34'h2959ad95a;
      expv[20] = 34'h2959ad95a;
      expv[21] = 34'h2959ad95a;
      expv[22] = 34'h2959ad95a;
      expv[23] = 34'h392483c92;
      expv[24] = 34'h392483c92;
      expv[25] = 34'h392483c92;
      expv[26] = 34'h3561e1576;
      expv[27] = 34'h2561e1576;
      expv[28] = 34'h2561e1576;
      expv[29] = 34'h2561e1576;
      expv[30] = 34'h2561e1576;
      expv[31] = 34'h2561e1576;
      expv[32] = 34'h2561e1576;
      expv[33] = 34'h31c29c9df;
      expv[34] = 34'h31c29c9df;
      expv[35] = 34'h31c29c9df;
      expv[36] = 34'h31c29c9df;
      expv[37] = 34'h21c29c9df;
      expv[38] = 34'h21c29c9df;
      expv[39] = 34'h3896613a0;
      expv[40] = 34'h3896613a0;
      expv[41] = 34'h3896613a0;
      expv[42] = 34'h3896613a0;
      expv[43] = 34'h3896613a0;
      expv[44] = 34'h2896613a0;
      expv[45] = 34'h2896613a0;
      expv[46] = 34'h2896613a0;
      expv[47] = 34'h2896613a0;
      expv[48] = 34'h2896613a0;
      expv[49] = 34'h2896613a0;
      expv[50] = 34'h2896613a0;
      expv[51] = 34'h2896613a0;
      expv[52] = 34'h2896613a0;
      expv[53] = 34'h2896613a0;
      expv[54] = 34'h2896613a0;
      expv[55] = 34'h36c35ec5e;
      expv[56] = 34'h36c35ec5e;
      expv[57] = 34'h36c35ec5e;
      expv[58] = 34'h36c35ec5e;
      expv[59] = 34'h36c35ec5e;
      expv[60] = 34'h3d9c7d89d;
      expv[61] = 34'h336efc369;
      expv[62] = 34'h336efc369;
      expv[63] = 34'h336efc369;
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
