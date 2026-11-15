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

  mg_08352 dut (
    .clk_in(clk),
    .rst_in(in_vec[9:9]),
    .en_in(in_vec[8:8]),
    .halt_in(in_vec[7:7]),
    .length_pulse_in(in_vec[6:6]),
    .length_in(in_vec[5:1]),
    .length_wr_in(in_vec[0:0]),
    .en_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h066;
    stim[1] = 10'h179;
    stim[2] = 10'h343;
    stim[3] = 10'h2dc;
    stim[4] = 10'h2a8;
    stim[5] = 10'h36e;
    stim[6] = 10'h2e4;
    stim[7] = 10'h2e2;
    stim[8] = 10'h3c6;
    stim[9] = 10'h2d5;
    stim[10] = 10'h39b;
    stim[11] = 10'h3fd;
    stim[12] = 10'h3a2;
    stim[13] = 10'h3e5;
    stim[14] = 10'h26e;
    stim[15] = 10'h350;
    stim[16] = 10'h237;
    stim[17] = 10'h2ea;
    stim[18] = 10'h292;
    stim[19] = 10'h307;
    stim[20] = 10'h308;
    stim[21] = 10'h2f7;
    stim[22] = 10'h2c4;
    stim[23] = 10'h2ce;
    stim[24] = 10'h263;
    stim[25] = 10'h367;
    stim[26] = 10'h28c;
    stim[27] = 10'h3f7;
    stim[28] = 10'h2e9;
    stim[29] = 10'h210;
    stim[30] = 10'h35c;
    stim[31] = 10'h32e;
    stim[32] = 10'h218;
    stim[33] = 10'h32a;
    stim[34] = 10'h2c3;
    stim[35] = 10'h227;
    stim[36] = 10'h236;
    stim[37] = 10'h324;
    stim[38] = 10'h1d1;
    stim[39] = 10'h2c5;
    stim[40] = 10'h25d;
    stim[41] = 10'h2ed;
    stim[42] = 10'h367;
    stim[43] = 10'h37d;
    stim[44] = 10'h006;
    stim[45] = 10'h3f4;
    stim[46] = 10'h209;
    stim[47] = 10'h378;
    stim[48] = 10'h235;
    stim[49] = 10'h320;
    stim[50] = 10'h2df;
    stim[51] = 10'h2ed;
    stim[52] = 10'h204;
    stim[53] = 10'h351;
    stim[54] = 10'h06b;
    stim[55] = 10'h3b2;
    stim[56] = 10'h3b5;
    stim[57] = 10'h3cb;
    stim[58] = 10'h305;
    stim[59] = 10'h23f;
    stim[60] = 10'h369;
    stim[61] = 10'h26e;
    stim[62] = 10'h28d;
    stim[63] = 10'h20a;
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
      expv[1] = 1'h0;
      expv[2] = 1'h1;
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
      expv[39] = 1'h1;
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
