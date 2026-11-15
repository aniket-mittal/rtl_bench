// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063886 dut (
    .gmii_rx_clk(clk),
    .sys_rst(in_vec[10:10]),
    .gmii_rx_dv(in_vec[9:9]),
    .gmii_rxd(in_vec[8:1]),
    .full(in_vec[0:0]),
    .din(out_vec[10:2]),
    .wr_en(out_vec[1:1]),
    .wr_clk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7a9;
    stim[1] = 11'h4d9;
    stim[2] = 11'h26e;
    stim[3] = 11'h113;
    stim[4] = 11'h06c;
    stim[5] = 11'h49b;
    stim[6] = 11'h12d;
    stim[7] = 11'h0b3;
    stim[8] = 11'h75c;
    stim[9] = 11'h18e;
    stim[10] = 11'h25b;
    stim[11] = 11'h034;
    stim[12] = 11'h3f9;
    stim[13] = 11'h093;
    stim[14] = 11'h341;
    stim[15] = 11'h34d;
    stim[16] = 11'h181;
    stim[17] = 11'h3af;
    stim[18] = 11'h249;
    stim[19] = 11'h164;
    stim[20] = 11'h127;
    stim[21] = 11'h0d9;
    stim[22] = 11'h18e;
    stim[23] = 11'h1ef;
    stim[24] = 11'h2b4;
    stim[25] = 11'h358;
    stim[26] = 11'h2a8;
    stim[27] = 11'h33f;
    stim[28] = 11'h3d3;
    stim[29] = 11'h125;
    stim[30] = 11'h1be;
    stim[31] = 11'h033;
    stim[32] = 11'h084;
    stim[33] = 11'h1bf;
    stim[34] = 11'h317;
    stim[35] = 11'h246;
    stim[36] = 11'h3b6;
    stim[37] = 11'h3f3;
    stim[38] = 11'h0c9;
    stim[39] = 11'h3c0;
    stim[40] = 11'h112;
    stim[41] = 11'h385;
    stim[42] = 11'h2e5;
    stim[43] = 11'h2f3;
    stim[44] = 11'h3f8;
    stim[45] = 11'h0cd;
    stim[46] = 11'h32f;
    stim[47] = 11'h244;
    stim[48] = 11'h2a2;
    stim[49] = 11'h01a;
    stim[50] = 11'h03a;
    stim[51] = 11'h27a;
    stim[52] = 11'h141;
    stim[53] = 11'h1fc;
    stim[54] = 11'h31b;
    stim[55] = 11'h1e2;
    stim[56] = 11'h1ec;
    stim[57] = 11'h109;
    stim[58] = 11'h344;
    stim[59] = 11'h3f5;
    stim[60] = 11'h022;
    stim[61] = 11'h148;
    stim[62] = 11'h22d;
    stim[63] = 11'h271;
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
      expv[0] = 11'h00x;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h4de;
      expv[4] = 11'h002;
      expv[5] = 11'h002;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h4b6;
      expv[12] = 11'h002;
      expv[13] = 11'h7f2;
      expv[14] = 11'h002;
      expv[15] = 11'h682;
      expv[16] = 11'h69a;
      expv[17] = 11'h002;
      expv[18] = 11'h75e;
      expv[19] = 11'h492;
      expv[20] = 11'h002;
      expv[21] = 11'h002;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h56a;
      expv[26] = 11'h6b2;
      expv[27] = 11'h552;
      expv[28] = 11'h67e;
      expv[29] = 11'h7a6;
      expv[30] = 11'h002;
      expv[31] = 11'h002;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h62e;
      expv[36] = 11'h48e;
      expv[37] = 11'h76e;
      expv[38] = 11'h7e6;
      expv[39] = 11'h002;
      expv[40] = 11'h782;
      expv[41] = 11'h002;
      expv[42] = 11'h70a;
      expv[43] = 11'h5ca;
      expv[44] = 11'h5e6;
      expv[45] = 11'h7f2;
      expv[46] = 11'h002;
      expv[47] = 11'h65e;
      expv[48] = 11'h48a;
      expv[49] = 11'h546;
      expv[50] = 11'h002;
      expv[51] = 11'h002;
      expv[52] = 11'h4f6;
      expv[53] = 11'h002;
      expv[54] = 11'h002;
      expv[55] = 11'h636;
      expv[56] = 11'h002;
      expv[57] = 11'h002;
      expv[58] = 11'h000;
      expv[59] = 11'h68a;
      expv[60] = 11'h7ea;
      expv[61] = 11'h002;
      expv[62] = 11'h002;
      expv[63] = 11'h45a;
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
