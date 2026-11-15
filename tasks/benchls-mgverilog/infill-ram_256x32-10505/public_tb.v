// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10505 dut (
    .clk(clk),
    .A(in_vec[64:33]),
    .WD(in_vec[32:1]),
    .WE(in_vec[0:0]),
    .RD(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1e50c806649af5ecc;
    stim[1] = 65'h16cd8add5d20b4c12;
    stim[2] = 65'h11a72f7c92932c3b4;
    stim[3] = 65'h0b52ecde076f9e402;
    stim[4] = 65'h09a1159dc53883945;
    stim[5] = 65'h10ed7e5aaed55d24e;
    stim[6] = 65'h0b47c774a925ea92f;
    stim[7] = 65'h09a496bfb626e288a;
    stim[8] = 65'h04662b686e57d723c;
    stim[9] = 65'h09d4e4c37e58332db;
    stim[10] = 65'h0cee1e60c12a7da54;
    stim[11] = 65'h092581222498be73b;
    stim[12] = 65'h08648e302b6e5f5b1;
    stim[13] = 65'h17c3f20bac27aa4a7;
    stim[14] = 65'h18afaf89ec84b81c2;
    stim[15] = 65'h12d939df2cfc68d1c;
    stim[16] = 65'h13e0a8ab67de6c420;
    stim[17] = 65'h097cc452e06c6aaf0;
    stim[18] = 65'h0c21e2de23bf86a15;
    stim[19] = 65'h0807c57fbbfb55134;
    stim[20] = 65'h0ff67307602b13759;
    stim[21] = 65'h0c87144e158edd6a0;
    stim[22] = 65'h15cd7091a2cfc935a;
    stim[23] = 65'h1cdac66c946426795;
    stim[24] = 65'h1824920ca37bd4009;
    stim[25] = 65'h131018e91d598cc12;
    stim[26] = 65'h02d6632e650813ca4;
    stim[27] = 65'h0cdc644eb4ff1459c;
    stim[28] = 65'h013ade8446aa76ed5;
    stim[29] = 65'h133a19b5686245e36;
    stim[30] = 65'h040f2d61ce90fcce8;
    stim[31] = 65'h12baf98fab0e78db7;
    stim[32] = 65'h193f319b5fe5f06a7;
    stim[33] = 65'h0c9372ea46a05d2a9;
    stim[34] = 65'h1c45ed01efc771ba7;
    stim[35] = 65'h1f27a813a2ba4fb2e;
    stim[36] = 65'h09c0cf3e6fbd96fa2;
    stim[37] = 65'h1a156b2c878af33a5;
    stim[38] = 65'h0d0a8ee7a53d8c0fe;
    stim[39] = 65'h03d4dc3e6de51cc25;
    stim[40] = 65'h065512d5c8945b5b2;
    stim[41] = 65'h1c2013147738f8494;
    stim[42] = 65'h0509ca4b4a4244ec2;
    stim[43] = 65'h10eb8227d5f1da59e;
    stim[44] = 65'h0c3ca76dd2dfc09f4;
    stim[45] = 65'h0b4532148b21796f4;
    stim[46] = 65'h10113534cd14d11a6;
    stim[47] = 65'h0edf74cb5b4153507;
    stim[48] = 65'h01cce404a57207b3c;
    stim[49] = 65'h0b283efe4f9f4b98c;
    stim[50] = 65'h05c3ba56a43721243;
    stim[51] = 65'h0427b84901643c2bb;
    stim[52] = 65'h1a35df327daaa2dba;
    stim[53] = 65'h01c45d728e125826a;
    stim[54] = 65'h0add112e8f8f46fe6;
    stim[55] = 65'h16962ffc59e6dc01a;
    stim[56] = 65'h04ba203f3fc40701e;
    stim[57] = 65'h189ce2632b8664f4a;
    stim[58] = 65'h180a9d7d4360afb69;
    stim[59] = 65'h0d0bd9dbb3d5f7c29;
    stim[60] = 65'h1d066c4167557525e;
    stim[61] = 65'h1f9b63a108ecaf1a0;
    stim[62] = 65'h05bc6153c4cc5efed;
    stim[63] = 65'h02afd49d7289898bf;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'ha32133ca;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
