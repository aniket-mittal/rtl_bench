// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 83;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04285 dut (
    .WBs_CLK_i(clk),
    .WBs_ADR_i(in_vec[54:48]),
    .WBs_CYC_i(in_vec[47:47]),
    .WBs_BYTE_STB_i(in_vec[46:43]),
    .WBs_WE_i(in_vec[42:42]),
    .WBs_STB_i(in_vec[41:41]),
    .WBs_DAT_i(in_vec[40:9]),
    .WBs_RST_i(in_vec[8:8]),
    .GPIO_IN_i(in_vec[7:0]),
    .WBs_DAT_o(out_vec[82:51]),
    .WBs_ACK_o(out_vec[50:50]),
    .CLK_4M_CNTL_o(out_vec[49:49]),
    .CLK_1M_CNTL_o(out_vec[48:48]),
    .Device_ID_o(out_vec[47:16]),
    .GPIO_OUT_o(out_vec[15:8]),
    .GPIO_OE_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h220f3ef88fef19;
    stim[1] = 55'h79ad113d6227a9;
    stim[2] = 55'h3ed4346f6eac6d;
    stim[3] = 55'h648f600a294647;
    stim[4] = 55'h194deac8e8f61b;
    stim[5] = 55'h04b05304db4eb9;
    stim[6] = 55'h2c1288c5524040;
    stim[7] = 55'h523d221c959f41;
    stim[8] = 55'h23ba6690be8e2d;
    stim[9] = 55'h6466f8130b1482;
    stim[10] = 55'h081a9e13864cb6;
    stim[11] = 55'h089bc2239a1604;
    stim[12] = 55'h6968f6b73a98ab;
    stim[13] = 55'h5ac831560cdabb;
    stim[14] = 55'h02c09a170474b8;
    stim[15] = 55'h20ec3059a0f623;
    stim[16] = 55'h76ed36944aacc5;
    stim[17] = 55'h1d196bcbe8a081;
    stim[18] = 55'h2f5b1dcdea46c2;
    stim[19] = 55'h4cbae4f5b8aa92;
    stim[20] = 55'h1fe43a388c6a2f;
    stim[21] = 55'h21c27af7b77ebe;
    stim[22] = 55'h52ba61315c2e4a;
    stim[23] = 55'h0669d5900c0220;
    stim[24] = 55'h19c3f31a20921f;
    stim[25] = 55'h19ddad5f82d413;
    stim[26] = 55'h69af046a610260;
    stim[27] = 55'h2ddace7a5172b8;
    stim[28] = 55'h5aad28ed0352be;
    stim[29] = 55'h748af3e035380b;
    stim[30] = 55'h76be12e0736033;
    stim[31] = 55'h290574e62c82d1;
    stim[32] = 55'h2a06d227d0b651;
    stim[33] = 55'h16299bed86d04a;
    stim[34] = 55'h4d6d50c02282fb;
    stim[35] = 55'h597ab0af5daad4;
    stim[36] = 55'h76ac4dda8da287;
    stim[37] = 55'h1d1da59c6e807c;
    stim[38] = 55'h6a0c783c9974c0;
    stim[39] = 55'h53e784715c52af;
    stim[40] = 55'h41f89dfa19e6eb;
    stim[41] = 55'h6abbf51ac26edf;
    stim[42] = 55'h484e66ed317ab3;
    stim[43] = 55'h6ba298c947c221;
    stim[44] = 55'h3be40d0de4a4c4;
    stim[45] = 55'h695bc7a4e2064a;
    stim[46] = 55'h30900760f3e005;
    stim[47] = 55'h21fc4edf3a6833;
    stim[48] = 55'h15e5b1fc233cd1;
    stim[49] = 55'h1a44ae0c02ecd6;
    stim[50] = 55'h1c453b8047b818;
    stim[51] = 55'h1343025683d877;
    stim[52] = 55'h2c5d766ddb9ee5;
    stim[53] = 55'h7fca54f574f4da;
    stim[54] = 55'h7e4c9e960e543c;
    stim[55] = 55'h269e73b9a50855;
    stim[56] = 55'h73d6f65bf6ae22;
    stim[57] = 55'h57b83f573880d1;
    stim[58] = 55'h7b54c044fa68f0;
    stim[59] = 55'h2b4773a794b808;
    stim[60] = 55'h7ac17c8e5b62d1;
    stim[61] = 55'h7057b8ecf2b29a;
    stim[62] = 55'h17e8e0b4f2ae57;
    stim[63] = 55'h11b1f8734c50d8;
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
      expv[0] = 83'h7d5ef7d6056a37e570000;
      expv[1] = 83'h7d5ef7d6056a37e570000;
      expv[2] = 83'h7d5ef7d6056a37e570000;
      expv[3] = 83'h7d5ef7d6056a37e570000;
      expv[4] = 83'h7d5ef7d6456a37e570000;
      expv[5] = 83'h00000000056a37e570000;
      expv[6] = 83'h7d5ef7d6056a37e570000;
      expv[7] = 83'h7d5ef7d6056a37e570000;
      expv[8] = 83'h7d5ef7d6056a37e570000;
      expv[9] = 83'h7d5ef7d6456a37e570000;
      expv[10] = 83'h7d5ef7d6056a37e570000;
      expv[11] = 83'h7d5ef7d6056a37e570000;
      expv[12] = 83'h7d5ef7d6456a37e570000;
      expv[13] = 83'h7d5ef7d6056a37e570000;
      expv[14] = 83'h0000005c056a37e570000;
      expv[15] = 83'h7d5ef7d6056a37e570000;
      expv[16] = 83'h7d5ef7d6056a37e570000;
      expv[17] = 83'h7d5ef7d6056a37e570000;
      expv[18] = 83'h7d5ef7d6056a37e570000;
      expv[19] = 83'h7d5ef7d6056a37e570000;
      expv[20] = 83'h7d5ef7d6456a37e570000;
      expv[21] = 83'h7d5ef7d6056a37e570000;
      expv[22] = 83'h7d5ef7d6456a37e570000;
      expv[23] = 83'h7d5ef7d6056a37e570000;
      expv[24] = 83'h7d5ef7d6056a37e570000;
      expv[25] = 83'h7d5ef7d6456a37e570000;
      expv[26] = 83'h7d5ef7d6056a37e570000;
      expv[27] = 83'h7d5ef7d6456a37e570000;
      expv[28] = 83'h7d5ef7d6056a37e570000;
      expv[29] = 83'h7d5ef7d6056a37e570000;
      expv[30] = 83'h7d5ef7d6456a37e570000;
      expv[31] = 83'h7d5ef7d6056a37e570000;
      expv[32] = 83'h7d5ef7d6056a37e570000;
      expv[33] = 83'h7d5ef7d6056a37e570000;
      expv[34] = 83'h7d5ef7d6056a37e570000;
      expv[35] = 83'h7d5ef7d6056a37e570000;
      expv[36] = 83'h7d5ef7d6056a37e570000;
      expv[37] = 83'h7d5ef7d6056a37e570000;
      expv[38] = 83'h7d5ef7d6056a37e570000;
      expv[39] = 83'h7d5ef7d6056a37e570000;
      expv[40] = 83'h7d5ef7d6456a37e570000;
      expv[41] = 83'h7d5ef7d6056a37e570000;
      expv[42] = 83'h7d5ef7d6456a37e570000;
      expv[43] = 83'h7d5ef7d6056a37e570000;
      expv[44] = 83'h7d5ef7d6456a37e570000;
      expv[45] = 83'h7d5ef7d6056a37e570000;
      expv[46] = 83'h7d5ef7d6056a37e570000;
      expv[47] = 83'h7d5ef7d6056a37e570000;
      expv[48] = 83'h7d5ef7d6056a37e570000;
      expv[49] = 83'h7d5ef7d6056a37e570000;
      expv[50] = 83'h7d5ef7d6056a37e570000;
      expv[51] = 83'h7d5ef7d6056a37e570000;
      expv[52] = 83'h7d5ef7d6056a37e570000;
      expv[53] = 83'h7d5ef7d6056a37e570000;
      expv[54] = 83'h7d5ef7d6456a37e570000;
      expv[55] = 83'h7d5ef7d6056a37e570000;
      expv[56] = 83'h7d5ef7d6456a37e570000;
      expv[57] = 83'h7d5ef7d6056a37e570000;
      expv[58] = 83'h7d5ef7d6056a37e570000;
      expv[59] = 83'h7d5ef7d6056a37e570000;
      expv[60] = 83'h7d5ef7d6056a37e570000;
      expv[61] = 83'h7d5ef7d6056a37e570000;
      expv[62] = 83'h7d5ef7d6056a37e570000;
      expv[63] = 83'h7d5ef7d6056a37e570000;
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
