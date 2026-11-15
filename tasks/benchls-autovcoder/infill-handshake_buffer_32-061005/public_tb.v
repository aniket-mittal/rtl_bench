// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061005 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h51877509a;
    stim[1] = 35'h6c43d6e2a;
    stim[2] = 35'h2dec31013;
    stim[3] = 35'h2c7900baa;
    stim[4] = 35'h2d149ada9;
    stim[5] = 35'h372f2d246;
    stim[6] = 35'h3b1a081d1;
    stim[7] = 35'h252097a7c;
    stim[8] = 35'h3809194a7;
    stim[9] = 35'h104743254;
    stim[10] = 35'h1df0e7725;
    stim[11] = 35'h22128a066;
    stim[12] = 35'h2ede58796;
    stim[13] = 35'h23638368d;
    stim[14] = 35'h1ff0d075a;
    stim[15] = 35'h39da6f8db;
    stim[16] = 35'h2d15886b3;
    stim[17] = 35'h279713fd8;
    stim[18] = 35'h0a959b5ed;
    stim[19] = 35'h301c40d66;
    stim[20] = 35'h1af3aae1e;
    stim[21] = 35'h3b2ef7642;
    stim[22] = 35'h3a25be66d;
    stim[23] = 35'h13bc177e9;
    stim[24] = 35'h001f965d4;
    stim[25] = 35'h2746f98e8;
    stim[26] = 35'h242556713;
    stim[27] = 35'h1825b0037;
    stim[28] = 35'h144380d31;
    stim[29] = 35'h067c41571;
    stim[30] = 35'h2af1bb701;
    stim[31] = 35'h194c7392b;
    stim[32] = 35'h2ee735e0e;
    stim[33] = 35'h30e85dd86;
    stim[34] = 35'h01e7a8abf;
    stim[35] = 35'h0d72aea92;
    stim[36] = 35'h3d3987ad6;
    stim[37] = 35'h32d8a2a28;
    stim[38] = 35'h2bf5d1a36;
    stim[39] = 35'h05440c05b;
    stim[40] = 35'h056fb3111;
    stim[41] = 35'h00940ee2d;
    stim[42] = 35'h328cb46b2;
    stim[43] = 35'h0b5252a79;
    stim[44] = 35'h06d6d05a0;
    stim[45] = 35'h15dd325f2;
    stim[46] = 35'h33e9ada8c;
    stim[47] = 35'h152ac6685;
    stim[48] = 35'h018a2395b;
    stim[49] = 35'h4283e442d;
    stim[50] = 35'h077092634;
    stim[51] = 35'h366fab417;
    stim[52] = 35'h00c28bdd8;
    stim[53] = 35'h1fb3dd05f;
    stim[54] = 35'h2a9f73191;
    stim[55] = 35'h299152d4d;
    stim[56] = 35'h315257a14;
    stim[57] = 35'h2d2354680;
    stim[58] = 35'h292117d5a;
    stim[59] = 35'h1c5b96dd1;
    stim[60] = 35'h1434bf309;
    stim[61] = 35'h1087091c7;
    stim[62] = 35'h3f01e9935;
    stim[63] = 35'h34b2ea7bb;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h2c43d6e28;
      expv[3] = 35'h6dec31010;
      expv[4] = 35'h6c7900baa;
      expv[5] = 35'h6d149ada8;
      expv[6] = 35'h772f2d246;
      expv[7] = 35'h7b1a081d0;
      expv[8] = 35'h652097a7c;
      expv[9] = 35'h7809194a7;
      expv[10] = 35'h7809194a6;
      expv[11] = 35'h5df0e7724;
      expv[12] = 35'h62128a067;
      expv[13] = 35'h22128a067;
      expv[14] = 35'h6ede58797;
      expv[15] = 35'h2ede58797;
      expv[16] = 35'h5ff0d075a;
      expv[17] = 35'h6d15886b3;
      expv[18] = 35'h6d15886b2;
      expv[19] = 35'h4a959b5ec;
      expv[20] = 35'h701c40d67;
      expv[21] = 35'h301c40d67;
      expv[22] = 35'h301c40d67;
      expv[23] = 35'h5af3aae1e;
      expv[24] = 35'h53bc177e8;
      expv[25] = 35'h401f965d4;
      expv[26] = 35'h6746f98e8;
      expv[27] = 35'h642556712;
      expv[28] = 35'h5825b0036;
      expv[29] = 35'h544380d30;
      expv[30] = 35'h467c41570;
      expv[31] = 35'h6af1bb700;
      expv[32] = 35'h594c7392b;
      expv[33] = 35'h194c7392b;
      expv[34] = 35'h194c7392b;
      expv[35] = 35'h6ee735e0f;
      expv[36] = 35'h2ee735e0f;
      expv[37] = 35'h2ee735e0f;
      expv[38] = 35'h2ee735e0f;
      expv[39] = 35'h2ee735e0f;
      expv[40] = 35'h4d72aea92;
      expv[41] = 35'h456fb3110;
      expv[42] = 35'h40940ee2c;
      expv[43] = 35'h728cb46b2;
      expv[44] = 35'h4b5252a78;
      expv[45] = 35'h46d6d05a0;
      expv[46] = 35'h55dd325f3;
      expv[47] = 35'h55dd325f2;
      expv[48] = 35'h552ac6684;
      expv[49] = 35'h418a2395a;
      expv[50] = 35'h018a23958;
      expv[51] = 35'h477092634;
      expv[52] = 35'h766fab417;
      expv[53] = 35'h766fab416;
      expv[54] = 35'h5fb3dd05e;
      expv[55] = 35'h6a9f73190;
      expv[56] = 35'h699152d4c;
      expv[57] = 35'h715257a14;
      expv[58] = 35'h6d2354680;
      expv[59] = 35'h692117d5a;
      expv[60] = 35'h5c5b96dd0;
      expv[61] = 35'h5434bf308;
      expv[62] = 35'h5087091c6;
      expv[63] = 35'h7f01e9934;
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
