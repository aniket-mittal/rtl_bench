// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09411 dut (
    .clk(clk),
    .xin(in_vec[86:58]),
    .yin(in_vec[57:29]),
    .zin(in_vec[28:0]),
    .xout(out_vec[86:58]),
    .yout(out_vec[57:29]),
    .zout(out_vec[28:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h1c5322648fe9c7e1291f68;
    stim[1] = 87'h6f2b53e43802bb0338ac6d;
    stim[2] = 87'h0645967e4f83cc9eae16f3;
    stim[3] = 87'h5fb1b4f0db8696fd80b003;
    stim[4] = 87'h2de13035d0f6f4d7bf1f91;
    stim[5] = 87'h574510184d473bca0a0b73;
    stim[6] = 87'h3fddb37138c6f90a05e763;
    stim[7] = 87'h4ea774d09173ad70a605a8;
    stim[8] = 87'h587d85c484a5069de2131f;
    stim[9] = 87'h470c3866fa787fbab3eb15;
    stim[10] = 87'h316ed5ebb9b6524b049f2d;
    stim[11] = 87'h06959ee601439ad03603cd;
    stim[12] = 87'h5ab330295261f9768c2cf4;
    stim[13] = 87'h262a02e420e3773436962c;
    stim[14] = 87'h4483e53f05292e48a99785;
    stim[15] = 87'h135c56bce9859fc599023a;
    stim[16] = 87'h13e57929074d7954532f1c;
    stim[17] = 87'h7de9f2feb0eeef5acb1d1b;
    stim[18] = 87'h04357bbe02dc631be16679;
    stim[19] = 87'h5b676628922c99fdb44921;
    stim[20] = 87'h6e457d3fc7fe21acd371d5;
    stim[21] = 87'h2d6959526eefbf64da0196;
    stim[22] = 87'h11212c4740c565420c87a0;
    stim[23] = 87'h117089472a4b6f994f761a;
    stim[24] = 87'h14280581cb5f94b2765f11;
    stim[25] = 87'h3ca283c0ea28920142a13a;
    stim[26] = 87'h562b6b22949aa27c3d82ff;
    stim[27] = 87'h3d5de3606cb2d1ed98418a;
    stim[28] = 87'h37aeb4d9802bc666dd7ed7;
    stim[29] = 87'h28de9f1698ecd056201a22;
    stim[30] = 87'h1c2f15cedc11058ff7005f;
    stim[31] = 87'h156fdde2e7af60fbc2d19c;
    stim[32] = 87'h075d9cc4bd30e74b1de55b;
    stim[33] = 87'h2bc9deec3c26e860dcdb36;
    stim[34] = 87'h734c575f92b96c532ba05d;
    stim[35] = 87'h738dbd56d7fa69f446953a;
    stim[36] = 87'h39db686c08cac906f6d2a6;
    stim[37] = 87'h121680e41cda826f4757b8;
    stim[38] = 87'h04922d2c298e47c414b82b;
    stim[39] = 87'h6292466a601313579d5731;
    stim[40] = 87'h2637c117b9c8e7ec9a4cfa;
    stim[41] = 87'h5c2962f548a71ead9698f7;
    stim[42] = 87'h2ff801bead4811675f4096;
    stim[43] = 87'h2afc7fe160306678cea6da;
    stim[44] = 87'h29e0027f8709f8f842392b;
    stim[45] = 87'h134c6b2684ac70aa643153;
    stim[46] = 87'h553b1f9da99e392498d54f;
    stim[47] = 87'h2209a3acce0d9947c30e51;
    stim[48] = 87'h047b6e66c3de9ff0e33be9;
    stim[49] = 87'h15bccf283fdfe64c2cded7;
    stim[50] = 87'h088a715faa01697ef7acf4;
    stim[51] = 87'h06fdf3e96c9ac728d1a219;
    stim[52] = 87'h5bafeabcfe342c77eef5a1;
    stim[53] = 87'h620fdac1e2a0cf34c3fce3;
    stim[54] = 87'h71825e7953a717b8ff93cb;
    stim[55] = 87'h4eeaddeb0bd35e57a4fdb7;
    stim[56] = 87'h502040b1927cf059b526f3;
    stim[57] = 87'h0d5eeaf84b7efbc9971bf4;
    stim[58] = 87'h0602547e9e8ecb24f2da02;
    stim[59] = 87'h4b0640f690e4623d4c8228;
    stim[60] = 87'h7c3ad1096171ceea01c4ac;
    stim[61] = 87'h7295c109e3066fe4600ca6;
    stim[62] = 87'h031ca5f815fccd29732d2b;
    stim[63] = 87'h15c728ca9fc3934100afb4;
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
      expv[0] = 87'hxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 87'hxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 87'h1c5322648fe9c7e1291f68;
      expv[3] = 87'h6f2b53e43802bb0338ac6d;
      expv[4] = 87'h0645967e4f83cc9eae16f3;
      expv[5] = 87'h5fb1b4f0db8696fd80b003;
      expv[6] = 87'h2de13035d0f6f4d7bf1f91;
      expv[7] = 87'h574510184d473bca0a0b73;
      expv[8] = 87'h3fddb37138c6f90a05e763;
      expv[9] = 87'h4ea774d09173ad70a605a8;
      expv[10] = 87'h587d85c484a5069de2131f;
      expv[11] = 87'h470c3866fa787fbab3eb15;
      expv[12] = 87'h316ed5ebb9b6524b049f2d;
      expv[13] = 87'h06959ee601439ad03603cd;
      expv[14] = 87'h5ab330295261f9768c2cf4;
      expv[15] = 87'h262a02e420e3773436962c;
      expv[16] = 87'h4483e53f05292e48a99785;
      expv[17] = 87'h135c56bce9859fc599023a;
      expv[18] = 87'h13e57929074d7954532f1c;
      expv[19] = 87'h7de9f2feb0eeef5acb1d1b;
      expv[20] = 87'h04357bbe02dc631be16679;
      expv[21] = 87'h5b676628922c99fdb44921;
      expv[22] = 87'h6e457d3fc7fe21acd371d5;
      expv[23] = 87'h2d6959526eefbf64da0196;
      expv[24] = 87'h11212c4740c565420c87a0;
      expv[25] = 87'h117089472a4b6f994f761a;
      expv[26] = 87'h14280581cb5f94b2765f11;
      expv[27] = 87'h3ca283c0ea28920142a13a;
      expv[28] = 87'h562b6b22949aa27c3d82ff;
      expv[29] = 87'h3d5de3606cb2d1ed98418a;
      expv[30] = 87'h37aeb4d9802bc666dd7ed7;
      expv[31] = 87'h28de9f1698ecd056201a22;
      expv[32] = 87'h1c2f15cedc11058ff7005f;
      expv[33] = 87'h156fdde2e7af60fbc2d19c;
      expv[34] = 87'h075d9cc4bd30e74b1de55b;
      expv[35] = 87'h2bc9deec3c26e860dcdb36;
      expv[36] = 87'h734c575f92b96c532ba05d;
      expv[37] = 87'h738dbd56d7fa69f446953a;
      expv[38] = 87'h39db686c08cac906f6d2a6;
      expv[39] = 87'h121680e41cda826f4757b8;
      expv[40] = 87'h04922d2c298e47c414b82b;
      expv[41] = 87'h6292466a601313579d5731;
      expv[42] = 87'h2637c117b9c8e7ec9a4cfa;
      expv[43] = 87'h5c2962f548a71ead9698f7;
      expv[44] = 87'h2ff801bead4811675f4096;
      expv[45] = 87'h2afc7fe160306678cea6da;
      expv[46] = 87'h29e0027f8709f8f842392b;
      expv[47] = 87'h134c6b2684ac70aa643153;
      expv[48] = 87'h553b1f9da99e392498d54f;
      expv[49] = 87'h2209a3acce0d9947c30e51;
      expv[50] = 87'h047b6e66c3de9ff0e33be9;
      expv[51] = 87'h15bccf283fdfe64c2cded7;
      expv[52] = 87'h088a715faa01697ef7acf4;
      expv[53] = 87'h06fdf3e96c9ac728d1a219;
      expv[54] = 87'h5bafeabcfe342c77eef5a1;
      expv[55] = 87'h620fdac1e2a0cf34c3fce3;
      expv[56] = 87'h71825e7953a717b8ff93cb;
      expv[57] = 87'h4eeaddeb0bd35e57a4fdb7;
      expv[58] = 87'h502040b1927cf059b526f3;
      expv[59] = 87'h0d5eeaf84b7efbc9971bf4;
      expv[60] = 87'h0602547e9e8ecb24f2da02;
      expv[61] = 87'h4b0640f690e4623d4c8228;
      expv[62] = 87'h7c3ad1096171ceea01c4ac;
      expv[63] = 87'h7295c109e3066fe4600ca6;
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
