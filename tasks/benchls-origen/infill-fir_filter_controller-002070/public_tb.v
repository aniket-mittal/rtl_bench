// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_002070 dut (
    .Sclk(clk),
    .Dclk(in_vec[36:36]),
    .Frame(in_vec[35:35]),
    .S2P_status(in_vec[34:34]),
    .sleep_status(in_vec[33:33]),
    .Reset_n(in_vec[32:32]),
    .col(in_vec[31:0]),
    .rj_status(out_vec[41:41]),
    .coeff_status(out_vec[40:40]),
    .in_status(out_vec[39:39]),
    .alu_status(out_vec[38:38]),
    .address_rj(out_vec[37:30]),
    .address_coeff(out_vec[29:22]),
    .address_in(out_vec[21:14]),
    .cont_address(out_vec[13:4]),
    .InReady(out_vec[3:3]),
    .Start(out_vec[2:2]),
    .clear(out_vec[1:1]),
    .set(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0cb9414f06;
    stim[1] = 37'h08aef092bd;
    stim[2] = 37'h19f6511efa;
    stim[3] = 37'h05d8349db9;
    stim[4] = 37'h0f7275b3df;
    stim[5] = 37'h019cc1e977;
    stim[6] = 37'h1534d5e606;
    stim[7] = 37'h01d21ae8ee;
    stim[8] = 37'h0170608bc1;
    stim[9] = 37'h0f2bf47509;
    stim[10] = 37'h0bf1a8df2d;
    stim[11] = 37'h0d49bd9793;
    stim[12] = 37'h1730e45c20;
    stim[13] = 37'h0536d467a9;
    stim[14] = 37'h0150ed847d;
    stim[15] = 37'h1320861de8;
    stim[16] = 37'h17feff8c09;
    stim[17] = 37'h1ff9cc4b89;
    stim[18] = 37'h075579cd29;
    stim[19] = 37'h0528401b70;
    stim[20] = 37'h09d2ce46a5;
    stim[21] = 37'h0908eba5ef;
    stim[22] = 37'h0768ecdf80;
    stim[23] = 37'h0fac538745;
    stim[24] = 37'h170383cca7;
    stim[25] = 37'h15380a97ee;
    stim[26] = 37'h0361d2bca6;
    stim[27] = 37'h05f6f8d759;
    stim[28] = 37'h014efeda96;
    stim[29] = 37'h056b371075;
    stim[30] = 37'h1158e57b5b;
    stim[31] = 37'h07d977c9c5;
    stim[32] = 37'h1ddcb83214;
    stim[33] = 37'h1db25e24a6;
    stim[34] = 37'h173e13ed53;
    stim[35] = 37'h0f9bcb33b6;
    stim[36] = 37'h19db265f92;
    stim[37] = 37'h19c7c9dc52;
    stim[38] = 37'h0d3d218093;
    stim[39] = 37'h116c220c04;
    stim[40] = 37'h05b1b45ab0;
    stim[41] = 37'h0106439090;
    stim[42] = 37'h0b2d7fe760;
    stim[43] = 37'h1f7881627e;
    stim[44] = 37'h05cab8d978;
    stim[45] = 37'h0383627b82;
    stim[46] = 37'h0b067b3931;
    stim[47] = 37'h1bcbb5ea98;
    stim[48] = 37'h0d32c28511;
    stim[49] = 37'h1dbf22893e;
    stim[50] = 37'h053811db59;
    stim[51] = 37'h17c732b7d6;
    stim[52] = 37'h07d405e69c;
    stim[53] = 37'h1b39a5fa87;
    stim[54] = 37'h0f2e37fe45;
    stim[55] = 37'h13440e6a23;
    stim[56] = 37'h1fb1544f97;
    stim[57] = 37'h09524698e0;
    stim[58] = 37'h13345957d1;
    stim[59] = 37'h0d727714d7;
    stim[60] = 37'h137e2156c2;
    stim[61] = 37'h0535ec647e;
    stim[62] = 37'h0f8d6a23b9;
    stim[63] = 37'h056f83f8cb;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h00000000000;
      expv[6] = 42'h00000000000;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h0c00000000c;
      expv[10] = 42'h0c00000000c;
      expv[11] = 42'h00000000000;
      expv[12] = 42'h00000000000;
      expv[13] = 42'h00000000000;
      expv[14] = 42'h00000000000;
      expv[15] = 42'h00000000000;
      expv[16] = 42'h00000000000;
      expv[17] = 42'h00000000000;
      expv[18] = 42'h00000000000;
      expv[19] = 42'h00000000000;
      expv[20] = 42'h00000000000;
      expv[21] = 42'h00000000000;
      expv[22] = 42'h00000000000;
      expv[23] = 42'h20000000000;
      expv[24] = 42'h00000000000;
      expv[25] = 42'h00000000000;
      expv[26] = 42'h00000000000;
      expv[27] = 42'h00000000000;
      expv[28] = 42'h00000000000;
      expv[29] = 42'h00000000000;
      expv[30] = 42'h00000000000;
      expv[31] = 42'h0c00000000c;
      expv[32] = 42'h0c00000000c;
      expv[33] = 42'h00000000000;
      expv[34] = 42'h00000000000;
      expv[35] = 42'h00000000000;
      expv[36] = 42'h00000000000;
      expv[37] = 42'h00000000000;
      expv[38] = 42'h00000000000;
      expv[39] = 42'h00000000000;
      expv[40] = 42'h20000000000;
      expv[41] = 42'h20040000000;
      expv[42] = 42'h20080000000;
      expv[43] = 42'h200c0000000;
      expv[44] = 42'h000c0000000;
      expv[45] = 42'h000c0000000;
      expv[46] = 42'h000c0000000;
      expv[47] = 42'h000c0000000;
      expv[48] = 42'h000c0000000;
      expv[49] = 42'h000c0000000;
      expv[50] = 42'h000c0000000;
      expv[51] = 42'h000c0000000;
      expv[52] = 42'h0c0c000000c;
      expv[53] = 42'h000c0000000;
      expv[54] = 42'h000c0000000;
      expv[55] = 42'h000c0000000;
      expv[56] = 42'h000c0000000;
      expv[57] = 42'h000c0000000;
      expv[58] = 42'h000c0000000;
      expv[59] = 42'h000c0000000;
      expv[60] = 42'h000c0000000;
      expv[61] = 42'h000c0000000;
      expv[62] = 42'h000c0000000;
      expv[63] = 42'h000c0000000;
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
