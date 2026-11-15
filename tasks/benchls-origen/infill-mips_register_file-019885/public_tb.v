// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_019885 dut (
    .clk(clk),
    .write_data(in_vec[59:28]),
    .alu_op_in(in_vec[27:22]),
    .read_sel_0(in_vec[21:17]),
    .read_sel_1(in_vec[16:12]),
    .read_sel_2(in_vec[11:7]),
    .write_address(in_vec[6:2]),
    .RegWrite(in_vec[1:1]),
    .LuiControl(in_vec[0:0]),
    .read_data_1(out_vec[63:32]),
    .read_data_2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'hd984a2f4483c236;
    stim[1] = 60'hf80d1b9572777cc;
    stim[2] = 60'h3c45ddd5e4b1d16;
    stim[3] = 60'hc809f1b82bf4a63;
    stim[4] = 60'hb8d5eee5a65538d;
    stim[5] = 60'h75ac64d87ff8ff6;
    stim[6] = 60'h8b5a1e7e0d071d2;
    stim[7] = 60'h05a640f7e0f7c13;
    stim[8] = 60'h3588a376fc13a72;
    stim[9] = 60'h6e807a5b7169d07;
    stim[10] = 60'h16038d2d0ed988d;
    stim[11] = 60'h596eb028bd06084;
    stim[12] = 60'h5d26458063a209c;
    stim[13] = 60'hda2eae57aa4075c;
    stim[14] = 60'haa429a949f943e2;
    stim[15] = 60'h12f2c9b63a972d0;
    stim[16] = 60'hfe040355031b1a2;
    stim[17] = 60'h9baf253b6f2b629;
    stim[18] = 60'h7f77e787ef6cdb1;
    stim[19] = 60'h9f14d0d5e4804da;
    stim[20] = 60'h24b6a898b452504;
    stim[21] = 60'hef7459673600e44;
    stim[22] = 60'h09961523e008eb1;
    stim[23] = 60'h8a01a6841103666;
    stim[24] = 60'hd5d3537d55b86d6;
    stim[25] = 60'h26404e7c31a63cd;
    stim[26] = 60'h34b3afa1d44f7f3;
    stim[27] = 60'hd82331124c9e4b4;
    stim[28] = 60'hf167884ae691fa7;
    stim[29] = 60'hd291b4720faf5ce;
    stim[30] = 60'h2e8f92648eed739;
    stim[31] = 60'he2a6ffd24e7334d;
    stim[32] = 60'h85b0602807f9da8;
    stim[33] = 60'hcb518bb73ed57b5;
    stim[34] = 60'hf266f1ee85ff983;
    stim[35] = 60'h223959d7a6cc082;
    stim[36] = 60'hd7198d60f09bd54;
    stim[37] = 60'h51526cbf152a435;
    stim[38] = 60'h21aca7b5c29c472;
    stim[39] = 60'hd8d16f7034c3664;
    stim[40] = 60'h46670159ff0159f;
    stim[41] = 60'h16c04321a54743e;
    stim[42] = 60'h45bdcb42885d909;
    stim[43] = 60'h34fc13e26aef4d0;
    stim[44] = 60'h96268d343f0fdf5;
    stim[45] = 60'h983ebf802eaaa3f;
    stim[46] = 60'h70ff1a1eb231014;
    stim[47] = 60'hf0a78a7c32b56bd;
    stim[48] = 60'ha2568f7dc41fd0d;
    stim[49] = 60'hdd36fb13ffe3383;
    stim[50] = 60'hceb3e179449e3c5;
    stim[51] = 60'h85ebd2818c0a0dc;
    stim[52] = 60'h2c99d8d159c5546;
    stim[53] = 60'h49ef1b87fcec1ba;
    stim[54] = 60'h47fffe92603ecfb;
    stim[55] = 60'hfcfc9fd7e26631e;
    stim[56] = 60'hb3767de5dbfc422;
    stim[57] = 60'h40cbbb2db8f38f3;
    stim[58] = 60'hf66f123f6cc4ce4;
    stim[59] = 60'h0dfc075800f8e84;
    stim[60] = 60'h6f158ac26692a24;
    stim[61] = 60'hb92185a95ef7397;
    stim[62] = 60'hf1b1f6783ed3ba6;
    stim[63] = 60'h9af3b49f6c16058;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'hf1b8000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h00000000f1b80000;
      expv[8] = 64'h000000008b5a1e7e;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h000000007a5b0000;
      expv[12] = 64'h000000007a5b0000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h8b5a1e7e00000000;
      expv[15] = 64'h000000003c45ddd5;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h000000003588a376;
      expv[22] = 64'hfe04035575ac64d8;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'haa429a94d984a2f4;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'hd984a2f400000000;
      expv[31] = 64'hd291b47200000000;
      expv[32] = 64'h000000008a01a684;
      expv[33] = 64'hd5d3537d00000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h000000007a5b0000;
      expv[36] = 64'h40f7000000000000;
      expv[37] = 64'h00000000fe040355;
      expv[38] = 64'hafa1a376fe040355;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h7a5b000000000000;
      expv[41] = 64'h01590000fe040355;
      expv[42] = 64'h75ac64d800000000;
      expv[43] = 64'h16c04321884a0000;
      expv[44] = 64'h16c0432100000000;
      expv[45] = 64'h000000008b5a1e7e;
      expv[46] = 64'h00000000223959d7;
      expv[47] = 64'hd5d3537dd984a2f4;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000001590000;
      expv[50] = 64'h0000000001590000;
      expv[51] = 64'h000000007a5b0000;
      expv[52] = 64'h3c45ddd500000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h000000008a01a684;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h21aca7b5fe040355;
      expv[57] = 64'hd291b4722c99d8d1;
      expv[58] = 64'h40f700008a01a684;
      expv[59] = 64'haa429a9475ac64d8;
      expv[60] = 64'h000000008b5a1e7e;
      expv[61] = 64'h00000000fcfc9fd7;
      expv[62] = 64'hd291b47200000000;
      expv[63] = 64'h9f14d0d5fb1359d7;
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
