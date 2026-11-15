// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132761 dut (
    .A(in_vec[65:34]),
    .B(in_vec[33:2]),
    .CTRL(in_vec[1:0]),
    .RESULT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h1630af4d51d57bc28;
    stim[1] = 66'h301cf75a003382d98;
    stim[2] = 66'h231e42118fbdc5755;
    stim[3] = 66'h15eef5955f8b6a0ff;
    stim[4] = 66'h21e8714c3c6de2c66;
    stim[5] = 66'h2dbe9c751b1c83bdb;
    stim[6] = 66'h106950cac3d6f455b;
    stim[7] = 66'h33318bfc30ff29ef3;
    stim[8] = 66'h334cface4df6011cc;
    stim[9] = 66'h118380f7ee527ee04;
    stim[10] = 66'h1f09a335c50367712;
    stim[11] = 66'h1238d8552a7854803;
    stim[12] = 66'h18b018662bad6d13e;
    stim[13] = 66'h0ad508d469b4f0c96;
    stim[14] = 66'h0153552e5b93f26fb;
    stim[15] = 66'h27d9c6eae75d9759e;
    stim[16] = 66'h24a0b386c685e36ed;
    stim[17] = 66'h1aee2cad1ecb07458;
    stim[18] = 66'h12724d196dc10ad7f;
    stim[19] = 66'h2852dadadd64f714e;
    stim[20] = 66'h21b915b202ae322f2;
    stim[21] = 66'h2b041aecca6cb157e;
    stim[22] = 66'h112385bb4fd60ece1;
    stim[23] = 66'h3a8800f8cb95270d7;
    stim[24] = 66'h16dcce3db4be83ba1;
    stim[25] = 66'h3fdff440d8c47b016;
    stim[26] = 66'h3ccc428afc1613b8d;
    stim[27] = 66'h2354cdc0547c3fead;
    stim[28] = 66'h0e4ae1b6e08f66eb6;
    stim[29] = 66'h39b0b00db311de3d7;
    stim[30] = 66'h0897b0e91e7ba8b0b;
    stim[31] = 66'h137c763febb57806d;
    stim[32] = 66'h02c188cb191ab2f81;
    stim[33] = 66'h1fa0ddcc0d5932b6a;
    stim[34] = 66'h388ade47d07058659;
    stim[35] = 66'h1ed6c7fd5a9c0bf60;
    stim[36] = 66'h37a8fa776319355e6;
    stim[37] = 66'h2104e1b4080db5685;
    stim[38] = 66'h2aae1daece2e9a8c8;
    stim[39] = 66'h3974292c290a6b882;
    stim[40] = 66'h1f81a29315679e435;
    stim[41] = 66'h287ebbea7da13d24f;
    stim[42] = 66'h13838dd5fe5713332;
    stim[43] = 66'h0266e028feaf02155;
    stim[44] = 66'h2a856b8f1a8ea3e17;
    stim[45] = 66'h3664dad397491625f;
    stim[46] = 66'h3779ac9f40f5a2563;
    stim[47] = 66'h0d69c992c7a4f16ee;
    stim[48] = 66'h2432fbd75f10166ad;
    stim[49] = 66'h235f87637e54c7b62;
    stim[50] = 66'h3d2ea6be42bc23062;
    stim[51] = 66'h0a4e530719fb538ed;
    stim[52] = 66'h27d22f286d94fda9b;
    stim[53] = 66'h0cfbe792af58c7146;
    stim[54] = 66'h0a6d1ad658eea794c;
    stim[55] = 66'h0f78da60d3b4f08b9;
    stim[56] = 66'h021aba2d899201816;
    stim[57] = 66'h3f27cb3d9736d416d;
    stim[58] = 66'h3665f4bea469e51c8;
    stim[59] = 66'h34db78701bd5cf4f1;
    stim[60] = 66'h277213c7f13b00eb0;
    stim[61] = 66'h01bbfc5bebfcf7808;
    stim[62] = 66'h2ee244cbebb1976ef;
    stim[63] = 66'h0997dadb7cabee397;
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
      expv[0] = 32'h5898ac3f;
      expv[1] = 32'hc041e8ce;
      expv[2] = 32'hbe81f271;
      expv[3] = 32'h19000001;
      expv[4] = 32'h39ad51b0;
      expv[5] = 32'h8a000001;
      expv[6] = 32'h72000000;
      expv[7] = 32'h48800000;
      expv[8] = 32'hcd0befac;
      expv[9] = 32'h4657ff60;
      expv[10] = 32'h50ceaf9c;
      expv[11] = 32'hde800001;
      expv[12] = 32'hd1f4fde8;
      expv[13] = 32'h9252cdb5;
      expv[14] = 32'h56800000;
      expv[15] = 32'h7cdb40cd;
      expv[16] = 32'h9a6b4060;
      expv[17] = 32'h7b64cfca;
      expv[18] = 32'hd2000011;
      expv[19] = 32'hd734c7b1;
      expv[20] = 32'hd1bbfae0;
      expv[21] = 32'h966eb66d;
      expv[22] = 32'h44b5dbb5;
      expv[23] = 32'hfb800000;
      expv[24] = 32'h5b792a0e;
      expv[25] = 32'ha2e0d90f;
      expv[26] = 32'hf358bb48;
      expv[27] = 32'hd1e23756;
      expv[28] = 32'hfbbfbaff;
      expv[29] = 32'h5a000000;
      expv[30] = 32'h68000000;
      expv[31] = 32'h4d9bf8e4;
      expv[32] = 32'h641b574c;
      expv[33] = 32'h743f5ee0;
      expv[34] = 32'he26a1789;
      expv[35] = 32'h7b4b4fcd;
      expv[36] = 32'h2b626a75;
      expv[37] = 32'ha05cb12f;
      expv[38] = 32'hb8f2e0ed;
      expv[39] = 32'h4a343600;
      expv[40] = 32'h7e68113f;
      expv[41] = 32'h6a800018;
      expv[42] = 32'h8785ed54;
      expv[43] = 32'h7adf784e;
      expv[44] = 32'hff800000;
      expv[45] = 32'hbc000000;
      expv[46] = 32'h99800001;
      expv[47] = 32'h14a1afc9;
      expv[48] = 32'hfc0b95b2;
      expv[49] = 32'h469674f8;
      expv[50] = 32'hbfaeb358;
      expv[51] = 32'h67cbfde1;
      expv[52] = 32'h28800000;
      expv[53] = 32'hb13f2d6a;
      expv[54] = 32'h63ef09ac;
      expv[55] = 32'h4e8fa755;
      expv[56] = 32'h6ebacf8e;
      expv[57] = 32'hfcc3dc9b;
      expv[58] = 32'hd9bf676c;
      expv[59] = 32'hef16a484;
      expv[60] = 32'hc4b452cb;
      expv[61] = 32'h2fe3cf71;
      expv[62] = 32'h4c800000;
      expv[63] = 32'hf3000001;
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
