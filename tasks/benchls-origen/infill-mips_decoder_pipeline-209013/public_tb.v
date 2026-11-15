// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_209013 dut (
    .instr(in_vec[33:2]),
    .over(in_vec[1:1]),
    .Gez(in_vec[0:0]),
    .NPCOp(out_vec[83:82]),
    .RFWr(out_vec[81:81]),
    .EXTOp(out_vec[80:80]),
    .ALUOp(out_vec[79:77]),
    .DMWr(out_vec[76:76]),
    .A3Sel(out_vec[75:74]),
    .WDSel(out_vec[73:72]),
    .DMSel(out_vec[71:71]),
    .BSel(out_vec[70:70]),
    .imm16(out_vec[69:54]),
    .addr26(out_vec[53:28]),
    .rs(out_vec[27:23]),
    .rt(out_vec[22:18]),
    .rd(out_vec[17:13]),
    .A3(out_vec[12:8]),
    .Tuse_rs(out_vec[7:6]),
    .Tuse_rt(out_vec[5:4]),
    .Tnew_E(out_vec[3:2]),
    .Tnew_M(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2cff67278;
    stim[1] = 34'h0d8b16279;
    stim[2] = 34'h3539436a5;
    stim[3] = 34'h3c0262dcf;
    stim[4] = 34'h1263d92fd;
    stim[5] = 34'h1891cc482;
    stim[6] = 34'h22c4d2911;
    stim[7] = 34'h323356a5d;
    stim[8] = 34'h0320730bb;
    stim[9] = 34'h0722d24f5;
    stim[10] = 34'h106df21c8;
    stim[11] = 34'h2b38d1cc2;
    stim[12] = 34'h3065f1d66;
    stim[13] = 34'h06e6e11bd;
    stim[14] = 34'h26d5113ec;
    stim[15] = 34'h3b294bd82;
    stim[16] = 34'h2bf083fda;
    stim[17] = 34'h082ca55d0;
    stim[18] = 34'h0bd024b95;
    stim[19] = 34'h215bfeb33;
    stim[20] = 34'h17802484e;
    stim[21] = 34'h018aa4175;
    stim[22] = 34'h223eac978;
    stim[23] = 34'h3714f73fe;
    stim[24] = 34'h22dd996ca;
    stim[25] = 34'h129d0a5e1;
    stim[26] = 34'h29dfd9586;
    stim[27] = 34'h32e3cde16;
    stim[28] = 34'h298ed69a2;
    stim[29] = 34'h31a09a050;
    stim[30] = 34'h014b0dd92;
    stim[31] = 34'h0550c2c47;
    stim[32] = 34'h371c24207;
    stim[33] = 34'h195afeaee;
    stim[34] = 34'h2d362807d;
    stim[35] = 34'h291c22427;
    stim[36] = 34'h1856bdbf7;
    stim[37] = 34'h0a4ae2004;
    stim[38] = 34'h31794809f;
    stim[39] = 34'h32b6d304e;
    stim[40] = 34'h27d7d96bd;
    stim[41] = 34'h1911d7788;
    stim[42] = 34'h318181482;
    stim[43] = 34'h2b88cc0ea;
    stim[44] = 34'h1d54ab4b8;
    stim[45] = 34'h014b678dd;
    stim[46] = 34'h138b89f12;
    stim[47] = 34'h34e6b4fed;
    stim[48] = 34'h22b2fb78e;
    stim[49] = 34'h1e38c10ee;
    stim[50] = 34'h093b62535;
    stim[51] = 34'h0a5e7d2a6;
    stim[52] = 34'h3ed77b98c;
    stim[53] = 34'h2b246a71c;
    stim[54] = 34'h39d67e100;
    stim[55] = 34'h3ad784d9c;
    stim[56] = 34'h26f21248b;
    stim[57] = 34'h39c3d8cc3;
    stim[58] = 34'h2cb364aa5;
    stim[59] = 34'h004ffefb8;
    stim[60] = 34'h1e75e3acd;
    stim[61] = 34'h2cf1fa187;
    stim[62] = 34'h00fcb7c22;
    stim[63] = 34'h3dc0e3fb3;
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
      expv[0] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 84'h11e11cc000000038c005b;
      expv[12] = 84'h11e11cc000000038c005b;
      expv[13] = 84'h11e11cc000000038c005b;
      expv[14] = 84'h11e11cc000000038c005b;
      expv[15] = 84'h11e11cc000000038c005b;
      expv[16] = 84'h11e03fd8000000f08005b;
      expv[17] = 84'h11e03fd8000000f08005b;
      expv[18] = 84'h11e03fd8000000f08005b;
      expv[19] = 84'h11e03fd8000000f08005b;
      expv[20] = 84'h11e03fd8000000f08005b;
      expv[21] = 84'h11e03fd8000000f08005b;
      expv[22] = 84'h11e03fd8000000f08005b;
      expv[23] = 84'h11e03fd8000000f08005b;
      expv[24] = 84'h11e03fd8000000f08005b;
      expv[25] = 84'h11e03fd8000000f08005b;
      expv[26] = 84'h11e03fd8000000f08005b;
      expv[27] = 84'h11e03fd8000000f08005b;
      expv[28] = 84'h11e03fd8000000f08005b;
      expv[29] = 84'h11e03fd8000000f08005b;
      expv[30] = 84'h11e03fd8000000f08005b;
      expv[31] = 84'h11e03fd8000000f08005b;
      expv[32] = 84'h11e03fd8000000f08005b;
      expv[33] = 84'h11e03fd8000000f08005b;
      expv[34] = 84'h11e03fd8000000f08005b;
      expv[35] = 84'h11e03fd8000000f08005b;
      expv[36] = 84'h11e03fd8000000f08005b;
      expv[37] = 84'h11e03fd8000000f08005b;
      expv[38] = 84'h11e03fd8000000f08005b;
      expv[39] = 84'h11e03fd8000000f08005b;
      expv[40] = 84'h11e03fd8000000f08005b;
      expv[41] = 84'h11e03fd8000000f08005b;
      expv[42] = 84'h11e03fd8000000f08005b;
      expv[43] = 84'h11e0c0e800000088c005b;
      expv[44] = 84'h11e0c0e800000088c005b;
      expv[45] = 84'h11e0c0e800000088c005b;
      expv[46] = 84'h11e0c0e800000088c005b;
      expv[47] = 84'h11e0c0e800000088c005b;
      expv[48] = 84'h11e0c0e800000088c005b;
      expv[49] = 84'h11e0c0e800000088c005b;
      expv[50] = 84'h11e0c0e800000088c005b;
      expv[51] = 84'h11e0c0e800000088c005b;
      expv[52] = 84'h11e0c0e800000088c005b;
      expv[53] = 84'h11e2a71c000000244005b;
      expv[54] = 84'h11e2a71c000000244005b;
      expv[55] = 84'h11e2a71c000000244005b;
      expv[56] = 84'h11e2a71c000000244005b;
      expv[57] = 84'h11e2a71c000000244005b;
      expv[58] = 84'h11e2a71c000000244005b;
      expv[59] = 84'h11e2a71c000000244005b;
      expv[60] = 84'h11e2a71c000000244005b;
      expv[61] = 84'h11e2a71c000000244005b;
      expv[62] = 84'h11e2a71c000000244005b;
      expv[63] = 84'h11e2a71c000000244005b;
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
