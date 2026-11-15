// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_193794 dut (
    .clk(clk),
    .reset(in_vec[13:13]),
    .cancle_flag(in_vec[12:12]),
    .coin_val(in_vec[11:2]),
    .get_ind(in_vec[1:1]),
    .buy_flag(in_vec[0:0]),
    .op_start(out_vec[5:5]),
    .light(out_vec[4:4]),
    .light_one(out_vec[3:3]),
    .light_two(out_vec[2:2]),
    .hold_ind(out_vec[1:1]),
    .not_enough(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3a8b;
    stim[1] = 14'h3f09;
    stim[2] = 14'h1d05;
    stim[3] = 14'h1f95;
    stim[4] = 14'h0b79;
    stim[5] = 14'h1f94;
    stim[6] = 14'h1e7e;
    stim[7] = 14'h0421;
    stim[8] = 14'h0505;
    stim[9] = 14'h12a6;
    stim[10] = 14'h3e22;
    stim[11] = 14'h06c3;
    stim[12] = 14'h18b4;
    stim[13] = 14'h1a02;
    stim[14] = 14'h09e9;
    stim[15] = 14'h01fd;
    stim[16] = 14'h0c8d;
    stim[17] = 14'h06cc;
    stim[18] = 14'h16ef;
    stim[19] = 14'h00fc;
    stim[20] = 14'h0fe6;
    stim[21] = 14'h05e0;
    stim[22] = 14'h12b6;
    stim[23] = 14'h0da4;
    stim[24] = 14'h1d3c;
    stim[25] = 14'h0ee5;
    stim[26] = 14'h1c96;
    stim[27] = 14'h1707;
    stim[28] = 14'h06e3;
    stim[29] = 14'h0c27;
    stim[30] = 14'h11ff;
    stim[31] = 14'h1785;
    stim[32] = 14'h0a4c;
    stim[33] = 14'h0354;
    stim[34] = 14'h18e9;
    stim[35] = 14'h1d9b;
    stim[36] = 14'h16c6;
    stim[37] = 14'h00f7;
    stim[38] = 14'h188f;
    stim[39] = 14'h112c;
    stim[40] = 14'h15c5;
    stim[41] = 14'h141e;
    stim[42] = 14'h12fc;
    stim[43] = 14'h042b;
    stim[44] = 14'h1646;
    stim[45] = 14'h1418;
    stim[46] = 14'h1e08;
    stim[47] = 14'h0b9e;
    stim[48] = 14'h102a;
    stim[49] = 14'h135b;
    stim[50] = 14'h1493;
    stim[51] = 14'h09e2;
    stim[52] = 14'h0fc5;
    stim[53] = 14'h1055;
    stim[54] = 14'h0041;
    stim[55] = 14'h1e1c;
    stim[56] = 14'h0e69;
    stim[57] = 14'h045b;
    stim[58] = 14'h0db3;
    stim[59] = 14'h0354;
    stim[60] = 14'h1fcd;
    stim[61] = 14'h0d5a;
    stim[62] = 14'h0947;
    stim[63] = 14'h1d3b;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h3e;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h3e;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h3e;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h3e;
      expv[17] = 6'h3e;
      expv[18] = 6'h3e;
      expv[19] = 6'h3e;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h3e;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h3e;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h3a;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h3e;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h3e;
      expv[55] = 6'h00;
      expv[56] = 6'h3a;
      expv[57] = 6'h00;
      expv[58] = 6'h3e;
      expv[59] = 6'h00;
      expv[60] = 6'h3e;
      expv[61] = 6'h3e;
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
