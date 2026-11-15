// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03748 dut (
    .clk(clk),
    .in(in_vec[29:0]),
    .out(out_vec[29:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h10417c63;
    stim[1] = 30'h058cc1c6;
    stim[2] = 30'h28c81d64;
    stim[3] = 30'h00f5ec6f;
    stim[4] = 30'h34425ae6;
    stim[5] = 30'h2edddb66;
    stim[6] = 30'h35033a1c;
    stim[7] = 30'h0b86df91;
    stim[8] = 30'h0f1f2d68;
    stim[9] = 30'h38ba0b38;
    stim[10] = 30'h29602db6;
    stim[11] = 30'h2c7e0b32;
    stim[12] = 30'h09e4918a;
    stim[13] = 30'h008b3f11;
    stim[14] = 30'h33dfc6d4;
    stim[15] = 30'h3215cbab;
    stim[16] = 30'h0de4b744;
    stim[17] = 30'h18151997;
    stim[18] = 30'h2bbca29f;
    stim[19] = 30'h00a1295a;
    stim[20] = 30'h0c16de7b;
    stim[21] = 30'h0b69a4b4;
    stim[22] = 30'h38773b7a;
    stim[23] = 30'h205ed340;
    stim[24] = 30'h3dec8e1b;
    stim[25] = 30'h050b7501;
    stim[26] = 30'h0fd1a78f;
    stim[27] = 30'h2db2f68e;
    stim[28] = 30'h24de582a;
    stim[29] = 30'h086fe10d;
    stim[30] = 30'h30db1594;
    stim[31] = 30'h2c068c98;
    stim[32] = 30'h38994279;
    stim[33] = 30'h2b028763;
    stim[34] = 30'h30a6df44;
    stim[35] = 30'h2f01850a;
    stim[36] = 30'h334c9141;
    stim[37] = 30'h09d7d02d;
    stim[38] = 30'h3b88683c;
    stim[39] = 30'h27f34b6d;
    stim[40] = 30'h1f75d60d;
    stim[41] = 30'h3c4293ed;
    stim[42] = 30'h3738f4b2;
    stim[43] = 30'h31872fae;
    stim[44] = 30'h3d4c90ab;
    stim[45] = 30'h3a9c44f2;
    stim[46] = 30'h098574ed;
    stim[47] = 30'h07fa493d;
    stim[48] = 30'h0a5add86;
    stim[49] = 30'h1322f1f6;
    stim[50] = 30'h28c100a5;
    stim[51] = 30'h14c0c2b1;
    stim[52] = 30'h255092ca;
    stim[53] = 30'h16a21aae;
    stim[54] = 30'h0422e20b;
    stim[55] = 30'h2ac32fca;
    stim[56] = 30'h24dd17ce;
    stim[57] = 30'h18985aed;
    stim[58] = 30'h1fe2a988;
    stim[59] = 30'h0342a589;
    stim[60] = 30'h13dd02ed;
    stim[61] = 30'h1cd3ed6e;
    stim[62] = 30'h200ab9c4;
    stim[63] = 30'h148151b2;
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
      expv[0] = 30'hxxxxxxxx;
      expv[1] = 30'h058c7c64;
      expv[2] = 30'h28c8c1c7;
      expv[3] = 30'h00f51d65;
      expv[4] = 30'h3442ec70;
      expv[5] = 30'h2edd5ae7;
      expv[6] = 30'h3503db67;
      expv[7] = 30'h0b863a1d;
      expv[8] = 30'h0f1fdf92;
      expv[9] = 30'h38ba2d69;
      expv[10] = 30'h29600b39;
      expv[11] = 30'h2c7e2db7;
      expv[12] = 30'h09e40b33;
      expv[13] = 30'h008b918b;
      expv[14] = 30'h33df3f12;
      expv[15] = 30'h3215c6d5;
      expv[16] = 30'h0de4cbac;
      expv[17] = 30'h1815b745;
      expv[18] = 30'h2bbc1998;
      expv[19] = 30'h00a1a2a0;
      expv[20] = 30'h0c16295b;
      expv[21] = 30'h0b69de7c;
      expv[22] = 30'h3877a4b5;
      expv[23] = 30'h205e3b7b;
      expv[24] = 30'h3decd341;
      expv[25] = 30'h050b8e1c;
      expv[26] = 30'h0fd17502;
      expv[27] = 30'h2db2a790;
      expv[28] = 30'h24def68f;
      expv[29] = 30'h086f582b;
      expv[30] = 30'h30dbe10e;
      expv[31] = 30'h2c061595;
      expv[32] = 30'h38998c99;
      expv[33] = 30'h2b02427a;
      expv[34] = 30'h30a68764;
      expv[35] = 30'h2f01df45;
      expv[36] = 30'h334c850b;
      expv[37] = 30'h09d79142;
      expv[38] = 30'h3b88d02e;
      expv[39] = 30'h27f3683d;
      expv[40] = 30'h1f754b6e;
      expv[41] = 30'h3c42d60e;
      expv[42] = 30'h373893ee;
      expv[43] = 30'h3187f4b3;
      expv[44] = 30'h3d4c2faf;
      expv[45] = 30'h3a9c90ac;
      expv[46] = 30'h098544f3;
      expv[47] = 30'h07fa74ee;
      expv[48] = 30'h0a5a493e;
      expv[49] = 30'h1322dd87;
      expv[50] = 30'h28c1f1f7;
      expv[51] = 30'h14c000a6;
      expv[52] = 30'h2550c2b2;
      expv[53] = 30'h16a292cb;
      expv[54] = 30'h04221aaf;
      expv[55] = 30'h2ac3e20c;
      expv[56] = 30'h24dd2fcb;
      expv[57] = 30'h189817cf;
      expv[58] = 30'h1fe25aee;
      expv[59] = 30'h0342a989;
      expv[60] = 30'h13dda58a;
      expv[61] = 30'h1cd302ee;
      expv[62] = 30'h200aed6f;
      expv[63] = 30'h1481b9c5;
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
