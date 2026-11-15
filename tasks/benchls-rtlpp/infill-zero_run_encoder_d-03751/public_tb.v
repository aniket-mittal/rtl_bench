// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03751 dut (
    .clock(clk),
    .reset(in_vec[6:6]),
    .i_d(in_vec[5:3]),
    .sel_o_d(in_vec[2:2]),
    .sel_cnt(in_vec[1:0]),
    .o_d(out_vec[6:3]),
    .f_start_i_eq_0(out_vec[2:2]),
    .f_zeros_i_eq_0(out_vec[1:1]),
    .f_zeros_t_cnt_eq_15(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h75;
    stim[1] = 7'h52;
    stim[2] = 7'h2e;
    stim[3] = 7'h24;
    stim[4] = 7'h20;
    stim[5] = 7'h34;
    stim[6] = 7'h1f;
    stim[7] = 7'h00;
    stim[8] = 7'h22;
    stim[9] = 7'h14;
    stim[10] = 7'h27;
    stim[11] = 7'h39;
    stim[12] = 7'h1e;
    stim[13] = 7'h11;
    stim[14] = 7'h3a;
    stim[15] = 7'h0e;
    stim[16] = 7'h1b;
    stim[17] = 7'h0b;
    stim[18] = 7'h1c;
    stim[19] = 7'h2e;
    stim[20] = 7'h10;
    stim[21] = 7'h3e;
    stim[22] = 7'h2c;
    stim[23] = 7'h15;
    stim[24] = 7'h2b;
    stim[25] = 7'h0b;
    stim[26] = 7'h07;
    stim[27] = 7'h09;
    stim[28] = 7'h12;
    stim[29] = 7'h2a;
    stim[30] = 7'h21;
    stim[31] = 7'h3c;
    stim[32] = 7'h28;
    stim[33] = 7'h0f;
    stim[34] = 7'h09;
    stim[35] = 7'h38;
    stim[36] = 7'h0c;
    stim[37] = 7'h27;
    stim[38] = 7'h30;
    stim[39] = 7'h21;
    stim[40] = 7'h27;
    stim[41] = 7'h33;
    stim[42] = 7'h20;
    stim[43] = 7'h3c;
    stim[44] = 7'h15;
    stim[45] = 7'h24;
    stim[46] = 7'h10;
    stim[47] = 7'h29;
    stim[48] = 7'h32;
    stim[49] = 7'h38;
    stim[50] = 7'h16;
    stim[51] = 7'h09;
    stim[52] = 7'h1c;
    stim[53] = 7'h0c;
    stim[54] = 7'h08;
    stim[55] = 7'h35;
    stim[56] = 7'h1b;
    stim[57] = 7'h0a;
    stim[58] = 7'h06;
    stim[59] = 7'h20;
    stim[60] = 7'h1d;
    stim[61] = 7'h21;
    stim[62] = 7'h28;
    stim[63] = 7'h16;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h00;
      expv[3] = 7'h00;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h00;
      expv[7] = 7'h06;
      expv[8] = 7'h00;
      expv[9] = 7'h00;
      expv[10] = 7'h00;
      expv[11] = 7'h08;
      expv[12] = 7'h00;
      expv[13] = 7'h00;
      expv[14] = 7'h08;
      expv[15] = 7'h00;
      expv[16] = 7'h08;
      expv[17] = 7'h08;
      expv[18] = 7'h00;
      expv[19] = 7'h00;
      expv[20] = 7'h00;
      expv[21] = 7'h00;
      expv[22] = 7'h00;
      expv[23] = 7'h00;
      expv[24] = 7'h08;
      expv[25] = 7'h08;
      expv[26] = 7'h06;
      expv[27] = 7'h08;
      expv[28] = 7'h00;
      expv[29] = 7'h08;
      expv[30] = 7'h00;
      expv[31] = 7'h00;
      expv[32] = 7'h08;
      expv[33] = 7'h00;
      expv[34] = 7'h08;
      expv[35] = 7'h08;
      expv[36] = 7'h00;
      expv[37] = 7'h00;
      expv[38] = 7'h00;
      expv[39] = 7'h00;
      expv[40] = 7'h00;
      expv[41] = 7'h00;
      expv[42] = 7'h00;
      expv[43] = 7'h00;
      expv[44] = 7'h00;
      expv[45] = 7'h00;
      expv[46] = 7'h00;
      expv[47] = 7'h08;
      expv[48] = 7'h00;
      expv[49] = 7'h08;
      expv[50] = 7'h00;
      expv[51] = 7'h08;
      expv[52] = 7'h00;
      expv[53] = 7'h00;
      expv[54] = 7'h08;
      expv[55] = 7'h00;
      expv[56] = 7'h08;
      expv[57] = 7'h08;
      expv[58] = 7'h06;
      expv[59] = 7'h00;
      expv[60] = 7'h00;
      expv[61] = 7'h00;
      expv[62] = 7'h08;
      expv[63] = 7'h00;
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
