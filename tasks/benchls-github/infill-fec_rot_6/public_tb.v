// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_6 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hb065bd68;
    stim[1] = 32'ha48f9de3;
    stim[2] = 32'hd761c188;
    stim[3] = 32'hd61353b0;
    stim[4] = 32'h66937766;
    stim[5] = 32'h1b015242;
    stim[6] = 32'h93de9302;
    stim[7] = 32'hee350a12;
    stim[8] = 32'hb2d89ec7;
    stim[9] = 32'h9895b767;
    stim[10] = 32'h2c25791f;
    stim[11] = 32'hbca7d796;
    stim[12] = 32'h461a6c04;
    stim[13] = 32'he5071976;
    stim[14] = 32'h412c4469;
    stim[15] = 32'h710cf096;
    stim[16] = 32'hc08796ca;
    stim[17] = 32'h84231cea;
    stim[18] = 32'h5e9085eb;
    stim[19] = 32'h2997c0ea;
    stim[20] = 32'ha5a702a6;
    stim[21] = 32'h27b022a1;
    stim[22] = 32'h7a6eda92;
    stim[23] = 32'h96bc1e27;
    stim[24] = 32'haf74d33f;
    stim[25] = 32'h34ea1461;
    stim[26] = 32'hf1f270c6;
    stim[27] = 32'hb57e3a6b;
    stim[28] = 32'h9df1678e;
    stim[29] = 32'h22d13a3a;
    stim[30] = 32'hac3353bd;
    stim[31] = 32'h7ef64635;
    stim[32] = 32'hf718d88f;
    stim[33] = 32'hcfcc30ff;
    stim[34] = 32'h49f2a48b;
    stim[35] = 32'h4c674d0e;
    stim[36] = 32'hb18a1bff;
    stim[37] = 32'hbb4677f9;
    stim[38] = 32'h7fa7333c;
    stim[39] = 32'hbc573742;
    stim[40] = 32'h5670693e;
    stim[41] = 32'h8949794c;
    stim[42] = 32'hdb839872;
    stim[43] = 32'h4193d993;
    stim[44] = 32'hb1595d1a;
    stim[45] = 32'h186fd467;
    stim[46] = 32'h2b98658a;
    stim[47] = 32'hf349e3b1;
    stim[48] = 32'h71e1b002;
    stim[49] = 32'h62552a99;
    stim[50] = 32'h5b2aff5f;
    stim[51] = 32'h3ac71d39;
    stim[52] = 32'h7dc21f11;
    stim[53] = 32'h0576a165;
    stim[54] = 32'ha9ac0c71;
    stim[55] = 32'h55106bd5;
    stim[56] = 32'h57b6d829;
    stim[57] = 32'hbcab929c;
    stim[58] = 32'h8d51f99b;
    stim[59] = 32'hbd20c720;
    stim[60] = 32'hd8e77166;
    stim[61] = 32'hd243f419;
    stim[62] = 32'h4beca79d;
    stim[63] = 32'hf7dcdfee;
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
      expv[0] = 32'h0aee3a9c;
      expv[1] = 32'h3246304d;
      expv[2] = 32'hc451cae1;
      expv[3] = 32'h98f544e1;
      expv[4] = 32'hab7d11fd;
      expv[5] = 32'hc394a09e;
      expv[6] = 32'he125e034;
      expv[7] = 32'h97a35c57;
      expv[8] = 32'ha5a6d15c;
      expv[9] = 32'h32ace97e;
      expv[10] = 32'h0dbe1fe7;
      expv[11] = 32'h3b949d13;
      expv[12] = 32'h8c3b8955;
      expv[13] = 32'h5a67955d;
      expv[14] = 32'h41119a10;
      expv[15] = 32'h4ebcc5ec;
      expv[16] = 32'h3fe43270;
      expv[17] = 32'h1c663225;
      expv[18] = 32'had41c28b;
      expv[19] = 32'h61b06aa2;
      expv[20] = 32'h7861e10d;
      expv[21] = 32'he9a8e06d;
      expv[22] = 32'h977654e6;
      expv[23] = 32'hb926a171;
      expv[24] = 32'hcdd59747;
      expv[25] = 32'h3da57079;
      expv[26] = 32'h651dd14c;
      expv[27] = 32'h4caff259;
      expv[28] = 32'h6b38db3b;
      expv[29] = 32'hb14ecea8;
      expv[30] = 32'h1c35b7c7;
      expv[31] = 32'hb1f17523;
      expv[32] = 32'hdf17cb09;
      expv[33] = 32'heceda73f;
      expv[34] = 32'h77e9b29a;
      expv[35] = 32'h1233dbdf;
      expv[36] = 32'h71079f5c;
      expv[37] = 32'hc35c8ed6;
      expv[38] = 32'he5ac3763;
      expv[39] = 32'h07aca813;
      expv[40] = 32'h943ae7c1;
      expv[41] = 32'h471f43aa;
      expv[42] = 32'hfd27ac6e;
      expv[43] = 32'h6ef6e490;
      expv[44] = 32'h45d6261c;
      expv[45] = 32'h183529de;
      expv[46] = 32'he25932a2;
      expv[47] = 32'hcbf90c8c;
      expv[48] = 32'h75ece0ec;
      expv[49] = 32'h9a4a6638;
      expv[50] = 32'hc37f678e;
      expv[51] = 32'hb7073e76;
      expv[52] = 32'h7ce73c23;
      expv[53] = 32'h5d085145;
      expv[54] = 32'h7b424cc2;
      expv[55] = 32'h4c3a5d01;
      expv[56] = 32'he596a201;
      expv[57] = 32'h3885df93;
      expv[58] = 32'h419f7e6f;
      expv[59] = 32'h5a50b093;
      expv[60] = 32'h241de96e;
      expv[61] = 32'h8c7ca6a4;
      expv[62] = 32'hf069771a;
      expv[63] = 32'hee161349;
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
