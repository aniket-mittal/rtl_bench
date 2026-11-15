// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04084 dut (
    .clk(clk),
    .rst(in_vec[48:48]),
    .reg_R_addr_A(in_vec[47:43]),
    .reg_R_addr_B(in_vec[42:38]),
    .reg_W_addr(in_vec[37:33]),
    .wdata(in_vec[32:1]),
    .reg_we(in_vec[0:0]),
    .rdata_A(out_vec[63:32]),
    .rdata_B(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h1a28bf6976dc8;
    stim[1] = 49'h149793c68142e;
    stim[2] = 49'h0e652d4801d23;
    stim[3] = 49'h09552b5161a86;
    stim[4] = 49'h0b20ce5d4a34d;
    stim[5] = 49'h018cf8ef4b4e2;
    stim[6] = 49'h0d7ba5bf4101c;
    stim[7] = 49'h0342079aacb1d;
    stim[8] = 49'h00b0d84fc5e1e;
    stim[9] = 49'h02f6e45adde6d;
    stim[10] = 49'h0651fa4a674f2;
    stim[11] = 49'h044abe1b493ff;
    stim[12] = 49'h0a1e48f42c16a;
    stim[13] = 49'h06ac0bb756b20;
    stim[14] = 49'h0afa8ebb92f62;
    stim[15] = 49'h057640c9a7021;
    stim[16] = 49'h07fd3468c2719;
    stim[17] = 49'h0ca267976db89;
    stim[18] = 49'h0dc000b4af331;
    stim[19] = 49'h0f5ee5e320ab8;
    stim[20] = 49'h0074c0cd36754;
    stim[21] = 49'h0e8cb7e324926;
    stim[22] = 49'h07948e49f3728;
    stim[23] = 49'h0f562e9570b09;
    stim[24] = 49'h154a52946d89a;
    stim[25] = 49'h0c6bec76228f2;
    stim[26] = 49'h0ffdf08b3242c;
    stim[27] = 49'h0f4809181ee79;
    stim[28] = 49'h06734c351f799;
    stim[29] = 49'h0a4d4191ed5bb;
    stim[30] = 49'h049598d17fda5;
    stim[31] = 49'h05d085a50f859;
    stim[32] = 49'h067d18e72fa22;
    stim[33] = 49'h0f2cd53a8e558;
    stim[34] = 49'h04194271c5381;
    stim[35] = 49'h0a1390d85dfd8;
    stim[36] = 49'h0d6555107cf8e;
    stim[37] = 49'h0d258e9696db8;
    stim[38] = 49'h0564fc121abd2;
    stim[39] = 49'h0d81e2323b88e;
    stim[40] = 49'h0d9e312de97a7;
    stim[41] = 49'h07bce71532507;
    stim[42] = 49'h0b2d9f117832a;
    stim[43] = 49'h0894e0936636c;
    stim[44] = 49'h0411cade7fc87;
    stim[45] = 49'h0c8660733f820;
    stim[46] = 49'h0066165568ef7;
    stim[47] = 49'h0ec0b945077c9;
    stim[48] = 49'h0ad800f0fc45d;
    stim[49] = 49'h08475cd6d29d9;
    stim[50] = 49'h066797cebc94b;
    stim[51] = 49'h0073494066b41;
    stim[52] = 49'h022db5e6de412;
    stim[53] = 49'h0bd3c2139e169;
    stim[54] = 49'h0697040d62172;
    stim[55] = 49'h0961f532eaab9;
    stim[56] = 49'h057ac5d5b140d;
    stim[57] = 49'h0b30fca15b71d;
    stim[58] = 49'h0960b54744a4e;
    stim[59] = 49'h040375f3043a2;
    stim[60] = 49'h06217daca0d84;
    stim[61] = 49'h0abaa3c565107;
    stim[62] = 49'h022fbc2160bd3;
    stim[63] = 49'h0b3c44decd751;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h72ea51a600000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'hf0da49ff00000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h000000003cd5658e;
      expv[19] = 64'h0000000022d6ef36;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h00000000f0da49ff;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'hc68bfed200000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h000000002d287c2c;
      expv[36] = 64'h61a8fbcc00000000;
      expv[37] = 64'h61a8fbcc00000000;
      expv[38] = 64'h138e29c000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h896f4bd300000000;
      expv[44] = 64'h000000002d287c2c;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h00000000b2ab477b;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'hb2ab477b896f4bd3;
      expv[50] = 64'hc68bfed200000000;
      expv[51] = 64'h00000000be75e4a5;
      expv[52] = 64'h2d287c2c00000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h00000000ca283be4;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h138e29c0109cf0b4;
      expv[57] = 64'h2ead8a06c68bfed2;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'hc68bfed200000000;
      expv[61] = 64'h0000000056f3fe43;
      expv[62] = 64'h2d287c2c00000000;
      expv[63] = 64'h2ead8a06a997555c;
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
