// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036489 dut (
    .clk(clk),
    .rstp(in_vec[50:50]),
    .src_in(in_vec[49:42]),
    .dst_in(in_vec[41:34]),
    .data_in(in_vec[33:2]),
    .writep(in_vec[1:1]),
    .readp(in_vec[0:0]),
    .src_out(out_vec[49:42]),
    .dst_out(out_vec[41:34]),
    .data_out(out_vec[33:2]),
    .emptyp(out_vec[1:1]),
    .fullp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h66da3d23a2b6b;
    stim[1] = 51'h4e62a1b8c46f4;
    stim[2] = 51'h1f7bee804cff4;
    stim[3] = 51'h2640702c3cdcc;
    stim[4] = 51'h342e0385e5ac1;
    stim[5] = 51'h00e58d36d78ef;
    stim[6] = 51'h138e1e68d9207;
    stim[7] = 51'h3151f6e6bff26;
    stim[8] = 51'h153b40ab607bf;
    stim[9] = 51'h1869a1340f8cd;
    stim[10] = 51'h074181e848a34;
    stim[11] = 51'h0922649c52161;
    stim[12] = 51'h0e457da03aa94;
    stim[13] = 51'h0a512d4ba3841;
    stim[14] = 51'h0f191157e7656;
    stim[15] = 51'h274d6792dcb58;
    stim[16] = 51'h10a4945e11bb1;
    stim[17] = 51'h34635d49ffd1d;
    stim[18] = 51'h0881739a7d4f5;
    stim[19] = 51'h1a3510477ccd2;
    stim[20] = 51'h7e81adddd7b30;
    stim[21] = 51'h08f3099565658;
    stim[22] = 51'h2599e58bb56b8;
    stim[23] = 51'h2ee64c3884f9c;
    stim[24] = 51'h61e89066f99bb;
    stim[25] = 51'h1e399fc27c844;
    stim[26] = 51'h1d602719c855d;
    stim[27] = 51'h3789fb7b1c6f3;
    stim[28] = 51'h10d0e5567e915;
    stim[29] = 51'h03061f0e3112d;
    stim[30] = 51'h1441cc206d97a;
    stim[31] = 51'h139f7d085d6fb;
    stim[32] = 51'h00aa1e9d81c0e;
    stim[33] = 51'h29f2f1a3c2625;
    stim[34] = 51'h04669b76aac8f;
    stim[35] = 51'h1af52563fc330;
    stim[36] = 51'h08b45ad5bb075;
    stim[37] = 51'h19b41a6e6785b;
    stim[38] = 51'h21eb21708d7d7;
    stim[39] = 51'h1b1800c2309f4;
    stim[40] = 51'h3409102ed3c38;
    stim[41] = 51'h0d67ffb267968;
    stim[42] = 51'h0df04470fd804;
    stim[43] = 51'h2ea23d9c42194;
    stim[44] = 51'h13eeecd486781;
    stim[45] = 51'h05f7ca2c29dc4;
    stim[46] = 51'h0246be83aeb6d;
    stim[47] = 51'h2e62b0d5c75f2;
    stim[48] = 51'h01ce305c0ac85;
    stim[49] = 51'h0f6a5d4be7007;
    stim[50] = 51'h0a97ba68b6935;
    stim[51] = 51'h09f5526d17b01;
    stim[52] = 51'h20b2ae658a745;
    stim[53] = 51'h1d414414a28e4;
    stim[54] = 51'h15fdcaa09104c;
    stim[55] = 51'h1d0012466952d;
    stim[56] = 51'h061c5ad5b6818;
    stim[57] = 51'h21211e4b0d020;
    stim[58] = 51'h0abae34e61f6b;
    stim[59] = 51'h1fa8dee5d9048;
    stim[60] = 51'h162a7c823cf57;
    stim[61] = 51'h386346589b889;
    stim[62] = 51'h2eab9cb8eac53;
    stim[63] = 51'h07ca661a8210a;
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
      expv[0] = 50'h0000000000002;
      expv[1] = 50'h0000000000002;
      expv[2] = 50'h0000000000002;
      expv[3] = 50'h0000000000000;
      expv[4] = 50'h0000000000000;
      expv[5] = 50'hxxxxxxxxxxxxx;
      expv[6] = 50'hxxxxxxxxxxxxx;
      expv[7] = 50'hxxxxxxxxxxxxx;
      expv[8] = 50'hxxxxxxxxxxxxx;
      expv[9] = 50'hxxxxxxxxxxxxx;
      expv[10] = 50'hxxxxxxxxxxxxx;
      expv[11] = 50'hxxxxxxxxxxxxx;
      expv[12] = 50'hxxxxxxxxxxxxx;
      expv[13] = 50'hxxxxxxxxxxxxx;
      expv[14] = 50'hxxxxxxxxxxxxx;
      expv[15] = 50'hxxxxxxxxxxxxx;
      expv[16] = 50'hxxxxxxxxxxxxx;
      expv[17] = 50'hxxxxxxxxxxxxx;
      expv[18] = 50'h00e58d36d78ed;
      expv[19] = 50'hxxxxxxxxxxxxx;
      expv[20] = 50'h0000000000002;
      expv[21] = 50'h0000000000002;
      expv[22] = 50'h0000000000000;
      expv[23] = 50'h0000000000000;
      expv[24] = 50'h0000000000002;
      expv[25] = 50'h0000000000002;
      expv[26] = 50'h0000000000000;
      expv[27] = 50'h00e58d36d78ec;
      expv[28] = 50'hxxxxxxxxxxxxx;
      expv[29] = 50'hxxxxxxxxxxxxx;
      expv[30] = 50'hxxxxxxxxxxxxx;
      expv[31] = 50'hxxxxxxxxxxxxx;
      expv[32] = 50'hxxxxxxxxxxxxx;
      expv[33] = 50'hxxxxxxxxxxxxx;
      expv[34] = 50'hxxxxxxxxxxxxx;
      expv[35] = 50'hxxxxxxxxxxxxx;
      expv[36] = 50'hxxxxxxxxxxxxx;
      expv[37] = 50'hxxxxxxxxxxxxx;
      expv[38] = 50'h3789fb7b1c6f1;
      expv[39] = 50'hxxxxxxxxxxxxx;
      expv[40] = 50'hxxxxxxxxxxxxx;
      expv[41] = 50'hxxxxxxxxxxxxx;
      expv[42] = 50'hxxxxxxxxxxxxx;
      expv[43] = 50'hxxxxxxxxxxxxx;
      expv[44] = 50'hxxxxxxxxxxxxx;
      expv[45] = 50'hxxxxxxxxxxxxx;
      expv[46] = 50'hxxxxxxxxxxxxx;
      expv[47] = 50'hxxxxxxxxxxxxx;
      expv[48] = 50'hxxxxxxxxxxxxx;
      expv[49] = 50'hxxxxxxxxxxxxx;
      expv[50] = 50'hxxxxxxxxxxxxx;
      expv[51] = 50'hxxxxxxxxxxxxx;
      expv[52] = 50'hxxxxxxxxxxxxx;
      expv[53] = 50'hxxxxxxxxxxxxx;
      expv[54] = 50'hxxxxxxxxxxxxx;
      expv[55] = 50'hxxxxxxxxxxxxx;
      expv[56] = 50'h3789fb7b1c6f0;
      expv[57] = 50'h3789fb7b1c6f0;
      expv[58] = 50'h3789fb7b1c6f0;
      expv[59] = 50'hxxxxxxxxxxxxx;
      expv[60] = 50'hxxxxxxxxxxxxx;
      expv[61] = 50'hxxxxxxxxxxxxx;
      expv[62] = 50'hxxxxxxxxxxxxx;
      expv[63] = 50'hxxxxxxxxxxxxx;
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
