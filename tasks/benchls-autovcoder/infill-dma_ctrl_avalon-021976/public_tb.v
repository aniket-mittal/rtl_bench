// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021976 dut (
    .iClk(clk),
    .iReset_n(in_vec[40:40]),
    .iChip_select(in_vec[39:39]),
    .iWrite(in_vec[38:38]),
    .iRead(in_vec[37:37]),
    .iWM_done(in_vec[36:36]),
    .iAddress(in_vec[35:32]),
    .iWrite_data(in_vec[31:0]),
    .oRM_start(out_vec[129:129]),
    .oWM_start(out_vec[128:128]),
    .oRead_data(out_vec[127:96]),
    .oSrc_address(out_vec[95:64]),
    .oDest_address(out_vec[63:32]),
    .oLength(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h09eb3e2f0fd;
    stim[1] = 41'h0dc9de0cfbc;
    stim[2] = 41'h1c6b9f4ee1c;
    stim[3] = 41'h1d2ab285785;
    stim[4] = 41'h17e1c98936e;
    stim[5] = 41'h15649c76bf1;
    stim[6] = 41'h1567ef3b50c;
    stim[7] = 41'h1ef5a1aa9a4;
    stim[8] = 41'h1f7776afa39;
    stim[9] = 41'h15cedf103ff;
    stim[10] = 41'h1be9abef166;
    stim[11] = 41'h10d6aed4e45;
    stim[12] = 41'h1018f29206d;
    stim[13] = 41'h13012bafd87;
    stim[14] = 41'h15e724b46ac;
    stim[15] = 41'h13c134cdda5;
    stim[16] = 41'h1fe314671d6;
    stim[17] = 41'h1179a9020e2;
    stim[18] = 41'h1e72e2af4d0;
    stim[19] = 41'h14d7e314352;
    stim[20] = 41'h118f06c7ffa;
    stim[21] = 41'h10ebbb82440;
    stim[22] = 41'h1a92f7d2eb6;
    stim[23] = 41'h181c2fff11e;
    stim[24] = 41'h134245cca13;
    stim[25] = 41'h1675ab866d0;
    stim[26] = 41'h161edc6b996;
    stim[27] = 41'h114a612c90b;
    stim[28] = 41'h1923067e2c3;
    stim[29] = 41'h12ebc522471;
    stim[30] = 41'h1f1679b0fde;
    stim[31] = 41'h1321a53582f;
    stim[32] = 41'h140f2d958f5;
    stim[33] = 41'h111f76f4324;
    stim[34] = 41'h1ae28967f10;
    stim[35] = 41'h1eee038c1ec;
    stim[36] = 41'h1b04c182cf8;
    stim[37] = 41'h11c29a7f9d5;
    stim[38] = 41'h1f4a3dc0e2c;
    stim[39] = 41'h16fb16e5ba4;
    stim[40] = 41'h16fc5447881;
    stim[41] = 41'h16c17dcfb4f;
    stim[42] = 41'h168f515bb42;
    stim[43] = 41'h118723f34e8;
    stim[44] = 41'h1cee39dd159;
    stim[45] = 41'h192096718a7;
    stim[46] = 41'h142e76b3a5d;
    stim[47] = 41'h1b9b5116b70;
    stim[48] = 41'h121df85ff0e;
    stim[49] = 41'h1cc577bf236;
    stim[50] = 41'h1b390ddfedf;
    stim[51] = 41'h190472367d0;
    stim[52] = 41'h11e3d87d186;
    stim[53] = 41'h14f9f05ca46;
    stim[54] = 41'h16c242741d1;
    stim[55] = 41'h139ee6203cf;
    stim[56] = 41'h17ed7d54b07;
    stim[57] = 41'h17a074503b9;
    stim[58] = 41'h1a56e2b7654;
    stim[59] = 41'h12b1646e00d;
    stim[60] = 41'h19060870dc1;
    stim[61] = 41'h1203a64677a;
    stim[62] = 41'h190f03a0900;
    stim[63] = 41'h13a65661ec8;
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
      expv[0] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 130'h000000000000000000000000000000000;
      expv[2] = 130'h000000000000000000000000000000000;
      expv[3] = 130'h000000000000000000000000000000000;
      expv[4] = 130'h0000000000000000000000000ab285785;
      expv[5] = 130'h0000000000000000000000000ab285785;
      expv[6] = 130'h0000000000000000000000000ab285785;
      expv[7] = 130'h0000000000000000000000000ab285785;
      expv[8] = 130'h0000000000000000000000000ab285785;
      expv[9] = 130'h0000000000000000000000000ab285785;
      expv[10] = 130'h3000000000000000000000000ab285785;
      expv[11] = 130'h0000000000000000000000000ab285785;
      expv[12] = 130'h0000000000000000000000000ab285785;
      expv[13] = 130'h0000000000000000000000000ab285785;
      expv[14] = 130'h0000000000000000000000000ab285785;
      expv[15] = 130'h0000000000000000000000000ab285785;
      expv[16] = 130'h0000000000000000000000000ab285785;
      expv[17] = 130'h0000000000000000000000000ab285785;
      expv[18] = 130'h0000000000000000000000000ab285785;
      expv[19] = 130'h0000000000000000000000000ab285785;
      expv[20] = 130'h0000000000000000000000000ab285785;
      expv[21] = 130'h0000000000000000000000000ab285785;
      expv[22] = 130'h0000000000000000000000000ab285785;
      expv[23] = 130'h0000000000000000000000000ab285785;
      expv[24] = 130'h0000000000000000000000000ab285785;
      expv[25] = 130'h0000000000000000000000000ab285785;
      expv[26] = 130'h0000000000000000000000000ab285785;
      expv[27] = 130'h0000000000000000000000000ab285785;
      expv[28] = 130'h0000000000000000000000000ab285785;
      expv[29] = 130'h0000000000000000000000000ab285785;
      expv[30] = 130'h0000000000000000000000000ab285785;
      expv[31] = 130'h00000000000000000679b0fdeab285785;
      expv[32] = 130'h00000000000000000679b0fdeab285785;
      expv[33] = 130'h00000000000000000679b0fdeab285785;
      expv[34] = 130'h00000000000000000679b0fdeab285785;
      expv[35] = 130'h00000000000000000679b0fdeab285785;
      expv[36] = 130'h00000000000000000679b0fdeab285785;
      expv[37] = 130'h00000000000000000679b0fdeab285785;
      expv[38] = 130'h00000000000000000679b0fdeab285785;
      expv[39] = 130'h00000000000000000679b0fdeab285785;
      expv[40] = 130'h00000000000000000679b0fdeab285785;
      expv[41] = 130'h00000000000000000679b0fdeab285785;
      expv[42] = 130'h00000000000000000679b0fdeab285785;
      expv[43] = 130'h00000000000000000679b0fdeab285785;
      expv[44] = 130'h00000000000000000679b0fdeab285785;
      expv[45] = 130'h00000000000000000679b0fdeab285785;
      expv[46] = 130'h00000000000000000679b0fdeab285785;
      expv[47] = 130'h00000000000000000679b0fdeab285785;
      expv[48] = 130'h00000000000000000679b0fdeab285785;
      expv[49] = 130'h00000000000000000679b0fdeab285785;
      expv[50] = 130'h00000000000000000679b0fdeab285785;
      expv[51] = 130'h00000000000000000679b0fdeab285785;
      expv[52] = 130'h00000000000000000679b0fdeab285785;
      expv[53] = 130'h00000000000000000679b0fdeab285785;
      expv[54] = 130'h00000000000000000679b0fdeab285785;
      expv[55] = 130'h00000000000000000679b0fdeab285785;
      expv[56] = 130'h00000000000000000679b0fdeab285785;
      expv[57] = 130'h00000000000000000679b0fdeab285785;
      expv[58] = 130'h00000000000000000679b0fdeab285785;
      expv[59] = 130'h00000000000000000679b0fdeab285785;
      expv[60] = 130'h00000000000000000679b0fdeab285785;
      expv[61] = 130'h00000000000000000679b0fdeab285785;
      expv[62] = 130'h00000000000000000679b0fdeab285785;
      expv[63] = 130'h00000000000000000679b0fdeab285785;
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
