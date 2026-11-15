// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_102117 dut (
    .instruction(in_vec[63:0]),
    .opcode(out_vec[103:98]),
    .func(out_vec[97:88]),
    .Store_or_load_address(out_vec[87:66]),
    .Data_register_or_address(out_vec[65:44]),
    .Image_Buffer_Register(out_vec[43:22]),
    .Resize_Reg_1(out_vec[21:11]),
    .Resize_Reg_2(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h72da94182b52dc2a;
    stim[1] = 64'h3e9b1ae08ca25019;
    stim[2] = 64'h390217540116cafa;
    stim[3] = 64'h1c4b93a401d8d603;
    stim[4] = 64'h79068a294edae036;
    stim[5] = 64'h7f7f9092f80a3c4f;
    stim[6] = 64'h3b56c36424b3d87c;
    stim[7] = 64'ha2f1d5271c0ef9e3;
    stim[8] = 64'h238687defc8c513e;
    stim[9] = 64'hc318d445d95aa22b;
    stim[10] = 64'hb4d3f6e5ca44d747;
    stim[11] = 64'h965796e13e12675e;
    stim[12] = 64'h6c394fa88e8d3544;
    stim[13] = 64'ha311aade88524e61;
    stim[14] = 64'h2bce191ef44d0ef1;
    stim[15] = 64'h88738c7e493c176c;
    stim[16] = 64'h1207497ea0ef0f9e;
    stim[17] = 64'h8bb1f5b56b2652bb;
    stim[18] = 64'hef2594544b501676;
    stim[19] = 64'h52c53fff5f330259;
    stim[20] = 64'hcdb9c3361e997212;
    stim[21] = 64'h7908de8ea0cadc29;
    stim[22] = 64'he1f61a70f16c4fa9;
    stim[23] = 64'h560872c9d44bfe66;
    stim[24] = 64'h0258e2b8a5212e25;
    stim[25] = 64'h6db263d2a0844fb9;
    stim[26] = 64'he2e4e5f2e153f59e;
    stim[27] = 64'h2ebca37c71308a2d;
    stim[28] = 64'h897c9164c72ea854;
    stim[29] = 64'ha916fddaa7ea76a9;
    stim[30] = 64'h2a32c6c2a5057db1;
    stim[31] = 64'hf6672c61acea9cdb;
    stim[32] = 64'he30305ff1aad329c;
    stim[33] = 64'h6527a2095dd22995;
    stim[34] = 64'hb4937041a02f927a;
    stim[35] = 64'h01ae81fcf759ea13;
    stim[36] = 64'ha6e6e94a8d45971f;
    stim[37] = 64'heee9c8cbec2371d4;
    stim[38] = 64'h2e746787b9b3ab71;
    stim[39] = 64'hed148deb53e7d043;
    stim[40] = 64'h246b8100ec477b16;
    stim[41] = 64'hbb24699f61551e7d;
    stim[42] = 64'haa0d1504eca27fb2;
    stim[43] = 64'h7697d6a12aa4781c;
    stim[44] = 64'h2414f8370a545ff6;
    stim[45] = 64'hb94a963313b9f1c2;
    stim[46] = 64'hcf1dae70f6aa0729;
    stim[47] = 64'hd8dec577188e3874;
    stim[48] = 64'h6067d195992904fd;
    stim[49] = 64'hf584b3f1c08b5ca7;
    stim[50] = 64'h8061afa409af2a7a;
    stim[51] = 64'h871863be3cbf0f3c;
    stim[52] = 64'h165e39d40d8679b9;
    stim[53] = 64'h3bdd6e2edb12c1ba;
    stim[54] = 64'hff97162a46814095;
    stim[55] = 64'hb3af757d51775a99;
    stim[56] = 64'hc306950bbaff331c;
    stim[57] = 64'h4edb4c8a585f343d;
    stim[58] = 64'he2e1a382fe769163;
    stim[59] = 64'h6fbaab6bf11f0787;
    stim[60] = 64'hbf68b3bc12027678;
    stim[61] = 64'h489a9967ee76cc6a;
    stim[62] = 64'h023cebc838c4c7b6;
    stim[63] = 64'hc296e4521ec2af37;
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
      expv[0] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 104'h6672xxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 104'h584bxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 104'hf971xxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
