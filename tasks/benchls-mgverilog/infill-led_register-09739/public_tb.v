// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09739 dut (
    .clk(clk),
    .rst(in_vec[96:96]),
    .addr_b(in_vec[95:64]),
    .data_b_in(in_vec[63:32]),
    .data_b_we(in_vec[31:0]),
    .LED(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h18a612a6ebc16451873f8c4dc;
    stim[1] = 97'h1c63d61cb8704db1a6160320d;
    stim[2] = 97'h0c9b68e0537216be48faf17d4;
    stim[3] = 97'h031e51068732e35db0ecff1e3;
    stim[4] = 97'h01d8519ab980cac3ff6ca2b85;
    stim[5] = 97'h01370b0b9be99d82076b093c9;
    stim[6] = 97'h06a05519e8bb6a817d9516458;
    stim[7] = 97'h0dffabaa495e5b80c2193352d;
    stim[8] = 97'h0b1d2ce7e44c766b657acd2a9;
    stim[9] = 97'h0b687bfef7fd14b4930614380;
    stim[10] = 97'h08a6b879ffbe4e044393e98ed;
    stim[11] = 97'h0dde313770cb0c7ec36609f98;
    stim[12] = 97'h0c6a28131e5bb3897f0f33b25;
    stim[13] = 97'h0356e0822cc2a7df861462013;
    stim[14] = 97'h0180abb78f9ae49c0fc86155f;
    stim[15] = 97'h00ad99d7d57f3267930951fb2;
    stim[16] = 97'h011f0625c45f8cca351043a8d;
    stim[17] = 97'h0f7a6c3960ab95fe4d1cefe0e;
    stim[18] = 97'h089b0ede4121cf46ddb512030;
    stim[19] = 97'h0bce7f20cfda2b624827830af;
    stim[20] = 97'h022d9aab286179c36e0a5b2f0;
    stim[21] = 97'h01dfc1fe34a913131fcb4eff7;
    stim[22] = 97'h0980da4375e27e534a2a16e48;
    stim[23] = 97'h08fd740cc23ae18406b48dd11;
    stim[24] = 97'h0f73a5bbbcb0ee8458276187a;
    stim[25] = 97'h0d55813e275e02df03501aa19;
    stim[26] = 97'h0103c6a24022811bc9dc98cbb;
    stim[27] = 97'h159d6191ad31332da2d33d6d7;
    stim[28] = 97'h0e66a0499057ad6f18ba22da7;
    stim[29] = 97'h005508f8126835dedf11448ba;
    stim[30] = 97'h095c21071765fa53ed3915ef5;
    stim[31] = 97'h03c3d4b8f28ad0d5ccc50e7b3;
    stim[32] = 97'h0a2bd2d8d1365af8147794b53;
    stim[33] = 97'h04035b12f55c701c936f3b2d2;
    stim[34] = 97'h09978f4c5bc7af6f708b25fe7;
    stim[35] = 97'h0afe19589cb4db4ea82df327a;
    stim[36] = 97'h0f6f3483718dbb8e2800366c0;
    stim[37] = 97'h026f2f96c444b913d8eb57b09;
    stim[38] = 97'h073f9716fd48a47b19d5c66bd;
    stim[39] = 97'h062e161f3ea0a165316bc8276;
    stim[40] = 97'h0565a42f66d6e3360e0343d02;
    stim[41] = 97'h0c0de563c7f0a28076eca9d76;
    stim[42] = 97'h07ef2428f4f5c1d1671a09167;
    stim[43] = 97'h0d2651295d5065612425b8028;
    stim[44] = 97'h00b2d33ebc6a722fb23afcdba;
    stim[45] = 97'h05097f6a619532a4e28f243ab;
    stim[46] = 97'h0d24e2440d2c91fa636c2255f;
    stim[47] = 97'h072ba009b4bc5ea8fb78b06ef;
    stim[48] = 97'h020f65e4def07f66f3a0775fa;
    stim[49] = 97'h0a71c9cd07a1e23008d20b83b;
    stim[50] = 97'h016a1bdc1f6f886c0477d01be;
    stim[51] = 97'h0c0421b068cb7ceedf100065c;
    stim[52] = 97'h0a6619b35784f00bf1b61c5ec;
    stim[53] = 97'h0be8001b34038f194fde00df6;
    stim[54] = 97'h01e26f52a286010deecd7cb0b;
    stim[55] = 97'h0725bda071e8f912fa54cc555;
    stim[56] = 97'h077355cc69a81011a21a3d7b4;
    stim[57] = 97'h0366e26a883f2191635deaff5;
    stim[58] = 97'h0c0571da27180c804f539eba7;
    stim[59] = 97'h0d25a299503cc81c1c8a27b69;
    stim[60] = 97'h0fc4176ae1e6f7814dd6c45f2;
    stim[61] = 97'h08ca89fddca89513970cc905b;
    stim[62] = 97'h0b8adf9884acca0e5cd39bb08;
    stim[63] = 97'h0b4016016c475cf02dcdd4b55;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
