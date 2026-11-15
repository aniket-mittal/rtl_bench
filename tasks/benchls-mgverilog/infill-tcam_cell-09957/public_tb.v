// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09957 dut (
    .clk(clk),
    .rst(in_vec[98:98]),
    .wdata(in_vec[97:66]),
    .wcare(in_vec[65:34]),
    .wused(in_vec[33:33]),
    .wena(in_vec[32:32]),
    .lookup_data(in_vec[31:0]),
    .match(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h62a19398a77b96ea96f74fb14;
    stim[1] = 99'h675fcba5ac8d5c412ba72bc02;
    stim[2] = 99'h0613f05ab5227a9fc80d94721;
    stim[3] = 99'h01effe82582e495f48d2bb5fd;
    stim[4] = 99'h17b1edac9ded92b67f605ddb7;
    stim[5] = 99'h0460e911be4382d493572d40a;
    stim[6] = 99'h4d56799d3a969f79d34fc4295;
    stim[7] = 99'h3c9cc7f0836c1094149735818;
    stim[8] = 99'h148eb9809c021ce64817e7f8f;
    stim[9] = 99'h316260a8f7f985e3e251070ec;
    stim[10] = 99'h2795f7098808693fffff1af02;
    stim[11] = 99'h33c38e8878348eb88b9d739e4;
    stim[12] = 99'h269492ef4a6b426ff5c2bd96f;
    stim[13] = 99'h285fa7ced073de604618458b6;
    stim[14] = 99'h3604ac2e0cb3d9de5a15ff6f3;
    stim[15] = 99'h1d13d4bfe44a2d186f790a60d;
    stim[16] = 99'h31fb1b83d5df8bdc3b98d244f;
    stim[17] = 99'h2e473aac0c47ba327b2056b29;
    stim[18] = 99'h3f812a8da60bc4f97ff0de0ea;
    stim[19] = 99'h3042527a87063667005212707;
    stim[20] = 99'h24a051b2ba233c7120b316bb3;
    stim[21] = 99'h2cedac3d66f1227ea5601692d;
    stim[22] = 99'h3aaeeb4498f08e28c48104bcf;
    stim[23] = 99'h3cde77d8c47576e59f5d0a7e9;
    stim[24] = 99'h036005ce160b18f4b2c843d0b;
    stim[25] = 99'h3e83b3009ada2f87e0f725453;
    stim[26] = 99'h1ceb2ac103428a2a316eaeb0f;
    stim[27] = 99'h3bc1b9d071d9a644b67a3333a;
    stim[28] = 99'h16bbe22654b9bb0c05472f075;
    stim[29] = 99'h35a6ef923fb6a26d441b8acd1;
    stim[30] = 99'h0a851685b9edfbeca18b9575d;
    stim[31] = 99'h1bdf3209933716cb45ab4629d;
    stim[32] = 99'h2f7d934e534af8a157c2e8685;
    stim[33] = 99'h12faff58542d0a5e2de09aa54;
    stim[34] = 99'h0b532f806f68e285a4f117e3f;
    stim[35] = 99'h024673fbcdd7287f0febdf9fe;
    stim[36] = 99'h25f1b82bd8e3c9457dcc7a447;
    stim[37] = 99'h3165286d622a313cc189f6d9a;
    stim[38] = 99'h3877c0ab547cd641ca161ba97;
    stim[39] = 99'h0ec09732d834248c65afb1737;
    stim[40] = 99'h1af30a7609f0a84d3829fbd3b;
    stim[41] = 99'h39eb5dbae14ecbb93ccc8f70c;
    stim[42] = 99'h31abfe33078ae05859b976622;
    stim[43] = 99'h008550d09635d2fbb865500c0;
    stim[44] = 99'h118a530295827548c8aef52c1;
    stim[45] = 99'h1494edb1ca2bcd07c3667adf2;
    stim[46] = 99'h161a7374a1f879e5094017789;
    stim[47] = 99'h116529169f466188bb1f221d9;
    stim[48] = 99'h0433b418c2eb224d80e76de82;
    stim[49] = 99'h1122ca87c21564afbe95e2ff3;
    stim[50] = 99'h17b3bb869a801e53970b43f88;
    stim[51] = 99'h385be177ec8d6e9700cb6018f;
    stim[52] = 99'h2b969a618e38b23fb1e13c427;
    stim[53] = 99'h20de31f78cf57b4dfdc3cb265;
    stim[54] = 99'h0daee33aac7893d5ef2e0a1f4;
    stim[55] = 99'h328a71e23654f72371425bd3d;
    stim[56] = 99'h0bca2af4fb079cb1e57ca4dc4;
    stim[57] = 99'h0756da0336c37cb8a0e06f719;
    stim[58] = 99'h337cd4570da64fbf9fcc44dd6;
    stim[59] = 99'h31427823e9fab2433d0254d8d;
    stim[60] = 99'h25cb7ce7ecb9072c2d3f87df3;
    stim[61] = 99'h08377b4d9f8c207201b5e3c07;
    stim[62] = 99'h3b90a8d461353486b33107303;
    stim[63] = 99'h3dd0957f54065202a1e3d28f1;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
