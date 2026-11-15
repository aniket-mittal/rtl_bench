// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174007 dut (
    .clock(clk),
    .reset_game_control(in_vec[6:6]),
    .play_game(in_vec[5:5]),
    .all_bricks_down(in_vec[4:4]),
    .ball_down(in_vec[3:3]),
    .play_again(in_vec[2:2]),
    .startup_done(in_vec[1:1]),
    .over_done(in_vec[0:0]),
    .reset_startup_counter(out_vec[11:11]),
    .enable_startup_counter(out_vec[10:10]),
    .reset_over_counter(out_vec[9:9]),
    .enable_over_counter(out_vec[8:8]),
    .startup_plot(out_vec[7:7]),
    .over_plot(out_vec[6:6]),
    .reset_brick_count(out_vec[5:5]),
    .enable_brick_count(out_vec[4:4]),
    .run_game(out_vec[3:3]),
    .reset_control(out_vec[2:2]),
    .sel_screen(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h6c;
    stim[1] = 7'h75;
    stim[2] = 7'h2c;
    stim[3] = 7'h0f;
    stim[4] = 7'h19;
    stim[5] = 7'h0b;
    stim[6] = 7'h08;
    stim[7] = 7'h0b;
    stim[8] = 7'h0d;
    stim[9] = 7'h37;
    stim[10] = 7'h08;
    stim[11] = 7'h10;
    stim[12] = 7'h33;
    stim[13] = 7'h21;
    stim[14] = 7'h01;
    stim[15] = 7'h3a;
    stim[16] = 7'h10;
    stim[17] = 7'h00;
    stim[18] = 7'h1f;
    stim[19] = 7'h00;
    stim[20] = 7'h17;
    stim[21] = 7'h3c;
    stim[22] = 7'h09;
    stim[23] = 7'h0f;
    stim[24] = 7'h28;
    stim[25] = 7'h2a;
    stim[26] = 7'h3d;
    stim[27] = 7'h10;
    stim[28] = 7'h37;
    stim[29] = 7'h04;
    stim[30] = 7'h02;
    stim[31] = 7'h13;
    stim[32] = 7'h19;
    stim[33] = 7'h18;
    stim[34] = 7'h3d;
    stim[35] = 7'h37;
    stim[36] = 7'h39;
    stim[37] = 7'h06;
    stim[38] = 7'h0f;
    stim[39] = 7'h2b;
    stim[40] = 7'h03;
    stim[41] = 7'h28;
    stim[42] = 7'h0c;
    stim[43] = 7'h30;
    stim[44] = 7'h22;
    stim[45] = 7'h20;
    stim[46] = 7'h22;
    stim[47] = 7'h0d;
    stim[48] = 7'h3f;
    stim[49] = 7'h2d;
    stim[50] = 7'h16;
    stim[51] = 7'h01;
    stim[52] = 7'h31;
    stim[53] = 7'h03;
    stim[54] = 7'h34;
    stim[55] = 7'h30;
    stim[56] = 7'h37;
    stim[57] = 7'h39;
    stim[58] = 7'h07;
    stim[59] = 7'h10;
    stim[60] = 7'h0d;
    stim[61] = 7'h27;
    stim[62] = 7'h0c;
    stim[63] = 7'h14;
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
      expv[0] = 12'haa4;
      expv[1] = 12'h6a1;
      expv[2] = 12'haa4;
      expv[3] = 12'haa4;
      expv[4] = 12'haa4;
      expv[5] = 12'haa4;
      expv[6] = 12'haa4;
      expv[7] = 12'haa4;
      expv[8] = 12'haa4;
      expv[9] = 12'haa4;
      expv[10] = 12'haa4;
      expv[11] = 12'haa4;
      expv[12] = 12'haa4;
      expv[13] = 12'haa4;
      expv[14] = 12'haa4;
      expv[15] = 12'haa4;
      expv[16] = 12'haa4;
      expv[17] = 12'haa4;
      expv[18] = 12'haa4;
      expv[19] = 12'haa4;
      expv[20] = 12'haa4;
      expv[21] = 12'haa4;
      expv[22] = 12'haa4;
      expv[23] = 12'haa4;
      expv[24] = 12'haa4;
      expv[25] = 12'haa4;
      expv[26] = 12'haa4;
      expv[27] = 12'haa4;
      expv[28] = 12'haa4;
      expv[29] = 12'haa4;
      expv[30] = 12'haa4;
      expv[31] = 12'haa4;
      expv[32] = 12'haa4;
      expv[33] = 12'haa4;
      expv[34] = 12'haa4;
      expv[35] = 12'haa4;
      expv[36] = 12'haa4;
      expv[37] = 12'haa4;
      expv[38] = 12'haa4;
      expv[39] = 12'haa4;
      expv[40] = 12'haa4;
      expv[41] = 12'haa4;
      expv[42] = 12'haa4;
      expv[43] = 12'haa4;
      expv[44] = 12'haa4;
      expv[45] = 12'haa4;
      expv[46] = 12'haa4;
      expv[47] = 12'haa4;
      expv[48] = 12'haa4;
      expv[49] = 12'haa4;
      expv[50] = 12'haa4;
      expv[51] = 12'haa4;
      expv[52] = 12'haa4;
      expv[53] = 12'haa4;
      expv[54] = 12'haa4;
      expv[55] = 12'haa4;
      expv[56] = 12'haa4;
      expv[57] = 12'haa4;
      expv[58] = 12'haa4;
      expv[59] = 12'haa4;
      expv[60] = 12'haa4;
      expv[61] = 12'haa4;
      expv[62] = 12'haa4;
      expv[63] = 12'haa4;
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
