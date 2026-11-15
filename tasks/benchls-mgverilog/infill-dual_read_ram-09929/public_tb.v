// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 62;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09929 dut (
    .clk(clk),
    .we(in_vec[46:46]),
    .wa(in_vec[45:41]),
    .ra1(in_vec[40:36]),
    .ra2(in_vec[35:31]),
    .di(in_vec[30:0]),
    .do1(out_vec[61:31]),
    .do2(out_vec[30:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h75d6b7775d54;
    stim[1] = 47'h574c428ad9ec;
    stim[2] = 47'h5bb5c8eb2055;
    stim[3] = 47'h158251699e7c;
    stim[4] = 47'h0d96dc8a6834;
    stim[5] = 47'h24129fa4ab6c;
    stim[6] = 47'h115b68f532f1;
    stim[7] = 47'h711609646191;
    stim[8] = 47'h2230297806c6;
    stim[9] = 47'h7d9e3ffc488d;
    stim[10] = 47'h08d4fb48a55d;
    stim[11] = 47'h17558a74201b;
    stim[12] = 47'h49e6b736b585;
    stim[13] = 47'h121ca18b98c6;
    stim[14] = 47'h149eebf0317e;
    stim[15] = 47'h4c26158db96c;
    stim[16] = 47'h621b4156b2b8;
    stim[17] = 47'h7803950d68c5;
    stim[18] = 47'h2d583b44306d;
    stim[19] = 47'h2eeaf54584f1;
    stim[20] = 47'h7fbcfb8421f0;
    stim[21] = 47'h14821c65e716;
    stim[22] = 47'h0eda848f1ecb;
    stim[23] = 47'h3e568a94a201;
    stim[24] = 47'h05c57ec28a38;
    stim[25] = 47'h3206fe966fc9;
    stim[26] = 47'h45377254c732;
    stim[27] = 47'h3d0facea0c08;
    stim[28] = 47'h452902a788d2;
    stim[29] = 47'h056899272a7b;
    stim[30] = 47'h47aa2bd02908;
    stim[31] = 47'h1c3d53f18440;
    stim[32] = 47'h66ba24e641f9;
    stim[33] = 47'h2a80ce939ab4;
    stim[34] = 47'h7178f596aa61;
    stim[35] = 47'h4d56b080ef74;
    stim[36] = 47'h1829ba072bc2;
    stim[37] = 47'h5dd4d1e9b665;
    stim[38] = 47'h7cf2d387d48b;
    stim[39] = 47'h057c40675b71;
    stim[40] = 47'h7589e2ea74a2;
    stim[41] = 47'h7094438429b3;
    stim[42] = 47'h677273a66a09;
    stim[43] = 47'h6e421e2a6a17;
    stim[44] = 47'h1012f41ce405;
    stim[45] = 47'h26f94a4299f1;
    stim[46] = 47'h7b57c7c7cd75;
    stim[47] = 47'h7614e2835bc1;
    stim[48] = 47'h5a38123201a8;
    stim[49] = 47'h4e96bddcc714;
    stim[50] = 47'h1806bac90347;
    stim[51] = 47'h1e564870f224;
    stim[52] = 47'h3554a1f5316d;
    stim[53] = 47'h13bf632782f9;
    stim[54] = 47'h02ebdaa50ab9;
    stim[55] = 47'h40a44d3dc396;
    stim[56] = 47'h45ab72125de7;
    stim[57] = 47'h5dc4c882dc10;
    stim[58] = 47'h171ec386c56c;
    stim[59] = 47'h01bcfcc9f579;
    stim[60] = 47'h52fe2fa5aa86;
    stim[61] = 47'h380276d6654b;
    stim[62] = 47'h3a0d6d592a6d;
    stim[63] = 47'h490b135bf34f;
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
      expv[0] = 62'hxxxxxxxxxxxxxxxx;
      expv[1] = 62'hxxxxxxxxxxxxxxxx;
      expv[2] = 62'hxxxxxxxxx28ad9ec;
      expv[3] = 62'hxxxxxxxxxxxxxxxx;
      expv[4] = 62'hxxxxxxxxx8eb2055;
      expv[5] = 62'hxxxxxxxxxxxxxxxx;
      expv[6] = 62'hxxxxxxxxxxxxxxxx;
      expv[7] = 62'hxxxxxxxxxxxxxxxx;
      expv[8] = 62'hxxxxxxxxxxxxxxxx;
      expv[9] = 62'hxxxxxxxxxxxxxxxx;
      expv[10] = 62'h2475902axxxxxxxx;
      expv[11] = 62'hxxxxxxxxx28ad9ec;
      expv[12] = 62'h1ffe2446c8eb2055;
      expv[13] = 62'hxxxxxxxxxxxxxxxx;
      expv[14] = 62'hxxxxxxxxxxxxxxxx;
      expv[15] = 62'hxxxxxxxxxxxxxxxx;
      expv[16] = 62'hxxxxxxxxxxxxxxxx;
      expv[17] = 62'hxxxxxxxxxxxxxxxx;
      expv[18] = 62'hxxxxxxxxxxxxxxxx;
      expv[19] = 62'hxxxxxxxxxxxxxxxx;
      expv[20] = 62'hxxxxxxxxxxxxxxxx;
      expv[21] = 62'hxxxxxxxxx736b585;
      expv[22] = 62'h2475902axxxxxxxx;
      expv[23] = 62'hxxxxxxxxx8eb2055;
      expv[24] = 62'h0a86b462xxxxxxxx;
      expv[25] = 62'hxxxxxxxxx8eb2055;
      expv[26] = 62'hxxxxxxxxxxxxxxxx;
      expv[27] = 62'hxxxxxxxxxxxxxxxx;
      expv[28] = 62'hxxxxxxxxxxxxxxxx;
      expv[29] = 62'hxxxxxxxxx156b2b8;
      expv[30] = 62'h1bbbaeaaxxxxxxxx;
      expv[31] = 62'h15e8148437775d54;
      expv[32] = 62'h21456cf6xxxxxxxx;
      expv[33] = 62'hxxxxxxxxxxxxxxxx;
      expv[34] = 62'hxxxxxxxxx156b2b8;
      expv[35] = 62'hxxxxxxxxx8eb2055;
      expv[36] = 62'h0153c46924e641f9;
      expv[37] = 62'hxxxxxxxxxxxxxxxx;
      expv[38] = 62'hxxxxxxxxxxxxxxxx;
      expv[39] = 62'hxxxxxxxxx596aa61;
      expv[40] = 62'h3acb5530a4e641f9;
      expv[41] = 62'hxxxxxxxxxxxxxxxx;
      expv[42] = 62'hxxxxxxxxx736b585;
      expv[43] = 62'h1b9b5ac2b736b585;
      expv[44] = 62'hxxxxxxxxxxxxxxxx;
      expv[45] = 62'hxxxxxxxxxxxxxxxx;
      expv[46] = 62'hxxxxxxxxxxxxxxxx;
      expv[47] = 62'hxxxxxxxxxxxxxxxx;
      expv[48] = 62'h15e81484xxxxxxxx;
      expv[49] = 62'hxxxxxxxxx23201a8;
      expv[50] = 62'hxxxxxxxxx23201a8;
      expv[51] = 62'hxxxxxxxxxxxxxxxx;
      expv[52] = 62'hxxxxxxxxxxxxxxxx;
      expv[53] = 62'h3141ade0d387d48b;
      expv[54] = 62'h28f4db329e2a6a17;
      expv[55] = 62'hxxxxxxxxxxxxxxxx;
      expv[56] = 62'h31753a51xxxxxxxx;
      expv[57] = 62'h0a86b462xxxxxxxx;
      expv[58] = 62'h20ab595c47c7cd75;
      expv[59] = 62'h3141ade0xxxxxxxx;
      expv[60] = 62'hxxxxxxxxx50d68c5;
      expv[61] = 62'h269ee1cb3736b585;
      expv[62] = 62'h269ee1cb62ea74a2;
      expv[63] = 62'hxxxxxxxxxxxxxxxx;
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
