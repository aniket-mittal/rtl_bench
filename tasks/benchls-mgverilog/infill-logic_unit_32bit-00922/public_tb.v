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

  mg_00922 dut (
    .opB(in_vec[65:34]),
    .opA(in_vec[33:2]),
    .op(in_vec[1:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h2af87c0e5ed3bfea7;
    stim[1] = 66'h191ea722fa0828654;
    stim[2] = 66'h257c078d6028021d6;
    stim[3] = 66'h3f2268e7d6d96fec4;
    stim[4] = 66'h20e08347d5cc18e22;
    stim[5] = 66'h05649d471463f6df4;
    stim[6] = 66'h2c096a12071f4ecfa;
    stim[7] = 66'h3260a9700e0d4f10c;
    stim[8] = 66'h305294f83fa0a92c8;
    stim[9] = 66'h2b1e9e1a9df6ae678;
    stim[10] = 66'h1755ede400f7e71fd;
    stim[11] = 66'h0e9ad368b3e689fbc;
    stim[12] = 66'h20ec89ab827905db1;
    stim[13] = 66'h301958843bb03f52d;
    stim[14] = 66'h04497b18971000d4b;
    stim[15] = 66'h038756faf36fc6522;
    stim[16] = 66'h0fafa8aafbdd703a7;
    stim[17] = 66'h1ea6ef28711f685f1;
    stim[18] = 66'h1da61236213b1bbd5;
    stim[19] = 66'h2abdc94a7ae0cd131;
    stim[20] = 66'h2c7ff872af94319a1;
    stim[21] = 66'h378e7acc2350f65a8;
    stim[22] = 66'h33dd27a122b1a3e77;
    stim[23] = 66'h0622857992242555d;
    stim[24] = 66'h08e5e14e91a8ebe9e;
    stim[25] = 66'h1200fcb7b4a752395;
    stim[26] = 66'h2bc946bedc2719958;
    stim[27] = 66'h257289567ba2c471e;
    stim[28] = 66'h2cadb42153e91c2a0;
    stim[29] = 66'h13eae7765eb7b6fed;
    stim[30] = 66'h2712cf7822e1a5ff3;
    stim[31] = 66'h24df44fedeaafffc4;
    stim[32] = 66'h213eedf096694720c;
    stim[33] = 66'h1c0baeb1ff9447e9f;
    stim[34] = 66'h03d324b8302d957f8;
    stim[35] = 66'h1d35a2b689f635fab;
    stim[36] = 66'h26f0b9b197bdf8227;
    stim[37] = 66'h33d7824952c50b2c3;
    stim[38] = 66'h2bafd77863956c5ee;
    stim[39] = 66'h11226c553a035bd26;
    stim[40] = 66'h3fe93d5350b5d319f;
    stim[41] = 66'h025775bd46c57e1c1;
    stim[42] = 66'h0d643a68373f5dc03;
    stim[43] = 66'h1cdba617b9a5e0a99;
    stim[44] = 66'h3502536e77fd20249;
    stim[45] = 66'h01d812a5e4b46cde1;
    stim[46] = 66'h3336960e24e2702b0;
    stim[47] = 66'h10deb10b7b70d50d3;
    stim[48] = 66'h1164e6e5991d89a38;
    stim[49] = 66'h11230b7f6894306a2;
    stim[50] = 66'h2af36cae8a9a47a8c;
    stim[51] = 66'h24d5101524aefa08c;
    stim[52] = 66'h10c0bf1a3aafd6c96;
    stim[53] = 66'h06154ac3a2d6efeea;
    stim[54] = 66'h361a58812f72b3403;
    stim[55] = 66'h3dce4c93966cf5a90;
    stim[56] = 66'h3fb0cc56343ed1839;
    stim[57] = 66'h3e689030e2d95061d;
    stim[58] = 66'h1c39cc44db72fe857;
    stim[59] = 66'h2955f456beccff319;
    stim[60] = 66'h1e0dfc33aa03baa32;
    stim[61] = 66'h283fddceebdced5f8;
    stim[62] = 66'h22dc328e482f83d61;
    stim[63] = 66'h0e3b5e8409db69be2;
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
      expv[0] = 32'h04100046;
      expv[1] = 32'h60208081;
      expv[2] = 32'h15501640;
      expv[3] = 32'h5801a391;
      expv[4] = 32'hd4b26e97;
      expv[5] = 32'h1182511c;
      expv[6] = 32'hac589376;
      expv[7] = 32'h08002440;
      expv[8] = 32'hc00200a0;
      expv[9] = 32'h245a380a;
      expv[10] = 32'h5fdfbfff;
      expv[11] = 32'h0a0a05a2;
      expv[12] = 32'h8bf637ee;
      expv[13] = 32'heee5ff5b;
      expv[14] = 32'ha29a108d;
      expv[15] = 32'hc3a242a3;
      expv[16] = 32'h00001d14;
      expv[17] = 32'hfeffbdfd;
      expv[18] = 32'hf6fc6efd;
      expv[19] = 32'hebf7356d;
      expv[20] = 32'hbfffe7ea;
      expv[21] = 32'h8c01c920;
      expv[22] = 32'h30096062;
      expv[23] = 32'h589a95f7;
      expv[24] = 32'h65342a9d;
      expv[25] = 32'hda9ffaff;
      expv[26] = 32'h20040252;
      expv[27] = 32'h7b41349e;
      expv[28] = 32'h02a45080;
      expv[29] = 32'h7fffdffb;
      expv[30] = 32'h60304003;
      expv[31] = 32'h122913f1;
      expv[32] = 32'h00a11482;
      expv[33] = 32'h01804018;
      expv[34] = 32'h000410e0;
      expv[35] = 32'h88212005;
      expv[36] = 32'h20081930;
      expv[37] = 32'h30a1d24a;
      expv[38] = 32'h20eaec9a;
      expv[39] = 32'hac84de1d;
      expv[40] = 32'h00080290;
      expv[41] = 32'h1b5dfef5;
      expv[42] = 32'h0202005f;
      expv[43] = 32'hf7ff9afe;
      expv[44] = 32'hdffdcdbb;
      expv[45] = 32'h97f1fbff;
      expv[46] = 32'h80884028;
      expv[47] = 32'h10042bc2;
      expv[48] = 32'h44120286;
      expv[49] = 32'he6dcec55;
      expv[50] = 32'h2a4912a2;
      expv[51] = 32'h92104000;
      expv[52] = 32'ha9bda74d;
      expv[53] = 32'h930e94b4;
      expv[54] = 32'h021410fb;
      expv[55] = 32'h51311204;
      expv[56] = 32'hfefb775e;
      expv[57] = 32'hfbe741c7;
      expv[58] = 32'h821004e8;
      expv[59] = 32'hff77fdde;
      expv[60] = 32'hd0391a42;
      expv[61] = 32'ha073353a;
      expv[62] = 32'habfecf79;
      expv[63] = 32'h1f80dce8;
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
