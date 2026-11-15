// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01146 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .exp_10_o(out_vec[86:77]),
    .dvdnd_50_o(out_vec[76:27]),
    .dvsor_27_o(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h19afe45bdc88cb6be;
    stim[1] = 65'h153d5e4bd8a148a7f;
    stim[2] = 65'h02a357c9db45f066d;
    stim[3] = 65'h038178aa64bb9c1a3;
    stim[4] = 65'h085c4baaa48dd081a;
    stim[5] = 65'h03d39a8f3e86d015e;
    stim[6] = 65'h1d4cfc786d039481f;
    stim[7] = 65'h0835264d6038ee88f;
    stim[8] = 65'h041050c3c633b9b12;
    stim[9] = 65'h09eb40be56b0bbd9d;
    stim[10] = 65'h082164d70cee139f1;
    stim[11] = 65'h068a29a8d381ea03d;
    stim[12] = 65'h0e2e7f6a53e84bb1b;
    stim[13] = 65'h075b115b0c4b9bfb3;
    stim[14] = 65'h0701b59a441ea1238;
    stim[15] = 65'h03bc26e3b5e607552;
    stim[16] = 65'h06e3ab1abd00fec46;
    stim[17] = 65'h0dff55284ac6bf47f;
    stim[18] = 65'h0fe845908c32d09d2;
    stim[19] = 65'h024a6587cbd3d3cfd;
    stim[20] = 65'h0b9cfc3795a0b01f8;
    stim[21] = 65'h0deba7b10d4cc41cd;
    stim[22] = 65'h03a45b0fdf71291b8;
    stim[23] = 65'h0a4a907638e92a7f2;
    stim[24] = 65'h091913c403f58a734;
    stim[25] = 65'h0827fccb3769b6290;
    stim[26] = 65'h017ad81ac6ae1cb3a;
    stim[27] = 65'h0a32397dd96e4c9bb;
    stim[28] = 65'h03e55733dd7294ad5;
    stim[29] = 65'h068338fedba0b68a9;
    stim[30] = 65'h0ef30476bdbf115a2;
    stim[31] = 65'h0930fb708e492f4c2;
    stim[32] = 65'h05419af441dc0345d;
    stim[33] = 65'h070eb5f4dd39e48ce;
    stim[34] = 65'h08f5b3d1f0fcde30e;
    stim[35] = 65'h0ac53081130981110;
    stim[36] = 65'h09476b426352c39a2;
    stim[37] = 65'h032390281c729ed16;
    stim[38] = 65'h0056999dedad67548;
    stim[39] = 65'h00bb4e929b1da4283;
    stim[40] = 65'h095be37f052dee113;
    stim[41] = 65'h0a427b3714553ad06;
    stim[42] = 65'h0ec3b309d7ed3c07a;
    stim[43] = 65'h0ac69843339e13ba3;
    stim[44] = 65'h0798d95316b7cba66;
    stim[45] = 65'h00cf76ea444d71fb5;
    stim[46] = 65'h021c9e13074b993de;
    stim[47] = 65'h034353bfa51a20a4f;
    stim[48] = 65'h00dcdf90757dd6be3;
    stim[49] = 65'h0cf427139697d34a4;
    stim[50] = 65'h092f8f68464e1b2ed;
    stim[51] = 65'h03272445eec39f256;
    stim[52] = 65'h073d6fcf70f4e395e;
    stim[53] = 65'h0681b53f17af3289b;
    stim[54] = 65'h09e91c5f5a1e89fcc;
    stim[55] = 65'h06900757d4c6cb261;
    stim[56] = 65'h03206cb5aa0c31015;
    stim[57] = 65'h02fb98a6233745836;
    stim[58] = 65'h0807fe300bc59e09e;
    stim[59] = 65'h0cf22fac12a0f3885;
    stim[60] = 65'h09d708de4c51df662;
    stim[61] = 65'h039c1ebfd48a0e750;
    stim[62] = 65'h0d581d7a87b1e4410;
    stim[63] = 65'h0be87c81145033dc7;
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
      expv[0] = 87'h001fc8b7a00000008cb6be;
      expv[1] = 87'h001abc97a0000000948a7f;
      expv[2] = 87'h0016af93a0000000df066d;
      expv[3] = 87'h0012f154c0000000b9c1a3;
      expv[4] = 87'h0ff8975540000000dd081a;
      expv[5] = 87'h0d77351e60000000ed015e;
      expv[6] = 87'h0019f8f0c0000000b9481f;
      expv[7] = 87'h001a4c9ac00000008ee88f;
      expv[8] = 87'h0010a18780000000bb9b12;
      expv[9] = 87'h0ff6817ca00000008bbd9d;
      expv[10] = 87'h0fd2c9ae00000000e139f1;
      expv[11] = 87'h07745351a00000009ea03d;
      expv[12] = 87'h7cdcfed4a000000084bb1b;
      expv[13] = 87'h7cd622b600000000b9bfb3;
      expv[14] = 87'h1c136b3480000000ea1238;
      expv[15] = 87'h18f84dc760000000e07552;
      expv[16] = 87'h1c375635600000008fec46;
      expv[17] = 87'h1b9eaa5080000000ebf47f;
      expv[18] = 87'h07508b2100000000ad09d2;
      expv[19] = 87'h1774cb0f80000000bd3cfd;
      expv[20] = 87'h1cd9f86f200000008b01f8;
      expv[21] = 87'h1ed74f6200000000cc41cd;
      expv[22] = 87'h09d8b61fa00000009291b8;
      expv[23] = 87'h07d520ec6000000092a7f2;
      expv[24] = 87'h1272278800000000d8a734;
      expv[25] = 87'h00bff996600000009b6290;
      expv[26] = 87'h1575b03580000000e1cb3a;
      expv[27] = 87'h049472fba0000000e4c9bb;
      expv[28] = 87'h72daae67a0000000a94ad5;
      expv[29] = 87'h7b3671fda00000008b68a9;
      expv[30] = 87'h131608ed60000000f115a2;
      expv[31] = 87'h09b1f6e10000000092f4c2;
      expv[32] = 87'h1b7335e880000000c0345d;
      expv[33] = 87'h14dd6be9a00000009e48ce;
      expv[34] = 87'h7b9b67a3e0000000cde30e;
      expv[35] = 87'h1d9a610220000000981110;
      expv[36] = 87'h173ed684c0000000ac39a2;
      expv[37] = 87'h0fd7205020000000a9ed16;
      expv[38] = 87'h0edd333bc0000000d67548;
      expv[39] = 87'h07b69d2520000000da4283;
      expv[40] = 87'h0ab7c6fe00000000dee113;
      expv[41] = 87'h7a94f66e20000000d3ad06;
      expv[42] = 87'h06776613a0000000d3c07a;
      expv[43] = 87'h00bd308660000000e13ba3;
      expv[44] = 87'h07b1b2a620000000fcba66;
      expv[45] = 87'h0b5eedd480000000d71fb5;
      expv[46] = 87'h0c993c2600000000b993de;
      expv[47] = 87'h1396a77f40000000a20a4f;
      expv[48] = 87'h01f9bf20e0000000dd6be3;
      expv[49] = 87'h7b384e2720000000fd34a4;
      expv[50] = 87'h089f1ed080000000e1b2ed;
      expv[51] = 87'h7d7e488bc0000000b9f256;
      expv[52] = 87'h097adf9ee0000000ce395e;
      expv[53] = 87'h7b736a7e20000000f3289b;
      expv[54] = 87'h017238bea0000000e89fcc;
      expv[55] = 87'h29100eafa0000000ecb261;
      expv[56] = 87'h0b50d96b40000000c31015;
      expv[57] = 87'h0f37314c40000000f45836;
      expv[58] = 87'h173ff8c000000000d9e09e;
      expv[59] = 87'h14545f58200000008f3885;
      expv[60] = 87'h0efe11bc800000009df662;
      expv[61] = 87'h01183d7fa0000000a0e750;
      expv[62] = 87'h19303af5000000009e4410;
      expv[63] = 87'h05f0f90220000000833dc7;
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
