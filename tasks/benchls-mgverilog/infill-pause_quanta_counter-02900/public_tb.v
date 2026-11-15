// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02900 dut (
    .tx_clk(clk),
    .rst(in_vec[19:19]),
    .tx_pause_en(in_vec[18:18]),
    .pause_quanta(in_vec[17:2]),
    .pause_quanta_val(in_vec[1:1]),
    .paused(in_vec[0:0]),
    .pause_apply(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'he7a20;
    stim[1] = 20'ha541a;
    stim[2] = 20'h33031;
    stim[3] = 20'h5bec7;
    stim[4] = 20'h72a1e;
    stim[5] = 20'h0f0f4;
    stim[6] = 20'h2e430;
    stim[7] = 20'h8b8b6;
    stim[8] = 20'h5a59c;
    stim[9] = 20'h096a0;
    stim[10] = 20'hee0e6;
    stim[11] = 20'h42c4c;
    stim[12] = 20'h75d2c;
    stim[13] = 20'h018bc;
    stim[14] = 20'h1f5dd;
    stim[15] = 20'h07467;
    stim[16] = 20'h14498;
    stim[17] = 20'h1b422;
    stim[18] = 20'h62f35;
    stim[19] = 20'h627d8;
    stim[20] = 20'h73db8;
    stim[21] = 20'h28687;
    stim[22] = 20'h42e2a;
    stim[23] = 20'h49560;
    stim[24] = 20'h031d6;
    stim[25] = 20'h13f9f;
    stim[26] = 20'h70dba;
    stim[27] = 20'h3bb41;
    stim[28] = 20'h2911f;
    stim[29] = 20'h3f2da;
    stim[30] = 20'h55527;
    stim[31] = 20'h43d2e;
    stim[32] = 20'h0ac09;
    stim[33] = 20'h39eb5;
    stim[34] = 20'h699ff;
    stim[35] = 20'h7b799;
    stim[36] = 20'h54831;
    stim[37] = 20'h776ca;
    stim[38] = 20'h438dd;
    stim[39] = 20'h09672;
    stim[40] = 20'h21197;
    stim[41] = 20'h3b186;
    stim[42] = 20'h77839;
    stim[43] = 20'h6ae10;
    stim[44] = 20'h1e679;
    stim[45] = 20'h52799;
    stim[46] = 20'h66d2b;
    stim[47] = 20'h5e17d;
    stim[48] = 20'h75d8c;
    stim[49] = 20'h7250f;
    stim[50] = 20'h54be3;
    stim[51] = 20'h5de06;
    stim[52] = 20'h31f94;
    stim[53] = 20'h2befa;
    stim[54] = 20'h310fa;
    stim[55] = 20'h49129;
    stim[56] = 20'h6f0ca;
    stim[57] = 20'h02433;
    stim[58] = 20'h35735;
    stim[59] = 20'h395ca;
    stim[60] = 20'h3409e;
    stim[61] = 20'h193e9;
    stim[62] = 20'h353f1;
    stim[63] = 20'h05773;
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
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
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
