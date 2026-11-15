// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132739 dut (
    .arbpc1_pcxdp_grant_bufp1_pa_l(in_vec[14:14]),
    .arbpc1_pcxdp_q0_hold_bufp1_pa(in_vec[13:13]),
    .arbpc1_pcxdp_qsel0_bufp1_pa_l(in_vec[12:12]),
    .arbpc1_pcxdp_qsel1_bufp1_pa(in_vec[11:11]),
    .arbpc1_pcxdp_shift_bufp1_px_l(in_vec[10:10]),
    .arbpc3_pcxdp_grant_bufp1_pa_l(in_vec[9:9]),
    .arbpc3_pcxdp_q0_hold_bufp1_pa(in_vec[8:8]),
    .arbpc3_pcxdp_qsel0_bufp1_pa_l(in_vec[7:7]),
    .arbpc3_pcxdp_qsel1_bufp1_pa(in_vec[6:6]),
    .arbpc3_pcxdp_shift_bufp1_px_l(in_vec[5:5]),
    .arbpc4_pcxdp_grant_bufp1_pa_l(in_vec[4:4]),
    .arbpc4_pcxdp_q0_hold_bufp1_pa(in_vec[3:3]),
    .arbpc4_pcxdp_qsel0_bufp1_pa_l(in_vec[2:2]),
    .arbpc4_pcxdp_qsel1_bufp1_pa(in_vec[1:1]),
    .arbpc4_pcxdp_shift_bufp1_px_l(in_vec[0:0]),
    .arbpc1_pcxdp_grant_pa(out_vec[14:14]),
    .arbpc1_pcxdp_q0_hold_pa_l(out_vec[13:13]),
    .arbpc1_pcxdp_qsel0_pa(out_vec[12:12]),
    .arbpc1_pcxdp_qsel1_pa_l(out_vec[11:11]),
    .arbpc1_pcxdp_shift_px(out_vec[10:10]),
    .arbpc3_pcxdp_grant_pa(out_vec[9:9]),
    .arbpc3_pcxdp_q0_hold_pa_l(out_vec[8:8]),
    .arbpc3_pcxdp_qsel0_pa(out_vec[7:7]),
    .arbpc3_pcxdp_qsel1_pa_l(out_vec[6:6]),
    .arbpc3_pcxdp_shift_px(out_vec[5:5]),
    .arbpc4_pcxdp_grant_pa(out_vec[4:4]),
    .arbpc4_pcxdp_q0_hold_pa_l(out_vec[3:3]),
    .arbpc4_pcxdp_qsel0_pa(out_vec[2:2]),
    .arbpc4_pcxdp_qsel1_pa_l(out_vec[1:1]),
    .arbpc4_pcxdp_shift_px(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h6a32;
    stim[1] = 15'h40a9;
    stim[2] = 15'h03b3;
    stim[3] = 15'h4462;
    stim[4] = 15'h2a2f;
    stim[5] = 15'h5245;
    stim[6] = 15'h233c;
    stim[7] = 15'h356c;
    stim[8] = 15'h2d04;
    stim[9] = 15'h50ad;
    stim[10] = 15'h73be;
    stim[11] = 15'h08e2;
    stim[12] = 15'h5a0f;
    stim[13] = 15'h6d5d;
    stim[14] = 15'h6773;
    stim[15] = 15'h36cf;
    stim[16] = 15'h7e27;
    stim[17] = 15'h0b88;
    stim[18] = 15'h06bf;
    stim[19] = 15'h2996;
    stim[20] = 15'h3cbc;
    stim[21] = 15'h7a6b;
    stim[22] = 15'h78b2;
    stim[23] = 15'h04bb;
    stim[24] = 15'h0699;
    stim[25] = 15'h1feb;
    stim[26] = 15'h4aeb;
    stim[27] = 15'h1711;
    stim[28] = 15'h37f9;
    stim[29] = 15'h784c;
    stim[30] = 15'h594e;
    stim[31] = 15'h35eb;
    stim[32] = 15'h6143;
    stim[33] = 15'h36a0;
    stim[34] = 15'h7796;
    stim[35] = 15'h5ffb;
    stim[36] = 15'h7f1a;
    stim[37] = 15'h142d;
    stim[38] = 15'h2982;
    stim[39] = 15'h512d;
    stim[40] = 15'h4022;
    stim[41] = 15'h61b3;
    stim[42] = 15'h4ace;
    stim[43] = 15'h0b7d;
    stim[44] = 15'h0f5b;
    stim[45] = 15'h7471;
    stim[46] = 15'h381f;
    stim[47] = 15'h0022;
    stim[48] = 15'h7df9;
    stim[49] = 15'h7f4c;
    stim[50] = 15'h727f;
    stim[51] = 15'h190f;
    stim[52] = 15'h11a7;
    stim[53] = 15'h3119;
    stim[54] = 15'h62c6;
    stim[55] = 15'h44ff;
    stim[56] = 15'h2f1d;
    stim[57] = 15'h671f;
    stim[58] = 15'h5b30;
    stim[59] = 15'h28e1;
    stim[60] = 15'h6714;
    stim[61] = 15'h08be;
    stim[62] = 15'h0427;
    stim[63] = 15'h7353;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 15'h15cd;
      expv[1] = 15'h3f56;
      expv[2] = 15'h7c4c;
      expv[3] = 15'h3b9d;
      expv[4] = 15'h55d0;
      expv[5] = 15'h2dba;
      expv[6] = 15'h5cc3;
      expv[7] = 15'h4a93;
      expv[8] = 15'h52fb;
      expv[9] = 15'h2f52;
      expv[10] = 15'h0c41;
      expv[11] = 15'h771d;
      expv[12] = 15'h25f0;
      expv[13] = 15'h12a2;
      expv[14] = 15'h188c;
      expv[15] = 15'h4930;
      expv[16] = 15'h01d8;
      expv[17] = 15'h7477;
      expv[18] = 15'h7940;
      expv[19] = 15'h5669;
      expv[20] = 15'h4343;
      expv[21] = 15'h0594;
      expv[22] = 15'h074d;
      expv[23] = 15'h7b44;
      expv[24] = 15'h7966;
      expv[25] = 15'h6014;
      expv[26] = 15'h3514;
      expv[27] = 15'h68ee;
      expv[28] = 15'h4806;
      expv[29] = 15'h07b3;
      expv[30] = 15'h26b1;
      expv[31] = 15'h4a14;
      expv[32] = 15'h1ebc;
      expv[33] = 15'h495f;
      expv[34] = 15'h0869;
      expv[35] = 15'h2004;
      expv[36] = 15'h00e5;
      expv[37] = 15'h6bd2;
      expv[38] = 15'h567d;
      expv[39] = 15'h2ed2;
      expv[40] = 15'h3fdd;
      expv[41] = 15'h1e4c;
      expv[42] = 15'h3531;
      expv[43] = 15'h7482;
      expv[44] = 15'h70a4;
      expv[45] = 15'h0b8e;
      expv[46] = 15'h47e0;
      expv[47] = 15'h7fdd;
      expv[48] = 15'h0206;
      expv[49] = 15'h00b3;
      expv[50] = 15'h0d80;
      expv[51] = 15'h66f0;
      expv[52] = 15'h6e58;
      expv[53] = 15'h4ee6;
      expv[54] = 15'h1d39;
      expv[55] = 15'h3b00;
      expv[56] = 15'h50e2;
      expv[57] = 15'h18e0;
      expv[58] = 15'h24cf;
      expv[59] = 15'h571e;
      expv[60] = 15'h18eb;
      expv[61] = 15'h7741;
      expv[62] = 15'h7bd8;
      expv[63] = 15'h0cac;
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
