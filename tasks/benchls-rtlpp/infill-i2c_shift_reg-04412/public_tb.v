// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04412 dut (
    .clk(clk),
    .data(in_vec[17:6]),
    .load_data(in_vec[5:5]),
    .RSTn(in_vec[4:4]),
    .load_start(in_vec[3:3]),
    .load_stop(in_vec[2:2]),
    .load_ack(in_vec[1:1]),
    .load_nack(in_vec[0:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2afc4;
    stim[1] = 18'h374ab;
    stim[2] = 18'h061b4;
    stim[3] = 18'h1c91a;
    stim[4] = 18'h06e7b;
    stim[5] = 18'h23a13;
    stim[6] = 18'h12a5f;
    stim[7] = 18'h13796;
    stim[8] = 18'h1bc13;
    stim[9] = 18'h2963e;
    stim[10] = 18'h1f093;
    stim[11] = 18'h22d34;
    stim[12] = 18'h2ef91;
    stim[13] = 18'h267ff;
    stim[14] = 18'h36054;
    stim[15] = 18'h12b5e;
    stim[16] = 18'h2fd98;
    stim[17] = 18'h39bd9;
    stim[18] = 18'h39370;
    stim[19] = 18'h3d9d2;
    stim[20] = 18'h2a896;
    stim[21] = 18'h1cabc;
    stim[22] = 18'h00f37;
    stim[23] = 18'h1a7b1;
    stim[24] = 18'h03ed0;
    stim[25] = 18'h1c8ba;
    stim[26] = 18'h20094;
    stim[27] = 18'h37897;
    stim[28] = 18'h1e75d;
    stim[29] = 18'h1a49e;
    stim[30] = 18'h17577;
    stim[31] = 18'h1cf7a;
    stim[32] = 18'h265b4;
    stim[33] = 18'h3beb3;
    stim[34] = 18'h13295;
    stim[35] = 18'h292f0;
    stim[36] = 18'h14730;
    stim[37] = 18'h05458;
    stim[38] = 18'h192f2;
    stim[39] = 18'h377f3;
    stim[40] = 18'h21e35;
    stim[41] = 18'h3721b;
    stim[42] = 18'h2ca5a;
    stim[43] = 18'h2c218;
    stim[44] = 18'h2d070;
    stim[45] = 18'h35dba;
    stim[46] = 18'h3b1fe;
    stim[47] = 18'h01035;
    stim[48] = 18'h3dc72;
    stim[49] = 18'h3ee51;
    stim[50] = 18'h14037;
    stim[51] = 18'h098d6;
    stim[52] = 18'h154d3;
    stim[53] = 18'h324d1;
    stim[54] = 18'h2a612;
    stim[55] = 18'h0dc76;
    stim[56] = 18'h2645f;
    stim[57] = 18'h377fa;
    stim[58] = 18'h3715f;
    stim[59] = 18'h2621f;
    stim[60] = 18'h22531;
    stim[61] = 18'h0f1f0;
    stim[62] = 18'h053ba;
    stim[63] = 18'h1f21f;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
