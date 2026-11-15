// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09265 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h1069e3d9c0593aaf409a0ff9c68cfbe;
    stim[1] = 122'h0c751a24c7b285cc751f796a7ff8bb0;
    stim[2] = 122'h3f22823483a0603ca7cda4fd6bb83a5;
    stim[3] = 122'h34d71edb78461d2e3cd1ef408af7a59;
    stim[4] = 122'h0a016bc61add0320d0d3729446b0d20;
    stim[5] = 122'h3d773b75cad4591137718e496256e8b;
    stim[6] = 122'h096dc52ab64d208de2fd1c23ae5b543;
    stim[7] = 122'h39cdf56a216d3ec1bac76b712edfe64;
    stim[8] = 122'h1e5e12942e2b789837469f9321f006f;
    stim[9] = 122'h3cdc4eb04526a5028d61cf50baeef2f;
    stim[10] = 122'h16b23d04a4da79e6f6e7aa615274fdb;
    stim[11] = 122'h3d933114578684f088ca377cb08466f;
    stim[12] = 122'h2b742ef986b21f29054f4b96cb5e931;
    stim[13] = 122'h185cd0f747d3b31779f866c63862563;
    stim[14] = 122'h1a216f1c5ecc2b5621c65c54a5cd754;
    stim[15] = 122'h30eef29674362d9fa56f22dfd3a1f53;
    stim[16] = 122'h0f9ab85b8cb5519122f7a41a0772cbe;
    stim[17] = 122'h392963648fb41fa2f54f0884820923c;
    stim[18] = 122'h350889a77ebb5ecb02cd668b428f67b;
    stim[19] = 122'h0b7e90beb1f0fb8a7f441be95f8f8a7;
    stim[20] = 122'h09fd17a47913e5c1f76b28c03d01c9d;
    stim[21] = 122'h0eda54fd3b7fc61496542a0a793b735;
    stim[22] = 122'h22721666f4243aa81249eefeeef0303;
    stim[23] = 122'h3387180f2faf146948f98b19cff43cc;
    stim[24] = 122'h0f3cc1cb333b161a15df0fef3410434;
    stim[25] = 122'h3f223e15fdbc3f8665f83c99a7adcca;
    stim[26] = 122'h1573b593315dac10db574ebd5232c8a;
    stim[27] = 122'h2b6e338672dab7efc5e07a89bf31231;
    stim[28] = 122'h0904505c59a873385ac0399fca819f4;
    stim[29] = 122'h3f599a4b008e99b6b879a2803450b05;
    stim[30] = 122'h0b7248f5ad2f69350e49abab0f7af6f;
    stim[31] = 122'h2593086656b7b67a3e72b2d4730b117;
    stim[32] = 122'h2496a882cb59eb6431d7c013f9a93be;
    stim[33] = 122'h2ddcacb56abdbee74451c20c086d673;
    stim[34] = 122'h3387ffffd4d316bb3872439e517b0f2;
    stim[35] = 122'h1c0d53b9354eda2cf877ca1c21cc3ad;
    stim[36] = 122'h1929b71daf28849082fdf94d012918a;
    stim[37] = 122'h18aec59a8e7c4c1267f54fef4fdde06;
    stim[38] = 122'h39a3b1b8ec3ec1b08ae95f6e2edb056;
    stim[39] = 122'h3fc2e62896229a20a644a80f9c874e1;
    stim[40] = 122'h31086a3f90e05191f858ed08cb99754;
    stim[41] = 122'h13da3c29ae107b5b7af04b134420f44;
    stim[42] = 122'h371e651357bcd253adf0d3cda0c19ba;
    stim[43] = 122'h251f910075e04556926f5daa6f5e5c8;
    stim[44] = 122'h0bd165f99947348571f3ac7f898a71f;
    stim[45] = 122'h3187b252624f9b79d9c6c18b9580771;
    stim[46] = 122'h0a6d6cf677788b8fc4648105d683345;
    stim[47] = 122'h3f06332fd6b2d2e04871f5203654a93;
    stim[48] = 122'h2fda0d4dc8abc6a71252ad8eeffe745;
    stim[49] = 122'h3217be9d2d4886c200f6ed2a86e6854;
    stim[50] = 122'h35838ab0df415270fb56ecf4f7fa28e;
    stim[51] = 122'h0a6a443b0ec2a444d266c3bfd1592b9;
    stim[52] = 122'h1fb6ac16295beccf4c79eb2edf42743;
    stim[53] = 122'h12be2b23110049f611524e5ba946710;
    stim[54] = 122'h0d2301d94c167b3e62f1804c7fa1d4b;
    stim[55] = 122'h0d4364abef28d2aa46cf5419e90d584;
    stim[56] = 122'h1baf5ecd889f2ce03e61da7bd814a3b;
    stim[57] = 122'h0992986a8a90057c5d73bb3516b4225;
    stim[58] = 122'h146396ce4462d525b67d7cc32f8c2bf;
    stim[59] = 122'h25fb6e50eecf3fe235d4aaed4094ceb;
    stim[60] = 122'h1bbbcd733555e1151fea48aa5293ec2;
    stim[61] = 122'h1dd66e010afd6d88c45046652260e5b;
    stim[62] = 122'h3fa4aa2a575300699d632c6aa516e7d;
    stim[63] = 122'h1499450b00763fe82356ce9a0c9f63b;
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
      expv[0] = 53'h00000000000000;
      expv[1] = 53'h00000000000000;
      expv[2] = 53'h00000000000000;
      expv[3] = 53'h1f91411a59730d;
      expv[4] = 53'h1a6b8f6dbc7e80;
      expv[5] = 53'h0500b5e301a896;
      expv[6] = 53'h1ebb9dbae21b84;
      expv[7] = 53'h04b6e2955bf14e;
      expv[8] = 53'h1ce6fab5033d03;
      expv[9] = 53'h0f2f094a101b25;
      expv[10] = 53'h1e6e2758250639;
      expv[11] = 53'h0b591e824dfb05;
      expv[12] = 53'h1ec9988a21243b;
      expv[13] = 53'h15ba177cd2021d;
      expv[14] = 53'h0c2e687baebc42;
      expv[15] = 53'h0d10b78e2c300f;
      expv[16] = 53'h1877794b3f120d;
      expv[17] = 53'h07cd5c2dc231ae;
      expv[18] = 53'h1c94b1b245da25;
      expv[19] = 53'h1a8444d3b6211f;
      expv[20] = 53'h05bf485f549f01;
      expv[21] = 53'h04fe8bd223db25;
      expv[22] = 53'h076d2a7e894b54;
      expv[23] = 53'h11390b33700917;
      expv[24] = 53'h19c38c0792a47a;
      expv[25] = 53'h079e60e5942a54;
      expv[26] = 53'h1f911f0aecb28c;
      expv[27] = 53'h0ab9dac9818d92;
      expv[28] = 53'h15b719c33fe21d;
      expv[29] = 53'h0482282e30ad13;
      expv[30] = 53'h1faccd258d5c82;
      expv[31] = 53'h05b9247aca0739;
      expv[32] = 53'h12c98433341f40;
      expv[33] = 53'h124b5441687866;
      expv[34] = 53'h16ee565aae825c;
      expv[35] = 53'h19c3fffff61c42;
      expv[36] = 53'h0e06a9dc999c62;
      expv[37] = 53'h0c94db8ec1215e;
      expv[38] = 53'h0c5762cd44b38c;
      expv[39] = 53'h1cd1d8dc61651b;
      expv[40] = 53'h1fe1731441530d;
      expv[41] = 53'h1884351fc39c42;
      expv[42] = 53'h09ed1e14d6bd82;
      expv[43] = 53'h1b8f3289a73688;
      expv[44] = 53'h128fc8802d0917;
      expv[45] = 53'h05e8b2fccab866;
      expv[46] = 53'h18c3d92933ac13;
      expv[47] = 53'h0536b67b3f821d;
      expv[48] = 53'h1f831997e0c49a;
      expv[49] = 53'h17ed06a6ee0956;
      expv[50] = 53'h190bdf4e84209e;
      expv[51] = 53'h1ac1c558619d62;
      expv[52] = 53'h0535221d898917;
      expv[53] = 53'h0fdb560b1e8658;
      expv[54] = 53'h095f15918c0856;
      expv[55] = 53'h069180ecbcf18e;
      expv[56] = 53'h06a1b255f4a31d;
      expv[57] = 53'h0dd7af66c01f01;
      expv[58] = 53'h04c94c35588e50;
      expv[59] = 53'h0a31cb672b1b64;
      expv[60] = 53'h12fdb728643a84;
      expv[61] = 53'h0ddde6b98a6f11;
      expv[62] = 53'h0eeb370091829c;
      expv[63] = 53'h1fd25515330e31;
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
