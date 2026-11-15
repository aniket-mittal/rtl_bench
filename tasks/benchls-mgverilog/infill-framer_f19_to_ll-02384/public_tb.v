// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02384 dut (
    .clk(clk),
    .reset(in_vec[22:22]),
    .clear(in_vec[21:21]),
    .f19_data(in_vec[20:2]),
    .f19_src_rdy_i(in_vec[1:1]),
    .ll_dst_rdy_n(in_vec[0:0]),
    .f19_dst_rdy_o(out_vec[11:11]),
    .ll_data(out_vec[10:3]),
    .ll_sof_n(out_vec[2:2]),
    .ll_eof_n(out_vec[1:1]),
    .ll_src_rdy_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h7dccdd;
    stim[1] = 23'h787be7;
    stim[2] = 23'h10beb5;
    stim[3] = 23'h0569d4;
    stim[4] = 23'h046a72;
    stim[5] = 23'h1a6bd1;
    stim[6] = 23'h113935;
    stim[7] = 23'h237765;
    stim[8] = 23'h0c07d1;
    stim[9] = 23'h342693;
    stim[10] = 23'h0a05a2;
    stim[11] = 23'h324284;
    stim[12] = 23'h3ebdbf;
    stim[13] = 23'h27f369;
    stim[14] = 23'h1237ba;
    stim[15] = 23'h1fa568;
    stim[16] = 23'h3021ca;
    stim[17] = 23'h0c5026;
    stim[18] = 23'h20828c;
    stim[19] = 23'h0ed20f;
    stim[20] = 23'h2a4a12;
    stim[21] = 23'h307e54;
    stim[22] = 23'h2f1de5;
    stim[23] = 23'h1afdd0;
    stim[24] = 23'h0223b6;
    stim[25] = 23'h08088a;
    stim[26] = 23'h028132;
    stim[27] = 23'h02ef89;
    stim[28] = 23'h1e46c4;
    stim[29] = 23'h03a62f;
    stim[30] = 23'h1552d9;
    stim[31] = 23'h29f27c;
    stim[32] = 23'h2134e2;
    stim[33] = 23'h3c9136;
    stim[34] = 23'h08f017;
    stim[35] = 23'h1b0779;
    stim[36] = 23'h3e8821;
    stim[37] = 23'h0a1742;
    stim[38] = 23'h1494ec;
    stim[39] = 23'h0d7485;
    stim[40] = 23'h06b9c8;
    stim[41] = 23'h0fe36f;
    stim[42] = 23'h359a3c;
    stim[43] = 23'h2ed86f;
    stim[44] = 23'h038a1c;
    stim[45] = 23'h3338b8;
    stim[46] = 23'h02d168;
    stim[47] = 23'h1fe255;
    stim[48] = 23'h1b2ef3;
    stim[49] = 23'h216a48;
    stim[50] = 23'h5e2be9;
    stim[51] = 23'h1cc395;
    stim[52] = 23'h10ac8b;
    stim[53] = 23'h2f5127;
    stim[54] = 23'h2ab752;
    stim[55] = 23'h3a7230;
    stim[56] = 23'h3704d9;
    stim[57] = 23'h4fa469;
    stim[58] = 23'h068fd6;
    stim[59] = 23'h1c645f;
    stim[60] = 23'h3384a8;
    stim[61] = 23'h30f8bb;
    stim[62] = 23'h197266;
    stim[63] = 23'h062113;
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
      expv[0] = 12'h39x;
      expv[1] = 12'h0f4;
      expv[2] = 12'h17f;
      expv[3] = 12'h2d3;
      expv[4] = 12'h0d2;
      expv[5] = 12'h7a5;
      expv[6] = 12'h26f;
      expv[7] = 12'h6cf;
      expv[8] = 12'h7a5;
      expv[9] = 12'h526;
      expv[10] = 12'hb44;
      expv[11] = 12'h487;
      expv[12] = 12'h578;
      expv[13] = 12'h7e3;
      expv[14] = 12'h46e;
      expv[15] = 12'h2d5;
      expv[16] = 12'hb96;
      expv[17] = 12'h0a2;
      expv[18] = 12'h51f;
      expv[19] = 12'h41c;
      expv[20] = 12'hc24;
      expv[21] = 12'h0ff;
      expv[22] = 12'h63b;
      expv[23] = 12'h5fd;
      expv[24] = 12'h446;
      expv[25] = 12'h914;
      expv[26] = 12'h506;
      expv[27] = 12'h717;
      expv[28] = 12'h58d;
      expv[29] = 12'h45e;
      expv[30] = 12'h5b7;
      expv[31] = 12'h4fd;
      expv[32] = 12'h9c6;
      expv[33] = 12'h920;
      expv[34] = 12'h1e6;
      expv[35] = 12'h60d;
      expv[36] = 12'h511;
      expv[37] = 12'h42e;
      expv[38] = 12'h1df;
      expv[39] = 12'h10d;
      expv[40] = 12'h397;
      expv[41] = 12'h6dc;
      expv[42] = 12'h47f;
      expv[43] = 12'h0dc;
      expv[44] = 12'h43f;
      expv[45] = 12'h177;
      expv[46] = 12'h2d7;
      expv[47] = 12'h4ad;
      expv[48] = 12'h5e4;
      expv[49] = 12'h497;
      expv[50] = 12'h7d5;
      expv[51] = 12'h181;
      expv[52] = 12'h15e;
      expv[53] = 12'h6a2;
      expv[54] = 12'h56e;
      expv[55] = 12'h465;
      expv[56] = 12'h1b7;
      expv[57] = 12'h0d5;
      expv[58] = 12'h51a;
      expv[59] = 12'h0bc;
      expv[60] = 12'h157;
      expv[61] = 12'h176;
      expv[62] = 12'hccc;
      expv[63] = 12'h442;
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
