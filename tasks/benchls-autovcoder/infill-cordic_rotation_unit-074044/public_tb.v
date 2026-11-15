// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 147;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_074044 dut (
    .clk(clk),
    .x_in(in_vec[129:114]),
    .y_in(in_vec[113:98]),
    .phi_in(in_vec[97:82]),
    .e_in(in_vec[81:66]),
    .teta_in(in_vec[65:50]),
    .phi_right_in(in_vec[49:34]),
    .x_i(in_vec[33:18]),
    .y_i(in_vec[17:2]),
    .start(in_vec[1:1]),
    .rst_n(in_vec[0:0]),
    .x_out(out_vec[146:131]),
    .y_out(out_vec[130:115]),
    .phi_out(out_vec[114:99]),
    .x_o(out_vec[98:83]),
    .y_o(out_vec[82:67]),
    .ce_vec(out_vec[66:66]),
    .ce_rot(out_vec[65:65]),
    .phi(out_vec[64:49]),
    .teta(out_vec[48:33]),
    .e(out_vec[32:17]),
    .phi_right_out(out_vec[16:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h2e2bf1791b882778cdd371f6607c2f890;
    stim[1] = 130'h3ff5dc8a204e235e4a7353f1172b8a60e;
    stim[2] = 130'h28889307d36558343c8b5900a4afdc6ab;
    stim[3] = 130'h39034fcdddc6a1beec83ec776f71ae389;
    stim[4] = 130'h2c338d7c8803fffc0a61cc75d8d2787dd;
    stim[5] = 130'h256f781666635dd2588a250b7910f018b;
    stim[6] = 130'h12b951dd246086919a522ecd272ee475b;
    stim[7] = 130'h1b70c203b0d8de574d052c9965d308f59;
    stim[8] = 130'h0de7ebb42303e979ef63b593ccef1c41b;
    stim[9] = 130'h21a2d63ba9f44441600c210341d967135;
    stim[10] = 130'h1d76040ca04d2ac8b515eaa181f65f24d;
    stim[11] = 130'h30c2602d1231ee2e556028358e021818b;
    stim[12] = 130'h22e0ea4783c9fa34af340e6a522d56f45;
    stim[13] = 130'h35cd3fa4f21d4cc4ecd42ba3d3b249469;
    stim[14] = 130'h09b0842e9c6c75f085a09317892295a29;
    stim[15] = 130'h28e17744d8c60fee2f0b5f286caa59737;
    stim[16] = 130'h1ecdd2a37c9f906788ab451a8b99cfe31;
    stim[17] = 130'h00ea68310acfbde73d5ecf5a7def136fb;
    stim[18] = 130'h2a5fc3b1b82b9ab908c2cce01f17f9155;
    stim[19] = 130'h2ac9833ddd52f8ed0dafe1b25ae33de6f;
    stim[20] = 130'h0d3250c5825537d6e8a9a2316470be203;
    stim[21] = 130'h0f1cb2f79c1fe84393be5fceb7b0adf55;
    stim[22] = 130'h35720a09848476b09fe2c7e949eae0bd9;
    stim[23] = 130'h0cc8ca56ad82fc4b9c908eabae3185b2b;
    stim[24] = 130'h007d6fa1c338acf66bf86b60a930bb10d;
    stim[25] = 130'h0ef04a4f3251e445bcf73888a68d1ba63;
    stim[26] = 130'h363edaa2bd6f5f3ae91951c1f3b946d87;
    stim[27] = 130'h1c77696005f19a2ac59ede41956d82a49;
    stim[28] = 130'h28d17af28d6cd741abb0e721be6a56f2d;
    stim[29] = 130'h3b814b5570312e2b150a4c3892ecdf467;
    stim[30] = 130'h273142368818dee8411063f2868c05b3b;
    stim[31] = 130'h0646a15126864af69946e176228ba3f2d;
    stim[32] = 130'h2c3f8a834f94b1c396f026e92c5ef0b15;
    stim[33] = 130'h15e6814666a5cfe6ded4a94eff63d0f25;
    stim[34] = 130'h3f7f5b024207081cdca29294b9b98df59;
    stim[35] = 130'h3d244d3fd857ef82ba5268d3ef5fef29d;
    stim[36] = 130'h3ac35d0c3289f76402e5c1f11dd6f4b7b;
    stim[37] = 130'h3e598091a8aaa3c2e417a001df8b40529;
    stim[38] = 130'h2f5294c1ed5647729127945fdec851f45;
    stim[39] = 130'h2d4821f90083bd60f53e336c288642a21;
    stim[40] = 130'h316e5b9354fc108fc3adf1ca5f6d65993;
    stim[41] = 130'h1400760c62d598042fafa9b2f5bd28b21;
    stim[42] = 130'h15dd136e4b393bbd702882cb82a5873c9;
    stim[43] = 130'h0cd4d794ded749cadaed4ec2fa939d80f;
    stim[44] = 130'h2fd7af4c69a2ea35b0eaf32bc8b83124f;
    stim[45] = 130'h08707693a8ffc479278133bebd85a56eb;
    stim[46] = 130'h33b91f9aa338352fb05e861d492021447;
    stim[47] = 130'h382396a238f584d60feb931ffaa63c247;
    stim[48] = 130'h14944a217eb03ec9370a63b131a7c435b;
    stim[49] = 130'h3abc8a23aaeb7a545aa0af990a882a29b;
    stim[50] = 130'h308ff9d9c618f5411de5c0f8f0afce6d3;
    stim[51] = 130'h10bcdb33417b317c246bad3280e1c4d65;
    stim[52] = 130'h3f6b614c84017a9649175ca169f420fb5;
    stim[53] = 130'h36b0eb021f1bf2fa9b8c913ea9854ad39;
    stim[54] = 130'h16617886c05fe914c8a05d6aeee01b3bd;
    stim[55] = 130'h1322ba193d28ffa4a65aeb32ef4d848cb;
    stim[56] = 130'h0d3cfa0c904f52069ca3d62dfa4d18981;
    stim[57] = 130'h08654646c6179900e5232647eebd9fbc5;
    stim[58] = 130'h1a3a64bfbc6acc28180c7984fdc97d491;
    stim[59] = 130'h3d02d0712f39a383bf279f0878c497d73;
    stim[60] = 130'h3e0e7cbf5283d29fd47f8d3ec1d9c9561;
    stim[61] = 130'h2ceceb49ea2d1f6bd6837bbf33f64f91d;
    stim[62] = 130'h1dd6c93f6455b15d4b17a7066564470f1;
    stim[63] = 130'h31cd3012d07765aa60f2b34c8028c1565;
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
      expv[0] = 147'h0000000000000000000000000000000000000;
      expv[1] = 147'h0000000000000000000000000000000000000;
      expv[2] = 147'h0000000000000000000000000000000000000;
      expv[3] = 147'h5111260fa6ca8000000040000000000000000;
      expv[4] = 147'h5111260fa6ca8000000040000000000000000;
      expv[5] = 147'h5111260fa6ca8000000040000000000000000;
      expv[6] = 147'h5111260fa6ca8000000040000000000000000;
      expv[7] = 147'h5111260fa6ca8000000040000000000000000;
      expv[8] = 147'h5111260fa6ca8000000040000000000000000;
      expv[9] = 147'h5111260fa6ca8000000040000000000000000;
      expv[10] = 147'h5111260fa6ca8000000040000000000000000;
      expv[11] = 147'h5111260fa6ca8000000040000000000000000;
      expv[12] = 147'h5111260fa6ca8000000040000000000000000;
      expv[13] = 147'h5111260fa6ca8000000040000000000000000;
      expv[14] = 147'h5111260fa6ca8000000040000000000000000;
      expv[15] = 147'h5111260fa6ca8000000040000000000000000;
      expv[16] = 147'h5111260fa6ca8000000040000000000000000;
      expv[17] = 147'h5111260fa6ca8000000040000000000000000;
      expv[18] = 147'h5111260fa6ca8000000040000000000000000;
      expv[19] = 147'h5111260fa6ca8000000040000000000000000;
      expv[20] = 147'h5111260fa6ca8000000040000000000000000;
      expv[21] = 147'h5111260fa6ca8000000040000000000000000;
      expv[22] = 147'h5111260fa6ca8000000040000000000000000;
      expv[23] = 147'h5111260fa6ca8000000040000000000000000;
      expv[24] = 147'h5111260fa6ca8000000040000000000000000;
      expv[25] = 147'h5111260fa6ca8000000040000000000000000;
      expv[26] = 147'h5111260fa6ca8000000040000000000000000;
      expv[27] = 147'h5111260fa6ca8000000040000000000000000;
      expv[28] = 147'h5111260fa6ca8000000040000000000000000;
      expv[29] = 147'h5111260fa6ca8000000040000000000000000;
      expv[30] = 147'h5111260fa6ca8000000040000000000000000;
      expv[31] = 147'h5111260fa6ca8000000040000000000000000;
      expv[32] = 147'h5111260fa6ca8000000040000000000000000;
      expv[33] = 147'h5111260fa6ca8000000040000000000000000;
      expv[34] = 147'h5111260fa6ca8000000040000000000000000;
      expv[35] = 147'h5111260fa6ca8000000040000000000000000;
      expv[36] = 147'h5111260fa6ca8000000040000000000000000;
      expv[37] = 147'h5111260fa6ca8000000040000000000000000;
      expv[38] = 147'h5111260fa6ca8000000040000000000000000;
      expv[39] = 147'h5111260fa6ca8000000040000000000000000;
      expv[40] = 147'h5111260fa6ca8000000040000000000000000;
      expv[41] = 147'h5111260fa6ca8000000040000000000000000;
      expv[42] = 147'h5111260fa6ca8000000040000000000000000;
      expv[43] = 147'h5111260fa6ca8000000040000000000000000;
      expv[44] = 147'h5111260fa6ca8000000000000000000000000;
      expv[45] = 147'h5111260fa6ca8000000020000000000000000;
      expv[46] = 147'h5111260fa6ca8000000020000000000000000;
      expv[47] = 147'h5111260fa6ca8000000020000000000000000;
      expv[48] = 147'h5111260fa6ca8000000020000000000000000;
      expv[49] = 147'h5111260fa6ca8000000020000000000000000;
      expv[50] = 147'h5111260fa6ca8000000020000000000000000;
      expv[51] = 147'h5111260fa6ca8000000020000000000000000;
      expv[52] = 147'h5111260fa6ca8000000020000000000000000;
      expv[53] = 147'h5111260fa6ca8000000020000000000000000;
      expv[54] = 147'h5111260fa6ca8000000020000000000000000;
      expv[55] = 147'h5111260fa6ca8000000020000000000000000;
      expv[56] = 147'h5111260fa6ca8000000020000000000000000;
      expv[57] = 147'h5111260fa6ca8000000020000000000000000;
      expv[58] = 147'h5111260fa6ca8000000020000000000000000;
      expv[59] = 147'h5111260fa6ca8000000020000000000000000;
      expv[60] = 147'h5111260fa6ca8000000020000000000000000;
      expv[61] = 147'h5111260fa6ca8000000020000000000000000;
      expv[62] = 147'h5111260fa6ca8000000020000000000000000;
      expv[63] = 147'h5111260fa6ca8000000020000000000000000;
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
