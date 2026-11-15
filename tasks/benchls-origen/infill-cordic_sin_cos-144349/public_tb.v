// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144349 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .en(in_vec[16:16]),
    .angle(in_vec[15:0]),
    .sin_val(out_vec[31:16]),
    .cos_val(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h304d8;
    stim[1] = 18'h2adba;
    stim[2] = 18'h1e279;
    stim[3] = 18'h081ea;
    stim[4] = 18'h0788d;
    stim[5] = 18'h085b7;
    stim[6] = 18'h00c34;
    stim[7] = 18'h0631e;
    stim[8] = 18'h158dd;
    stim[9] = 18'h10878;
    stim[10] = 18'h0f717;
    stim[11] = 18'h0a619;
    stim[12] = 18'h16cc6;
    stim[13] = 18'h141c6;
    stim[14] = 18'h1da00;
    stim[15] = 18'h1c4dd;
    stim[16] = 18'h1269e;
    stim[17] = 18'h05d9c;
    stim[18] = 18'h1fd3e;
    stim[19] = 18'h09963;
    stim[20] = 18'h13498;
    stim[21] = 18'h0e0a2;
    stim[22] = 18'h1590d;
    stim[23] = 18'h07098;
    stim[24] = 18'h11d0a;
    stim[25] = 18'h08153;
    stim[26] = 18'h17f8c;
    stim[27] = 18'h09057;
    stim[28] = 18'h05525;
    stim[29] = 18'h152a1;
    stim[30] = 18'h1aa8f;
    stim[31] = 18'h1d6b9;
    stim[32] = 18'h02699;
    stim[33] = 18'h0b58c;
    stim[34] = 18'h0e388;
    stim[35] = 18'h1ec58;
    stim[36] = 18'h1cb2c;
    stim[37] = 18'h11024;
    stim[38] = 18'h19af6;
    stim[39] = 18'h0e0d6;
    stim[40] = 18'h00c19;
    stim[41] = 18'h106b6;
    stim[42] = 18'h06487;
    stim[43] = 18'h00427;
    stim[44] = 18'h16d94;
    stim[45] = 18'h0fb33;
    stim[46] = 18'h0ef3f;
    stim[47] = 18'h08771;
    stim[48] = 18'h0da46;
    stim[49] = 18'h1285b;
    stim[50] = 18'h00722;
    stim[51] = 18'h1b79f;
    stim[52] = 18'h1a9d6;
    stim[53] = 18'h1eb91;
    stim[54] = 18'h13633;
    stim[55] = 18'h0a21f;
    stim[56] = 18'h1d093;
    stim[57] = 18'h1ff8e;
    stim[58] = 18'h071a7;
    stim[59] = 18'h0ac99;
    stim[60] = 18'h11815;
    stim[61] = 18'h0b907;
    stim[62] = 18'h1eb55;
    stim[63] = 18'h07ab1;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000100;
      expv[8] = 32'h00000100;
      expv[9] = 32'h00000100;
      expv[10] = 32'h00000100;
      expv[11] = 32'h00000100;
      expv[12] = 32'h00000100;
      expv[13] = 32'h00000100;
      expv[14] = 32'h00000100;
      expv[15] = 32'h00000100;
      expv[16] = 32'h00000100;
      expv[17] = 32'h00000100;
      expv[18] = 32'h00000100;
      expv[19] = 32'h00000100;
      expv[20] = 32'h00000100;
      expv[21] = 32'h00000100;
      expv[22] = 32'h00000100;
      expv[23] = 32'h00000100;
      expv[24] = 32'h00000100;
      expv[25] = 32'h00000100;
      expv[26] = 32'h00000100;
      expv[27] = 32'h00000100;
      expv[28] = 32'h00000100;
      expv[29] = 32'h00000100;
      expv[30] = 32'h00000100;
      expv[31] = 32'h00000100;
      expv[32] = 32'h00000100;
      expv[33] = 32'h00000100;
      expv[34] = 32'h00000100;
      expv[35] = 32'h00000100;
      expv[36] = 32'h00000100;
      expv[37] = 32'h00000100;
      expv[38] = 32'h00000100;
      expv[39] = 32'h00000100;
      expv[40] = 32'h00000100;
      expv[41] = 32'h00000100;
      expv[42] = 32'h00000100;
      expv[43] = 32'h00000100;
      expv[44] = 32'h00000100;
      expv[45] = 32'h00000100;
      expv[46] = 32'h00000100;
      expv[47] = 32'h00000100;
      expv[48] = 32'h00000100;
      expv[49] = 32'h00000100;
      expv[50] = 32'h00000100;
      expv[51] = 32'h00000100;
      expv[52] = 32'h00000100;
      expv[53] = 32'h00000100;
      expv[54] = 32'h00000100;
      expv[55] = 32'h00000100;
      expv[56] = 32'h00000100;
      expv[57] = 32'h00000100;
      expv[58] = 32'h00000100;
      expv[59] = 32'h00000100;
      expv[60] = 32'h00000100;
      expv[61] = 32'h00000100;
      expv[62] = 32'h00000100;
      expv[63] = 32'h00000100;
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
