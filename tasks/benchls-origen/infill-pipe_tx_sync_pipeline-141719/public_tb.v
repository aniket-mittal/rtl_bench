// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141719 dut (
    .pipe_clk(clk),
    .pipe_tx_rcvr_det_i(in_vec[6:6]),
    .pipe_tx_reset_i(in_vec[5:5]),
    .pipe_tx_rate_i(in_vec[4:4]),
    .pipe_tx_deemph_i(in_vec[3:3]),
    .pipe_tx_margin_i(in_vec[2:2]),
    .pipe_tx_swing_i(in_vec[1:1]),
    .rst_n(in_vec[0:0]),
    .pipe_tx_rcvr_det_o(out_vec[5:5]),
    .pipe_tx_reset_o(out_vec[4:4]),
    .pipe_tx_rate_o(out_vec[3:3]),
    .pipe_tx_deemph_o(out_vec[2:2]),
    .pipe_tx_margin_o(out_vec[1:1]),
    .pipe_tx_swing_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h34;
    stim[1] = 7'h5a;
    stim[2] = 7'h2b;
    stim[3] = 7'h23;
    stim[4] = 7'h11;
    stim[5] = 7'h29;
    stim[6] = 7'h43;
    stim[7] = 7'h1b;
    stim[8] = 7'h49;
    stim[9] = 7'h57;
    stim[10] = 7'h2d;
    stim[11] = 7'h1b;
    stim[12] = 7'h31;
    stim[13] = 7'h5d;
    stim[14] = 7'h0d;
    stim[15] = 7'h7d;
    stim[16] = 7'h0b;
    stim[17] = 7'h69;
    stim[18] = 7'h69;
    stim[19] = 7'h1f;
    stim[20] = 7'h19;
    stim[21] = 7'h27;
    stim[22] = 7'h2d;
    stim[23] = 7'h4d;
    stim[24] = 7'h2d;
    stim[25] = 7'h67;
    stim[26] = 7'h7b;
    stim[27] = 7'h2d;
    stim[28] = 7'h13;
    stim[29] = 7'h03;
    stim[30] = 7'h19;
    stim[31] = 7'h6d;
    stim[32] = 7'h55;
    stim[33] = 7'h31;
    stim[34] = 7'h7f;
    stim[35] = 7'h4f;
    stim[36] = 7'h6b;
    stim[37] = 7'h07;
    stim[38] = 7'h55;
    stim[39] = 7'h25;
    stim[40] = 7'h61;
    stim[41] = 7'h71;
    stim[42] = 7'h4d;
    stim[43] = 7'h21;
    stim[44] = 7'h31;
    stim[45] = 7'h6f;
    stim[46] = 7'h41;
    stim[47] = 7'h29;
    stim[48] = 7'h55;
    stim[49] = 7'h7f;
    stim[50] = 7'h1d;
    stim[51] = 7'h4b;
    stim[52] = 7'h2d;
    stim[53] = 7'h17;
    stim[54] = 7'h03;
    stim[55] = 7'h39;
    stim[56] = 7'h4b;
    stim[57] = 7'h0f;
    stim[58] = 7'h23;
    stim[59] = 7'h23;
    stim[60] = 7'h1b;
    stim[61] = 7'h63;
    stim[62] = 7'h1f;
    stim[63] = 7'h69;
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
      expv[3] = 6'h15;
      expv[4] = 6'h11;
      expv[5] = 6'h08;
      expv[6] = 6'h14;
      expv[7] = 6'h21;
      expv[8] = 6'h0d;
      expv[9] = 6'h24;
      expv[10] = 6'h2b;
      expv[11] = 6'h16;
      expv[12] = 6'h0d;
      expv[13] = 6'h18;
      expv[14] = 6'h2e;
      expv[15] = 6'h06;
      expv[16] = 6'h3e;
      expv[17] = 6'h05;
      expv[18] = 6'h34;
      expv[19] = 6'h34;
      expv[20] = 6'h0f;
      expv[21] = 6'h0c;
      expv[22] = 6'h13;
      expv[23] = 6'h16;
      expv[24] = 6'h26;
      expv[25] = 6'h16;
      expv[26] = 6'h33;
      expv[27] = 6'h3d;
      expv[28] = 6'h16;
      expv[29] = 6'h09;
      expv[30] = 6'h01;
      expv[31] = 6'h0c;
      expv[32] = 6'h36;
      expv[33] = 6'h2a;
      expv[34] = 6'h18;
      expv[35] = 6'h3f;
      expv[36] = 6'h27;
      expv[37] = 6'h35;
      expv[38] = 6'h03;
      expv[39] = 6'h2a;
      expv[40] = 6'h12;
      expv[41] = 6'h30;
      expv[42] = 6'h38;
      expv[43] = 6'h26;
      expv[44] = 6'h10;
      expv[45] = 6'h18;
      expv[46] = 6'h37;
      expv[47] = 6'h20;
      expv[48] = 6'h14;
      expv[49] = 6'h2a;
      expv[50] = 6'h3f;
      expv[51] = 6'h0e;
      expv[52] = 6'h25;
      expv[53] = 6'h16;
      expv[54] = 6'h0b;
      expv[55] = 6'h01;
      expv[56] = 6'h1c;
      expv[57] = 6'h25;
      expv[58] = 6'h07;
      expv[59] = 6'h11;
      expv[60] = 6'h11;
      expv[61] = 6'h0d;
      expv[62] = 6'h31;
      expv[63] = 6'h0f;
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
