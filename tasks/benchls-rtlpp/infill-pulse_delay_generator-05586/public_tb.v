// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05586 dut (
    .clk(clk),
    .wb(in_vec[11:4]),
    .reset(in_vec[3:3]),
    .trigger(in_vec[2:2]),
    .mode_a(in_vec[1:1]),
    .mode_b(in_vec[0:0]),
    .delay_out_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h7fd;
    stim[1] = 12'hc7c;
    stim[2] = 12'ha36;
    stim[3] = 12'h071;
    stim[4] = 12'h854;
    stim[5] = 12'h0e6;
    stim[6] = 12'he91;
    stim[7] = 12'hb82;
    stim[8] = 12'hf37;
    stim[9] = 12'hdf0;
    stim[10] = 12'h8e6;
    stim[11] = 12'h616;
    stim[12] = 12'hef3;
    stim[13] = 12'h0c5;
    stim[14] = 12'h841;
    stim[15] = 12'hb04;
    stim[16] = 12'h877;
    stim[17] = 12'hed0;
    stim[18] = 12'h037;
    stim[19] = 12'hab7;
    stim[20] = 12'h3a5;
    stim[21] = 12'hb50;
    stim[22] = 12'h7a1;
    stim[23] = 12'hd11;
    stim[24] = 12'hf47;
    stim[25] = 12'h594;
    stim[26] = 12'h960;
    stim[27] = 12'h739;
    stim[28] = 12'hda2;
    stim[29] = 12'h193;
    stim[30] = 12'had2;
    stim[31] = 12'h9f1;
    stim[32] = 12'hed3;
    stim[33] = 12'h087;
    stim[34] = 12'hff0;
    stim[35] = 12'hd11;
    stim[36] = 12'ha45;
    stim[37] = 12'h7a5;
    stim[38] = 12'h190;
    stim[39] = 12'h6f2;
    stim[40] = 12'h391;
    stim[41] = 12'h021;
    stim[42] = 12'hdf7;
    stim[43] = 12'h300;
    stim[44] = 12'h3e1;
    stim[45] = 12'he51;
    stim[46] = 12'ha15;
    stim[47] = 12'h1d3;
    stim[48] = 12'h6d7;
    stim[49] = 12'h431;
    stim[50] = 12'h803;
    stim[51] = 12'haf2;
    stim[52] = 12'h140;
    stim[53] = 12'hab5;
    stim[54] = 12'ha38;
    stim[55] = 12'haf1;
    stim[56] = 12'h651;
    stim[57] = 12'h372;
    stim[58] = 12'h900;
    stim[59] = 12'h391;
    stim[60] = 12'h612;
    stim[61] = 12'hf17;
    stim[62] = 12'h5b6;
    stim[63] = 12'h564;
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
      expv[0] = 1'hx;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
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
