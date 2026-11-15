// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_067675 dut (
    .i_cclk(clk),
    .i_start(in_vec[18:18]),
    .i_read(in_vec[17:17]),
    .i_stop(in_vec[16:16]),
    .i_sda(in_vec[15:15]),
    .i_address(in_vec[14:8]),
    .i_txdata(in_vec[7:0]),
    .i_rxdata(out_vec[10:3]),
    .o_scl(out_vec[2:2]),
    .o_busy(out_vec[1:1]),
    .o_sda(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h7753a;
    stim[1] = 19'h13a33;
    stim[2] = 19'h19ce1;
    stim[3] = 19'h7c01c;
    stim[4] = 19'h6d79d;
    stim[5] = 19'h3cc55;
    stim[6] = 19'h06d7f;
    stim[7] = 19'h0f211;
    stim[8] = 19'h5f455;
    stim[9] = 19'h0a51c;
    stim[10] = 19'h7b21f;
    stim[11] = 19'h1fe77;
    stim[12] = 19'h27293;
    stim[13] = 19'h39ff6;
    stim[14] = 19'h57cc5;
    stim[15] = 19'h54319;
    stim[16] = 19'h0d427;
    stim[17] = 19'h72e02;
    stim[18] = 19'h71c39;
    stim[19] = 19'h52bbb;
    stim[20] = 19'h6e39f;
    stim[21] = 19'h0108f;
    stim[22] = 19'h54395;
    stim[23] = 19'h361f5;
    stim[24] = 19'h7e654;
    stim[25] = 19'h3fe69;
    stim[26] = 19'h05f39;
    stim[27] = 19'h0484f;
    stim[28] = 19'h0b16d;
    stim[29] = 19'h50777;
    stim[30] = 19'h6507a;
    stim[31] = 19'h136c6;
    stim[32] = 19'h4c943;
    stim[33] = 19'h27df7;
    stim[34] = 19'h3f778;
    stim[35] = 19'h2b7ea;
    stim[36] = 19'h7e0ce;
    stim[37] = 19'h0f245;
    stim[38] = 19'h1bbad;
    stim[39] = 19'h3e4a1;
    stim[40] = 19'h52828;
    stim[41] = 19'h48a4b;
    stim[42] = 19'h276a7;
    stim[43] = 19'h45b4e;
    stim[44] = 19'h00f5c;
    stim[45] = 19'h7b4d5;
    stim[46] = 19'h05c94;
    stim[47] = 19'h17d86;
    stim[48] = 19'h3c941;
    stim[49] = 19'h57fb3;
    stim[50] = 19'h163d6;
    stim[51] = 19'h2055e;
    stim[52] = 19'h4aa26;
    stim[53] = 19'h3c1ca;
    stim[54] = 19'h083c3;
    stim[55] = 19'h78274;
    stim[56] = 19'h7445d;
    stim[57] = 19'h3770b;
    stim[58] = 19'h26232;
    stim[59] = 19'h620ca;
    stim[60] = 19'h45717;
    stim[61] = 19'h276d8;
    stim[62] = 19'h7e24e;
    stim[63] = 19'h7b3c9;
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
      expv[0] = 11'h000;
      expv[1] = 11'h001;
      expv[2] = 11'h001;
      expv[3] = 11'h001;
      expv[4] = 11'h001;
      expv[5] = 11'h001;
      expv[6] = 11'h001;
      expv[7] = 11'h000;
      expv[8] = 11'h003;
      expv[9] = 11'h003;
      expv[10] = 11'h002;
      expv[11] = 11'h003;
      expv[12] = 11'h003;
      expv[13] = 11'h002;
      expv[14] = 11'h003;
      expv[15] = 11'h001;
      expv[16] = 11'h000;
      expv[17] = 11'h001;
      expv[18] = 11'h003;
      expv[19] = 11'h003;
      expv[20] = 11'h002;
      expv[21] = 11'h003;
      expv[22] = 11'h003;
      expv[23] = 11'h002;
      expv[24] = 11'h003;
      expv[25] = 11'h001;
      expv[26] = 11'h001;
      expv[27] = 11'h000;
      expv[28] = 11'h002;
      expv[29] = 11'h003;
      expv[30] = 11'h003;
      expv[31] = 11'h003;
      expv[32] = 11'h002;
      expv[33] = 11'h002;
      expv[34] = 11'h003;
      expv[35] = 11'h002;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h001;
      expv[40] = 11'h003;
      expv[41] = 11'h003;
      expv[42] = 11'h002;
      expv[43] = 11'h003;
      expv[44] = 11'h003;
      expv[45] = 11'h002;
      expv[46] = 11'h003;
      expv[47] = 11'h001;
      expv[48] = 11'h000;
      expv[49] = 11'h001;
      expv[50] = 11'h003;
      expv[51] = 11'h003;
      expv[52] = 11'h002;
      expv[53] = 11'h003;
      expv[54] = 11'h003;
      expv[55] = 11'h002;
      expv[56] = 11'h003;
      expv[57] = 11'h001;
      expv[58] = 11'h001;
      expv[59] = 11'h000;
      expv[60] = 11'h002;
      expv[61] = 11'h002;
      expv[62] = 11'h002;
      expv[63] = 11'h082;
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
