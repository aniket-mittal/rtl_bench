// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089973 dut (
    .clock(clk),
    .gl_reset(in_vec[9:9]),
    .city_done(in_vec[8:8]),
    .parkpick_confirm(in_vec[7:7]),
    .parkpick(in_vec[6:6]),
    .spot_entered(in_vec[5:5]),
    .leave(in_vec[4:4]),
    .size_entered(in_vec[3:3]),
    .fit(in_vec[2:2]),
    .car_in_done(in_vec[1:1]),
    .resetn(in_vec[0:0]),
    .read_vehicle_size(out_vec[10:10]),
    .read_park_pick(out_vec[9:9]),
    .read_spot(out_vec[8:8]),
    .read_city(out_vec[7:7]),
    .current_state_out(out_vec[6:3]),
    .go(out_vec[2:2]),
    .reverse(out_vec[1:1]),
    .change_background(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1e6;
    stim[1] = 10'h134;
    stim[2] = 10'h26b;
    stim[3] = 10'h1ff;
    stim[4] = 10'h053;
    stim[5] = 10'h231;
    stim[6] = 10'h1e1;
    stim[7] = 10'h0d1;
    stim[8] = 10'h3dd;
    stim[9] = 10'h1a5;
    stim[10] = 10'h0e3;
    stim[11] = 10'h2ef;
    stim[12] = 10'h039;
    stim[13] = 10'h395;
    stim[14] = 10'h0b5;
    stim[15] = 10'h231;
    stim[16] = 10'h35d;
    stim[17] = 10'h1eb;
    stim[18] = 10'h2fd;
    stim[19] = 10'h337;
    stim[20] = 10'h3f5;
    stim[21] = 10'h343;
    stim[22] = 10'h2a1;
    stim[23] = 10'h093;
    stim[24] = 10'h1ab;
    stim[25] = 10'h0f7;
    stim[26] = 10'h27b;
    stim[27] = 10'h3d1;
    stim[28] = 10'h273;
    stim[29] = 10'h20d;
    stim[30] = 10'h037;
    stim[31] = 10'h1e1;
    stim[32] = 10'h2f7;
    stim[33] = 10'h2c5;
    stim[34] = 10'h293;
    stim[35] = 10'h269;
    stim[36] = 10'h22b;
    stim[37] = 10'h10d;
    stim[38] = 10'h343;
    stim[39] = 10'h3cb;
    stim[40] = 10'h185;
    stim[41] = 10'h129;
    stim[42] = 10'h3bb;
    stim[43] = 10'h107;
    stim[44] = 10'h37f;
    stim[45] = 10'h17d;
    stim[46] = 10'h3bb;
    stim[47] = 10'h003;
    stim[48] = 10'h389;
    stim[49] = 10'h309;
    stim[50] = 10'h173;
    stim[51] = 10'h29b;
    stim[52] = 10'h25f;
    stim[53] = 10'h0f3;
    stim[54] = 10'h025;
    stim[55] = 10'h355;
    stim[56] = 10'h3fb;
    stim[57] = 10'h243;
    stim[58] = 10'h1bb;
    stim[59] = 10'h06d;
    stim[60] = 10'h1f5;
    stim[61] = 10'h29f;
    stim[62] = 10'h1b3;
    stim[63] = 10'h333;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'h049;
      expv[2] = 11'h000;
      expv[3] = 11'h0c0;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h0c0;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h0c0;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h0c0;
      expv[13] = 11'h000;
      expv[14] = 11'h0c0;
      expv[15] = 11'h000;
      expv[16] = 11'h0c0;
      expv[17] = 11'h0c0;
      expv[18] = 11'h000;
      expv[19] = 11'h0c0;
      expv[20] = 11'h0c0;
      expv[21] = 11'h0c0;
      expv[22] = 11'h0c0;
      expv[23] = 11'h0c0;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h0c0;
      expv[28] = 11'h0c0;
      expv[29] = 11'h0c0;
      expv[30] = 11'h0c0;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h0c0;
      expv[34] = 11'h0c0;
      expv[35] = 11'h0c0;
      expv[36] = 11'h0c0;
      expv[37] = 11'h0c0;
      expv[38] = 11'h000;
      expv[39] = 11'h0c0;
      expv[40] = 11'h0c0;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h0c0;
      expv[44] = 11'h000;
      expv[45] = 11'h0c0;
      expv[46] = 11'h000;
      expv[47] = 11'h0c0;
      expv[48] = 11'h000;
      expv[49] = 11'h0c0;
      expv[50] = 11'h0c0;
      expv[51] = 11'h000;
      expv[52] = 11'h0c0;
      expv[53] = 11'h0c0;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h0c0;
      expv[57] = 11'h0c0;
      expv[58] = 11'h0c0;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h0c0;
      expv[63] = 11'h000;
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
