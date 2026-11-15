// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_004581 dut (
    .pd_data_in1(in_vec[48:48]),
    .pd_data_in0(in_vec[47:47]),
    .iclkin_dist_in1(in_vec[46:46]),
    .iclkin_dist_in0(in_vec[45:45]),
    .idata0_in1(in_vec[44:44]),
    .idata0_in0(in_vec[43:43]),
    .idata1_in1(in_vec[42:42]),
    .idata1_in0(in_vec[41:41]),
    .idataselb_in1(in_vec[40:40]),
    .idataselb_in0(in_vec[39:39]),
    .iddren_in1(in_vec[38:38]),
    .iddren_in0(in_vec[37:37]),
    .ilaunch_clk_in1(in_vec[36:36]),
    .ilaunch_clk_in0(in_vec[35:35]),
    .ilpbk_dat_in1(in_vec[34:34]),
    .ilpbk_dat_in0(in_vec[33:33]),
    .ilpbk_en_in1(in_vec[32:32]),
    .ilpbk_en_in0(in_vec[31:31]),
    .irxen_in1(in_vec[30:28]),
    .irxen_in0(in_vec[27:25]),
    .istrbclk_in1(in_vec[24:24]),
    .istrbclk_in0(in_vec[23:23]),
    .itxen_in1(in_vec[22:22]),
    .itxen_in0(in_vec[21:21]),
    .indrv_in1(in_vec[20:19]),
    .indrv_in0(in_vec[18:17]),
    .ipdrv_in1(in_vec[16:15]),
    .ipdrv_in0(in_vec[14:13]),
    .async_dat_in1(in_vec[12:12]),
    .async_dat_in0(in_vec[11:11]),
    .oclkb_in1(in_vec[10:10]),
    .oclkb_in0(in_vec[9:9]),
    .oclk_in1(in_vec[8:8]),
    .oclk_in0(in_vec[7:7]),
    .odat0_in1(in_vec[6:6]),
    .odat0_in0(in_vec[5:5]),
    .odat1_in1(in_vec[4:4]),
    .odat1_in0(in_vec[3:3]),
    .odat_async_in1(in_vec[2:2]),
    .odat_async_in0(in_vec[1:1]),
    .shift_en(in_vec[0:0]),
    .iclkin_dist_out(out_vec[23:23]),
    .idata0_out(out_vec[22:22]),
    .idata1_out(out_vec[21:21]),
    .idataselb_out(out_vec[20:20]),
    .iddren_out(out_vec[19:19]),
    .ilaunch_clk_out(out_vec[18:18]),
    .ilpbk_dat_out(out_vec[17:17]),
    .ilpbk_en_out(out_vec[16:16]),
    .irxen_out(out_vec[15:13]),
    .istrbclk_out(out_vec[12:12]),
    .itxen_out(out_vec[11:11]),
    .indrv_out(out_vec[10:9]),
    .ipdrv_out(out_vec[8:7]),
    .async_dat_out(out_vec[6:6]),
    .pd_data_out(out_vec[5:5]),
    .oclkb_out(out_vec[4:4]),
    .oclk_out(out_vec[3:3]),
    .odat0_out(out_vec[2:2]),
    .odat1_out(out_vec[1:1]),
    .odat_async_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h06afdc3e526c9;
    stim[1] = 49'h0a2aef6b0f520;
    stim[2] = 49'h19b4c1924404e;
    stim[3] = 49'h181ec8afa41ee;
    stim[4] = 49'h04b58e16be428;
    stim[5] = 49'h0557d5cde1843;
    stim[6] = 49'h0d8ea2e43665f;
    stim[7] = 49'h04cd46c62e22e;
    stim[8] = 49'h0b5d7da3cf6c9;
    stim[9] = 49'h0bef28b41b589;
    stim[10] = 49'h0c87eea2dd9a9;
    stim[11] = 49'h1dceffcd297f0;
    stim[12] = 49'h03ec360b0d601;
    stim[13] = 49'h18aea4eeeff1c;
    stim[14] = 49'h14c69e3b42939;
    stim[15] = 49'h058721ea2b865;
    stim[16] = 49'h179a3c1056e5a;
    stim[17] = 49'h069b0c517492c;
    stim[18] = 49'h1dad0b7e9e52c;
    stim[19] = 49'h02460943e1641;
    stim[20] = 49'h0cdc3156ba055;
    stim[21] = 49'h1c0c94fe07151;
    stim[22] = 49'h0e458f3a67ea1;
    stim[23] = 49'h033f713341283;
    stim[24] = 49'h0f6bd7c72e821;
    stim[25] = 49'h011996816fd76;
    stim[26] = 49'h012ac2583eb47;
    stim[27] = 49'h18674ea67e67a;
    stim[28] = 49'h1209802c7acf4;
    stim[29] = 49'h187c07e794541;
    stim[30] = 49'h18e392124a561;
    stim[31] = 49'h17afa7cbb1ca6;
    stim[32] = 49'h1972e45907e2f;
    stim[33] = 49'h05a78e02ecc0e;
    stim[34] = 49'h1d144164611c1;
    stim[35] = 49'h090e0efd03010;
    stim[36] = 49'h104652c1f3d9e;
    stim[37] = 49'h16c941b6e0757;
    stim[38] = 49'h1aab02eb7ed15;
    stim[39] = 49'h0fef2639433e4;
    stim[40] = 49'h0a49dbf81b84d;
    stim[41] = 49'h17eb65c1014ca;
    stim[42] = 49'h0b92f9be32e8c;
    stim[43] = 49'h0c2e9cc6cbaa8;
    stim[44] = 49'h0e74ca0e50966;
    stim[45] = 49'h1c53bf4237c43;
    stim[46] = 49'h1529911e9c5a5;
    stim[47] = 49'h0ecfb5bab1fc6;
    stim[48] = 49'h08e0a301db46a;
    stim[49] = 49'h122d5082bbec3;
    stim[50] = 49'h0fc0d461204e7;
    stim[51] = 49'h0e57a244bccfc;
    stim[52] = 49'h073a7f39b7b58;
    stim[53] = 49'h0867c0d3297b3;
    stim[54] = 49'h0a6504d3fefce;
    stim[55] = 49'h003870629732a;
    stim[56] = 49'h062398565ede5;
    stim[57] = 49'h1486acded23f8;
    stim[58] = 49'h12fa3f15b388f;
    stim[59] = 49'h1ccbce69fe5cb;
    stim[60] = 49'h0bd915710263e;
    stim[61] = 49'h009539ae66bd3;
    stim[62] = 49'h0def9b1e591e9;
    stim[63] = 49'h19568578da2c6;
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
      expv[0] = 24'h8f9914;
      expv[1] = 24'hbf79a4;
      expv[2] = 24'h648d23;
      expv[3] = 24'h1dbb2f;
      expv[4] = 24'h650b86;
      expv[5] = 24'hffae44;
      expv[6] = 24'hc84917;
      expv[7] = 24'h50cb97;
      expv[8] = 24'h7fa6d4;
      expv[9] = 24'h6c19d8;
      expv[10] = 24'h8ec3c8;
      expv[11] = 24'h5fd23c;
      expv[12] = 24'h69c4d0;
      expv[13] = 24'h7efff2;
      expv[14] = 24'ha9d42a;
      expv[15] = 24'hcc20c5;
      expv[16] = 24'hdb05d3;
      expv[17] = 24'hd94746;
      expv[18] = 24'h7179a6;
      expv[19] = 24'h282654;
      expv[20] = 24'hb93b87;
      expv[21] = 24'h89986e;
      expv[22] = 24'hacf050;
      expv[23] = 24'h5f3440;
      expv[24] = 24'he7ec80;
      expv[25] = 24'h1487c5;
      expv[26] = 24'h42518d;
      expv[27] = 24'h29afb7;
      expv[28] = 24'h9436cc;
      expv[29] = 24'h38ef3c;
      expv[30] = 24'h2550bc;
      expv[31] = 24'hfeda4d;
      expv[32] = 24'h729471;
      expv[33] = 24'h6d0f43;
      expv[34] = 24'hda286c;
      expv[35] = 24'h19f0a0;
      expv[36] = 24'h08c6cb;
      expv[37] = 24'ha63a3f;
      expv[38] = 24'h0445bb;
      expv[39] = 24'hfa34bc;
      expv[40] = 24'h2771c5;
      expv[41] = 24'hfac00b;
      expv[42] = 24'hcfbafa;
      expv[43] = 24'h3dccfe;
      expv[44] = 24'ha51c65;
      expv[45] = 24'hb5e174;
      expv[46] = 24'hc53bb9;
      expv[47] = 24'hdeba79;
      expv[48] = 24'h6604a7;
      expv[49] = 24'h0f03f4;
      expv[50] = 24'he38415;
      expv[51] = 24'h8e436e;
      expv[52] = 24'hbb33d2;
      expv[53] = 24'h2e14da;
      expv[54] = 24'ha0cffb;
      expv[55] = 24'h326997;
      expv[56] = 24'h85199d;
      expv[57] = 24'h4fdc9e;
      expv[58] = 24'h31ff61;
      expv[59] = 24'ha6c7bc;
      expv[60] = 24'hd060b7;
      expv[61] = 24'h1d280e;
      expv[62] = 24'hed79cc;
      expv[63] = 24'h0c74b9;
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
