// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005605 dut (
    .clk_100m(clk),
    .rst_n(in_vec[51:51]),
    .bclk(in_vec[50:50]),
    .lrclk(in_vec[49:49]),
    .ldata(in_vec[48:25]),
    .rdata(in_vec[24:1]),
    .en(in_vec[0:0]),
    .sdata_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h60b90ca578b85;
    stim[1] = 52'h25db29654edbe;
    stim[2] = 52'h90955854767cb;
    stim[3] = 52'haed6e4f49b0ba;
    stim[4] = 52'h94447efbd0ef7;
    stim[5] = 52'he758a1a6ad701;
    stim[6] = 52'hc07ef0be90ce0;
    stim[7] = 52'hb2d7e9115bcbe;
    stim[8] = 52'h5601449b7fe71;
    stim[9] = 52'h66742639b639b;
    stim[10] = 52'h9ae3ef59f2823;
    stim[11] = 52'h70786e9ab97f7;
    stim[12] = 52'h816e27c1bd32f;
    stim[13] = 52'he6b604b3653fc;
    stim[14] = 52'haebea5f13b253;
    stim[15] = 52'hfd7c6704414ab;
    stim[16] = 52'h9c1b2be228126;
    stim[17] = 52'hea78c25b01924;
    stim[18] = 52'h987f5bfd9e79c;
    stim[19] = 52'h9631367325fee;
    stim[20] = 52'hd6638a0c5b1dc;
    stim[21] = 52'habbae5ff4f031;
    stim[22] = 52'hdce74d5fa879c;
    stim[23] = 52'hf3668395056b0;
    stim[24] = 52'hbee3ad1e10510;
    stim[25] = 52'hbf95cf5128c99;
    stim[26] = 52'h87dd307151f5b;
    stim[27] = 52'hec4dc11874a2e;
    stim[28] = 52'hf239b665cf6ee;
    stim[29] = 52'head0fdf55bb29;
    stim[30] = 52'h9ea7782a57c49;
    stim[31] = 52'hc564448c688a7;
    stim[32] = 52'hd4bd772ec1e28;
    stim[33] = 52'hb5bc3af3699fb;
    stim[34] = 52'he495f5e4d2c60;
    stim[35] = 52'hefde5c8763c12;
    stim[36] = 52'hc2e8c5ba2835e;
    stim[37] = 52'hcca20b2ea1848;
    stim[38] = 52'h9e33138c505b3;
    stim[39] = 52'h9d1d38ca087e0;
    stim[40] = 52'hb5a08132bde3e;
    stim[41] = 52'he529df1ea3238;
    stim[42] = 52'hba90a59e75db7;
    stim[43] = 52'hbe4308bf143ab;
    stim[44] = 52'he1cd46fe36b4d;
    stim[45] = 52'hb94cdcf8a3e5f;
    stim[46] = 52'haf638bfd230f6;
    stim[47] = 52'h88d9bb4ad7f55;
    stim[48] = 52'ha616595952c00;
    stim[49] = 52'ha5aceb96670c6;
    stim[50] = 52'hfd43813e59616;
    stim[51] = 52'hc773a2b18d452;
    stim[52] = 52'hf62f74ffc3def;
    stim[53] = 52'hb146122cab59e;
    stim[54] = 52'hd11e3d3277b31;
    stim[55] = 52'hfa8d11fa88742;
    stim[56] = 52'hb290e5de77f81;
    stim[57] = 52'h9261294b50272;
    stim[58] = 52'hc64d2381b36f5;
    stim[59] = 52'hb584a6d304107;
    stim[60] = 52'h702536c0f7bb3;
    stim[61] = 52'hf77e383971ee9;
    stim[62] = 52'h1319dad4b28c6;
    stim[63] = 52'ha497164cb3939;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
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
