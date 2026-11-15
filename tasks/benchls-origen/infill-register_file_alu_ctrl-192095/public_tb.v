// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_192095 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .ins(in_vec[34:19]),
    .rd_alu(in_vec[18:16]),
    .data_alu(in_vec[15:0]),
    .r1_data(out_vec[40:25]),
    .r2_data(out_vec[24:9]),
    .imm_data(out_vec[8:6]),
    .rd(out_vec[5:3]),
    .aluop(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb9a8057dc;
    stim[1] = 36'hce8ada9a8;
    stim[2] = 36'h43cb74193;
    stim[3] = 36'h648d48afa;
    stim[4] = 36'h203518076;
    stim[5] = 36'h21b0f6824;
    stim[6] = 36'h00e2f2e9a;
    stim[7] = 36'h3afc14846;
    stim[8] = 36'h535c401d5;
    stim[9] = 36'h18f6c9e07;
    stim[10] = 36'h3eb2efc6b;
    stim[11] = 36'h1f01c8928;
    stim[12] = 36'h0dca24f82;
    stim[13] = 36'h5ceb3766a;
    stim[14] = 36'h0bf7c39db;
    stim[15] = 36'h3185d2750;
    stim[16] = 36'h7e675ffee;
    stim[17] = 36'h5b12591e0;
    stim[18] = 36'h32297e201;
    stim[19] = 36'h09aad8269;
    stim[20] = 36'h7e61331a7;
    stim[21] = 36'h4b6fefe44;
    stim[22] = 36'h4bf238bcf;
    stim[23] = 36'h3ccdb84bb;
    stim[24] = 36'h1b2312211;
    stim[25] = 36'h1d56510e7;
    stim[26] = 36'h15e755927;
    stim[27] = 36'h06610f1a0;
    stim[28] = 36'h73d703668;
    stim[29] = 36'h6306f8756;
    stim[30] = 36'h7583ba3e2;
    stim[31] = 36'h2cd4bc6e8;
    stim[32] = 36'h692f36076;
    stim[33] = 36'h04292b36a;
    stim[34] = 36'h44506cc1d;
    stim[35] = 36'h55124378e;
    stim[36] = 36'h5f8563b41;
    stim[37] = 36'h3e0dc3abe;
    stim[38] = 36'h63e9e8d4b;
    stim[39] = 36'h5b9e2a915;
    stim[40] = 36'h10eae3533;
    stim[41] = 36'h5ce30871a;
    stim[42] = 36'h39588d968;
    stim[43] = 36'h2262f7656;
    stim[44] = 36'h50685d029;
    stim[45] = 36'h57b1f734c;
    stim[46] = 36'h4d4c8b66a;
    stim[47] = 36'h0d3564201;
    stim[48] = 36'h31d392c89;
    stim[49] = 36'h66ec63490;
    stim[50] = 36'h53a0c6b39;
    stim[51] = 36'h4bf4a6af0;
    stim[52] = 36'h014887cff;
    stim[53] = 36'h5db0c8ab2;
    stim[54] = 36'h2611ee3a7;
    stim[55] = 36'h2245eec61;
    stim[56] = 36'h9b14b92a7;
    stim[57] = 36'h6b8532f51;
    stim[58] = 36'h691bf7125;
    stim[59] = 36'h01d28ca44;
    stim[60] = 36'h6aec2a6dc;
    stim[61] = 36'h3de60b96c;
    stim[62] = 36'h79221621b;
    stim[63] = 36'h299c81785;
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
      expv[0] = 41'hxxxxxxxxxxd;
      expv[1] = 41'h00000000108;
      expv[2] = 41'h000000001c8;
      expv[3] = 41'h00000832648;
      expv[4] = 41'h000000000b4;
      expv[5] = 41'h00000000034;
      expv[6] = 41'h00000000020;
      expv[7] = 41'h0000000003d;
      expv[8] = 41'h00000000158;
      expv[9] = 41'h0908c000071;
      expv[10] = 41'h13c0e000135;
      expv[11] = 41'h05d340001c1;
      expv[12] = 41'h05d351251c8;
      expv[13] = 41'h1f8d65d35a8;
      expv[14] = 41'h1f8d6ecd5b0;
      expv[15] = 41'h000005d3545;
      expv[16] = 41'h00001f8d620;
      expv[17] = 41'h05d34908dd0;
      expv[18] = 41'h123c073b76d;
      expv[19] = 41'h0908c000068;
      expv[20] = 41'h073b7f8d720;
      expv[21] = 41'h1c402908de8;
      expv[22] = 41'h104d304d370;
      expv[23] = 41'h104d3c4034d;
      expv[24] = 41'h1fc890977a1;
      expv[25] = 41'h104d273b751;
      expv[26] = 41'h1fc8821cfa1;
      expv[27] = 41'h09f05c402a0;
      expv[28] = 41'h109764422d0;
      expv[29] = 41'h04423c40240;
      expv[30] = 41'h0442273b640;
      expv[31] = 41'h09f05fc8894;
      expv[32] = 41'h1fc898dd1a8;
      expv[33] = 41'h073b673b728;
      expv[34] = 41'h166d46cd090;
      expv[35] = 41'h166d4442290;
      expv[36] = 41'h166d46f1c80;
      expv[37] = 41'h10eac7683cd;
      expv[38] = 41'h10eac6cd1e8;
      expv[39] = 41'h044230eac58;
      expv[40] = 41'h0b24f1a9769;
      expv[41] = 41'h06cd0c0ec20;
      expv[42] = 41'h06a66c0ed9d;
      expv[43] = 41'h0757cb24f24;
      expv[44] = 41'h04422442268;
      expv[45] = 41'h1b2d0442230;
      expv[46] = 41'h0c0ec6a66c8;
      expv[47] = 41'h06a67a053b0;
      expv[48] = 41'h08402757d95;
      expv[49] = 41'h16cd4e69828;
      expv[50] = 41'h0c0ecc0ece0;
      expv[51] = 41'h05912692070;
      expv[52] = 41'h1a052e69948;
      expv[53] = 41'h0f9ffa05230;
      expv[54] = 41'h06920692194;
      expv[55] = 41'h0c0ecf9fec4;
      expv[56] = 41'h05912591251;
      expv[57] = 41'h00000000140;
      expv[58] = 41'h00000000158;
      expv[59] = 41'h00000000110;
      expv[60] = 41'h19488e24a28;
      expv[61] = 41'h000005ea365;
      expv[62] = 41'h00000e24ba0;
      expv[63] = 41'h0000000011c;
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
