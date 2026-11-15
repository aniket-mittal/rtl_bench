// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00977 dut (
    .clk(clk),
    .ce(in_vec[9:9]),
    .reset_n(in_vec[8:8]),
    .noise_select(in_vec[7:5]),
    .pulse_in(in_vec[4:4]),
    .noise_4(in_vec[3:3]),
    .noise_5(in_vec[2:2]),
    .noise_large(in_vec[1:1]),
    .sync_reset(in_vec[0:0]),
    .pulse_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0c6;
    stim[1] = 10'h257;
    stim[2] = 10'h1d4;
    stim[3] = 10'h368;
    stim[4] = 10'h344;
    stim[5] = 10'h3ce;
    stim[6] = 10'h313;
    stim[7] = 10'h378;
    stim[8] = 10'h321;
    stim[9] = 10'h09e;
    stim[10] = 10'h353;
    stim[11] = 10'h020;
    stim[12] = 10'h3c4;
    stim[13] = 10'h32b;
    stim[14] = 10'h141;
    stim[15] = 10'h151;
    stim[16] = 10'h148;
    stim[17] = 10'h331;
    stim[18] = 10'h344;
    stim[19] = 10'h197;
    stim[20] = 10'h3e8;
    stim[21] = 10'h14a;
    stim[22] = 10'h30e;
    stim[23] = 10'h145;
    stim[24] = 10'h36a;
    stim[25] = 10'h1d1;
    stim[26] = 10'h146;
    stim[27] = 10'h389;
    stim[28] = 10'h1f6;
    stim[29] = 10'h3f9;
    stim[30] = 10'h34b;
    stim[31] = 10'h2ee;
    stim[32] = 10'h180;
    stim[33] = 10'h15e;
    stim[34] = 10'h151;
    stim[35] = 10'h394;
    stim[36] = 10'h395;
    stim[37] = 10'h1ec;
    stim[38] = 10'h3ea;
    stim[39] = 10'h188;
    stim[40] = 10'h399;
    stim[41] = 10'h199;
    stim[42] = 10'h12e;
    stim[43] = 10'h39d;
    stim[44] = 10'h158;
    stim[45] = 10'h1b4;
    stim[46] = 10'h35b;
    stim[47] = 10'h3e2;
    stim[48] = 10'h195;
    stim[49] = 10'h121;
    stim[50] = 10'h186;
    stim[51] = 10'h1b2;
    stim[52] = 10'h3bd;
    stim[53] = 10'h372;
    stim[54] = 10'h37a;
    stim[55] = 10'h373;
    stim[56] = 10'h38a;
    stim[57] = 10'h1ce;
    stim[58] = 10'h10f;
    stim[59] = 10'h30d;
    stim[60] = 10'h103;
    stim[61] = 10'h168;
    stim[62] = 10'h364;
    stim[63] = 10'h2f7;
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
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
