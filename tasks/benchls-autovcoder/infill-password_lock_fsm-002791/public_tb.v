// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002791 dut (
    .clk(clk),
    .userIDfoundFlag(in_vec[22:22]),
    .loadButton_s(in_vec[21:21]),
    .PASSWORD(in_vec[20:5]),
    .passInput(in_vec[4:1]),
    .rst(in_vec[0:0]),
    .accessFlag(out_vec[5:5]),
    .blinkFlag(out_vec[4:4]),
    .outOfAttemptsFlag(out_vec[3:3]),
    .state(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h03cc85;
    stim[1] = 23'h4d4d07;
    stim[2] = 23'h619508;
    stim[3] = 23'h612168;
    stim[4] = 23'h2c4780;
    stim[5] = 23'h32c13a;
    stim[6] = 23'h3bda72;
    stim[7] = 23'h6f3686;
    stim[8] = 23'h130c4a;
    stim[9] = 23'h5a0244;
    stim[10] = 23'h44f832;
    stim[11] = 23'h6240de;
    stim[12] = 23'h2c7e54;
    stim[13] = 23'h0796ba;
    stim[14] = 23'h5e1044;
    stim[15] = 23'h632baa;
    stim[16] = 23'h7b7ff0;
    stim[17] = 23'h51eaac;
    stim[18] = 23'h02a4d4;
    stim[19] = 23'h48f76e;
    stim[20] = 23'h3a3b36;
    stim[21] = 23'h2d7ef6;
    stim[22] = 23'h597e46;
    stim[23] = 23'h5b621c;
    stim[24] = 23'h460b3a;
    stim[25] = 23'h2532ee;
    stim[26] = 23'h148146;
    stim[27] = 23'h12e57c;
    stim[28] = 23'h213a12;
    stim[29] = 23'h4136b2;
    stim[30] = 23'h35f6e6;
    stim[31] = 23'h6a42da;
    stim[32] = 23'h4aeda0;
    stim[33] = 23'h7d0f6c;
    stim[34] = 23'h13ed58;
    stim[35] = 23'h628cda;
    stim[36] = 23'h75c4fe;
    stim[37] = 23'h5e59e4;
    stim[38] = 23'h31a98d;
    stim[39] = 23'h24c6ce;
    stim[40] = 23'h3932a2;
    stim[41] = 23'h7d6a7e;
    stim[42] = 23'h3db302;
    stim[43] = 23'h272c84;
    stim[44] = 23'h36b9c0;
    stim[45] = 23'h0aed2c;
    stim[46] = 23'h2b3f0a;
    stim[47] = 23'h70ef8e;
    stim[48] = 23'h1d4214;
    stim[49] = 23'h6d3274;
    stim[50] = 23'h5ac4a0;
    stim[51] = 23'h534c60;
    stim[52] = 23'h0b7e4c;
    stim[53] = 23'h5316b2;
    stim[54] = 23'h3bf028;
    stim[55] = 23'h641c2c;
    stim[56] = 23'h6cdbea;
    stim[57] = 23'h2437a8;
    stim[58] = 23'h1a0236;
    stim[59] = 23'h09b348;
    stim[60] = 23'h30331a;
    stim[61] = 23'h2f29d8;
    stim[62] = 23'h175eda;
    stim[63] = 23'h2920d4;
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
      expv[0] = 6'hx0;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
