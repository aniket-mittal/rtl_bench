// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_013424 dut (
    .clk(clk),
    .load_p(in_vec[22:22]),
    .reset(in_vec[21:21]),
    .start_x(in_vec[20:13]),
    .start_y(in_vec[12:6]),
    .bg_colour(in_vec[5:3]),
    .fg_colour(in_vec[2:0]),
    .done(out_vec[19:19]),
    .x_pos(out_vec[18:11]),
    .y_pos(out_vec[10:4]),
    .colour_out(out_vec[3:1]),
    .draw(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h7f00f9;
    stim[1] = 23'h2dd637;
    stim[2] = 23'h09426a;
    stim[3] = 23'h16552b;
    stim[4] = 23'h13fe72;
    stim[5] = 23'h5efb39;
    stim[6] = 23'h4aee32;
    stim[7] = 23'h1146af;
    stim[8] = 23'h0f95bb;
    stim[9] = 23'h079a46;
    stim[10] = 23'h05a725;
    stim[11] = 23'h497474;
    stim[12] = 23'h490db6;
    stim[13] = 23'h79049d;
    stim[14] = 23'h47a8c6;
    stim[15] = 23'h0d61e6;
    stim[16] = 23'h0f923b;
    stim[17] = 23'h111604;
    stim[18] = 23'h50c993;
    stim[19] = 23'h4a6d5b;
    stim[20] = 23'h452e6b;
    stim[21] = 23'h1c9d85;
    stim[22] = 23'h1337d9;
    stim[23] = 23'h576cf8;
    stim[24] = 23'h4609dc;
    stim[25] = 23'h0ad99a;
    stim[26] = 23'h47fafd;
    stim[27] = 23'h18922a;
    stim[28] = 23'h4f6a8d;
    stim[29] = 23'h4f5146;
    stim[30] = 23'h1e669e;
    stim[31] = 23'h4ad4d8;
    stim[32] = 23'h42ebfc;
    stim[33] = 23'h03f570;
    stim[34] = 23'h503be9;
    stim[35] = 23'h4960bc;
    stim[36] = 23'h0c0657;
    stim[37] = 23'h1c15d0;
    stim[38] = 23'h489258;
    stim[39] = 23'h3485e3;
    stim[40] = 23'h0a163c;
    stim[41] = 23'h53f99a;
    stim[42] = 23'h4d45d0;
    stim[43] = 23'h467b35;
    stim[44] = 23'h0e5289;
    stim[45] = 23'h51bc98;
    stim[46] = 23'h4e9c26;
    stim[47] = 23'h0a3f18;
    stim[48] = 23'h15ac67;
    stim[49] = 23'h5aec7c;
    stim[50] = 23'h178bbb;
    stim[51] = 23'h1b543f;
    stim[52] = 23'h40493e;
    stim[53] = 23'h538512;
    stim[54] = 23'h53f728;
    stim[55] = 23'h47a088;
    stim[56] = 23'h6311b1;
    stim[57] = 23'h4037dc;
    stim[58] = 23'h592978;
    stim[59] = 23'h19a66d;
    stim[60] = 23'h5b06ea;
    stim[61] = 23'h46acc8;
    stim[62] = 23'h541a26;
    stim[63] = 23'h1509d2;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxf;
      expv[2] = 20'hxxxxf;
      expv[3] = 20'hxxxxf;
      expv[4] = 20'hxxxxf;
      expv[5] = 20'hxxxxf;
      expv[6] = 20'hxxxxf;
      expv[7] = 20'hxxxxf;
      expv[8] = 20'hxxxxf;
      expv[9] = 20'hxxxxf;
      expv[10] = 20'hxxxxf;
      expv[11] = 20'hxxxxf;
      expv[12] = 20'hxxxxf;
      expv[13] = 20'hxxxxf;
      expv[14] = 20'hxxxxf;
      expv[15] = 20'hxxxxf;
      expv[16] = 20'hxxxxf;
      expv[17] = 20'hxxxxf;
      expv[18] = 20'hxxxxf;
      expv[19] = 20'hxxxxf;
      expv[20] = 20'hxxxxf;
      expv[21] = 20'hxxxxf;
      expv[22] = 20'hxxxxf;
      expv[23] = 20'hxxxxf;
      expv[24] = 20'hxxxxf;
      expv[25] = 20'hxxxxf;
      expv[26] = 20'hxxxxf;
      expv[27] = 20'hxxxxf;
      expv[28] = 20'hxxxxf;
      expv[29] = 20'hxxxxf;
      expv[30] = 20'hxxxxf;
      expv[31] = 20'hxxxxf;
      expv[32] = 20'hxxxxf;
      expv[33] = 20'hxxxxf;
      expv[34] = 20'hxxxxf;
      expv[35] = 20'hxxxxf;
      expv[36] = 20'hxxxxf;
      expv[37] = 20'hxxxxf;
      expv[38] = 20'hxxxxf;
      expv[39] = 20'hxxxxf;
      expv[40] = 20'hxxxxf;
      expv[41] = 20'hxxxxf;
      expv[42] = 20'hxxxxf;
      expv[43] = 20'hxxxxf;
      expv[44] = 20'hxxxxf;
      expv[45] = 20'hxxxxf;
      expv[46] = 20'hxxxxf;
      expv[47] = 20'hxxxxf;
      expv[48] = 20'hxxxxf;
      expv[49] = 20'hxxxxf;
      expv[50] = 20'hxxxxf;
      expv[51] = 20'hxxxxf;
      expv[52] = 20'hxxxxf;
      expv[53] = 20'hxxxxf;
      expv[54] = 20'hxxxxf;
      expv[55] = 20'hxxxxf;
      expv[56] = 20'hxxxxf;
      expv[57] = 20'hxxxxf;
      expv[58] = 20'hxxxxf;
      expv[59] = 20'hxxxxf;
      expv[60] = 20'hxxxxf;
      expv[61] = 20'hxxxxf;
      expv[62] = 20'hxxxxf;
      expv[63] = 20'hxxxxf;
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
