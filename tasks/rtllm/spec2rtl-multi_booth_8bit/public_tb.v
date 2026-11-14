// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  multi_booth_8bit dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .p(out_vec[16:1]),
    .rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h167e4;
    stim[1] = 17'h1ceab;
    stim[2] = 17'h02da4;
    stim[3] = 17'h02be0;
    stim[4] = 17'h055a7;
    stim[5] = 17'h0cb7c;
    stim[6] = 17'h0e760;
    stim[7] = 17'h0159f;
    stim[8] = 17'h079a8;
    stim[9] = 17'h089c1;
    stim[10] = 17'h03b8e;
    stim[11] = 17'h04899;
    stim[12] = 17'h03daa;
    stim[13] = 17'h08249;
    stim[14] = 17'h04ba7;
    stim[15] = 17'h099e3;
    stim[16] = 17'h09b68;
    stim[17] = 17'h0fc7b;
    stim[18] = 17'h0d5a8;
    stim[19] = 17'h03d92;
    stim[20] = 17'h0c83f;
    stim[21] = 17'h069f0;
    stim[22] = 17'h0ab50;
    stim[23] = 17'h08094;
    stim[24] = 17'h0f9d8;
    stim[25] = 17'h028f7;
    stim[26] = 17'h0b1d7;
    stim[27] = 17'h0c7a3;
    stim[28] = 17'h075ea;
    stim[29] = 17'h0130a;
    stim[30] = 17'h0fbd5;
    stim[31] = 17'h05ac0;
    stim[32] = 17'h00e0b;
    stim[33] = 17'h04931;
    stim[34] = 17'h0bf92;
    stim[35] = 17'h0bb85;
    stim[36] = 17'h00274;
    stim[37] = 17'h0251e;
    stim[38] = 17'h0db82;
    stim[39] = 17'h09932;
    stim[40] = 17'h0c79e;
    stim[41] = 17'h0e6f7;
    stim[42] = 17'h156c3;
    stim[43] = 17'h099ed;
    stim[44] = 17'h0a3fa;
    stim[45] = 17'h09487;
    stim[46] = 17'h08d3b;
    stim[47] = 17'h0e290;
    stim[48] = 17'h04301;
    stim[49] = 17'h06da4;
    stim[50] = 17'h0d871;
    stim[51] = 17'h05e28;
    stim[52] = 17'h01a9d;
    stim[53] = 17'h03572;
    stim[54] = 17'h020c4;
    stim[55] = 17'h0f601;
    stim[56] = 17'h04fe7;
    stim[57] = 17'h08bd6;
    stim[58] = 17'h09297;
    stim[59] = 17'h034e0;
    stim[60] = 17'h00f96;
    stim[61] = 17'h004d1;
    stim[62] = 17'h08990;
    stim[63] = 17'h0bc15;
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
      expv[4] = 17'h1feac;
      expv[5] = 17'h1fc04;
      expv[6] = 17'h1f6b4;
      expv[7] = 17'h1f6b4;
      expv[8] = 17'h1f6b4;
      expv[9] = 17'h1cc34;
      expv[10] = 17'h17734;
      expv[11] = 17'h0cd34;
      expv[12] = 17'h17934;
      expv[13] = 17'h0d134;
      expv[14] = 17'h18134;
      expv[15] = 17'h0e134;
      expv[16] = 17'h1a134;
      expv[17] = 17'h12134;
      expv[18] = 17'h02134;
      expv[19] = 17'h02135;
      expv[20] = 17'h02135;
      expv[21] = 17'h02135;
      expv[22] = 17'h02135;
      expv[23] = 17'h02135;
      expv[24] = 17'h02135;
      expv[25] = 17'h02135;
      expv[26] = 17'h02135;
      expv[27] = 17'h02135;
      expv[28] = 17'h02135;
      expv[29] = 17'h02135;
      expv[30] = 17'h02135;
      expv[31] = 17'h02135;
      expv[32] = 17'h02135;
      expv[33] = 17'h02135;
      expv[34] = 17'h02135;
      expv[35] = 17'h02135;
      expv[36] = 17'h02135;
      expv[37] = 17'h02135;
      expv[38] = 17'h02135;
      expv[39] = 17'h02135;
      expv[40] = 17'h02135;
      expv[41] = 17'h02135;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h1ff0c;
      expv[46] = 17'h1fd24;
      expv[47] = 17'h1fd24;
      expv[48] = 17'h1f584;
      expv[49] = 17'h1f584;
      expv[50] = 17'h1d704;
      expv[51] = 17'h1d704;
      expv[52] = 17'h1d704;
      expv[53] = 17'h1d704;
      expv[54] = 17'h1d704;
      expv[55] = 17'h1d704;
      expv[56] = 17'h1d704;
      expv[57] = 17'h1d704;
      expv[58] = 17'h1d704;
      expv[59] = 17'h1d704;
      expv[60] = 17'h1d705;
      expv[61] = 17'h1d705;
      expv[62] = 17'h1d705;
      expv[63] = 17'h1d705;
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
