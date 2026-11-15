// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09754 dut (
    .clock(clk),
    .reset(in_vec[5:5]),
    .i_v(in_vec[4:4]),
    .o_b(in_vec[3:3]),
    .f_start_i_eq_0(in_vec[2:2]),
    .f_zeros_i_eq_0(in_vec[1:1]),
    .f_zeros_t_cnt_eq_15(in_vec[0:0]),
    .i_b(out_vec[5:5]),
    .o_v(out_vec[4:4]),
    .stateo(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h26;
    stim[1] = 6'h27;
    stim[2] = 6'h04;
    stim[3] = 6'h11;
    stim[4] = 6'h15;
    stim[5] = 6'h0f;
    stim[6] = 6'h10;
    stim[7] = 6'h1a;
    stim[8] = 6'h12;
    stim[9] = 6'h1b;
    stim[10] = 6'h0f;
    stim[11] = 6'h0b;
    stim[12] = 6'h0b;
    stim[13] = 6'h1b;
    stim[14] = 6'h03;
    stim[15] = 6'h0d;
    stim[16] = 6'h13;
    stim[17] = 6'h15;
    stim[18] = 6'h0b;
    stim[19] = 6'h1b;
    stim[20] = 6'h17;
    stim[21] = 6'h18;
    stim[22] = 6'h18;
    stim[23] = 6'h0c;
    stim[24] = 6'h03;
    stim[25] = 6'h18;
    stim[26] = 6'h18;
    stim[27] = 6'h1f;
    stim[28] = 6'h1c;
    stim[29] = 6'h00;
    stim[30] = 6'h18;
    stim[31] = 6'h0e;
    stim[32] = 6'h1b;
    stim[33] = 6'h08;
    stim[34] = 6'h06;
    stim[35] = 6'h03;
    stim[36] = 6'h15;
    stim[37] = 6'h02;
    stim[38] = 6'h06;
    stim[39] = 6'h1f;
    stim[40] = 6'h01;
    stim[41] = 6'h19;
    stim[42] = 6'h08;
    stim[43] = 6'h00;
    stim[44] = 6'h0a;
    stim[45] = 6'h10;
    stim[46] = 6'h05;
    stim[47] = 6'h13;
    stim[48] = 6'h03;
    stim[49] = 6'h02;
    stim[50] = 6'h04;
    stim[51] = 6'h12;
    stim[52] = 6'h0a;
    stim[53] = 6'h04;
    stim[54] = 6'h1a;
    stim[55] = 6'h17;
    stim[56] = 6'h04;
    stim[57] = 6'h11;
    stim[58] = 6'h0f;
    stim[59] = 6'h0a;
    stim[60] = 6'h3f;
    stim[61] = 6'h02;
    stim[62] = 6'h14;
    stim[63] = 6'h0f;
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
      expv[0] = 6'h20;
      expv[1] = 6'h20;
      expv[2] = 6'h20;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h20;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h20;
      expv[11] = 6'h20;
      expv[12] = 6'h20;
      expv[13] = 6'h00;
      expv[14] = 6'h20;
      expv[15] = 6'h20;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h20;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h20;
      expv[24] = 6'h20;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h20;
      expv[30] = 6'h00;
      expv[31] = 6'h20;
      expv[32] = 6'h00;
      expv[33] = 6'h20;
      expv[34] = 6'h20;
      expv[35] = 6'h20;
      expv[36] = 6'h00;
      expv[37] = 6'h20;
      expv[38] = 6'h20;
      expv[39] = 6'h00;
      expv[40] = 6'h20;
      expv[41] = 6'h00;
      expv[42] = 6'h20;
      expv[43] = 6'h20;
      expv[44] = 6'h20;
      expv[45] = 6'h00;
      expv[46] = 6'h20;
      expv[47] = 6'h00;
      expv[48] = 6'h20;
      expv[49] = 6'h20;
      expv[50] = 6'h20;
      expv[51] = 6'h00;
      expv[52] = 6'h20;
      expv[53] = 6'h20;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h20;
      expv[57] = 6'h00;
      expv[58] = 6'h20;
      expv[59] = 6'h20;
      expv[60] = 6'h00;
      expv[61] = 6'h20;
      expv[62] = 6'h00;
      expv[63] = 6'h20;
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
