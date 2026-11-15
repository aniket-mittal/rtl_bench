// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144245 dut (
    .clk(clk),
    .reset(in_vec[12:12]),
    .load(in_vec[11:11]),
    .up_down(in_vec[10:10]),
    .count_enable(in_vec[9:9]),
    .data_in(in_vec[8:5]),
    .add_sub_in(in_vec[4:1]),
    .add_sub_sel(in_vec[0:0]),
    .final_out(out_vec[4:1]),
    .max_count(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1abd;
    stim[1] = 13'h1c4c;
    stim[2] = 13'h069a;
    stim[3] = 13'h0728;
    stim[4] = 13'h0c43;
    stim[5] = 13'h06fc;
    stim[6] = 13'h007f;
    stim[7] = 13'h09bd;
    stim[8] = 13'h0a88;
    stim[9] = 13'h0760;
    stim[10] = 13'h0607;
    stim[11] = 13'h17c3;
    stim[12] = 13'h0058;
    stim[13] = 13'h17ac;
    stim[14] = 13'h01b8;
    stim[15] = 13'h02f6;
    stim[16] = 13'h095b;
    stim[17] = 13'h08bb;
    stim[18] = 13'h0920;
    stim[19] = 13'h0789;
    stim[20] = 13'h0650;
    stim[21] = 13'h03fc;
    stim[22] = 13'h01e4;
    stim[23] = 13'h0a82;
    stim[24] = 13'h05f6;
    stim[25] = 13'h030a;
    stim[26] = 13'h0d95;
    stim[27] = 13'h08e2;
    stim[28] = 13'h0617;
    stim[29] = 13'h022a;
    stim[30] = 13'h022c;
    stim[31] = 13'h0601;
    stim[32] = 13'h0a6b;
    stim[33] = 13'h0351;
    stim[34] = 13'h07ce;
    stim[35] = 13'h08e7;
    stim[36] = 13'h0069;
    stim[37] = 13'h06f1;
    stim[38] = 13'h0a00;
    stim[39] = 13'h01a4;
    stim[40] = 13'h098c;
    stim[41] = 13'h004d;
    stim[42] = 13'h0ddd;
    stim[43] = 13'h0986;
    stim[44] = 13'h0b86;
    stim[45] = 13'h07d1;
    stim[46] = 13'h0b18;
    stim[47] = 13'h0b2a;
    stim[48] = 13'h09a3;
    stim[49] = 13'h0534;
    stim[50] = 13'h068f;
    stim[51] = 13'h0b63;
    stim[52] = 13'h01af;
    stim[53] = 13'h0044;
    stim[54] = 13'h0705;
    stim[55] = 13'h07f6;
    stim[56] = 13'h0fb9;
    stim[57] = 13'h09d4;
    stim[58] = 13'h0d82;
    stim[59] = 13'h0957;
    stim[60] = 13'h0148;
    stim[61] = 13'h0bb8;
    stim[62] = 13'h07fc;
    stim[63] = 13'h00e1;
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
      expv[0] = 5'h01;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h1a;
      expv[4] = 5'h00;
      expv[5] = 5'h04;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h1a;
      expv[9] = 5'h08;
      expv[10] = 5'h08;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h01;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h12;
      expv[20] = 5'h0a;
      expv[21] = 5'h1a;
      expv[22] = 5'h00;
      expv[23] = 5'h16;
      expv[24] = 5'h00;
      expv[25] = 5'h08;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h0e;
      expv[29] = 5'h18;
      expv[30] = 5'h02;
      expv[31] = 5'h0e;
      expv[32] = 5'h0e;
      expv[33] = 5'h06;
      expv[34] = 5'h16;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h0e;
      expv[38] = 5'h1e;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h18;
      expv[45] = 5'h18;
      expv[46] = 5'h08;
      expv[47] = 5'h10;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h1a;
      expv[51] = 5'h0c;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h16;
      expv[55] = 5'h12;
      expv[56] = 5'h08;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h14;
      expv[62] = 5'h1a;
      expv[63] = 5'h00;
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
