// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_192091 dut (
    .clk(clk),
    .run(in_vec[64:64]),
    .x(in_vec[63:32]),
    .y(in_vec[31:0]),
    .stall(out_vec[32:32]),
    .z(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1efc282b7f93ca0bc;
    stim[1] = 65'h093d9f4f8436e6d0f;
    stim[2] = 65'h0287c88317f2d69cd;
    stim[3] = 65'h115c0d3fdbc68351f;
    stim[4] = 65'h1ff14c6a0524cca20;
    stim[5] = 65'h0e493100ec85ec3a8;
    stim[6] = 65'h1e3a005e5a6fafcab;
    stim[7] = 65'h00f9e310b64df711e;
    stim[8] = 65'h052e937804423bbd6;
    stim[9] = 65'h00df4b0a6dde82b7a;
    stim[10] = 65'h1600c895fdc641004;
    stim[11] = 65'h1d98939db651da8f3;
    stim[12] = 65'h11ac3e47264e5398a;
    stim[13] = 65'h1166e9405bc6b0d39;
    stim[14] = 65'h0e32d5ba6280e2cf0;
    stim[15] = 65'h1b5f9d37947951947;
    stim[16] = 65'h07cc652998c38e6a1;
    stim[17] = 65'h085d2f4f97cbfd095;
    stim[18] = 65'h1304fd19e32aea9fe;
    stim[19] = 65'h11067a0415574db24;
    stim[20] = 65'h1a6e0d9f6e448e23c;
    stim[21] = 65'h101eb985e0a7c23f5;
    stim[22] = 65'h12efeed14965b54ca;
    stim[23] = 65'h1946dc69fc79bd72b;
    stim[24] = 65'h14895275801c8be43;
    stim[25] = 65'h055e4d9f95810a5bf;
    stim[26] = 65'h0f0383019bb18b3cb;
    stim[27] = 65'h000172a77ed46d903;
    stim[28] = 65'h0a27c0d6d994e2082;
    stim[29] = 65'h15bf370cb85c64753;
    stim[30] = 65'h0c465624777850d47;
    stim[31] = 65'h0e33be639bc3e7866;
    stim[32] = 65'h0331ca2b2d199733a;
    stim[33] = 65'h1c3bf321769b2eb4c;
    stim[34] = 65'h1d1dc343f21dc981c;
    stim[35] = 65'h09947ecfa79dc249b;
    stim[36] = 65'h07ad5b2fe650a1290;
    stim[37] = 65'h04c3ec63fc156de96;
    stim[38] = 65'h19cd54171bbe67b93;
    stim[39] = 65'h0fe63f6094bc574fc;
    stim[40] = 65'h068cbeddd9285fba5;
    stim[41] = 65'h1043e185356b3c5a9;
    stim[42] = 65'h1acf1cbf4f396605c;
    stim[43] = 65'h10f905dc94604162b;
    stim[44] = 65'h151d7edfc2bfb8893;
    stim[45] = 65'h0c30b986438c0585b;
    stim[46] = 65'h0f0d53abe04de6cf1;
    stim[47] = 65'h1766c698d106930d9;
    stim[48] = 65'h0be2fb6a8a5c573d3;
    stim[49] = 65'h0a7d8df883091a4cc;
    stim[50] = 65'h0acd37ef46b8e3f95;
    stim[51] = 65'h095a9431d03769190;
    stim[52] = 65'h1851750b8cc1a41d5;
    stim[53] = 65'h0847050da326452d6;
    stim[54] = 65'h09559e71ece960400;
    stim[55] = 65'h195a5977c8d1e7823;
    stim[56] = 65'h024a94d40932f0efa;
    stim[57] = 65'h08cb43b84769704e4;
    stim[58] = 65'h19d36c7df8801dc90;
    stim[59] = 65'h0d9e40656b88b669c;
    stim[60] = 65'h0f61f977d5821fcd9;
    stim[61] = 65'h0f4bbb426a7d9b787;
    stim[62] = 65'h0c4d532cbc6b151d5;
    stim[63] = 65'h026ff80c721b2ed22;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h0xxxxxxxx;
      expv[2] = 33'h067800000;
      expv[3] = 33'h092000000;
      expv[4] = 33'h180000000;
      expv[5] = 33'h16d000000;
      expv[6] = 33'h04a800000;
      expv[7] = 33'h134800000;
      expv[8] = 33'h057000000;
      expv[9] = 33'h0ab800000;
      expv[10] = 33'h0fc800000;
      expv[11] = 33'h1ff000000;
      expv[12] = 33'h13f800000;
      expv[13] = 33'h192800000;
      expv[14] = 33'h1cb800000;
      expv[15] = 33'h0bd800000;
      expv[16] = 33'h1c9000000;
      expv[17] = 33'h0c2800000;
      expv[18] = 33'h023000000;
      expv[19] = 33'h125800000;
      expv[20] = 33'h14b000000;
      expv[21] = 33'h17fffffff;
      expv[22] = 33'h185000000;
      expv[23] = 33'h11c000000;
      expv[24] = 33'h10a800000;
      expv[25] = 33'h16e000000;
      expv[26] = 33'h06b800000;
      expv[27] = 33'h0ad800000;
      expv[28] = 33'h07fffffff;
      expv[29] = 33'h0a1800000;
      expv[30] = 33'h1fc000000;
      expv[31] = 33'h05f800000;
      expv[32] = 33'h0c5000000;
      expv[33] = 33'h0ed800000;
      expv[34] = 33'h1b3800000;
      expv[35] = 33'h1d3000000;
      expv[36] = 33'h07fffffff;
      expv[37] = 33'h0cd800000;
      expv[38] = 33'h018800000;
      expv[39] = 33'h180000000;
      expv[40] = 33'h0bb800000;
      expv[41] = 33'h01b000000;
      expv[42] = 33'h160800000;
      expv[43] = 33'h116000000;
      expv[44] = 33'h13d800000;
      expv[45] = 33'h1bc000000;
      expv[46] = 33'h0b5800000;
      expv[47] = 33'h046800000;
      expv[48] = 33'h124000000;
      expv[49] = 33'h098800000;
      expv[50] = 33'h0d8800000;
      expv[51] = 33'h080000000;
      expv[52] = 33'h011800000;
      expv[53] = 33'h180000000;
      expv[54] = 33'h024000000;
      expv[55] = 33'h07fffffff;
      expv[56] = 33'h180000000;
      expv[57] = 33'h0c3800000;
      expv[58] = 33'h07fffffff;
      expv[59] = 33'h152800000;
      expv[60] = 33'h080000000;
      expv[61] = 33'h05c800000;
      expv[62] = 33'h04b800000;
      expv[63] = 33'h008800000;
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
