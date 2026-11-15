// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_088026 dut (
    .clock(clk),
    .reset(in_vec[10:10]),
    .ctl_enable(in_vec[9:9]),
    .ctl_data(in_vec[8:8]),
    .ctl_then(in_vec[7:7]),
    .ctl_else(in_vec[6:6]),
    .ctl_conditions(in_vec[5:5]),
    .ctl_actions(in_vec[4:4]),
    .in_conditions(in_vec[3:0]),
    .out_act(out_vec[4:4]),
    .out_actions(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h65b;
    stim[1] = 11'h6c1;
    stim[2] = 11'h1fb;
    stim[3] = 11'h17f;
    stim[4] = 11'h207;
    stim[5] = 11'h1bd;
    stim[6] = 11'h1e1;
    stim[7] = 11'h049;
    stim[8] = 11'h062;
    stim[9] = 11'h384;
    stim[10] = 11'h345;
    stim[11] = 11'h341;
    stim[12] = 11'h1b3;
    stim[13] = 11'h15c;
    stim[14] = 11'h30c;
    stim[15] = 11'h2cd;
    stim[16] = 11'h120;
    stim[17] = 11'h352;
    stim[18] = 11'h22d;
    stim[19] = 11'h323;
    stim[20] = 11'h39f;
    stim[21] = 11'h3c7;
    stim[22] = 11'h1fe;
    stim[23] = 11'h287;
    stim[24] = 11'h16b;
    stim[25] = 11'h28b;
    stim[26] = 11'h1dd;
    stim[27] = 11'h11a;
    stim[28] = 11'h369;
    stim[29] = 11'h13c;
    stim[30] = 11'h06f;
    stim[31] = 11'h05e;
    stim[32] = 11'h05a;
    stim[33] = 11'h223;
    stim[34] = 11'h371;
    stim[35] = 11'h182;
    stim[36] = 11'h2b6;
    stim[37] = 11'h2a3;
    stim[38] = 11'h1a9;
    stim[39] = 11'h38d;
    stim[40] = 11'h08e;
    stim[41] = 11'h23e;
    stim[42] = 11'h1dc;
    stim[43] = 11'h330;
    stim[44] = 11'h10e;
    stim[45] = 11'h260;
    stim[46] = 11'h210;
    stim[47] = 11'h31e;
    stim[48] = 11'h691;
    stim[49] = 11'h041;
    stim[50] = 11'h235;
    stim[51] = 11'h11c;
    stim[52] = 11'h25c;
    stim[53] = 11'h340;
    stim[54] = 11'h234;
    stim[55] = 11'h327;
    stim[56] = 11'h265;
    stim[57] = 11'h3e6;
    stim[58] = 11'h739;
    stim[59] = 11'h3e6;
    stim[60] = 11'h19c;
    stim[61] = 11'h014;
    stim[62] = 11'h244;
    stim[63] = 11'h215;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h08;
      expv[19] = 5'h08;
      expv[20] = 5'h08;
      expv[21] = 5'h08;
      expv[22] = 5'h08;
      expv[23] = 5'h08;
      expv[24] = 5'h08;
      expv[25] = 5'h08;
      expv[26] = 5'h08;
      expv[27] = 5'h08;
      expv[28] = 5'h08;
      expv[29] = 5'h18;
      expv[30] = 5'h18;
      expv[31] = 5'h18;
      expv[32] = 5'h18;
      expv[33] = 5'h08;
      expv[34] = 5'h08;
      expv[35] = 5'h0c;
      expv[36] = 5'h0c;
      expv[37] = 5'h0c;
      expv[38] = 5'h0c;
      expv[39] = 5'h1c;
      expv[40] = 5'h1c;
      expv[41] = 5'h1c;
      expv[42] = 5'h1c;
      expv[43] = 5'h0c;
      expv[44] = 5'h1c;
      expv[45] = 5'h0c;
      expv[46] = 5'h0c;
      expv[47] = 5'h1c;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h10;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
