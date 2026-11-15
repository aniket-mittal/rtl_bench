// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  timer_cntrl dut (
    .clk_i(clk),
    .rstn_i(in_vec[6:6]),
    .cfg_start_i(in_vec[5:5]),
    .cfg_stop_i(in_vec[4:4]),
    .cfg_rst_i(in_vec[3:3]),
    .cfg_update_i(in_vec[2:2]),
    .cfg_arm_i(in_vec[1:1]),
    .cnt_update_i(in_vec[0:0]),
    .ctrl_cnt_upd_o(out_vec[12:12]),
    .ctrl_all_upd_o(out_vec[11:11]),
    .ctrl_active_o(out_vec[10:10]),
    .ctrl_rst_o(out_vec[9:9]),
    .ctrl_arm_o(out_vec[8:8]),
    .status_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h7c;
    stim[1] = 7'h61;
    stim[2] = 7'h29;
    stim[3] = 7'h2b;
    stim[4] = 7'h18;
    stim[5] = 7'h09;
    stim[6] = 7'h3b;
    stim[7] = 7'h18;
    stim[8] = 7'h16;
    stim[9] = 7'h19;
    stim[10] = 7'h06;
    stim[11] = 7'h11;
    stim[12] = 7'h34;
    stim[13] = 7'h1b;
    stim[14] = 7'h3c;
    stim[15] = 7'h09;
    stim[16] = 7'h66;
    stim[17] = 7'h26;
    stim[18] = 7'h17;
    stim[19] = 7'h30;
    stim[20] = 7'h2a;
    stim[21] = 7'h10;
    stim[22] = 7'h26;
    stim[23] = 7'h1a;
    stim[24] = 7'h1e;
    stim[25] = 7'h2f;
    stim[26] = 7'h04;
    stim[27] = 7'h2b;
    stim[28] = 7'h16;
    stim[29] = 7'h04;
    stim[30] = 7'h19;
    stim[31] = 7'h0c;
    stim[32] = 7'h1e;
    stim[33] = 7'h15;
    stim[34] = 7'h18;
    stim[35] = 7'h25;
    stim[36] = 7'h39;
    stim[37] = 7'h3f;
    stim[38] = 7'h1f;
    stim[39] = 7'h6d;
    stim[40] = 7'h66;
    stim[41] = 7'h30;
    stim[42] = 7'h05;
    stim[43] = 7'h27;
    stim[44] = 7'h3d;
    stim[45] = 7'h21;
    stim[46] = 7'h24;
    stim[47] = 7'h2f;
    stim[48] = 7'h24;
    stim[49] = 7'h22;
    stim[50] = 7'h1e;
    stim[51] = 7'h3a;
    stim[52] = 7'h20;
    stim[53] = 7'h0f;
    stim[54] = 7'h23;
    stim[55] = 7'h1e;
    stim[56] = 7'h0d;
    stim[57] = 7'h22;
    stim[58] = 7'h3e;
    stim[59] = 7'h1b;
    stim[60] = 7'h30;
    stim[61] = 7'h27;
    stim[62] = 7'h3f;
    stim[63] = 7'h23;
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
      expv[0] = 13'h1a00;
      expv[1] = 13'h0c01;
      expv[2] = 13'h1a00;
      expv[3] = 13'h1b00;
      expv[4] = 13'h0200;
      expv[5] = 13'h0a00;
      expv[6] = 13'h1b00;
      expv[7] = 13'h0200;
      expv[8] = 13'h1100;
      expv[9] = 13'h0a00;
      expv[10] = 13'h1100;
      expv[11] = 13'h0800;
      expv[12] = 13'h1a00;
      expv[13] = 13'h0b00;
      expv[14] = 13'h1a00;
      expv[15] = 13'h0a00;
      expv[16] = 13'h1b00;
      expv[17] = 13'h1b00;
      expv[18] = 13'h1900;
      expv[19] = 13'h1a00;
      expv[20] = 13'h1b00;
      expv[21] = 13'h0000;
      expv[22] = 13'h1b00;
      expv[23] = 13'h0300;
      expv[24] = 13'h1300;
      expv[25] = 13'h1b00;
      expv[26] = 13'h1000;
      expv[27] = 13'h1b00;
      expv[28] = 13'h1100;
      expv[29] = 13'h1000;
      expv[30] = 13'h0a00;
      expv[31] = 13'h1200;
      expv[32] = 13'h1300;
      expv[33] = 13'h1800;
      expv[34] = 13'h0200;
      expv[35] = 13'h1a00;
      expv[36] = 13'h1a00;
      expv[37] = 13'h1b00;
      expv[38] = 13'h1b00;
      expv[39] = 13'h1a00;
      expv[40] = 13'h1501;
      expv[41] = 13'h1a00;
      expv[42] = 13'h1800;
      expv[43] = 13'h1b00;
      expv[44] = 13'h1a00;
      expv[45] = 13'h1a00;
      expv[46] = 13'h1a00;
      expv[47] = 13'h1b00;
      expv[48] = 13'h1a00;
      expv[49] = 13'h1b00;
      expv[50] = 13'h1300;
      expv[51] = 13'h1b00;
      expv[52] = 13'h1a00;
      expv[53] = 13'h1b00;
      expv[54] = 13'h1b00;
      expv[55] = 13'h1300;
      expv[56] = 13'h1a00;
      expv[57] = 13'h1b00;
      expv[58] = 13'h1b00;
      expv[59] = 13'h0b00;
      expv[60] = 13'h1a00;
      expv[61] = 13'h1b00;
      expv[62] = 13'h1b00;
      expv[63] = 13'h1b00;
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
