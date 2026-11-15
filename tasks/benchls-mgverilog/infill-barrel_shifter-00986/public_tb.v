// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00986 dut (
    .a(in_vec[12:7]),
    .amount(in_vec[6:1]),
    .cin(in_vec[0:0]),
    .o(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h028a;
    stim[1] = 13'h03e2;
    stim[2] = 13'h019c;
    stim[3] = 13'h037b;
    stim[4] = 13'h004d;
    stim[5] = 13'h1e6c;
    stim[6] = 13'h1150;
    stim[7] = 13'h18fc;
    stim[8] = 13'h0571;
    stim[9] = 13'h08d7;
    stim[10] = 13'h0025;
    stim[11] = 13'h1c97;
    stim[12] = 13'h1a9d;
    stim[13] = 13'h19ab;
    stim[14] = 13'h11b6;
    stim[15] = 13'h140b;
    stim[16] = 13'h09f3;
    stim[17] = 13'h17de;
    stim[18] = 13'h0e9f;
    stim[19] = 13'h12ec;
    stim[20] = 13'h1810;
    stim[21] = 13'h0359;
    stim[22] = 13'h1958;
    stim[23] = 13'h131e;
    stim[24] = 13'h07f5;
    stim[25] = 13'h0649;
    stim[26] = 13'h0e1a;
    stim[27] = 13'h0893;
    stim[28] = 13'h0f7f;
    stim[29] = 13'h1c58;
    stim[30] = 13'h1de3;
    stim[31] = 13'h11cf;
    stim[32] = 13'h054d;
    stim[33] = 13'h18ee;
    stim[34] = 13'h1be0;
    stim[35] = 13'h1c49;
    stim[36] = 13'h1df7;
    stim[37] = 13'h08e5;
    stim[38] = 13'h0584;
    stim[39] = 13'h0340;
    stim[40] = 13'h1faf;
    stim[41] = 13'h19aa;
    stim[42] = 13'h10ed;
    stim[43] = 13'h1db9;
    stim[44] = 13'h00bf;
    stim[45] = 13'h1ee3;
    stim[46] = 13'h14f2;
    stim[47] = 13'h05f0;
    stim[48] = 13'h0f74;
    stim[49] = 13'h19c8;
    stim[50] = 13'h1594;
    stim[51] = 13'h186e;
    stim[52] = 13'h1a10;
    stim[53] = 13'h1de1;
    stim[54] = 13'h051c;
    stim[55] = 13'h08c6;
    stim[56] = 13'h0573;
    stim[57] = 13'h0682;
    stim[58] = 13'h0d9e;
    stim[59] = 13'h0176;
    stim[60] = 13'h15d5;
    stim[61] = 13'h196f;
    stim[62] = 13'h08a1;
    stim[63] = 13'h07fe;
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
      expv[0] = 6'h20;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h1f;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h2c;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h1a;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
