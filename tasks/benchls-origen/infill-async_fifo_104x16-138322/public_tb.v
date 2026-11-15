// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 108;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138322 dut (
    .wr_clk(clk),
    .wr_rst(in_vec[107:107]),
    .rd_rst(in_vec[106:106]),
    .rd_clk(in_vec[105:105]),
    .wr_en(in_vec[104:104]),
    .din(in_vec[103:0]),
    .full(out_vec[107:107]),
    .prog_full(out_vec[106:106]),
    .dout(out_vec[105:2]),
    .empty(out_vec[1:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'hcc8d016dd5f35274d477eaa9b48;
    stim[1] = 108'h93a35231f0f7f45fa2b7e8cd351;
    stim[2] = 108'h1b45521a4c1131c92b24124b18f;
    stim[3] = 108'h560a904daf9db0919ed27f56ec0;
    stim[4] = 108'h5f351f0d1329b124419f83128c1;
    stim[5] = 108'h6ffe4cd6f72ac95bffd69249399;
    stim[6] = 108'h15ce032c02ef6f66fa5c5aa4f53;
    stim[7] = 108'h3fa3344ffa3736977065199225e;
    stim[8] = 108'h64b2bebf4f17485bb5b226badf9;
    stim[9] = 108'h017f56fe1ff6d39a23f0131895d;
    stim[10] = 108'h09f0a58da954a0b18c124ab1965;
    stim[11] = 108'h0081f1cf426a3897d3eaa837d45;
    stim[12] = 108'h24a171626b0166929bc23a56469;
    stim[13] = 108'h2288125f48ca0d4fdf5e351ae07;
    stim[14] = 108'h44cfc94b90b9df35c849f175453;
    stim[15] = 108'h17ff41240312d00b16f5a4ae139;
    stim[16] = 108'h63517036dbdf6ecc4c9a3e0b571;
    stim[17] = 108'h63c35695f87110ba4bfb1c7104d;
    stim[18] = 108'h1663d773efa85b234d2f3685cb0;
    stim[19] = 108'h469b2019213df83d6e5d8005217;
    stim[20] = 108'h7fa7464229baf4fc25663608423;
    stim[21] = 108'h2443895eef88d8b3af9ef977218;
    stim[22] = 108'h38553b2995f61490c1f849dd0bf;
    stim[23] = 108'h3063ca8b18650f485ce8368b60b;
    stim[24] = 108'h2538780fffa748bad1f43933558;
    stim[25] = 108'h727fd468d466d54b8d5a3bcf66c;
    stim[26] = 108'h230699a07319d73688c38ed3041;
    stim[27] = 108'h083b6fd0634d373117a2ba7d85a;
    stim[28] = 108'h4d090a6e874d85c82871928d9fc;
    stim[29] = 108'h24112332f78ebb94cbb2934de07;
    stim[30] = 108'h03e2c86d6a5ed1d21cadc83f956;
    stim[31] = 108'h7e3b1d46511d846bb3b098b5bee;
    stim[32] = 108'h0d0ff96f63f44549aab183509b5;
    stim[33] = 108'h2a97fa2f61e9e1eb27674aaf1d3;
    stim[34] = 108'h6248e15142936f5837fd8860c11;
    stim[35] = 108'h5d2b347c1cd3e146128e0a72f34;
    stim[36] = 108'h2e4fb459564053cd1b6c042bedd;
    stim[37] = 108'h098fdf0041ea1850b16e37413d9;
    stim[38] = 108'h49da67289718ff09b69ba90057e;
    stim[39] = 108'h834fad964ec0936120ab2488f83;
    stim[40] = 108'h786ff3d9c6b7c10e99d0fd22999;
    stim[41] = 108'h4b8ecb992fb5b3c71bb4d9f44cf;
    stim[42] = 108'h775f4ef43bab385c8b197549c4f;
    stim[43] = 108'h050182f71b0effab0977b11a80e;
    stim[44] = 108'h102918ff2d37928cdfe957d262f;
    stim[45] = 108'h09df0a9d57d5f0b047d7380881e;
    stim[46] = 108'h494f0f85062cecc392045eaa06f;
    stim[47] = 108'h0e44694c2d1cb5523c352392812;
    stim[48] = 108'h552d8ca1c01c08e7c6effe844ec;
    stim[49] = 108'h0894812536bcce252f54de5c222;
    stim[50] = 108'h528bea4c58c608df2fb99cc43f4;
    stim[51] = 108'h768866bbffc9c98409f6957f600;
    stim[52] = 108'h3f9530cfc4f408c81341c9b3ae9;
    stim[53] = 108'h5d2bd1b26e59ec904840da55ddf;
    stim[54] = 108'h4c453852c9541a1c4b6485c0827;
    stim[55] = 108'h7b2507b4aa9910ddef22891ffbd;
    stim[56] = 108'h40efa47237445a352a3f49f5bdc;
    stim[57] = 108'h29ace3f1ed87dc087dde76ff85f;
    stim[58] = 108'h03fd2d291c9b74ab05f65934709;
    stim[59] = 108'h3133888ddbb238bc57b9d552be5;
    stim[60] = 108'h1e35a418ec4631751de1b38c190;
    stim[61] = 108'hacbb231263705fc05cdc1f6bfd4;
    stim[62] = 108'h1f94d57713cbf55ee912795d533;
    stim[63] = 108'h7e594a91b937bea5dbd2e0524bd;
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
      expv[0] = 108'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 108'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 108'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 108'h2d1548693044c724ac90492c63e;
      expv[4] = 108'h2d1548693044c724ac90492c63e;
      expv[5] = 108'h2d1548693044c724ac90492c63e;
      expv[6] = 108'h2d1548693044c724ac90492c63e;
      expv[7] = 108'h2d1548693044c724ac90492c63e;
      expv[8] = 108'h2d1548693044c724ac90492c63e;
      expv[9] = 108'h2d1548693044c724ac90492c63e;
      expv[10] = 108'h2d1548693044c724ac90492c63e;
      expv[11] = 108'h2d1548693044c724ac90492c63e;
      expv[12] = 108'h2d1548693044c724ac90492c63e;
      expv[13] = 108'h2d1548693044c724ac90492c63e;
      expv[14] = 108'h2d1548693044c724ac90492c63e;
      expv[15] = 108'h2d1548693044c724ac90492c63e;
      expv[16] = 108'h2d1548693044c724ac90492c63e;
      expv[17] = 108'h2d1548693044c724ac90492c63e;
      expv[18] = 108'h2d1548693044c724ac90492c63e;
      expv[19] = 108'h2d1548693044c724ac90492c63e;
      expv[20] = 108'h2d1548693044c724ac90492c63e;
      expv[21] = 108'h2d1548693044c724ac90492c63e;
      expv[22] = 108'h2d1548693044c724ac90492c63e;
      expv[23] = 108'h2d1548693044c724ac90492c63e;
      expv[24] = 108'h2d1548693044c724ac90492c63e;
      expv[25] = 108'h2d1548693044c724ac90492c63e;
      expv[26] = 108'h2d1548693044c724ac90492c63e;
      expv[27] = 108'h2d1548693044c724ac90492c63e;
      expv[28] = 108'h2d1548693044c724ac90492c63e;
      expv[29] = 108'h2d1548693044c724ac90492c63e;
      expv[30] = 108'h2d1548693044c724ac90492c63e;
      expv[31] = 108'h2d1548693044c724ac90492c63e;
      expv[32] = 108'h2d1548693044c724ac90492c63e;
      expv[33] = 108'h2d1548693044c724ac90492c63e;
      expv[34] = 108'h2d1548693044c724ac90492c63e;
      expv[35] = 108'h2d1548693044c724ac90492c63e;
      expv[36] = 108'h2d1548693044c724ac90492c63e;
      expv[37] = 108'h2d1548693044c724ac90492c63e;
      expv[38] = 108'h2d1548693044c724ac90492c63e;
      expv[39] = 108'h2d1548693044c724ac90492c63e;
      expv[40] = 108'h2d1548693044c724ac90492c63e;
      expv[41] = 108'h21bfcf671adf043a6743f48a666;
      expv[42] = 108'h21bfcf671adf043a6743f48a666;
      expv[43] = 108'h21bfcf671adf043a6743f48a666;
      expv[44] = 108'h21bfcf671adf043a6743f48a666;
      expv[45] = 108'h21bfcf671adf043a6743f48a666;
      expv[46] = 108'h21bfcf671adf043a6743f48a666;
      expv[47] = 108'h21bfcf671adf043a6743f48a666;
      expv[48] = 108'h21bfcf671adf043a6743f48a666;
      expv[49] = 108'h21bfcf671adf043a6743f48a666;
      expv[50] = 108'h21bfcf671adf043a6743f48a666;
      expv[51] = 108'h21bfcf671adf043a6743f48a666;
      expv[52] = 108'h21bfcf671adf043a6743f48a666;
      expv[53] = 108'h21bfcf671adf043a6743f48a666;
      expv[54] = 108'h21bfcf671adf043a6743f48a666;
      expv[55] = 108'h21bfcf671adf043a6743f48a666;
      expv[56] = 108'h21bfcf671adf043a6743f48a666;
      expv[57] = 108'h21bfcf671adf043a6743f48a666;
      expv[58] = 108'h21bfcf671adf043a6743f48a666;
      expv[59] = 108'h21bfcf671adf043a6743f48a664;
      expv[60] = 108'h21bfcf671adf043a6743f48a664;
      expv[61] = 108'h1d7d3bd0eeace1722c65d52713d;
      expv[62] = 108'h1d7d3bd0eeace1722c65d52713d;
      expv[63] = 108'h3e5355dc4f2fd57ba449e5754ce;
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
