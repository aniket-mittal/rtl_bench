// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167782 dut (
    .data0_in(in_vec[72:41]),
    .data1_in(in_vec[40:9]),
    .data2_in(in_vec[8:4]),
    .ALUCtrl(in_vec[3:0]),
    .data_out(out_vec[32:1]),
    .Zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h0734af60f09e6aea6b3;
    stim[1] = 73'h0e6d8d32982c7a0af79;
    stim[2] = 73'h055ae4e3371351fe9dc;
    stim[3] = 73'h0fe1ea8db6685949309;
    stim[4] = 73'h1a9a70e4e894a319b1d;
    stim[5] = 73'h0a4c12affaa819f01ae;
    stim[6] = 73'h1027d24d17de0794ab8;
    stim[7] = 73'h1be5899bab7cb7f8ad9;
    stim[8] = 73'h11f2e0aa2109329691b;
    stim[9] = 73'h1fbb88807c33cecd283;
    stim[10] = 73'h0c6b8dcd81f71b43556;
    stim[11] = 73'h01e2f93543b84724b8f;
    stim[12] = 73'h011075c86239147e90d;
    stim[13] = 73'h1698902925029bc9b2d;
    stim[14] = 73'h06d0983247a7d157b30;
    stim[15] = 73'h06dd7ba3c99bbbaaf31;
    stim[16] = 73'h0c02c6735ed10432151;
    stim[17] = 73'h103baeb46d11d31f37f;
    stim[18] = 73'h02d4283155d859cf972;
    stim[19] = 73'h1ba24c5a0d37f01665f;
    stim[20] = 73'h02db6e9959e1577a318;
    stim[21] = 73'h0523dbf405a1324c9e8;
    stim[22] = 73'h0a141a6ac3ae28f4656;
    stim[23] = 73'h07fe7ce335831c3309c;
    stim[24] = 73'h0f110215ebd0ba66512;
    stim[25] = 73'h0ba47dbc66ed1a0e02b;
    stim[26] = 73'h12cfe49159274e022b2;
    stim[27] = 73'h1239a3921e7c589ba44;
    stim[28] = 73'h0c2b1b6c22e0013d8d0;
    stim[29] = 73'h072e92698010167db65;
    stim[30] = 73'h03e7db24f2d6e1cef23;
    stim[31] = 73'h0fec3de2e4afef6081b;
    stim[32] = 73'h1523ab36a14fdd77f33;
    stim[33] = 73'h03afa3afb708ea88adc;
    stim[34] = 73'h0a71561e96085d76722;
    stim[35] = 73'h0b44886581783f771d6;
    stim[36] = 73'h08c8c53335d71792bd0;
    stim[37] = 73'h1883a376f595b2f7e8c;
    stim[38] = 73'h199d62aef64ca29e86b;
    stim[39] = 73'h10cdf7138ce8fcb4d7c;
    stim[40] = 73'h14693a6f020cb6bfe74;
    stim[41] = 73'h063c8e26a6103e8ec27;
    stim[42] = 73'h081d268850fe2893aac;
    stim[43] = 73'h125b5928c89b4154e21;
    stim[44] = 73'h0f2773c27daf79fb287;
    stim[45] = 73'h17d885405f8b24c4fa8;
    stim[46] = 73'h00e4f44e935535b7d15;
    stim[47] = 73'h0631655c6b8a99c3565;
    stim[48] = 73'h0fb830778fc0ef1752a;
    stim[49] = 73'h11033e674efd9539f38;
    stim[50] = 73'h003978a854821a6587b;
    stim[51] = 73'h0db57913935bab16b09;
    stim[52] = 73'h1b9fe84522a3dac8ae5;
    stim[53] = 73'h1c01929c7fd7a9bdbfe;
    stim[54] = 73'h0a17545c7e8a7ae71a5;
    stim[55] = 73'h186f8c6b871446294a2;
    stim[56] = 73'h194802088e06758aac6;
    stim[57] = 73'h0c2ca6d73cc995947fc;
    stim[58] = 73'h1549ea50e70b63389aa;
    stim[59] = 73'h0f9fab2094415773d71;
    stim[60] = 73'h133174263ced2442b90;
    stim[61] = 73'h1f1eebc30f1811bca9e;
    stim[62] = 73'h10a5f1a03c1ddbc3b08;
    stim[63] = 73'h0334dc63e84377783e0;
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
      expv[0] = 33'h17aac58a8;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h0388464d4;
      expv[10] = 33'h0a74728a4;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h068090120;
      expv[15] = 33'h0fdffbabe;
      expv[16] = 33'h1ed3c6734;
      expv[17] = 33'h000000000;
      expv[18] = 33'h18ac8200c;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h0665f1766;
      expv[23] = 33'h000000000;
      expv[24] = 33'h1ae1bc7c2;
      expv[25] = 33'h000000000;
      expv[26] = 33'h0bf732936;
      expv[27] = 33'h07c589ba0;
      expv[28] = 33'h0020012c0;
      expv[29] = 33'h000000004;
      expv[30] = 33'h11313aea0;
      expv[31] = 33'h000000000;
      expv[32] = 33'h146c76414;
      expv[33] = 33'h000000000;
      expv[34] = 33'h0079b394e;
      expv[35] = 33'h09cc48ee8;
      expv[36] = 33'h00c005122;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h065b5ff00;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000000;
      expv[43] = 33'h1adb597ce;
      expv[44] = 33'h000000002;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000009aa8;
      expv[47] = 33'h0000002e2;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h00000a8f6;
      expv[53] = 33'h000000000;
      expv[54] = 33'h00000007a;
      expv[55] = 33'h1f83d294c;
      expv[56] = 33'h0b418c7de;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h1fdfff73c;
      expv[60] = 33'h102124022;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000054602;
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
