// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_069357 dut (
    .pixelClock(clk),
    .sw(in_vec[45:44]),
    .btn(in_vec[43:40]),
    .ppuAddress(in_vec[39:24]),
    .vd(in_vec[23:0]),
    .red(out_vec[42:35]),
    .green(out_vec[34:27]),
    .blue(out_vec[26:19]),
    .hSync(out_vec[18:18]),
    .vSync(out_vec[17:17]),
    .blank(out_vec[16:16]),
    .va(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h32eae8f350e9;
    stim[1] = 46'h0d578a245c78;
    stim[2] = 46'h11c3584f6c61;
    stim[3] = 46'h1a4306c34277;
    stim[4] = 46'h3a41d0194391;
    stim[5] = 46'h3beaffe29b87;
    stim[6] = 46'h10d0ca331655;
    stim[7] = 46'h0957a8b35eab;
    stim[8] = 46'h267d00d5d7c6;
    stim[9] = 46'h2dde0c6971b3;
    stim[10] = 46'h238f3a339edd;
    stim[11] = 46'h1fcb02fc3a54;
    stim[12] = 46'h0f3f174442e6;
    stim[13] = 46'h176eabf1305d;
    stim[14] = 46'h2818a2be4fe5;
    stim[15] = 46'h28b042a690a8;
    stim[16] = 46'h3742801ff0dc;
    stim[17] = 46'h2b35b0c3cc33;
    stim[18] = 46'h35cac83cc5ac;
    stim[19] = 46'h2f1253204fae;
    stim[20] = 46'h246c0e6cfee2;
    stim[21] = 46'h105c90da55f4;
    stim[22] = 46'h33196a5c55df;
    stim[23] = 46'h37415b3b6552;
    stim[24] = 46'h2a17b13bc052;
    stim[25] = 46'h3c346489ad22;
    stim[26] = 46'h2f3b5f3c9334;
    stim[27] = 46'h0e4c668410ed;
    stim[28] = 46'h378534138ff6;
    stim[29] = 46'h02ca1ce88bbd;
    stim[30] = 46'h09a1cd0366f6;
    stim[31] = 46'h3f0e30450bae;
    stim[32] = 46'h2a26350fbdee;
    stim[33] = 46'h1d082e2e8d3a;
    stim[34] = 46'h24ba8bf6fff3;
    stim[35] = 46'h09284403555b;
    stim[36] = 46'h1bcb4d26f7fc;
    stim[37] = 46'h3a36e2e4ea92;
    stim[38] = 46'h37b09782f432;
    stim[39] = 46'h31956ad86197;
    stim[40] = 46'h31e35890aa36;
    stim[41] = 46'h30d931894c5f;
    stim[42] = 46'h224fcb8eb23d;
    stim[43] = 46'h002c78c8524d;
    stim[44] = 46'h37ea95af4bdc;
    stim[45] = 46'h1c83f1d35c1b;
    stim[46] = 46'h109a69c8fcba;
    stim[47] = 46'h2fb4a3cab6f2;
    stim[48] = 46'h19b6e09ee910;
    stim[49] = 46'h2df00d6e487d;
    stim[50] = 46'h04bdd3b002ae;
    stim[51] = 46'h338c3c6649f8;
    stim[52] = 46'h0f0b4e7a0847;
    stim[53] = 46'h1b3154a9cb20;
    stim[54] = 46'h1b9d3213a80a;
    stim[55] = 46'h3c705ba018a0;
    stim[56] = 46'h25c3687cc6fc;
    stim[57] = 46'h2cfb20f01a32;
    stim[58] = 46'h20d92114f10b;
    stim[59] = 46'h22f5f5bbdac2;
    stim[60] = 46'h265aeff50ba7;
    stim[61] = 46'h14afc5bf5ccc;
    stim[62] = 46'h14228e897f20;
    stim[63] = 46'h37cc81a02ed0;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h000000x0000;
      expv[2] = 43'h000000x0000;
      expv[3] = 43'h000000x0000;
      expv[4] = 43'h000000x0000;
      expv[5] = 43'h000000x0000;
      expv[6] = 43'h000000x0000;
      expv[7] = 43'h000000x0000;
      expv[8] = 43'h000000x0000;
      expv[9] = 43'h000000x0000;
      expv[10] = 43'h000000x0000;
      expv[11] = 43'h000000x0000;
      expv[12] = 43'h000000x0000;
      expv[13] = 43'h000000x0000;
      expv[14] = 43'h000000x0000;
      expv[15] = 43'h000000x0000;
      expv[16] = 43'h000000x0000;
      expv[17] = 43'h000000x0000;
      expv[18] = 43'h000000x0000;
      expv[19] = 43'h000000x0000;
      expv[20] = 43'h000000x0000;
      expv[21] = 43'h000000x0000;
      expv[22] = 43'h000000x0000;
      expv[23] = 43'h000000x0000;
      expv[24] = 43'h000000x0000;
      expv[25] = 43'h000000x0000;
      expv[26] = 43'h000000x0000;
      expv[27] = 43'h000000x0000;
      expv[28] = 43'h000000x0000;
      expv[29] = 43'h000000x0000;
      expv[30] = 43'h000000x0000;
      expv[31] = 43'h000000x0000;
      expv[32] = 43'h000000x0000;
      expv[33] = 43'h000000x0000;
      expv[34] = 43'h000000x0000;
      expv[35] = 43'h000000x0000;
      expv[36] = 43'h000000x0000;
      expv[37] = 43'h000000x0000;
      expv[38] = 43'h000000x0000;
      expv[39] = 43'h000000x0000;
      expv[40] = 43'h000000x0000;
      expv[41] = 43'h000000x0000;
      expv[42] = 43'h000000x0000;
      expv[43] = 43'h000000x0000;
      expv[44] = 43'h000000x0000;
      expv[45] = 43'h000000x0000;
      expv[46] = 43'h000000x0000;
      expv[47] = 43'h000000x0000;
      expv[48] = 43'h000000x0000;
      expv[49] = 43'h000000x0000;
      expv[50] = 43'h000000x0000;
      expv[51] = 43'h000000x0000;
      expv[52] = 43'h000000x0000;
      expv[53] = 43'h000000x0000;
      expv[54] = 43'h000000x0000;
      expv[55] = 43'h000000x0000;
      expv[56] = 43'h000000x0000;
      expv[57] = 43'h000000x0000;
      expv[58] = 43'h000000x0000;
      expv[59] = 43'h000000x0000;
      expv[60] = 43'h000000x0000;
      expv[61] = 43'h000000x0000;
      expv[62] = 43'h000000x0000;
      expv[63] = 43'h000000x0000;
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
