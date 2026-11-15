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

  origen_142485 dut (
    .arbpc1_pcxdp_grant_arbbf_pa(in_vec[14:14]),
    .arbpc1_pcxdp_q0_hold_arbbf_pa_l(in_vec[13:13]),
    .arbpc1_pcxdp_qsel0_arbbf_pa(in_vec[12:12]),
    .arbpc1_pcxdp_qsel1_arbbf_pa_l(in_vec[11:11]),
    .arbpc1_pcxdp_shift_arbbf_px(in_vec[10:10]),
    .arbpc3_pcxdp_grant_arbbf_pa(in_vec[9:9]),
    .arbpc3_pcxdp_q0_hold_arbbf_pa_l(in_vec[8:8]),
    .arbpc3_pcxdp_qsel0_arbbf_pa(in_vec[7:7]),
    .arbpc3_pcxdp_qsel1_arbbf_pa_l(in_vec[6:6]),
    .arbpc3_pcxdp_shift_arbbf_px(in_vec[5:5]),
    .arbpc4_pcxdp_grant_arbbf_pa(in_vec[4:4]),
    .arbpc4_pcxdp_q0_hold_arbbf_pa_l(in_vec[3:3]),
    .arbpc4_pcxdp_qsel0_arbbf_pa(in_vec[2:2]),
    .arbpc4_pcxdp_qsel1_arbbf_pa_l(in_vec[1:1]),
    .arbpc4_pcxdp_shift_arbbf_px(in_vec[0:0]),
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
    stim[0] = 15'h305e;
    stim[1] = 15'h15f2;
    stim[2] = 15'h5037;
    stim[3] = 15'h3310;
    stim[4] = 15'h7cd2;
    stim[5] = 15'h1615;
    stim[6] = 15'h3d6c;
    stim[7] = 15'h463a;
    stim[8] = 15'h656a;
    stim[9] = 15'h1ef7;
    stim[10] = 15'h224b;
    stim[11] = 15'h0edc;
    stim[12] = 15'h015e;
    stim[13] = 15'h550c;
    stim[14] = 15'h263f;
    stim[15] = 15'h4fd3;
    stim[16] = 15'h117b;
    stim[17] = 15'h3557;
    stim[18] = 15'h113a;
    stim[19] = 15'h0430;
    stim[20] = 15'h4b55;
    stim[21] = 15'h5448;
    stim[22] = 15'h662e;
    stim[23] = 15'h6acd;
    stim[24] = 15'h5643;
    stim[25] = 15'h5691;
    stim[26] = 15'h2dc6;
    stim[27] = 15'h48e8;
    stim[28] = 15'h43ec;
    stim[29] = 15'h429f;
    stim[30] = 15'h209a;
    stim[31] = 15'h4513;
    stim[32] = 15'h544f;
    stim[33] = 15'h5c47;
    stim[34] = 15'h6b14;
    stim[35] = 15'h59ae;
    stim[36] = 15'h4972;
    stim[37] = 15'h73f6;
    stim[38] = 15'h77c0;
    stim[39] = 15'h371d;
    stim[40] = 15'h2fb5;
    stim[41] = 15'h2bc3;
    stim[42] = 15'h0da9;
    stim[43] = 15'h2a2e;
    stim[44] = 15'h02a3;
    stim[45] = 15'h262f;
    stim[46] = 15'h792f;
    stim[47] = 15'h1ef7;
    stim[48] = 15'h48d9;
    stim[49] = 15'h2c0d;
    stim[50] = 15'h7e65;
    stim[51] = 15'h0cf4;
    stim[52] = 15'h2b7d;
    stim[53] = 15'h3f4d;
    stim[54] = 15'h6de7;
    stim[55] = 15'h0a4c;
    stim[56] = 15'h4690;
    stim[57] = 15'h0d5e;
    stim[58] = 15'h7f62;
    stim[59] = 15'h76b7;
    stim[60] = 15'h1a3c;
    stim[61] = 15'h3820;
    stim[62] = 15'h0642;
    stim[63] = 15'h279b;
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
      expv[0] = 15'h305e;
      expv[1] = 15'h15f2;
      expv[2] = 15'h5037;
      expv[3] = 15'h3310;
      expv[4] = 15'h7cd2;
      expv[5] = 15'h1615;
      expv[6] = 15'h3d6c;
      expv[7] = 15'h463a;
      expv[8] = 15'h656a;
      expv[9] = 15'h1ef7;
      expv[10] = 15'h224b;
      expv[11] = 15'h0edc;
      expv[12] = 15'h015e;
      expv[13] = 15'h550c;
      expv[14] = 15'h263f;
      expv[15] = 15'h4fd3;
      expv[16] = 15'h117b;
      expv[17] = 15'h3557;
      expv[18] = 15'h113a;
      expv[19] = 15'h0430;
      expv[20] = 15'h4b55;
      expv[21] = 15'h5448;
      expv[22] = 15'h662e;
      expv[23] = 15'h6acd;
      expv[24] = 15'h5643;
      expv[25] = 15'h5691;
      expv[26] = 15'h2dc6;
      expv[27] = 15'h48e8;
      expv[28] = 15'h43ec;
      expv[29] = 15'h429f;
      expv[30] = 15'h209a;
      expv[31] = 15'h4513;
      expv[32] = 15'h544f;
      expv[33] = 15'h5c47;
      expv[34] = 15'h6b14;
      expv[35] = 15'h59ae;
      expv[36] = 15'h4972;
      expv[37] = 15'h73f6;
      expv[38] = 15'h77c0;
      expv[39] = 15'h371d;
      expv[40] = 15'h2fb5;
      expv[41] = 15'h2bc3;
      expv[42] = 15'h0da9;
      expv[43] = 15'h2a2e;
      expv[44] = 15'h02a3;
      expv[45] = 15'h262f;
      expv[46] = 15'h792f;
      expv[47] = 15'h1ef7;
      expv[48] = 15'h48d9;
      expv[49] = 15'h2c0d;
      expv[50] = 15'h7e65;
      expv[51] = 15'h0cf4;
      expv[52] = 15'h2b7d;
      expv[53] = 15'h3f4d;
      expv[54] = 15'h6de7;
      expv[55] = 15'h0a4c;
      expv[56] = 15'h4690;
      expv[57] = 15'h0d5e;
      expv[58] = 15'h7f62;
      expv[59] = 15'h76b7;
      expv[60] = 15'h1a3c;
      expv[61] = 15'h3820;
      expv[62] = 15'h0642;
      expv[63] = 15'h279b;
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
