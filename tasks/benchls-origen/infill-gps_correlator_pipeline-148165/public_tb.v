// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148165 dut (
    .clk(clk),
    .rst(in_vec[128:128]),
    .in(in_vec[127:0]),
    .out(out_vec[95:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h12a797fd1194061b60c1923132bb9cf7c;
    stim[1] = 129'h17f028c3b1a27892acc31a3b4eacdecce;
    stim[2] = 129'h0b60525e946ac452340425eef84e593c9;
    stim[3] = 129'h0c94a54c65cde0856d0ca8d864a83e3c5;
    stim[4] = 129'h0f2e63ab070e8cdee3166540d4e24745c;
    stim[5] = 129'h0242061aeb754d66eb1bbea6f7e59f3ec;
    stim[6] = 129'h06ceed036b801f0a5aa3980a7dd5fe684;
    stim[7] = 129'h0b92fa2f7cf96c9e85a91f97cc71735db;
    stim[8] = 129'h0bffcd5f21e5689847ec15f55c351cfac;
    stim[9] = 129'h0b364b9f6a7e81a252edac5b242376c1e;
    stim[10] = 129'h0b22e0b419c4cc4775c6d44c479b0426d;
    stim[11] = 129'h020f9d1713d4847c0f8fbf637f274b42a;
    stim[12] = 129'h0bd7f66946232f1fa5a0d9890142aacca;
    stim[13] = 129'h0d88ae79dc78c07fd667afd105332d8f4;
    stim[14] = 129'h09bfbf76740d40636e8faac4305bd85d8;
    stim[15] = 129'h0efc9d14088a328f973e65f03705a27ab;
    stim[16] = 129'h05e7e1c9e092abef3c414bfd0ef23132c;
    stim[17] = 129'h0c40d9ea06abdd5f0ac162c4484f4092a;
    stim[18] = 129'h0273f2da1c794b0cce6d17d2df5456a2f;
    stim[19] = 129'h01dbe8e80af17f0e8ad95d9c79a1c5f63;
    stim[20] = 129'h1d8d0ff869ac34a1b0ff46bea792d4910;
    stim[21] = 129'h0d8f8fdb4df5d4b4bf706475ae2a66dae;
    stim[22] = 129'h00316df34ec85859cf1f04bcd54f23e3c;
    stim[23] = 129'h00e6d401531bb87bdf4bfd4a2d07f9509;
    stim[24] = 129'h0a2dcc0b97387936ed39c2bee5742c84c;
    stim[25] = 129'h0509abe48c1ca43ee88b4358ead346a45;
    stim[26] = 129'h01f233a0eb1f278b58122d2df6799a785;
    stim[27] = 129'h0dda9bb9abff8f7edab7587f1bf04bccc;
    stim[28] = 129'h0c56dcfd4ba179ba85bad18a29f6efb51;
    stim[29] = 129'h08d58c086c9c3c4e37a8faa2f8b3929ee;
    stim[30] = 129'h04235f3c17b649842cdf71046b5a9a0ca;
    stim[31] = 129'h0b4cba740a369d70c7dd3df86d1a9fc89;
    stim[32] = 129'h09c647c4f2fd81bec19647673aff9fbfc;
    stim[33] = 129'h03ed2ae14bf36bb992729f71c48ce984b;
    stim[34] = 129'h0460e3d022a48ea18c4c69e50be6c4cf4;
    stim[35] = 129'h092210ab18d094c24c9ee54068ca6ed71;
    stim[36] = 129'h0864ca8e345c416e326c8752e1262a5ea;
    stim[37] = 129'h0ac7196a1c6026b83ee019beacbce2a39;
    stim[38] = 129'h0509cdc51924cdcc8f8429b48d51d9afb;
    stim[39] = 129'h0c81b03197428597c9d5fa57fe5e671f9;
    stim[40] = 129'h04100f1e3338130f6988fdb611b6e04c5;
    stim[41] = 129'h0981481dbde895b5244750c2ea0e65aa6;
    stim[42] = 129'h04167713f9b6a5d360677ef1b7c905231;
    stim[43] = 129'h0c203190acfd4bfde3b33a6f9d1ce9e1b;
    stim[44] = 129'h065485fe3bbbeb1f17a4d35daa17c24c1;
    stim[45] = 129'h0cd6d8fe6a9c15b699a81644532f0cbac;
    stim[46] = 129'h0a3917aa71c426fdfedba7e34f2b257ae;
    stim[47] = 129'h0f899c21ebb3fd3b1310069a0a50d7734;
    stim[48] = 129'h0271eab62f1cc7d7c26294449d52970ce;
    stim[49] = 129'h04443e24031e2d8c3610ac5779b9426fa;
    stim[50] = 129'h023947b6378c3f67ab711fe6ed611ad2e;
    stim[51] = 129'h07fe3dde9f8054f83214d07cb406d3ee1;
    stim[52] = 129'h0564e3f8cd9ebf4a260c4422cef60183f;
    stim[53] = 129'h06407668acf51b00e06a1cbe413008b64;
    stim[54] = 129'h008bb4ddb1eef51bd78e61d669cca7b27;
    stim[55] = 129'h0740426db2369d5a09febcb2db2af7a18;
    stim[56] = 129'h028ef3a678b29925ed515684de8573585;
    stim[57] = 129'h0eae590f7609679a239fccb1fe05cbf06;
    stim[58] = 129'h0b49a37ed8589f0a2a99cb1b4e22a6d01;
    stim[59] = 129'h0a210a9882f89222f2e7654737747a36f;
    stim[60] = 129'h0ad95e82a9f35b7f1d4488abbfc1b8596;
    stim[61] = 129'h087347b7de4850266f871072009e5b704;
    stim[62] = 129'h02c0bebc66cc9191e5500223b145e57a2;
    stim[63] = 129'h004b152bd1a26c0cb8cc0f39c007f70a7;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h000000000000000000000000;
      expv[4] = 96'h000000000000000000000000;
      expv[5] = 96'h000000000000000000000000;
      expv[6] = 96'h000000000000000000000000;
      expv[7] = 96'h000000000000000000000000;
      expv[8] = 96'h000000000000000000000000;
      expv[9] = 96'h000000000000000000000000;
      expv[10] = 96'h000000000000000000000000;
      expv[11] = 96'h000000000000000000000000;
      expv[12] = 96'h000000000000000000000000;
      expv[13] = 96'h000000000000000000000000;
      expv[14] = 96'h000000000000000000000000;
      expv[15] = 96'h000000000000000000000000;
      expv[16] = 96'h000000000000000000000000;
      expv[17] = 96'h000000000000000000000000;
      expv[18] = 96'h000000000000000000000000;
      expv[19] = 96'h000000000000000000000000;
      expv[20] = 96'h000000000000000000000000;
      expv[21] = 96'h000000000000000000000000;
      expv[22] = 96'h000000000000000000000000;
      expv[23] = 96'h000000000000000000000000;
      expv[24] = 96'h000000000000000000000000;
      expv[25] = 96'h000000000000000000000000;
      expv[26] = 96'h000000000000000000000000;
      expv[27] = 96'h000000000000000000000000;
      expv[28] = 96'h000000000000000000000000;
      expv[29] = 96'h000000000000000000000000;
      expv[30] = 96'h000000000000000000000000;
      expv[31] = 96'h000000000000000000000000;
      expv[32] = 96'h000000000000000000000000;
      expv[33] = 96'h000000000000000000000000;
      expv[34] = 96'h000000000000000000000000;
      expv[35] = 96'h000000000000000000000000;
      expv[36] = 96'h000000000000000000000000;
      expv[37] = 96'h000000000000000000000000;
      expv[38] = 96'h000000000000000000000000;
      expv[39] = 96'h000000000000000000000000;
      expv[40] = 96'h000000000000000000000000;
      expv[41] = 96'h000000000000000000000000;
      expv[42] = 96'h000000000000000000000000;
      expv[43] = 96'h000000000000000000000000;
      expv[44] = 96'h000000000000000000000000;
      expv[45] = 96'h000000000000000000000000;
      expv[46] = 96'h000000000000000000000000;
      expv[47] = 96'h000000000000000000000000;
      expv[48] = 96'h000000000000000000000000;
      expv[49] = 96'h000000000000000000000000;
      expv[50] = 96'h000000000000000000000000;
      expv[51] = 96'h000000000000000000000000;
      expv[52] = 96'h000000000000000000000000;
      expv[53] = 96'h000000000000000000000000;
      expv[54] = 96'h000000000000000000000000;
      expv[55] = 96'h000000000000000000000000;
      expv[56] = 96'h000000000000000000000000;
      expv[57] = 96'h000000000000000000000000;
      expv[58] = 96'h000000000000000000000000;
      expv[59] = 96'h000000000000000000000000;
      expv[60] = 96'h000000000000000000000000;
      expv[61] = 96'h000000000000000000000000;
      expv[62] = 96'h000000000000000000000000;
      expv[63] = 96'h000000000000000000000000;
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
