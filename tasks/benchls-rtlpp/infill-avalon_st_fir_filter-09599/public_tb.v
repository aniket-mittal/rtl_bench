// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09599 dut (
    .clk(clk),
    .reset_n(in_vec[68:68]),
    .ast_sink_data(in_vec[67:40]),
    .ast_sink_valid(in_vec[39:39]),
    .ast_source_ready(in_vec[38:38]),
    .ast_sink_sop(in_vec[37:37]),
    .ast_sink_eop(in_vec[36:36]),
    .ast_sink_error(in_vec[35:34]),
    .coef_we(in_vec[33:33]),
    .coef_in(in_vec[32:1]),
    .coef_in_clk(in_vec[0:0]),
    .ast_source_data(out_vec[35:8]),
    .ast_sink_ready(out_vec[7:7]),
    .ast_source_valid(out_vec[6:6]),
    .ast_source_sop(out_vec[5:5]),
    .ast_source_eop(out_vec[4:4]),
    .ast_source_channel(out_vec[3:2]),
    .ast_source_error(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h0300f7036505bb8947;
    stim[1] = 69'h08e97b161d170f22d3;
    stim[2] = 69'h117b3d12240bb515ff;
    stim[3] = 69'h15a521af4405536759;
    stim[4] = 69'h1098ce9d026c6f8638;
    stim[5] = 69'h1e88d5a30cce3475be;
    stim[6] = 69'h15afac2075e84e7455;
    stim[7] = 69'h1d4afc7c2f14fd0de6;
    stim[8] = 69'h1555da9755f679d254;
    stim[9] = 69'h1c7db9036addc7eec2;
    stim[10] = 69'h15316eada30683eff2;
    stim[11] = 69'h17d7e369174202b9af;
    stim[12] = 69'h0a84bc887c0a944dc9;
    stim[13] = 69'h19f9b6eb64a87ad2cd;
    stim[14] = 69'h1099f8dcff35a81e4c;
    stim[15] = 69'h18f8abf7ebb2cf4d81;
    stim[16] = 69'h166ec85e7fca112b90;
    stim[17] = 69'h110cdcf1d0c3c3f2d5;
    stim[18] = 69'h17696daade53f3d563;
    stim[19] = 69'h186ac169ca0a388b8c;
    stim[20] = 69'h10085bad2ebf48cf85;
    stim[21] = 69'h1f07e536bb5ed2fe22;
    stim[22] = 69'h11a352e2cb6aaa0230;
    stim[23] = 69'h1862a4d9d73c7e75cc;
    stim[24] = 69'h18a4d7e42d71d6dee9;
    stim[25] = 69'h160a2a7276b57db730;
    stim[26] = 69'h1014ca2d25aaf359f9;
    stim[27] = 69'h17ae1b7a2eddc97832;
    stim[28] = 69'h17887ef0e7b6446c02;
    stim[29] = 69'h142ba63fa2f525d87a;
    stim[30] = 69'h109382040d75321af4;
    stim[31] = 69'h0b1f10416998c7bbf9;
    stim[32] = 69'h1a118bf956d6469b5b;
    stim[33] = 69'h1aeee43bcee732dd21;
    stim[34] = 69'h12b33b24dca57cffe7;
    stim[35] = 69'h17dbd32ec4cc25e05c;
    stim[36] = 69'h1835272a7c8bfd372b;
    stim[37] = 69'h17d126b420a6d8db83;
    stim[38] = 69'h1670c69025da2d83e3;
    stim[39] = 69'h1714e6edf592e13856;
    stim[40] = 69'h113a67440f334c891d;
    stim[41] = 69'h14b060ec35ccff85bb;
    stim[42] = 69'h170e3b7f00adcdab56;
    stim[43] = 69'h13d7d005d12e1adb53;
    stim[44] = 69'h12d443a8521eb75244;
    stim[45] = 69'h1c579ef6cb23ca8611;
    stim[46] = 69'h1c3e37fa669c3cd9a4;
    stim[47] = 69'h187558ca5db8d51f22;
    stim[48] = 69'h13f46473327db5a8e2;
    stim[49] = 69'h1daf161c7269caef38;
    stim[50] = 69'h1f584466da433272d3;
    stim[51] = 69'h1aef05ce011639cf5a;
    stim[52] = 69'h1d33cb1bcd5b19e6d1;
    stim[53] = 69'h18c7d263754e968d67;
    stim[54] = 69'h1996a5e3e11e0495da;
    stim[55] = 69'h1b011969a4d4675870;
    stim[56] = 69'h1f056dd2820fc7a7eb;
    stim[57] = 69'h1e32c9ec95c1b12822;
    stim[58] = 69'h1495a2a7fdce8b666b;
    stim[59] = 69'h1b0558354e87c8fa91;
    stim[60] = 69'h10bfa56c7672dcce41;
    stim[61] = 69'h105e130873cebb21b8;
    stim[62] = 69'h1bb23ea718efba0bc7;
    stim[63] = 69'h1544b7f62bdc684361;
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
      expv[0] = 36'h000000080;
      expv[1] = 36'h000000080;
      expv[2] = 36'h000000080;
      expv[3] = 36'h000000080;
      expv[4] = 36'h000000080;
      expv[5] = 36'h000000080;
      expv[6] = 36'h000000080;
      expv[7] = 36'h000000080;
      expv[8] = 36'h000000080;
      expv[9] = 36'h000000080;
      expv[10] = 36'h000000080;
      expv[11] = 36'h0000000e0;
      expv[12] = 36'h000000080;
      expv[13] = 36'h000000080;
      expv[14] = 36'h000000080;
      expv[15] = 36'h0000000fc;
      expv[16] = 36'h0000000e8;
      expv[17] = 36'h0000000a8;
      expv[18] = 36'h0000000d0;
      expv[19] = 36'h0000000dc;
      expv[20] = 36'h0000000c8;
      expv[21] = 36'h000000088;
      expv[22] = 36'h0000000f8;
      expv[23] = 36'h0000000c8;
      expv[24] = 36'h0000000d4;
      expv[25] = 36'h000000094;
      expv[26] = 36'h000000094;
      expv[27] = 36'h000000094;
      expv[28] = 36'h000000094;
      expv[29] = 36'h0000000e4;
      expv[30] = 36'h0000000e0;
      expv[31] = 36'h000000080;
      expv[32] = 36'h000000080;
      expv[33] = 36'h000000080;
      expv[34] = 36'h0000000cc;
      expv[35] = 36'h0000000dc;
      expv[36] = 36'h0000000c4;
      expv[37] = 36'h000000084;
      expv[38] = 36'h000000084;
      expv[39] = 36'h000000084;
      expv[40] = 36'h0000000f4;
      expv[41] = 36'h0000000b4;
      expv[42] = 36'h0000000b4;
      expv[43] = 36'h0000000b4;
      expv[44] = 36'h0000000d0;
      expv[45] = 36'h000000090;
      expv[46] = 36'h0000000c8;
      expv[47] = 36'h000000088;
      expv[48] = 36'h000000088;
      expv[49] = 36'h000000088;
      expv[50] = 36'h000000088;
      expv[51] = 36'h0000000d8;
      expv[52] = 36'h000000098;
      expv[53] = 36'h0000000cc;
      expv[54] = 36'h00000008c;
      expv[55] = 36'h0000000e0;
      expv[56] = 36'h0000000e4;
      expv[57] = 36'h0000000c0;
      expv[58] = 36'h0000000d4;
      expv[59] = 36'h0000000fc;
      expv[60] = 36'h0000000bc;
      expv[61] = 36'h0000000bc;
      expv[62] = 36'h0000000bc;
      expv[63] = 36'h0000000bc;
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
