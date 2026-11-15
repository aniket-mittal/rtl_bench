// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  csi_fuzzer dut (
    .clk(clk),
    .rstn(in_vec[47:47]),
    .iq(in_vec[46:15]),
    .iq_valid(in_vec[14:14]),
    .bb_gain1(in_vec[13:8]),
    .bb_gain1_rot90_flag(in_vec[7:7]),
    .bb_gain2(in_vec[6:1]),
    .bb_gain2_rot90_flag(in_vec[0:0]),
    .iq_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h4f9cc910ad14;
    stim[1] = 48'h0cfbffde3cc3;
    stim[2] = 48'hfba1eae5c870;
    stim[3] = 48'hf867eee09a44;
    stim[4] = 48'hb8f637f17752;
    stim[5] = 48'hd48437374594;
    stim[6] = 48'h859473e4ed32;
    stim[7] = 48'ha5a5f52dbd33;
    stim[8] = 48'he1e56a99eb49;
    stim[9] = 48'hf5e8f5d7530a;
    stim[10] = 48'hbaba89222b32;
    stim[11] = 48'hbcbe73516832;
    stim[12] = 48'hdbd8f5e6db59;
    stim[13] = 48'h8abc1bca4c48;
    stim[14] = 48'heaf9e26eebc9;
    stim[15] = 48'hdcc931af1b47;
    stim[16] = 48'h8588c198f116;
    stim[17] = 48'hef37dc8fa5bb;
    stim[18] = 48'hf5e567ac297b;
    stim[19] = 48'he5541fc210b5;
    stim[20] = 48'h9597c9dd0731;
    stim[21] = 48'h9106b84080c4;
    stim[22] = 48'h9ecbe14709a3;
    stim[23] = 48'ha4c42bce5cf4;
    stim[24] = 48'h99820586ec55;
    stim[25] = 48'hf97292ee3387;
    stim[26] = 48'hacabcc851443;
    stim[27] = 48'h9e15ae9c3455;
    stim[28] = 48'hef3aa8c74e5d;
    stim[29] = 48'he0d8a1648306;
    stim[30] = 48'h99ad144f3f1d;
    stim[31] = 48'hd00b76866c48;
    stim[32] = 48'h8aa330f9b1ac;
    stim[33] = 48'h3c32cf7cd287;
    stim[34] = 48'heb0faca0d018;
    stim[35] = 48'hadbeb6d20f46;
    stim[36] = 48'he68168ec8dc7;
    stim[37] = 48'he9f1c53504d3;
    stim[38] = 48'h084dfb2509ec;
    stim[39] = 48'hb6ba2ce3d2e0;
    stim[40] = 48'hdb81b1ddebac;
    stim[41] = 48'hd85219a9a727;
    stim[42] = 48'ha6d1d6b9364a;
    stim[43] = 48'heca4bbfc8200;
    stim[44] = 48'he94468e039c6;
    stim[45] = 48'hfbd2c242708a;
    stim[46] = 48'haabc722fc3a8;
    stim[47] = 48'hfa211838db6d;
    stim[48] = 48'h9a2f9924c98b;
    stim[49] = 48'hac70a1c2b8c9;
    stim[50] = 48'he87a7ae7bad5;
    stim[51] = 48'ha1bd7648658a;
    stim[52] = 48'h8d73bf1e77d3;
    stim[53] = 48'h89fab49d97e3;
    stim[54] = 48'ha78aa85613b3;
    stim[55] = 48'he28a482ce166;
    stim[56] = 48'hbc401b343692;
    stim[57] = 48'hf1e6afea7c4a;
    stim[58] = 48'hddf0a6a96471;
    stim[59] = 48'he0d87af53068;
    stim[60] = 48'hdd0f774e5042;
    stim[61] = 48'hdf8a6b1206ea;
    stim[62] = 48'h964e025dd65a;
    stim[63] = 48'h9a1d10347638;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hf743d5cb;
      expv[4] = 32'hf743d5cb;
      expv[5] = 32'h71ec6fe2;
      expv[6] = 32'haa42745d;
      expv[7] = 32'h1287d849;
      expv[8] = 32'h1287d849;
      expv[9] = 32'h0a1be01e;
      expv[10] = 32'hb7d6cd93;
      expv[11] = 32'hb7d6cd93;
      expv[12] = 32'h687ad808;
      expv[13] = 32'ha7bce2b2;
      expv[14] = 32'h4f112691;
      expv[15] = 32'h933dcc2c;
      expv[16] = 32'h933dcc2c;
      expv[17] = 32'h01aa6a99;
      expv[18] = 32'h01aa6a99;
      expv[19] = 32'h01aa6a99;
      expv[20] = 32'h01aa6a99;
      expv[21] = 32'h01aa6a99;
      expv[22] = 32'h01aa6a99;
      expv[23] = 32'h01aa6a99;
      expv[24] = 32'h57136f05;
      expv[25] = 32'h005a0bc0;
      expv[26] = 32'h005a0bc0;
      expv[27] = 32'h005a0bc0;
      expv[28] = 32'h005a0bc0;
      expv[29] = 32'hf26139fa;
      expv[30] = 32'hf26139fa;
      expv[31] = 32'hf26139fa;
      expv[32] = 32'h929a0424;
      expv[33] = 32'h929a0424;
      expv[34] = 32'h00000000;
      expv[35] = 32'hd61f5941;
      expv[36] = 32'hd61f5941;
      expv[37] = 32'hd61f5941;
      expv[38] = 32'hd61f5941;
      expv[39] = 32'h00000000;
      expv[40] = 32'h6d7459c7;
      expv[41] = 32'hb70363bb;
      expv[42] = 32'hb70363bb;
      expv[43] = 32'hb70363bb;
      expv[44] = 32'hb70363bb;
      expv[45] = 32'hb70363bb;
      expv[46] = 32'hda2fa86e;
      expv[47] = 32'h4516d922;
      expv[48] = 32'hd7a84fff;
      expv[49] = 32'h6bb82552;
      expv[50] = 32'h6bb82552;
      expv[51] = 32'h6bb82552;
      expv[52] = 32'h4820e788;
      expv[53] = 32'h04c5981c;
      expv[54] = 32'h04c5981c;
      expv[55] = 32'h04c5981c;
      expv[56] = 32'hb5bcaca8;
      expv[57] = 32'hb5bcaca8;
      expv[58] = 32'hc91026a0;
      expv[59] = 32'hb4351f0a;
      expv[60] = 32'hb4351f0a;
      expv[61] = 32'hd468bd51;
      expv[62] = 32'hd468bd51;
      expv[63] = 32'h293ce9a4;
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
