// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01631 dut (
    .clk(clk),
    .h_reset_n(in_vec[17:17]),
    .we(in_vec[16:16]),
    .h_hclk(in_vec[15:15]),
    .clk_en(in_vec[14:14]),
    .addr1(in_vec[13:10]),
    .addr2(in_vec[9:6]),
    .din(in_vec[5:0]),
    .dout1(out_vec[11:6]),
    .dout2(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h18556;
    stim[1] = 18'h0f003;
    stim[2] = 18'h2b9ff;
    stim[3] = 18'h32972;
    stim[4] = 18'h27c87;
    stim[5] = 18'h35a2e;
    stim[6] = 18'h399e7;
    stim[7] = 18'h3f232;
    stim[8] = 18'h20915;
    stim[9] = 18'h32743;
    stim[10] = 18'h3c5d7;
    stim[11] = 18'h21e19;
    stim[12] = 18'h353ee;
    stim[13] = 18'h2139f;
    stim[14] = 18'h20804;
    stim[15] = 18'h27c0a;
    stim[16] = 18'h309e4;
    stim[17] = 18'h2ac4f;
    stim[18] = 18'h2b5e2;
    stim[19] = 18'h2b8fd;
    stim[20] = 18'h2178e;
    stim[21] = 18'h31e0a;
    stim[22] = 18'h20483;
    stim[23] = 18'h29f4f;
    stim[24] = 18'h36757;
    stim[25] = 18'h3d00a;
    stim[26] = 18'h2cb7b;
    stim[27] = 18'h30edc;
    stim[28] = 18'h3c557;
    stim[29] = 18'h28008;
    stim[30] = 18'h330b8;
    stim[31] = 18'h20769;
    stim[32] = 18'h3a844;
    stim[33] = 18'h352a4;
    stim[34] = 18'h215e8;
    stim[35] = 18'h206eb;
    stim[36] = 18'h39c31;
    stim[37] = 18'h2c0d5;
    stim[38] = 18'h339f2;
    stim[39] = 18'h35dbf;
    stim[40] = 18'h36455;
    stim[41] = 18'h20263;
    stim[42] = 18'h31da8;
    stim[43] = 18'h37e5a;
    stim[44] = 18'h28cdd;
    stim[45] = 18'h21cd2;
    stim[46] = 18'h3dcf6;
    stim[47] = 18'h25c3d;
    stim[48] = 18'h20d57;
    stim[49] = 18'h27b29;
    stim[50] = 18'h230d3;
    stim[51] = 18'h37e6d;
    stim[52] = 18'h381fa;
    stim[53] = 18'h383bd;
    stim[54] = 18'h25e6d;
    stim[55] = 18'h2e554;
    stim[56] = 18'h3add1;
    stim[57] = 18'h3e8f6;
    stim[58] = 18'h375cc;
    stim[59] = 18'h2977d;
    stim[60] = 18'h2054e;
    stim[61] = 18'h20644;
    stim[62] = 18'h3c13d;
    stim[63] = 18'h21a88;
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
      expv[0] = 12'hxx0;
      expv[1] = 12'hxx0;
      expv[2] = 12'hxx0;
      expv[3] = 12'hxx0;
      expv[4] = 12'hxx0;
      expv[5] = 12'hxx0;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h5c0;
      expv[29] = 12'h5c0;
      expv[30] = 12'h5c0;
      expv[31] = 12'h5c0;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h004;
      expv[35] = 12'h004;
      expv[36] = 12'h004;
      expv[37] = 12'h004;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h027;
      expv[41] = 12'h017;
      expv[42] = 12'h017;
      expv[43] = 12'h017;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'hc40;
      expv[47] = 12'hc40;
      expv[48] = 12'hc40;
      expv[49] = 12'hc40;
      expv[50] = 12'hc40;
      expv[51] = 12'hc40;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h036;
      expv[60] = 12'h036;
      expv[61] = 12'h036;
      expv[62] = 12'heb6;
      expv[63] = 12'he8a;
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
