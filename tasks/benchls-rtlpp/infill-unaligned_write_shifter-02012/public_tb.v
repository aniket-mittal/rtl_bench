// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02012 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h23c841bbbefd36f956;
    stim[1] = 70'h3d68aaa50468a67505;
    stim[2] = 70'h1f42b8014f2b9e2062;
    stim[3] = 70'h0e65de0dd515e01ac2;
    stim[4] = 70'h115d7dea9dbced24e1;
    stim[5] = 70'h009db25d8b846a86bc;
    stim[6] = 70'h02a2d9dd60c985131a;
    stim[7] = 70'h1331141fffe13f2ce7;
    stim[8] = 70'h01aeeaf68a38a9b614;
    stim[9] = 70'h1e045ee9216a9f1da0;
    stim[10] = 70'h12bd630635afbc9b68;
    stim[11] = 70'h0e0d53f66fb0158bd9;
    stim[12] = 70'h0f8d2c6d56ad934acd;
    stim[13] = 70'h07270a30daecba12ba;
    stim[14] = 70'h1175178e410ab47739;
    stim[15] = 70'h0233e867611d3cc80b;
    stim[16] = 70'h000fdd922f16008233;
    stim[17] = 70'h138ff948190c668108;
    stim[18] = 70'h1a155edcc205ceb662;
    stim[19] = 70'h00e21f9c178b3e95ce;
    stim[20] = 70'h1b73fdac87aab8ff3a;
    stim[21] = 70'h03706dd90390a2aab4;
    stim[22] = 70'h1861a5c1986009071b;
    stim[23] = 70'h1eedcd2873b06d1384;
    stim[24] = 70'h10fba72f29f9b67ab7;
    stim[25] = 70'h1a79b66070d0971784;
    stim[26] = 70'h129ef3a5154d14c802;
    stim[27] = 70'h1471a5bca190b14d4a;
    stim[28] = 70'h17f89c0ab3876b073e;
    stim[29] = 70'h0fe1f3dbd7ef5fb075;
    stim[30] = 70'h065797546c21798ae0;
    stim[31] = 70'h0614556bf74049e352;
    stim[32] = 70'h0e8130ccbe71f22bd8;
    stim[33] = 70'h030dcedceadb3945aa;
    stim[34] = 70'h0182e7237d5ee52fce;
    stim[35] = 70'h1e0c6a87aadf1b7b1a;
    stim[36] = 70'h043dd605f382e0eca5;
    stim[37] = 70'h0305aaeb4c7422b5b7;
    stim[38] = 70'h188ce5ee5ba94bc9ee;
    stim[39] = 70'h0354489525a2f5df95;
    stim[40] = 70'h08af5f0a737699d3e3;
    stim[41] = 70'h08edb072210364ea6c;
    stim[42] = 70'h1afaffd02426899fc7;
    stim[43] = 70'h0690c0be8a475d9415;
    stim[44] = 70'h197998bf95530ca9f3;
    stim[45] = 70'h1f3302318245d1c123;
    stim[46] = 70'h0279bd42402e2554f1;
    stim[47] = 70'h0bfea90cb29c53a5a4;
    stim[48] = 70'h171b2719f6a01bfb9a;
    stim[49] = 70'h0824505a6fe027426f;
    stim[50] = 70'h05c24612deae901b7c;
    stim[51] = 70'h0501f1f002f97af962;
    stim[52] = 70'h15cf5e044adc9f46ed;
    stim[53] = 70'h194b7d14243ecd3e8e;
    stim[54] = 70'h1f5817ad4177aab3db;
    stim[55] = 70'h1f99089900e396fc19;
    stim[56] = 70'h167b84d58f5ed4673c;
    stim[57] = 70'h035ed0880601a6844c;
    stim[58] = 70'h332822402c8bce0ad7;
    stim[59] = 70'h1628798b8bd55885df;
    stim[60] = 70'h0d227afe340fd1d47d;
    stim[61] = 70'h0bf80c5153b6595ff1;
    stim[62] = 70'h057e6d0d489352fafc;
    stim[63] = 70'h152ca5d913415817bc;
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
      expv[0] = 33'h0fd36f956;
      expv[1] = 33'h068a67504;
      expv[2] = 33'h12b9e2062;
      expv[3] = 33'h115e01ac2;
      expv[4] = 33'h1bced24e0;
      expv[5] = 33'h1846a86bc;
      expv[6] = 33'h0c985131a;
      expv[7] = 33'h1e13f2ce6;
      expv[8] = 33'h038a9b614;
      expv[9] = 33'h16a9f1da1;
      expv[10] = 33'h1afbc9b68;
      expv[11] = 33'h1b0158bd8;
      expv[12] = 33'h0ad934acc;
      expv[13] = 33'h0ecba12ba;
      expv[14] = 33'h10ab47738;
      expv[15] = 33'h11d3cc80a;
      expv[16] = 33'h116008232;
      expv[17] = 33'h10c668109;
      expv[18] = 33'h005ceb662;
      expv[19] = 33'h18b3e95ce;
      expv[20] = 33'h1aab8ff3a;
      expv[21] = 33'h190a2aab4;
      expv[22] = 33'h06009071a;
      expv[23] = 33'h1b06d1384;
      expv[24] = 33'h1f9b67ab6;
      expv[25] = 33'h0d0971785;
      expv[26] = 33'h14d14c802;
      expv[27] = 33'h190b14d4b;
      expv[28] = 33'h1876b073e;
      expv[29] = 33'h1ef5fb074;
      expv[30] = 33'h021798ae0;
      expv[31] = 33'h14049e352;
      expv[32] = 33'h071f22bd8;
      expv[33] = 33'h0db3945aa;
      expv[34] = 33'h15ee52fce;
      expv[35] = 33'h0df1b7b1a;
      expv[36] = 33'h182e0eca4;
      expv[37] = 33'h07422b5b6;
      expv[38] = 33'h1a94bc9ee;
      expv[39] = 33'h1a2f5df94;
      expv[40] = 33'h17699d3e2;
      expv[41] = 33'h10364ea6c;
      expv[42] = 33'h026899fc6;
      expv[43] = 33'h0475d9414;
      expv[44] = 33'h1530ca9f2;
      expv[45] = 33'h045d1c122;
      expv[46] = 33'h02e2554f0;
      expv[47] = 33'h09c53a5a4;
      expv[48] = 33'h0a01bfb9a;
      expv[49] = 33'h1e027426e;
      expv[50] = 33'h0ae901b7c;
      expv[51] = 33'h0f97af962;
      expv[52] = 33'h0dc9f46ec;
      expv[53] = 33'h03ecd3e8e;
      expv[54] = 33'h177aab3da;
      expv[55] = 33'h0e396fc18;
      expv[56] = 33'h15ed4673c;
      expv[57] = 33'h001a6844c;
      expv[58] = 33'h08bce0ad6;
      expv[59] = 33'h1d55885de;
      expv[60] = 33'h00fd1d47c;
      expv[61] = 33'h1b6595ff0;
      expv[62] = 33'h09352fafc;
      expv[63] = 33'h1415817bc;
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
