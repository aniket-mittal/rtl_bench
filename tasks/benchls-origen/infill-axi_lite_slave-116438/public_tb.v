// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116438 dut (
    .s00_axi_aclk(clk),
    .s00_axi_aresetn(in_vec[61:61]),
    .s00_axi_awaddr(in_vec[60:51]),
    .s00_axi_awvalid(in_vec[50:50]),
    .s00_axi_wdata(in_vec[49:18]),
    .s00_axi_wstrb(in_vec[17:14]),
    .s00_axi_wvalid(in_vec[13:13]),
    .s00_axi_bready(in_vec[12:12]),
    .s00_axi_araddr(in_vec[11:2]),
    .s00_axi_arvalid(in_vec[1:1]),
    .s00_axi_rready(in_vec[0:0]),
    .s00_axi_awready(out_vec[40:40]),
    .s00_axi_wready(out_vec[39:39]),
    .s00_axi_bresp(out_vec[38:37]),
    .s00_axi_bvalid(out_vec[36:36]),
    .s00_axi_arready(out_vec[35:35]),
    .s00_axi_rdata(out_vec[34:3]),
    .s00_axi_rresp(out_vec[2:1]),
    .s00_axi_rvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h032f62036a19980f;
    stim[1] = 62'h1c3e3771dda9e1be;
    stim[2] = 62'h2d2697c767d39ea4;
    stim[3] = 62'h2f565f61417fc150;
    stim[4] = 62'h3fca24805d3ef384;
    stim[5] = 62'h2251c2deff50375d;
    stim[6] = 62'h289bd94275ec009c;
    stim[7] = 62'h2a1c4daff6bf0740;
    stim[8] = 62'h377af111aad22f2f;
    stim[9] = 62'h3eb4bc6f3b5113c0;
    stim[10] = 62'h304b30b00bf2ebd0;
    stim[11] = 62'h3f7378931224ef28;
    stim[12] = 62'h3a7f3a3e530bdaaa;
    stim[13] = 62'h2d6f7573896337b6;
    stim[14] = 62'h2389e02fdbf908d6;
    stim[15] = 62'h396848892669bfb4;
    stim[16] = 62'h349f030097765b31;
    stim[17] = 62'h2e1acd655c0659f4;
    stim[18] = 62'h3d7e74c814399fee;
    stim[19] = 62'h342da49276190840;
    stim[20] = 62'h30a9ce66ba75db3b;
    stim[21] = 62'h256d9d995988ca32;
    stim[22] = 62'h2689a82aaad36d6f;
    stim[23] = 62'h35153004470faa42;
    stim[24] = 62'h3935044c458f1efc;
    stim[25] = 62'h3320cbf0aa4bdae7;
    stim[26] = 62'h3dda903b2af0e560;
    stim[27] = 62'h2a141056d93f0e3e;
    stim[28] = 62'h2e398a4cbc0ff6e9;
    stim[29] = 62'h3411865653ed7fe0;
    stim[30] = 62'h386838b1fe358a4a;
    stim[31] = 62'h23cb07688d98a6c3;
    stim[32] = 62'h2f945de13501649b;
    stim[33] = 62'h3933eb9b95372427;
    stim[34] = 62'h248aa8048a54974c;
    stim[35] = 62'h21a03975520690e5;
    stim[36] = 62'h26d2d818ce748f4c;
    stim[37] = 62'h2fde5fc32314514c;
    stim[38] = 62'h337cc3c00bf0295d;
    stim[39] = 62'h28c996fc05bd06b4;
    stim[40] = 62'h2716e1ec3df390a2;
    stim[41] = 62'h39b56e4819716a23;
    stim[42] = 62'h35995fb212d855e8;
    stim[43] = 62'h2e43d5f9007d6a4b;
    stim[44] = 62'h33116212b410dbe1;
    stim[45] = 62'h33f48f19eef10f95;
    stim[46] = 62'h2b3091552b239a3c;
    stim[47] = 62'h31d20e717bbccc81;
    stim[48] = 62'h214d5197d7211504;
    stim[49] = 62'h39345a4019fffb89;
    stim[50] = 62'h2d950ba8f949ef78;
    stim[51] = 62'h2d2400cd3e4247a5;
    stim[52] = 62'h385be60b7530106b;
    stim[53] = 62'h245d5af60734a65c;
    stim[54] = 62'h2423ab277a32e8af;
    stim[55] = 62'h20d9179752421467;
    stim[56] = 62'h3989c9e0bebf364a;
    stim[57] = 62'h296384483052a056;
    stim[58] = 62'h2c63ae6841eef19f;
    stim[59] = 62'h2117050e75260eb0;
    stim[60] = 62'h33da8b14d9113c18;
    stim[61] = 62'h3da76d93efa80e69;
    stim[62] = 62'h2f77ff8b5f084965;
    stim[63] = 62'h2761acadd7b3fb4f;
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
      expv[0] = 41'hxxxxxxxxxxx;
      expv[1] = 41'h0x000000000;
      expv[2] = 41'h0x000000000;
      expv[3] = 41'h0x000000000;
      expv[4] = 41'h0x000000000;
      expv[5] = 41'h0x000000000;
      expv[6] = 41'h0x000000000;
      expv[7] = 41'h0x000000000;
      expv[8] = 41'h0x000000000;
      expv[9] = 41'h0x800000000;
      expv[10] = 41'h0x000000001;
      expv[11] = 41'h0x000000001;
      expv[12] = 41'h0x000000001;
      expv[13] = 41'h0x000000001;
      expv[14] = 41'h19000000001;
      expv[15] = 41'h016eae712c1;
      expv[16] = 41'h006eae712c1;
      expv[17] = 41'h006eae712c0;
      expv[18] = 41'h006eae712c0;
      expv[19] = 41'h00eeae712c0;
      expv[20] = 41'h006eae712c1;
      expv[21] = 41'h006eae712c0;
      expv[22] = 41'h00eeae712c0;
      expv[23] = 41'h006eae712c1;
      expv[24] = 41'h006eae712c1;
      expv[25] = 41'h006eae712c1;
      expv[26] = 41'h006eae712c0;
      expv[27] = 41'h006eae712c0;
      expv[28] = 41'h00eeae712c0;
      expv[29] = 41'h006eae712c1;
      expv[30] = 41'h006eae712c1;
      expv[31] = 41'h006eae712c1;
      expv[32] = 41'h006eae712c0;
      expv[33] = 41'h00eeae712c0;
      expv[34] = 41'h006eae712c1;
      expv[35] = 41'h006eae712c1;
      expv[36] = 41'h006eae712c0;
      expv[37] = 41'h006eae712c0;
      expv[38] = 41'h006eae712c0;
      expv[39] = 41'h006eae712c0;
      expv[40] = 41'h006eae712c0;
      expv[41] = 41'h00eeae712c0;
      expv[42] = 41'h006eae712c1;
      expv[43] = 41'h006eae712c1;
      expv[44] = 41'h006eae712c0;
      expv[45] = 41'h006eae712c0;
      expv[46] = 41'h006eae712c0;
      expv[47] = 41'h006eae712c0;
      expv[48] = 41'h006eae712c0;
      expv[49] = 41'h006eae712c0;
      expv[50] = 41'h196eae712c0;
      expv[51] = 41'h016eae712c0;
      expv[52] = 41'h016eae712c0;
      expv[53] = 41'h00eeae712c0;
      expv[54] = 41'h000b48033f9;
      expv[55] = 41'h000b48033f8;
      expv[56] = 41'h008b48033f8;
      expv[57] = 41'h000b48033f9;
      expv[58] = 41'h000b48033f9;
      expv[59] = 41'h000b48033f8;
      expv[60] = 41'h000b48033f8;
      expv[61] = 41'h000b48033f8;
      expv[62] = 41'h000b48033f8;
      expv[63] = 41'h000b48033f8;
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
