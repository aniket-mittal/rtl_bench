// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_062837 dut (
    .clk(clk),
    .reset(in_vec[28:28]),
    .img_di(in_vec[27:20]),
    .grad_di(in_vec[19:0]),
    .done(out_vec[64:64]),
    .img_wr(out_vec[63:63]),
    .img_rd(out_vec[62:62]),
    .grad_wr(out_vec[61:61]),
    .grad_rd(out_vec[60:60]),
    .img_addr(out_vec[59:44]),
    .grad_addr(out_vec[43:28]),
    .img_do(out_vec[27:20]),
    .grad_do(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h19f56371;
    stim[1] = 29'h104a9038;
    stim[2] = 29'h044283b6;
    stim[3] = 29'h0823cc45;
    stim[4] = 29'h0540a48e;
    stim[5] = 29'h0174764d;
    stim[6] = 29'h0295fc9e;
    stim[7] = 29'h0abc89d5;
    stim[8] = 29'h0d3bcc79;
    stim[9] = 29'h0e0a0b8c;
    stim[10] = 29'h0016f19c;
    stim[11] = 29'h026896e8;
    stim[12] = 29'h0223fc0a;
    stim[13] = 29'h0317341a;
    stim[14] = 29'h0636b903;
    stim[15] = 29'h0d25b5c7;
    stim[16] = 29'h07e02807;
    stim[17] = 29'h07a8ed67;
    stim[18] = 29'h0d073c91;
    stim[19] = 29'h01e6595e;
    stim[20] = 29'h034efff1;
    stim[21] = 29'h0903661d;
    stim[22] = 29'h0b4cccc6;
    stim[23] = 29'h00ce5a89;
    stim[24] = 29'h183df5d7;
    stim[25] = 29'h0cf67e26;
    stim[26] = 29'h037f4f1e;
    stim[27] = 29'h0c997e32;
    stim[28] = 29'h02776bab;
    stim[29] = 29'h03db5a84;
    stim[30] = 29'h020425c9;
    stim[31] = 29'h0bf3fcd1;
    stim[32] = 29'h0c02e5d9;
    stim[33] = 29'h0c9f55ed;
    stim[34] = 29'h0af216e2;
    stim[35] = 29'h0c2339f3;
    stim[36] = 29'h06a3f174;
    stim[37] = 29'h08878827;
    stim[38] = 29'h0145a81b;
    stim[39] = 29'h04acf3b6;
    stim[40] = 29'h015ed94d;
    stim[41] = 29'h0d7d9066;
    stim[42] = 29'h06aa8e38;
    stim[43] = 29'h052c9d95;
    stim[44] = 29'h098f4c52;
    stim[45] = 29'h0338b466;
    stim[46] = 29'h06f8fabe;
    stim[47] = 29'h0e71e43b;
    stim[48] = 29'h0d5ae7c8;
    stim[49] = 29'h0f0e0a27;
    stim[50] = 29'h07e1842d;
    stim[51] = 29'h0dd580ed;
    stim[52] = 29'h08cc82c1;
    stim[53] = 29'h0d48d2c5;
    stim[54] = 29'h013a2d26;
    stim[55] = 29'h05a25bf3;
    stim[56] = 29'h09c76f42;
    stim[57] = 29'h0f420cf0;
    stim[58] = 29'h0b54512b;
    stim[59] = 29'h02e9a7f1;
    stim[60] = 29'h001fe0a9;
    stim[61] = 29'h0cae47f2;
    stim[62] = 29'h05f042ee;
    stim[63] = 29'h0bf1fffc;
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
      expv[0] = 65'h0400000000xxxxxxx;
      expv[1] = 65'h0400000000xxxxxxx;
      expv[2] = 65'h0400000000xxxxxxx;
      expv[3] = 65'h0400010000xxxxxxx;
      expv[4] = 65'h0401010000xxxxxxx;
      expv[5] = 65'h0400010000xxxxxxx;
      expv[6] = 65'h0600010000xx0f810;
      expv[7] = 65'h0400020001xx0f810;
      expv[8] = 65'h0401020001xx0f810;
      expv[9] = 65'h0400020001xx0f810;
      expv[10] = 65'h0600020001xx0a451;
      expv[11] = 65'h0400030002xx0a451;
      expv[12] = 65'h0401030002xx0a451;
      expv[13] = 65'h0400030002xx0a451;
      expv[14] = 65'h0600030002xxdef77;
      expv[15] = 65'h0400040003xxdef77;
      expv[16] = 65'h0401040003xxdef77;
      expv[17] = 65'h0400040003xxdef77;
      expv[18] = 65'h0600040003xx2b058;
      expv[19] = 65'h0400050004xx2b058;
      expv[20] = 65'h0401050004xx2b058;
      expv[21] = 65'h0400050004xx2b058;
      expv[22] = 65'h0600050004xxd3362;
      expv[23] = 65'h0400060005xxd3362;
      expv[24] = 65'h0400000000xxd3362;
      expv[25] = 65'h0400000000xxd3362;
      expv[26] = 65'h0400010000xxd3362;
      expv[27] = 65'h0401010000xxd3362;
      expv[28] = 65'h0400010000xxd3362;
      expv[29] = 65'h0600010000xxda3fa;
      expv[30] = 65'h0400020001xxda3fa;
      expv[31] = 65'h0401020001xxda3fa;
      expv[32] = 65'h0400020001xxda3fa;
      expv[33] = 65'h0600020001xxfa488;
      expv[34] = 65'h0400030002xxfa488;
      expv[35] = 65'h0401030002xxfa488;
      expv[36] = 65'h0400030002xxfa488;
      expv[37] = 65'h0600030002xx23ca2;
      expv[38] = 65'h0400040003xx23ca2;
      expv[39] = 65'h0401040003xx23ca2;
      expv[40] = 65'h0400040003xx23ca2;
      expv[41] = 65'h0600040003xxd979b;
      expv[42] = 65'h0400050004xxd979b;
      expv[43] = 65'h0401050004xxd979b;
      expv[44] = 65'h0400050004xxd979b;
      expv[45] = 65'h0600050004xx1583e;
      expv[46] = 65'h0400060005xx1583e;
      expv[47] = 65'h0401060005xx1583e;
      expv[48] = 65'h0400060005xx1583e;
      expv[49] = 65'h0600060005xx0147d;
      expv[50] = 65'h0400070006xx0147d;
      expv[51] = 65'h0401070006xx0147d;
      expv[52] = 65'h0400070006xx0147d;
      expv[53] = 65'h0600070006xx03c6e;
      expv[54] = 65'h0400080007xx03c6e;
      expv[55] = 65'h0401080007xx03c6e;
      expv[56] = 65'h0400080007xx03c6e;
      expv[57] = 65'h0600080007xxe57dc;
      expv[58] = 65'h0400090008xxe57dc;
      expv[59] = 65'h0401090008xxe57dc;
      expv[60] = 65'h0400090008xxe57dc;
      expv[61] = 65'h0600090008xx2881b;
      expv[62] = 65'h04000a0009xx2881b;
      expv[63] = 65'h04010a0009xx2881b;
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
