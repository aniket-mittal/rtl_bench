// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mul22c17u22c dut (
    .clk(clk),
    .dix(in_vec[61:40]),
    .diy(in_vec[39:18]),
    .diz(in_vec[17:1]),
    .iv(in_vec[0:0]),
    .dox(out_vec[44:23]),
    .doy(out_vec[22:1]),
    .ov(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h11d1274551224cd8;
    stim[1] = 62'h1a94ccbfebae3d64;
    stim[2] = 62'h0ebf02c5877c4aef;
    stim[3] = 62'h146a5adfdd0475bf;
    stim[4] = 62'h0f15e4496a5b038d;
    stim[5] = 62'h31e12ebb2e6ae586;
    stim[6] = 62'h1af05d1745605ee8;
    stim[7] = 62'h04c54f9bc1b444b3;
    stim[8] = 62'h16ba9651a75b2d0f;
    stim[9] = 62'h3c49157e00da16b5;
    stim[10] = 62'h264eac554361c6a6;
    stim[11] = 62'h399ea8b5b4a167f6;
    stim[12] = 62'h36001a45fe3145e6;
    stim[13] = 62'h15cc1583d5e23a1b;
    stim[14] = 62'h31eba61988b3d1ed;
    stim[15] = 62'h3b746571eacbb3d9;
    stim[16] = 62'h0145873a5cd66a76;
    stim[17] = 62'h134fc12d9a518251;
    stim[18] = 62'h34dc1c175b6c9500;
    stim[19] = 62'h079e62bb060ee4fe;
    stim[20] = 62'h03cc02cb1fd0e0e6;
    stim[21] = 62'h0357f9bfb78d1335;
    stim[22] = 62'h1497fb00070430d2;
    stim[23] = 62'h2341529bbd9904f1;
    stim[24] = 62'h16d9d1e40a563fd7;
    stim[25] = 62'h154fc3df314c9b49;
    stim[26] = 62'h12130fb44892dae3;
    stim[27] = 62'h2c7ad8bdae6ddb01;
    stim[28] = 62'h2316f256a54ce570;
    stim[29] = 62'h2cc610bed2f834e9;
    stim[30] = 62'h3fc4d2b316094be4;
    stim[31] = 62'h183915a63848824e;
    stim[32] = 62'h17d569f41650205c;
    stim[33] = 62'h0eac0ef7f369c2db;
    stim[34] = 62'h1c46a2810558ff6d;
    stim[35] = 62'h31e00e584e026bf8;
    stim[36] = 62'h1c7a07c7064e4423;
    stim[37] = 62'h1cd292e30729427a;
    stim[38] = 62'h2202f707f55c9ea9;
    stim[39] = 62'h1d605aa680403138;
    stim[40] = 62'h067e60c7eed6f92a;
    stim[41] = 62'h02905ca9b51d7f3b;
    stim[42] = 62'h2e14993a26672258;
    stim[43] = 62'h0f4f7b8fd61373dd;
    stim[44] = 62'h12ef1a05e6cdd190;
    stim[45] = 62'h3066a6904434fedf;
    stim[46] = 62'h0f543263c8307e6b;
    stim[47] = 62'h3572e1f3955ca11c;
    stim[48] = 62'h1c0dfaac5b001a8d;
    stim[49] = 62'h1813f6d25a5bd857;
    stim[50] = 62'h30d9b142025831e9;
    stim[51] = 62'h2be5c5bee9c491a9;
    stim[52] = 62'h2269df3cae22212e;
    stim[53] = 62'h19958a52db7cf8db;
    stim[54] = 62'h13eda889ad6408c5;
    stim[55] = 62'h330382d4ee1360b3;
    stim[56] = 62'h386e5f073baf30ff;
    stim[57] = 62'h1ef356d799a2d28c;
    stim[58] = 62'h2179709814b521a5;
    stim[59] = 62'h0755831eb981715d;
    stim[60] = 62'h067f4c93a037ec0b;
    stim[61] = 62'h355195118ad23ade;
    stim[62] = 62'h36e8da731c816b2f;
    stim[63] = 62'h1255a14a93024b5a;
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
      expv[0] = 45'hxxxxxxxxxxxx;
      expv[1] = 45'hxxxxxxxxxxxx;
      expv[2] = 45'hxxxxxxxxxxxx;
      expv[3] = 45'h0008a18073a1;
      expv[4] = 45'h0012c780cded;
      expv[5] = 45'h005aee01ba87;
      expv[6] = 45'h005aee01ba87;
      expv[7] = 45'h005aee01ba87;
      expv[8] = 45'h00028f005397;
      expv[9] = 45'h00905f8206a9;
      expv[10] = 45'h00fbd5820e5d;
      expv[11] = 45'h00fbd5820e5d;
      expv[12] = 45'h00fbd5820e5d;
      expv[13] = 45'h00fbd5820e5d;
      expv[14] = 45'h006115024b2f;
      expv[15] = 45'h017d6480c315;
      expv[16] = 45'h01b843034b8f;
      expv[17] = 45'h01b843034b8f;
      expv[18] = 45'h003a488089a1;
      expv[19] = 45'h003a488089a1;
      expv[20] = 45'h003a488089a1;
      expv[21] = 45'h003a488089a1;
      expv[22] = 45'h000730019c33;
      expv[23] = 45'h000730019c33;
      expv[24] = 45'h0047de813d7d;
      expv[25] = 45'h0066cc8401e3;
      expv[26] = 45'h0019da810ec3;
      expv[27] = 45'h00673484056d;
      expv[28] = 45'h00a50f82bfe5;
      expv[29] = 45'h00a50f82bfe5;
      expv[30] = 45'h001281804edf;
      expv[31] = 45'h001281804edf;
      expv[32] = 45'h001281804edf;
      expv[33] = 45'h001281804edf;
      expv[34] = 45'h0033ad83695b;
      expv[35] = 45'h00386c810175;
      expv[36] = 45'h00386c810175;
      expv[37] = 45'h008110838609;
      expv[38] = 45'h008110838609;
      expv[39] = 45'h002a280009dd;
      expv[40] = 45'h002a280009dd;
      expv[41] = 45'h002a280009dd;
      expv[42] = 45'h0007ad01fc19;
      expv[43] = 45'h0007ad01fc19;
      expv[44] = 45'h0069b883e135;
      expv[45] = 45'h0069b883e135;
      expv[46] = 45'h00605f811f41;
      expv[47] = 45'h000f2380628b;
      expv[48] = 45'h000f2380628b;
      expv[49] = 45'h0005d18023bf;
      expv[50] = 45'h00b9298651a3;
      expv[51] = 45'h00130b8019bd;
      expv[52] = 45'h0031f380d93f;
      expv[53] = 45'h0031f380d93f;
      expv[54] = 45'h0031bd00a117;
      expv[55] = 45'h00015d00096d;
      expv[56] = 45'h01589e859e6f;
      expv[57] = 45'h01682f802e2b;
      expv[58] = 45'h01682f802e2b;
      expv[59] = 45'h004bbf015821;
      expv[60] = 45'h0015298058a9;
      expv[61] = 45'h0032f68485fd;
      expv[62] = 45'h0032f68485fd;
      expv[63] = 45'h009bcc01469d;
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
