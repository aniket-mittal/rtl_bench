// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_021612 dut (
    .p1x(in_vec[71:60]),
    .p1y(in_vec[59:48]),
    .p2x(in_vec[47:36]),
    .p2y(in_vec[35:24]),
    .p3x(in_vec[23:12]),
    .p3y(in_vec[11:0]),
    .s(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h092fe1261d51d54eae;
    stim[1] = 72'hecfde7eacaa8d3a301;
    stim[2] = 72'h466ef53562dc7061f3;
    stim[3] = 72'h300e059c2a7b5b8008;
    stim[4] = 72'h2f6b624c6db308c86f;
    stim[5] = 72'h1d1e011b92684a2282;
    stim[6] = 72'ha00ab7faac39410054;
    stim[7] = 72'ha7236ac17f0ba92cf5;
    stim[8] = 72'ha22e8ad269cd54a368;
    stim[9] = 72'h3b441442a997bbd7f3;
    stim[10] = 72'h1b862001797fa92618;
    stim[11] = 72'hdad384c07ffebaa690;
    stim[12] = 72'h1ec61142965fe5ec49;
    stim[13] = 72'h42333bc1edba13bbf1;
    stim[14] = 72'haaf64c2f2d2ff0afce;
    stim[15] = 72'he2ef150d83cb1795fc;
    stim[16] = 72'h3d2151d63c5a9df720;
    stim[17] = 72'hd8284e3d548fdbcce8;
    stim[18] = 72'haf5fd7172dcf2bd79e;
    stim[19] = 72'h0cb62a8df0bfd33076;
    stim[20] = 72'hd6956760dd52218ae5;
    stim[21] = 72'he04eda6d482c566810;
    stim[22] = 72'h6d8af9f9ed1e6764c9;
    stim[23] = 72'h1a792176ee753a4733;
    stim[24] = 72'h6328664d39d6e7b872;
    stim[25] = 72'h8e526c4b7a19807ee5;
    stim[26] = 72'hc4f9c4a1e28a0e5a8f;
    stim[27] = 72'hbb0eef8dbd50a05d71;
    stim[28] = 72'h3d98c625924c9956a2;
    stim[29] = 72'h5176ea4f37cbbe5225;
    stim[30] = 72'hf82fd9fd393815e054;
    stim[31] = 72'he2fc3dc792d267ec33;
    stim[32] = 72'h0194eab3caf4cb8cb4;
    stim[33] = 72'h2377014916f699c837;
    stim[34] = 72'hec8ec82573fb29a183;
    stim[35] = 72'h36bd57b57b1901da56;
    stim[36] = 72'hc2a61ec9e1a01e7fc0;
    stim[37] = 72'h74805081b7064f4287;
    stim[38] = 72'h992f4389b1f8953b07;
    stim[39] = 72'h6293dcbdae92b774b4;
    stim[40] = 72'h46558398f8c33516d8;
    stim[41] = 72'h6170632087df740859;
    stim[42] = 72'h9706e7877505c27a6e;
    stim[43] = 72'hfb3848b4bcb14aea83;
    stim[44] = 72'h856de9c7963cb19eef;
    stim[45] = 72'hb6382e1a7b37cd703a;
    stim[46] = 72'h7b1521c120111115fe;
    stim[47] = 72'h22570aa9c2b371a448;
    stim[48] = 72'h557dbac019659f1246;
    stim[49] = 72'h37e149f03c9189cb8e;
    stim[50] = 72'h4fe0d1d2e9d337785e;
    stim[51] = 72'h148b4132b5c81fa79c;
    stim[52] = 72'h77e1d214755a0354d4;
    stim[53] = 72'h83caa211c7939b8d0d;
    stim[54] = 72'h61eb1f0ef8461fb2ed;
    stim[55] = 72'h40e57cbcb88923feb6;
    stim[56] = 72'h606af6f4c4ffe2deff;
    stim[57] = 72'h16dcf459bbbb1fff69;
    stim[58] = 72'h294bdf2b80dd0b21dd;
    stim[59] = 72'hcb4d6cf3a782d7c98a;
    stim[60] = 72'he5eb21d72e930d6cbe;
    stim[61] = 72'h9eca723e7b7e8c084e;
    stim[62] = 72'hd34ad7e510fb576ef0;
    stim[63] = 72'h135727eb2f6e5ec1dc;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
