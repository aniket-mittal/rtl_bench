// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10945 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
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
    stim[0] = 42'h33d0c0800b7;
    stim[1] = 42'h2a4da212601;
    stim[2] = 42'h119e2c38475;
    stim[3] = 42'h2d404d82b70;
    stim[4] = 42'h2fcb96f66bd;
    stim[5] = 42'h03854af478e;
    stim[6] = 42'h05f3bf67fab;
    stim[7] = 42'h0b7faa644f8;
    stim[8] = 42'h196dadb2bb5;
    stim[9] = 42'h16dd94b9e06;
    stim[10] = 42'h08721f3b769;
    stim[11] = 42'h0d181891965;
    stim[12] = 42'h3b70e5ff0aa;
    stim[13] = 42'h339efea829d;
    stim[14] = 42'h0fdc0de02ff;
    stim[15] = 42'h10579da9b43;
    stim[16] = 42'h196c2428170;
    stim[17] = 42'h1446a1d9618;
    stim[18] = 42'h100584c8adf;
    stim[19] = 42'h3732c538f8f;
    stim[20] = 42'h0c5cbd97b29;
    stim[21] = 42'h1d86c43310e;
    stim[22] = 42'h130adec13c5;
    stim[23] = 42'h303268810b2;
    stim[24] = 42'h01c6d141830;
    stim[25] = 42'h0efe22b3098;
    stim[26] = 42'h16d3b6dbe9d;
    stim[27] = 42'h091d563a770;
    stim[28] = 42'h1a9582e8e7b;
    stim[29] = 42'h0b57f362c94;
    stim[30] = 42'h206e6ed2f90;
    stim[31] = 42'h16597c6e2c4;
    stim[32] = 42'h39e7ad51f32;
    stim[33] = 42'h27382e9c1e5;
    stim[34] = 42'h079e369195b;
    stim[35] = 42'h2a389be6226;
    stim[36] = 42'h0d1709abf61;
    stim[37] = 42'h1e100717a25;
    stim[38] = 42'h0b7d4e21930;
    stim[39] = 42'h0fc5ca7037d;
    stim[40] = 42'h216cd285cad;
    stim[41] = 42'h329c83c33d8;
    stim[42] = 42'h3201d944a1f;
    stim[43] = 42'h21e8edcde90;
    stim[44] = 42'h3ba37986fcc;
    stim[45] = 42'h0c89f86409f;
    stim[46] = 42'h27530000506;
    stim[47] = 42'h0333d7e0db6;
    stim[48] = 42'h3234dc797fb;
    stim[49] = 42'h13846c9cb31;
    stim[50] = 42'h0d34bd62d58;
    stim[51] = 42'h3259b0b4804;
    stim[52] = 42'h3927d2a7aaf;
    stim[53] = 42'h32f16574f27;
    stim[54] = 42'h0d1551bfb8f;
    stim[55] = 42'h3d68f1a8735;
    stim[56] = 42'h1e5e20761ac;
    stim[57] = 42'h293a398d3c5;
    stim[58] = 42'h12dfaca36dd;
    stim[59] = 42'h007e7da8949;
    stim[60] = 42'h2b5d94e2f4c;
    stim[61] = 42'h1486d4673ea;
    stim[62] = 42'h0724d3d17e2;
    stim[63] = 42'h20dad558a8e;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'hxxxxxxxxxx000;
      expv[8] = 51'hxxxxxxxxxx000;
      expv[9] = 51'h4b6d6d95da200;
      expv[10] = 51'h4b6d6d95da000;
      expv[11] = 51'h4b6d6d95da000;
      expv[12] = 51'h4b6d6d95da000;
      expv[13] = 51'h5b872ff854100;
      expv[14] = 51'h5b872ff854000;
      expv[15] = 51'h5b872ff854000;
      expv[16] = 51'h02bced4da0080;
      expv[17] = 51'h02bced4da0000;
      expv[18] = 51'h22350ecb0c040;
      expv[19] = 51'h22350ecb0c000;
      expv[20] = 51'h22350ecb0c000;
      expv[21] = 51'h22350ecb0c000;
      expv[22] = 51'h6c36219886020;
      expv[23] = 51'h6c36219886000;
      expv[24] = 51'h6c36219886000;
      expv[25] = 51'h0e368a0c18001;
      expv[26] = 51'h0e368a0c18000;
      expv[27] = 51'h369db6df4e100;
      expv[28] = 51'h369db6df4e000;
      expv[29] = 51'h369db6df4e000;
      expv[30] = 51'h369db6df4e000;
      expv[31] = 51'h369db6df4e000;
      expv[32] = 51'h32cbe37162040;
      expv[33] = 51'h32cbe37162000;
      expv[34] = 51'h32cbe37162000;
      expv[35] = 51'h32cbe37162000;
      expv[36] = 51'h51c4df3112020;
      expv[37] = 51'h51c4df3112000;
      expv[38] = 51'h708038bd12100;
      expv[39] = 51'h708038bd12000;
      expv[40] = 51'h708038bd12000;
      expv[41] = 51'h708038bd12000;
      expv[42] = 51'h708038bd12000;
      expv[43] = 51'h708038bd12000;
      expv[44] = 51'h708038bd12000;
      expv[45] = 51'h708038bd12000;
      expv[46] = 51'h644fc3204e002;
      expv[47] = 51'h644fc3204e000;
      expv[48] = 51'h644fc3204e000;
      expv[49] = 51'h11a6e3cbfc080;
      expv[50] = 51'h11a6e3cbfc000;
      expv[51] = 51'h11a6e3cbfc000;
      expv[52] = 51'h11a6e3cbfc000;
      expv[53] = 51'h11a6e3cbfc000;
      expv[54] = 51'h11a6e3cbfc000;
      expv[55] = 51'h11a6e3cbfc000;
      expv[56] = 51'h6b478d439a080;
      expv[57] = 51'h6b478d439a000;
      expv[58] = 51'h6b478d439a000;
      expv[59] = 51'h6b478d439a000;
      expv[60] = 51'h6b478d439a000;
      expv[61] = 51'h6b478d439a000;
      expv[62] = 51'h6b478d439a000;
      expv[63] = 51'h6b478d439a000;
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
