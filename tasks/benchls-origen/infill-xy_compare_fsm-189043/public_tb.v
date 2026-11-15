// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_189043 dut (
    .clk(clk),
    .rst(in_vec[5:5]),
    .op(in_vec[4:4]),
    .start(in_vec[3:3]),
    .x_gt_y(in_vec[2:2]),
    .x_eq_y(in_vec[1:1]),
    .x_ls_y(in_vec[0:0]),
    .x_sel(out_vec[8:8]),
    .y_sel(out_vec[7:7]),
    .x_en(out_vec[6:6]),
    .y_en(out_vec[5:5]),
    .x_op(out_vec[4:3]),
    .y_op(out_vec[2:1]),
    .done_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h3e;
    stim[1] = 6'h25;
    stim[2] = 6'h11;
    stim[3] = 6'h02;
    stim[4] = 6'h08;
    stim[5] = 6'h0d;
    stim[6] = 6'h10;
    stim[7] = 6'h1d;
    stim[8] = 6'h0a;
    stim[9] = 6'h12;
    stim[10] = 6'h0f;
    stim[11] = 6'h19;
    stim[12] = 6'h05;
    stim[13] = 6'h08;
    stim[14] = 6'h04;
    stim[15] = 6'h31;
    stim[16] = 6'h02;
    stim[17] = 6'h0a;
    stim[18] = 6'h1a;
    stim[19] = 6'h07;
    stim[20] = 6'h0e;
    stim[21] = 6'h1c;
    stim[22] = 6'h05;
    stim[23] = 6'h0a;
    stim[24] = 6'h06;
    stim[25] = 6'h0a;
    stim[26] = 6'h1d;
    stim[27] = 6'h1c;
    stim[28] = 6'h18;
    stim[29] = 6'h12;
    stim[30] = 6'h19;
    stim[31] = 6'h02;
    stim[32] = 6'h1c;
    stim[33] = 6'h0a;
    stim[34] = 6'h05;
    stim[35] = 6'h1f;
    stim[36] = 6'h1b;
    stim[37] = 6'h1b;
    stim[38] = 6'h0c;
    stim[39] = 6'h14;
    stim[40] = 6'h10;
    stim[41] = 6'h0e;
    stim[42] = 6'h1a;
    stim[43] = 6'h06;
    stim[44] = 6'h1f;
    stim[45] = 6'h1a;
    stim[46] = 6'h0f;
    stim[47] = 6'h1d;
    stim[48] = 6'h01;
    stim[49] = 6'h01;
    stim[50] = 6'h15;
    stim[51] = 6'h10;
    stim[52] = 6'h01;
    stim[53] = 6'h0a;
    stim[54] = 6'h1b;
    stim[55] = 6'h0c;
    stim[56] = 6'h1e;
    stim[57] = 6'h02;
    stim[58] = 6'h13;
    stim[59] = 6'h0c;
    stim[60] = 6'h0d;
    stim[61] = 6'h1e;
    stim[62] = 6'h12;
    stim[63] = 6'h1a;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h151;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h1f5;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h0a3;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h1eb;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h149;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h151;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h149;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h1f5;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h151;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h1eb;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h1eb;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h1eb;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h0a5;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h1eb;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h1f5;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h151;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
