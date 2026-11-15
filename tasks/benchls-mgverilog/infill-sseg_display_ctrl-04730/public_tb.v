// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 76;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04730 dut (
    .clk(clk),
    .rst(in_vec[100:100]),
    .ie(in_vec[99:99]),
    .de(in_vec[98:98]),
    .iaddr(in_vec[97:66]),
    .daddr(in_vec[65:34]),
    .drw(in_vec[33:32]),
    .din(in_vec[31:0]),
    .iout(out_vec[75:44]),
    .dout(out_vec[43:12]),
    .sseg_an(out_vec[11:8]),
    .sseg_display(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h18ad61d4e3a8ce1980a7e4a3e3;
    stim[1] = 101'h1971d37e34844bfcf3ada9a49a;
    stim[2] = 101'h0861e47445d08a054dd76b62d1;
    stim[3] = 101'h06fee9b7090e371846bdbe37c2;
    stim[4] = 101'h011dc0de1276a7a11d60a0faf7;
    stim[5] = 101'h0f297167588f2376be2eeb1945;
    stim[6] = 101'h014fa816f8e41f66fbd771f984;
    stim[7] = 101'h0d4a06bfc28199f6474e9311aa;
    stim[8] = 101'h0a8e4094806e140c6c9b43c812;
    stim[9] = 101'h0714f6731bf82b7b47ae7f6f8e;
    stim[10] = 101'h09fa068ec390e907d69a64f3e1;
    stim[11] = 101'h0692645bc4092e4268a021f115;
    stim[12] = 101'h0945b4017686bc07ab005fe40d;
    stim[13] = 101'h0224c4ec25f36e113d154ccd88;
    stim[14] = 101'h0eedcb83b475c548aaf3532beb;
    stim[15] = 101'h07a74aa55991daa902b9a095b6;
    stim[16] = 101'h0a27248bd1254fbab723a147f1;
    stim[17] = 101'h0417ab66674ee9c34667fe162e;
    stim[18] = 101'h0cd12118c3dae677c9bc8cad33;
    stim[19] = 101'h06aefc123af47ebfc76ba0e5cc;
    stim[20] = 101'h0fa1c2a7cc9ee600aadf289225;
    stim[21] = 101'h0c1a70d5e0096615569efd79e2;
    stim[22] = 101'h071673139f51aefa17a82bbc95;
    stim[23] = 101'h0a06b6ceae0901f5d4c25406b4;
    stim[24] = 101'h0faf5bd0f6396fb0bc45fbf941;
    stim[25] = 101'h08c84804593a9b73fd4db222c4;
    stim[26] = 101'h0293288d34c611b4f3cf730ddc;
    stim[27] = 101'h095e3be5e2c10015ebbdf4bfd4;
    stim[28] = 101'h0f084641048d724d2c7eb1d8fa;
    stim[29] = 101'h022d7e81635d4ac5029b2a9d4b;
    stim[30] = 101'h0b4661b65dbc376ddbea9969b4;
    stim[31] = 101'h050a8d1370b6546c77e92aed66;
    stim[32] = 101'h0d5c78dc7b14ec2eabc7f7f0bf;
    stim[33] = 101'h03ed08d2cb92360177e42c8959;
    stim[34] = 101'h0f66d630cfdbd278afe9ff2ef9;
    stim[35] = 101'h0bbf736bbcdc4f0135c1e88c9f;
    stim[36] = 101'h03a151b4c7cd8529f7dce8f25b;
    stim[37] = 101'h0834c71d903600787f5e17b76d;
    stim[38] = 101'h0c6cbc96679316a00f75569fdf;
    stim[39] = 101'h02d51e34e0f60695a4564d751e;
    stim[40] = 101'h0dd0acb41c13f8f702eb29dee3;
    stim[41] = 101'h0b36f3456ef50472386479624d;
    stim[42] = 101'h0b4701c9c46e4aa4544cd95193;
    stim[43] = 101'h0600a042fcc8d309acdefbc20f;
    stim[44] = 101'h0e00906d762211baecf420bd5a;
    stim[45] = 101'h00508e53d0a501d602cc89d585;
    stim[46] = 101'h0bf13eaf020970af5f5f98f860;
    stim[47] = 101'h07ff14bd98f4bbdbb5d50275b6;
    stim[48] = 101'h0d9cecc14b5dd2cd6602370e1e;
    stim[49] = 101'h0005da3576a1cb5ee76804411d;
    stim[50] = 101'h074cef025f0631e6f1b0256247;
    stim[51] = 101'h0a120ea1758619686ffeb97d49;
    stim[52] = 101'h06607a56f3c77d503fe03d2b90;
    stim[53] = 101'h0b62bafebd711a166d356fb133;
    stim[54] = 101'h09bbe990f4793748cccfb8928d;
    stim[55] = 101'h03defc881b9e66c160cabbf6ac;
    stim[56] = 101'h0e3c71bb83c0b698dc4cb51b08;
    stim[57] = 101'h0e941764cd176d9748cac78c8a;
    stim[58] = 101'h06f48ec112594aa7963781eb7e;
    stim[59] = 101'h0955955a14d5d6452c5044e7a7;
    stim[60] = 101'h0128175050f7c940d2c0fff0b8;
    stim[61] = 101'h03037d219e4705500e9abe92da;
    stim[62] = 101'h0648b79d38d8dec0746abfb647;
    stim[63] = 101'h00ceef72cd621387057cbcbb38;
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
      expv[0] = 76'h00000000xxxxxxxxxxx;
      expv[1] = 76'h0000000000000000x00;
      expv[2] = 76'h0000000000000000x00;
      expv[3] = 76'h0000000000000000x00;
      expv[4] = 76'h0000000000000000x00;
      expv[5] = 76'h0000000000000000x00;
      expv[6] = 76'h0000000000000000x00;
      expv[7] = 76'h0000000000000000x00;
      expv[8] = 76'h000000004e9311aaxxx;
      expv[9] = 76'h000000004e9311aaxxx;
      expv[10] = 76'h00000000ae7f6f8exxx;
      expv[11] = 76'h00000000ae7f6f8exxx;
      expv[12] = 76'h00000000ae7f6f8exxx;
      expv[13] = 76'h00000000ae7f6f8exxx;
      expv[14] = 76'h00000000ae7f6f8exxx;
      expv[15] = 76'h00000000ae7f6f8exxx;
      expv[16] = 76'h00000000ae7f6f8exxx;
      expv[17] = 76'h00000000ae7f6f8exxx;
      expv[18] = 76'h00000000ae7f6f8exxx;
      expv[19] = 76'h00000000bc8cad33xxx;
      expv[20] = 76'h000000006ba0e5ccxxx;
      expv[21] = 76'h000000006ba0e5ccxxx;
      expv[22] = 76'h000000006ba0e5ccxxx;
      expv[23] = 76'h00000000a82bbc95xxx;
      expv[24] = 76'h00000000a82bbc95xxx;
      expv[25] = 76'h00000000a82bbc95xxx;
      expv[26] = 76'h00000000a82bbc95xxx;
      expv[27] = 76'h00000000a82bbc95xxx;
      expv[28] = 76'h00000000a82bbc95xxx;
      expv[29] = 76'h00000000a82bbc95xxx;
      expv[30] = 76'h00000000a82bbc95xxx;
      expv[31] = 76'h00000000a82bbc95xxx;
      expv[32] = 76'h00000000e92aed66xxx;
      expv[33] = 76'h00000000c7f7f0bfxxx;
      expv[34] = 76'h00000000c7f7f0bfxxx;
      expv[35] = 76'h00000000e9ff2ef9xxx;
      expv[36] = 76'h00000000e9ff2ef9xxx;
      expv[37] = 76'h00000000e9ff2ef9xxx;
      expv[38] = 76'h00000000e9ff2ef9xxx;
      expv[39] = 76'h0000000075569fdfxxx;
      expv[40] = 76'h0000000075569fdfxxx;
      expv[41] = 76'h0000000075569fdfxxx;
      expv[42] = 76'h0000000075569fdfxxx;
      expv[43] = 76'h0000000075569fdfxxx;
      expv[44] = 76'h0000000075569fdfxxx;
      expv[45] = 76'h0000000075569fdfxxx;
      expv[46] = 76'h0000000075569fdfxxx;
      expv[47] = 76'h0000000075569fdfxxx;
      expv[48] = 76'h00000000d50275b6xxx;
      expv[49] = 76'h00000000d50275b6xxx;
      expv[50] = 76'h00000000d50275b6xxx;
      expv[51] = 76'h00000000b0256247xxx;
      expv[52] = 76'h00000000b0256247xxx;
      expv[53] = 76'h00000000e03d2b90xxx;
      expv[54] = 76'h00000000e03d2b90xxx;
      expv[55] = 76'h00000000e03d2b90xxx;
      expv[56] = 76'h00000000e03d2b90xxx;
      expv[57] = 76'h00000000e03d2b90xxx;
      expv[58] = 76'h00000000e03d2b90xxx;
      expv[59] = 76'h00000000e03d2b90xxx;
      expv[60] = 76'h00000000e03d2b90xxx;
      expv[61] = 76'h00000000e03d2b90xxx;
      expv[62] = 76'h00000000e03d2b90xxx;
      expv[63] = 76'h00000000e03d2b90xxx;
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
