// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066853 dut (
    .ALUOp(in_vec[9:6]),
    .funct(in_vec[5:0]),
    .ALUCtl(out_vec[5:1]),
    .Sign(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h14f;
    stim[1] = 10'h3c5;
    stim[2] = 10'h137;
    stim[3] = 10'h3b5;
    stim[4] = 10'h159;
    stim[5] = 10'h0bd;
    stim[6] = 10'h3a5;
    stim[7] = 10'h254;
    stim[8] = 10'h14a;
    stim[9] = 10'h317;
    stim[10] = 10'h19f;
    stim[11] = 10'h0d4;
    stim[12] = 10'h1e0;
    stim[13] = 10'h076;
    stim[14] = 10'h166;
    stim[15] = 10'h2f2;
    stim[16] = 10'h13b;
    stim[17] = 10'h31d;
    stim[18] = 10'h183;
    stim[19] = 10'h1ad;
    stim[20] = 10'h10a;
    stim[21] = 10'h1da;
    stim[22] = 10'h016;
    stim[23] = 10'h2b0;
    stim[24] = 10'h317;
    stim[25] = 10'h0de;
    stim[26] = 10'h1e1;
    stim[27] = 10'h0e4;
    stim[28] = 10'h0a6;
    stim[29] = 10'h272;
    stim[30] = 10'h3d5;
    stim[31] = 10'h2a7;
    stim[32] = 10'h0c3;
    stim[33] = 10'h106;
    stim[34] = 10'h009;
    stim[35] = 10'h04c;
    stim[36] = 10'h0fa;
    stim[37] = 10'h32a;
    stim[38] = 10'h3b4;
    stim[39] = 10'h388;
    stim[40] = 10'h12f;
    stim[41] = 10'h36f;
    stim[42] = 10'h262;
    stim[43] = 10'h241;
    stim[44] = 10'h36a;
    stim[45] = 10'h1d0;
    stim[46] = 10'h267;
    stim[47] = 10'h2f7;
    stim[48] = 10'h335;
    stim[49] = 10'h0f8;
    stim[50] = 10'h21d;
    stim[51] = 10'h27b;
    stim[52] = 10'h1f0;
    stim[53] = 10'h15e;
    stim[54] = 10'h06a;
    stim[55] = 10'h256;
    stim[56] = 10'h3be;
    stim[57] = 10'h138;
    stim[58] = 10'h216;
    stim[59] = 10'h051;
    stim[60] = 10'h1bc;
    stim[61] = 10'h00a;
    stim[62] = 10'h0d8;
    stim[63] = 10'h27b;
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
      expv[0] = 6'h0f;
      expv[1] = 6'hxx;
      expv[2] = 6'h01;
      expv[3] = 6'hxx;
      expv[4] = 6'h0f;
      expv[5] = 6'hxx;
      expv[6] = 6'hxx;
      expv[7] = 6'h0c;
      expv[8] = 6'h0f;
      expv[9] = 6'h00;
      expv[10] = 6'hxx;
      expv[11] = 6'h03;
      expv[12] = 6'hxx;
      expv[13] = 6'h0d;
      expv[14] = 6'h0f;
      expv[15] = 6'h02;
      expv[16] = 6'h01;
      expv[17] = 6'h00;
      expv[18] = 6'hxx;
      expv[19] = 6'hxx;
      expv[20] = 6'h01;
      expv[21] = 6'hxx;
      expv[22] = 6'h05;
      expv[23] = 6'hxx;
      expv[24] = 6'h00;
      expv[25] = 6'h03;
      expv[26] = 6'hxx;
      expv[27] = 6'h03;
      expv[28] = 6'h1b;
      expv[29] = 6'h0c;
      expv[30] = 6'hxx;
      expv[31] = 6'h18;
      expv[32] = 6'h03;
      expv[33] = 6'h01;
      expv[34] = 6'h05;
      expv[35] = 6'h0d;
      expv[36] = 6'h03;
      expv[37] = 6'h00;
      expv[38] = 6'hxx;
      expv[39] = 6'hxx;
      expv[40] = 6'h01;
      expv[41] = 6'h0e;
      expv[42] = 6'h0c;
      expv[43] = 6'h0c;
      expv[44] = 6'h0e;
      expv[45] = 6'hxx;
      expv[46] = 6'h0c;
      expv[47] = 6'h02;
      expv[48] = 6'h00;
      expv[49] = 6'h03;
      expv[50] = 6'h04;
      expv[51] = 6'h0c;
      expv[52] = 6'hxx;
      expv[53] = 6'h0f;
      expv[54] = 6'h0d;
      expv[55] = 6'h0c;
      expv[56] = 6'hxx;
      expv[57] = 6'h01;
      expv[58] = 6'h04;
      expv[59] = 6'h0d;
      expv[60] = 6'hxx;
      expv[61] = 6'h05;
      expv[62] = 6'h03;
      expv[63] = 6'h0c;
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
