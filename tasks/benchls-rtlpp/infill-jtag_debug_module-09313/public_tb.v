// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09313 dut (
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
    .jdo(out_vec[49:12]),
    .jrst_n(out_vec[11:11]),
    .st_ready_test_idle(out_vec[10:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h13d05f66c2cc6e1cd734bfaa6d8e875;
    stim[1] = 122'h0838b096d94e664fdc30f0439a2430c;
    stim[2] = 122'h3532eb2160e504968ed63c090858902;
    stim[3] = 122'h1c8fcee4ba2a3d24cd7563306ac739d;
    stim[4] = 122'h2294f0fa1b4a6fc1a9748798b74026a;
    stim[5] = 122'h04639abebd50ff04fe7fb2abea0c8df;
    stim[6] = 122'h2940753c33d29344d7e308a60cebaa0;
    stim[7] = 122'h30330ca9dbeedc9e0af30e5e485eb09;
    stim[8] = 122'h06b853c391f0278e3acaf3729a1f16d;
    stim[9] = 122'h3dbc7838972224463a6e25f90e2ac68;
    stim[10] = 122'h25893faa6203defbe05cda0e410743b;
    stim[11] = 122'h37af599b8f78eee46c4fcfec5715cd4;
    stim[12] = 122'h325d8a89ccf42ad53e74b6912aa4cdf;
    stim[13] = 122'h3656fd7f2de0f41a1b7a52d529817ef;
    stim[14] = 122'h2e8f426f78c871ca25d9773d5181ed0;
    stim[15] = 122'h135495a80d1ac8c0729029f1da630a1;
    stim[16] = 122'h326553a6d314cd7d24c0d04fd344932;
    stim[17] = 122'h15b9dad8234a1c6a236295560812fcb;
    stim[18] = 122'h07928a54c3ff081408ee38776215bd6;
    stim[19] = 122'h2fd031aced9e728d54f63dacfe07806;
    stim[20] = 122'h20f1c00a21d11c5ef179c52d9fd6db9;
    stim[21] = 122'h073502aa9cb9b6574b4763a724e7193;
    stim[22] = 122'h034aecea993c2a112cd03e86efc7cb2;
    stim[23] = 122'h379eb6b87a1525cf1460fb529681e54;
    stim[24] = 122'h014a8993bf667c17d5c9b4827d56869;
    stim[25] = 122'h077f2323aa8fc8baaac1d4de88d521e;
    stim[26] = 122'h14a95658bf9438858deabf996432244;
    stim[27] = 122'h04c3d75ae3f353067f50d20b6e04e08;
    stim[28] = 122'h1239b1029ecb20206802b894c095b29;
    stim[29] = 122'h2b00a0df33e6190f20e911cc8af9865;
    stim[30] = 122'h0df061519c39084709df42f0056e8ae;
    stim[31] = 122'h3677c3bbb4db1525c3fc69cd88f2d50;
    stim[32] = 122'h151600a76395e49f5d68ec75aa15ac2;
    stim[33] = 122'h07fd54810775569198caf47dd2372e9;
    stim[34] = 122'h3483634724b7b005b758fbca3d4ed76;
    stim[35] = 122'h32694b722350c90385716da173f42f4;
    stim[36] = 122'h20a24268905bf9f80de20ca8868cd51;
    stim[37] = 122'h0bbcb404b4bd6a47be621b557eccda2;
    stim[38] = 122'h282cb86f47d2ecf7806fcb8cc582fcf;
    stim[39] = 122'h1f302c9720f52e2fdb4e62601c3d5ba;
    stim[40] = 122'h310a9dd02b674582f6539ae6cbd3166;
    stim[41] = 122'h3d4fef96f748967491602b2daba6f90;
    stim[42] = 122'h12341c8841e5fba24ce7140bc52acef;
    stim[43] = 122'h3dd6f28cd9bb88840f55d7521a6d986;
    stim[44] = 122'h0528d595c33c07ec8d710fe2a435162;
    stim[45] = 122'h19fad90f6828fc84ced9816d5f9b05d;
    stim[46] = 122'h3ddbb87b0a317546fdf3a2c3d439457;
    stim[47] = 122'h0ffaaafb4e7f15e44ff4510067a214b;
    stim[48] = 122'h0ce0762106497ea2167dc26ab48a3f4;
    stim[49] = 122'h16da56144db101598fd545a232b7838;
    stim[50] = 122'h131eaa7a4226dad5efe09b626c4e263;
    stim[51] = 122'h330f70a8040737706ae33bcef4b23f2;
    stim[52] = 122'h3bbfd4c2a3140a46b8bbeeebd8fb510;
    stim[53] = 122'h260de339ba999eefabf1380c756eaf0;
    stim[54] = 122'h1d39b9a871b92f9256c9841ee3aa8ba;
    stim[55] = 122'h063cc2e58bd75acbdb4724ba034c59e;
    stim[56] = 122'h0f17797c048615dfcefed4866153d78;
    stim[57] = 122'h127ca7840a850fd606506ae7133eee9;
    stim[58] = 122'h2ff3bb5ddfb9f83c55f89fbd604932b;
    stim[59] = 122'h17ed3a3dfde40723f5cc246a2f57439;
    stim[60] = 122'h2aa34ec330a0c326afeae481cdf9d96;
    stim[61] = 122'h3ca249d06394c25b2244956d7a52e10;
    stim[62] = 122'h259185e49f83fc12325786ffad055b2;
    stim[63] = 122'h1411f9f44cfcafc3d0e6b6b7d7ea761;
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
      expv[0] = 50'h3aa6d8e8750xx;
      expv[1] = 50'h0439a2430c0xx;
      expv[2] = 50'h0090858902cxx;
      expv[3] = 50'h3306ac739d0xx;
      expv[4] = 50'h398b74026a0xx;
      expv[5] = 50'h2abea0c8df0xx;
      expv[6] = 50'h0a60cebaa00xx;
      expv[7] = 50'h25e485eb094xx;
      expv[8] = 50'h3729a1f16dcxx;
      expv[9] = 50'h1f90e2ac680xx;
      expv[10] = 50'h20e410743b8xx;
      expv[11] = 50'h3ec5715cd48xx;
      expv[12] = 50'h2912aa4cdf0xx;
      expv[13] = 50'h2d529817ef0xx;
      expv[14] = 50'h33d5181ed08xx;
      expv[15] = 50'h1f1da630a14xx;
      expv[16] = 50'h04fd344932cxx;
      expv[17] = 50'h1560812fcb0xx;
      expv[18] = 50'h0776215bd64xx;
      expv[19] = 50'h1acfe078064xx;
      expv[20] = 50'h12d9fd6db90xx;
      expv[21] = 50'h3a724e71938xx;
      expv[22] = 50'h286efc7cb2cxx;
      expv[23] = 50'h3529681e540xx;
      expv[24] = 50'h0827d568698xx;
      expv[25] = 50'h0de88d521ecxx;
      expv[26] = 50'h39964322440xx;
      expv[27] = 50'h20b6e04e088xx;
      expv[28] = 50'h094c095b290xx;
      expv[29] = 50'h1cc8af98654xx;
      expv[30] = 50'h2f0056e8ae8xx;
      expv[31] = 50'h1cd88f2d500xx;
      expv[32] = 50'h075aa15ac20xx;
      expv[33] = 50'h07dd2372e9cxx;
      expv[34] = 50'h3ca3d4ed768xx;
      expv[35] = 50'h1a173f42f40xx;
      expv[36] = 50'h0a8868cd510xx;
      expv[37] = 50'h3557eccda20xx;
      expv[38] = 50'h38cc582fcf0xx;
      expv[39] = 50'h2601c3d5ba8xx;
      expv[40] = 50'h2e6cbd31668xx;
      expv[41] = 50'h32daba6f900xx;
      expv[42] = 50'h00bc52acef4xx;
      expv[43] = 50'h3521a6d9868xx;
      expv[44] = 50'h3e2a4351620xx;
      expv[45] = 50'h16d5f9b05dcxx;
      expv[46] = 50'h2c3d4394570xx;
      expv[47] = 50'h10067a214b0xx;
      expv[48] = 50'h26ab48a3f40xx;
      expv[49] = 50'h1a232b78388xx;
      expv[50] = 50'h3626c4e2630xx;
      expv[51] = 50'h3cef4b23f24xx;
      expv[52] = 50'h2ebd8fb5104xx;
      expv[53] = 50'h00c756eaf00xx;
      expv[54] = 50'h01ee3aa8bacxx;
      expv[55] = 50'h0ba034c59e8xx;
      expv[56] = 50'h0866153d784xx;
      expv[57] = 50'h2e7133eee98xx;
      expv[58] = 50'h3bd604932b0xx;
      expv[59] = 50'h06a2f574398xx;
      expv[60] = 50'h081cdf9d960xx;
      expv[61] = 50'h16d7a52e108xx;
      expv[62] = 50'h2ffad055b28xx;
      expv[63] = 50'h2b7d7ea7614xx;
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
