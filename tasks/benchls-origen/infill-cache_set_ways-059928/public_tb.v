// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059928 dut (
    .clk(clk),
    .rst(in_vec[74:74]),
    .DataIn(in_vec[73:66]),
    .Write0(in_vec[65:65]),
    .Write1(in_vec[64:64]),
    .BlockEnable(in_vec[63:0]),
    .DataOut0(out_vec[15:8]),
    .DataOut1(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h4c53fd2723611156792;
    stim[1] = 75'h723e6f789f7b47879f4;
    stim[2] = 75'h367cbd23edb7265989d;
    stim[3] = 75'h37bdf61ba3b49eaea4a;
    stim[4] = 75'h24ea99665aa2f7ac17d;
    stim[5] = 75'h0dba8200a0640468166;
    stim[6] = 75'h3f05398be682be8c398;
    stim[7] = 75'h3abfb8ddd77db3894c3;
    stim[8] = 75'h0c618ab37ccc2033ad0;
    stim[9] = 75'h1208e4124357527c860;
    stim[10] = 75'h13325a078151cca7346;
    stim[11] = 75'h3eedc628215b64e9925;
    stim[12] = 75'h1eb1c21356256419d71;
    stim[13] = 75'h1f64560f2e7642e6cac;
    stim[14] = 75'h1321fa309d595eacf9e;
    stim[15] = 75'h158979f0150990b146c;
    stim[16] = 75'h5dc2ebeb40714389072;
    stim[17] = 75'h0220d4db45cc7435832;
    stim[18] = 75'h3aeebae712dc3f42dc0;
    stim[19] = 75'h22ef4f277757c9caaed;
    stim[20] = 75'h09c9a41b44a254fb45a;
    stim[21] = 75'h3e8e7682cc811390e75;
    stim[22] = 75'h0d10094a43e5ec26690;
    stim[23] = 75'h38a05ea8a99199945af;
    stim[24] = 75'h233a63bc0a8cd904925;
    stim[25] = 75'h3d713b294dd9f7b4aba;
    stim[26] = 75'h3ddd35f86a4453ac6b7;
    stim[27] = 75'h3b81a4ec82a2a5b0339;
    stim[28] = 75'h18d8775e90493f0627f;
    stim[29] = 75'h398a975b4cf405cdf84;
    stim[30] = 75'h15c24dc9e573785f699;
    stim[31] = 75'h20f983c3d231c9ed741;
    stim[32] = 75'h2287420614002fbf1b3;
    stim[33] = 75'h14a1accf6f7a868b7bf;
    stim[34] = 75'h1159413ba1761654962;
    stim[35] = 75'h11ade03836060a90e50;
    stim[36] = 75'h126d7eee68fa654a492;
    stim[37] = 75'h32f8253443b8479aae6;
    stim[38] = 75'h03d0d515741ea3dadf9;
    stim[39] = 75'h0e665ccc12253ebacfc;
    stim[40] = 75'h300828b13920e5d976f;
    stim[41] = 75'h36057377241426c5c95;
    stim[42] = 75'h1f9a5839776b7a3e8db;
    stim[43] = 75'h032ac4425b7a5e248a6;
    stim[44] = 75'h200fc8b2f7e343fa6f2;
    stim[45] = 75'h1989b036e338eba54fb;
    stim[46] = 75'h23501f3fb94c0901ed1;
    stim[47] = 75'h13507145340a541e1be;
    stim[48] = 75'h2f1828edd4770a6e6f0;
    stim[49] = 75'h1d6cbb76245bfbee742;
    stim[50] = 75'h08c0bd8a6b299a11fd1;
    stim[51] = 75'h3a693c1876ec811bf92;
    stim[52] = 75'h265083509b9545dee15;
    stim[53] = 75'h0ef229b5bbbfd3e900f;
    stim[54] = 75'h054a8afcac0de1387a6;
    stim[55] = 75'h13c0258c8bf0ee4e103;
    stim[56] = 75'h17ae95f97e9c7418ae9;
    stim[57] = 75'h22d4688d2eb16690d56;
    stim[58] = 75'h01155c5abf391921fd7;
    stim[59] = 75'h1771c38a15c8b111bef;
    stim[60] = 75'h25779ba27bf62bc231a;
    stim[61] = 75'h2bc2ed53260fc430fa9;
    stim[62] = 75'h30667f394533c916937;
    stim[63] = 75'h17d94c905415e696230;
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
      expv[0] = 16'h00xx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'h0000;
      expv[17] = 16'hxxx0;
      expv[18] = 16'hxxx0;
      expv[19] = 16'hxxx0;
      expv[20] = 16'hxxx0;
      expv[21] = 16'hxxx0;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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
