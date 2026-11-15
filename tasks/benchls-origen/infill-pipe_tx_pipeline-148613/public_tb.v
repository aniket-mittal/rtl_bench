// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148613 dut (
    .pipe_clk(clk),
    .pipe_tx_rcvr_det_i(in_vec[8:8]),
    .pipe_tx_reset_i(in_vec[7:7]),
    .pipe_tx_rate_i(in_vec[6:6]),
    .pipe_tx_deemph_i(in_vec[5:5]),
    .pipe_tx_margin_i(in_vec[4:2]),
    .pipe_tx_swing_i(in_vec[1:1]),
    .rst_n(in_vec[0:0]),
    .pipe_tx_rcvr_det_o(out_vec[7:7]),
    .pipe_tx_reset_o(out_vec[6:6]),
    .pipe_tx_rate_o(out_vec[5:5]),
    .pipe_tx_deemph_o(out_vec[4:4]),
    .pipe_tx_margin_o(out_vec[3:1]),
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
    stim[0] = 9'h138;
    stim[1] = 9'h0e8;
    stim[2] = 9'h13b;
    stim[3] = 9'h005;
    stim[4] = 9'h129;
    stim[5] = 9'h11f;
    stim[6] = 9'h18b;
    stim[7] = 9'h175;
    stim[8] = 9'h07d;
    stim[9] = 9'h1e1;
    stim[10] = 9'h0f5;
    stim[11] = 9'h0b1;
    stim[12] = 9'h071;
    stim[13] = 9'h1f1;
    stim[14] = 9'h171;
    stim[15] = 9'h10b;
    stim[16] = 9'h029;
    stim[17] = 9'h0c7;
    stim[18] = 9'h06f;
    stim[19] = 9'h183;
    stim[20] = 9'h1db;
    stim[21] = 9'h07f;
    stim[22] = 9'h1d1;
    stim[23] = 9'h1e9;
    stim[24] = 9'h181;
    stim[25] = 9'h043;
    stim[26] = 9'h13d;
    stim[27] = 9'h01f;
    stim[28] = 9'h1e5;
    stim[29] = 9'h015;
    stim[30] = 9'h1af;
    stim[31] = 9'h157;
    stim[32] = 9'h00f;
    stim[33] = 9'h0b5;
    stim[34] = 9'h0c9;
    stim[35] = 9'h001;
    stim[36] = 9'h153;
    stim[37] = 9'h00b;
    stim[38] = 9'h077;
    stim[39] = 9'h03b;
    stim[40] = 9'h1b9;
    stim[41] = 9'h16f;
    stim[42] = 9'h1c1;
    stim[43] = 9'h1c7;
    stim[44] = 9'h0b1;
    stim[45] = 9'h091;
    stim[46] = 9'h105;
    stim[47] = 9'h1f1;
    stim[48] = 9'h15d;
    stim[49] = 9'h06b;
    stim[50] = 9'h19b;
    stim[51] = 9'h0e5;
    stim[52] = 9'h029;
    stim[53] = 9'h1f9;
    stim[54] = 9'h1c1;
    stim[55] = 9'h13b;
    stim[56] = 9'h179;
    stim[57] = 9'h1a9;
    stim[58] = 9'h147;
    stim[59] = 9'h0e5;
    stim[60] = 9'h091;
    stim[61] = 9'h153;
    stim[62] = 9'h0c3;
    stim[63] = 9'h1a7;
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
      expv[0] = 8'h9c;
      expv[1] = 8'h74;
      expv[2] = 8'h9d;
      expv[3] = 8'h02;
      expv[4] = 8'h94;
      expv[5] = 8'h8f;
      expv[6] = 8'hc5;
      expv[7] = 8'hba;
      expv[8] = 8'h3e;
      expv[9] = 8'hf0;
      expv[10] = 8'h7a;
      expv[11] = 8'h58;
      expv[12] = 8'h38;
      expv[13] = 8'hf8;
      expv[14] = 8'hb8;
      expv[15] = 8'h85;
      expv[16] = 8'h14;
      expv[17] = 8'h63;
      expv[18] = 8'h37;
      expv[19] = 8'hc1;
      expv[20] = 8'hed;
      expv[21] = 8'h3f;
      expv[22] = 8'he8;
      expv[23] = 8'hf4;
      expv[24] = 8'hc0;
      expv[25] = 8'h21;
      expv[26] = 8'h9e;
      expv[27] = 8'h0f;
      expv[28] = 8'hf2;
      expv[29] = 8'h0a;
      expv[30] = 8'hd7;
      expv[31] = 8'hab;
      expv[32] = 8'h07;
      expv[33] = 8'h5a;
      expv[34] = 8'h64;
      expv[35] = 8'h00;
      expv[36] = 8'ha9;
      expv[37] = 8'h05;
      expv[38] = 8'h3b;
      expv[39] = 8'h1d;
      expv[40] = 8'hdc;
      expv[41] = 8'hb7;
      expv[42] = 8'he0;
      expv[43] = 8'he3;
      expv[44] = 8'h58;
      expv[45] = 8'h48;
      expv[46] = 8'h82;
      expv[47] = 8'hf8;
      expv[48] = 8'hae;
      expv[49] = 8'h35;
      expv[50] = 8'hcd;
      expv[51] = 8'h72;
      expv[52] = 8'h14;
      expv[53] = 8'hfc;
      expv[54] = 8'he0;
      expv[55] = 8'h9d;
      expv[56] = 8'hbc;
      expv[57] = 8'hd4;
      expv[58] = 8'ha3;
      expv[59] = 8'h72;
      expv[60] = 8'h48;
      expv[61] = 8'ha9;
      expv[62] = 8'h61;
      expv[63] = 8'hd3;
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
