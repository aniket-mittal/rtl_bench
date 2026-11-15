// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_171434 dut (
    .pixel_clk(clk),
    .rst(in_vec[63:63]),
    .left(in_vec[62:62]),
    .right(in_vec[61:61]),
    .d_x(in_vec[60:51]),
    .d_y(in_vec[50:41]),
    .p1_vpos(in_vec[40:31]),
    .p3_vpos(in_vec[30:21]),
    .p1_hpos(in_vec[20:11]),
    .p3_hpos(in_vec[10:1]),
    .terminated(in_vec[0:0]),
    .hsync(out_vec[25:25]),
    .vsync(out_vec[24:24]),
    .red(out_vec[23:16]),
    .green(out_vec[15:8]),
    .blue(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hd0b8457a13fb7902;
    stim[1] = 64'ha878b03465b8947c;
    stim[2] = 64'h5a40a8026b483c48;
    stim[3] = 64'h5ed829e776345d5e;
    stim[4] = 64'h68be39a9466e41a8;
    stim[5] = 64'h3a35269c3180ba6e;
    stim[6] = 64'h0eba2179fc617a7d;
    stim[7] = 64'h060a4b9192b1d936;
    stim[8] = 64'h1186a878ff19f8f3;
    stim[9] = 64'h6703f464840dc517;
    stim[10] = 64'h43a0ba431599ab07;
    stim[11] = 64'h0099decb01151432;
    stim[12] = 64'h163a887833456250;
    stim[13] = 64'h629a6e350d6de942;
    stim[14] = 64'h1e40860d16753f2e;
    stim[15] = 64'h699519f71a8d7deb;
    stim[16] = 64'h2cff447fdc021d99;
    stim[17] = 64'h11cd42b458fc8da4;
    stim[18] = 64'h38fe6a9b231aed3e;
    stim[19] = 64'hf864385466e92a84;
    stim[20] = 64'ha16351c364cdd7ba;
    stim[21] = 64'h53ea46eb4d924c09;
    stim[22] = 64'h52648cf06088fba2;
    stim[23] = 64'h15a68a9fbf9b606a;
    stim[24] = 64'h1f18f88309552bea;
    stim[25] = 64'h464d416ed08a8d6f;
    stim[26] = 64'h5f6bccc8fab00b5b;
    stim[27] = 64'h1e368ce087258eaf;
    stim[28] = 64'h4ad16f2e6e908701;
    stim[29] = 64'h4e08d2dd055d5449;
    stim[30] = 64'h7da3e702e35957be;
    stim[31] = 64'h20311a56624ae2f3;
    stim[32] = 64'h226ce7cf3168dc18;
    stim[33] = 64'h25d3894fe7d47ca2;
    stim[34] = 64'h57ea514b93832eb8;
    stim[35] = 64'h58ff986ccd7768c0;
    stim[36] = 64'h7544f79c72d84f0a;
    stim[37] = 64'h0eef2cc533bb14a5;
    stim[38] = 64'h3eb1fcabf26f3e4f;
    stim[39] = 64'h1ae6d573e9fb089a;
    stim[40] = 64'he9f6a6543b16a324;
    stim[41] = 64'h5cf37d8cab105596;
    stim[42] = 64'h1210cd784e6ea53c;
    stim[43] = 64'h67e68efe9d2588ed;
    stim[44] = 64'h25b20199af7490a5;
    stim[45] = 64'h0817276a0ac4ca0b;
    stim[46] = 64'h461009f137c1db2d;
    stim[47] = 64'h1a97f1e5f046e585;
    stim[48] = 64'h0c4c90f22b0969f8;
    stim[49] = 64'h4324fb1c0ef0bb4c;
    stim[50] = 64'h48b34293898c358c;
    stim[51] = 64'h63b5d17c9e6a51af;
    stim[52] = 64'h2a044dd7c2379059;
    stim[53] = 64'h678491bf46461a82;
    stim[54] = 64'h4e5a0ac9f5546450;
    stim[55] = 64'h30ebd970b72d134a;
    stim[56] = 64'h1c3a2d3877193118;
    stim[57] = 64'h474fcaa5ead189e4;
    stim[58] = 64'h2f8cdb0d066c99d2;
    stim[59] = 64'h2364a64decb7e3f9;
    stim[60] = 64'h775e42969ead3d5c;
    stim[61] = 64'h12efb00111b4fdcf;
    stim[62] = 64'h63e054b4ace3373a;
    stim[63] = 64'h50f47c83fc345582;
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
      expv[0] = 26'hxxxxxxx;
      expv[1] = 26'h3000000;
      expv[2] = 26'h0000000;
      expv[3] = 26'h0000000;
      expv[4] = 26'h0000000;
      expv[5] = 26'h0000000;
      expv[6] = 26'h0000000;
      expv[7] = 26'h0000000;
      expv[8] = 26'h0000000;
      expv[9] = 26'h0000000;
      expv[10] = 26'h0000000;
      expv[11] = 26'h0000000;
      expv[12] = 26'h0000000;
      expv[13] = 26'h0000000;
      expv[14] = 26'h0000000;
      expv[15] = 26'h0000000;
      expv[16] = 26'h0000000;
      expv[17] = 26'h0000000;
      expv[18] = 26'h0000000;
      expv[19] = 26'h0000000;
      expv[20] = 26'h0000000;
      expv[21] = 26'h0000000;
      expv[22] = 26'h0000000;
      expv[23] = 26'h0000000;
      expv[24] = 26'h0000000;
      expv[25] = 26'h0000000;
      expv[26] = 26'h0000000;
      expv[27] = 26'h0000000;
      expv[28] = 26'h0000000;
      expv[29] = 26'h0000000;
      expv[30] = 26'h0000000;
      expv[31] = 26'h0000000;
      expv[32] = 26'h0000000;
      expv[33] = 26'h0000000;
      expv[34] = 26'h0000000;
      expv[35] = 26'h0000000;
      expv[36] = 26'h0000000;
      expv[37] = 26'h0000000;
      expv[38] = 26'h0000000;
      expv[39] = 26'h0000000;
      expv[40] = 26'h0000000;
      expv[41] = 26'h0000000;
      expv[42] = 26'h0000000;
      expv[43] = 26'h0000000;
      expv[44] = 26'h0000000;
      expv[45] = 26'h0000000;
      expv[46] = 26'h0000000;
      expv[47] = 26'h0000000;
      expv[48] = 26'h0000000;
      expv[49] = 26'h0000000;
      expv[50] = 26'h0000000;
      expv[51] = 26'h0000000;
      expv[52] = 26'h0000000;
      expv[53] = 26'h0000000;
      expv[54] = 26'h0000000;
      expv[55] = 26'h0000000;
      expv[56] = 26'h0000000;
      expv[57] = 26'h0000000;
      expv[58] = 26'h0000000;
      expv[59] = 26'h0000000;
      expv[60] = 26'h0000000;
      expv[61] = 26'h0000000;
      expv[62] = 26'h0000000;
      expv[63] = 26'h0000000;
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
