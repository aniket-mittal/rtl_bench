// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04655 dut (
    .clk(clk),
    .din(in_vec[12:0]),
    .dout(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h13fc;
    stim[1] = 13'h1c7d;
    stim[2] = 13'h1fd3;
    stim[3] = 13'h0940;
    stim[4] = 13'h0e54;
    stim[5] = 13'h02bc;
    stim[6] = 13'h0f8a;
    stim[7] = 13'h11f3;
    stim[8] = 13'h0bd0;
    stim[9] = 13'h1286;
    stim[10] = 13'h09ca;
    stim[11] = 13'h156b;
    stim[12] = 13'h09ef;
    stim[13] = 13'h04d6;
    stim[14] = 13'h09cc;
    stim[15] = 13'h1eb5;
    stim[16] = 13'h1bcb;
    stim[17] = 13'h1002;
    stim[18] = 13'h1200;
    stim[19] = 13'h1cb4;
    stim[20] = 13'h1124;
    stim[21] = 13'h1a66;
    stim[22] = 13'h0a20;
    stim[23] = 13'h0c81;
    stim[24] = 13'h0e4d;
    stim[25] = 13'h187f;
    stim[26] = 13'h1682;
    stim[27] = 13'h0e52;
    stim[28] = 13'h1c59;
    stim[29] = 13'h0551;
    stim[30] = 13'h0949;
    stim[31] = 13'h1bf2;
    stim[32] = 13'h0794;
    stim[33] = 13'h1432;
    stim[34] = 13'h028c;
    stim[35] = 13'h11ca;
    stim[36] = 13'h159c;
    stim[37] = 13'h1257;
    stim[38] = 13'h11c0;
    stim[39] = 13'h05da;
    stim[40] = 13'h1fbf;
    stim[41] = 13'h18be;
    stim[42] = 13'h08ea;
    stim[43] = 13'h05b5;
    stim[44] = 13'h0c31;
    stim[45] = 13'h0acc;
    stim[46] = 13'h1265;
    stim[47] = 13'h1704;
    stim[48] = 13'h1761;
    stim[49] = 13'h0a30;
    stim[50] = 13'h0ed4;
    stim[51] = 13'h1fc1;
    stim[52] = 13'h071d;
    stim[53] = 13'h0111;
    stim[54] = 13'h02b1;
    stim[55] = 13'h0e2a;
    stim[56] = 13'h070e;
    stim[57] = 13'h196e;
    stim[58] = 13'h1900;
    stim[59] = 13'h035d;
    stim[60] = 13'h0010;
    stim[61] = 13'h1bfd;
    stim[62] = 13'h1bc2;
    stim[63] = 13'h1754;
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
      expv[0] = 4'hx;
      expv[1] = 4'h8;
      expv[2] = 4'h8;
      expv[3] = 4'h0;
      expv[4] = 4'h7;
      expv[5] = 4'h7;
      expv[6] = 4'h5;
      expv[7] = 4'h7;
      expv[8] = 4'h8;
      expv[9] = 4'h7;
      expv[10] = 4'h8;
      expv[11] = 4'h7;
      expv[12] = 4'h8;
      expv[13] = 4'h7;
      expv[14] = 4'h7;
      expv[15] = 4'h7;
      expv[16] = 4'hd;
      expv[17] = 4'h8;
      expv[18] = 4'h8;
      expv[19] = 4'h8;
      expv[20] = 4'h9;
      expv[21] = 4'h8;
      expv[22] = 4'h8;
      expv[23] = 4'h7;
      expv[24] = 4'h7;
      expv[25] = 4'h7;
      expv[26] = 4'h8;
      expv[27] = 4'h8;
      expv[28] = 4'h7;
      expv[29] = 4'h8;
      expv[30] = 4'h7;
      expv[31] = 4'h7;
      expv[32] = 4'h8;
      expv[33] = 4'h7;
      expv[34] = 4'h8;
      expv[35] = 4'h5;
      expv[36] = 4'h8;
      expv[37] = 4'h8;
      expv[38] = 4'h8;
      expv[39] = 4'h8;
      expv[40] = 4'h7;
      expv[41] = 4'hf;
      expv[42] = 4'h8;
      expv[43] = 4'h7;
      expv[44] = 4'h7;
      expv[45] = 4'h7;
      expv[46] = 4'h7;
      expv[47] = 4'h8;
      expv[48] = 4'h8;
      expv[49] = 4'h8;
      expv[50] = 4'h7;
      expv[51] = 4'h7;
      expv[52] = 4'h0;
      expv[53] = 4'h7;
      expv[54] = 4'h2;
      expv[55] = 4'h5;
      expv[56] = 4'h7;
      expv[57] = 4'h7;
      expv[58] = 4'h8;
      expv[59] = 4'h8;
      expv[60] = 4'h7;
      expv[61] = 4'h0;
      expv[62] = 4'h8;
      expv[63] = 4'h8;
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
