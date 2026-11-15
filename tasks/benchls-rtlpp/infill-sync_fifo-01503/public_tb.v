// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01503 dut (
    .clk(clk),
    .reset(in_vec[39:39]),
    .in_valid(in_vec[38:38]),
    .in_data(in_vec[37:1]),
    .out_ready(in_vec[0:0]),
    .fill_level(out_vec[42:39]),
    .in_ready(out_vec[38:38]),
    .out_valid(out_vec[37:37]),
    .out_data(out_vec[36:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'ha65f47f475;
    stim[1] = 40'h9b35d2d952;
    stim[2] = 40'h07440e0acf;
    stim[3] = 40'h659b1c686d;
    stim[4] = 40'h522e127663;
    stim[5] = 40'h0bc57e4cc6;
    stim[6] = 40'h56ac9b2439;
    stim[7] = 40'h4e2f8bca41;
    stim[8] = 40'h345022fdcd;
    stim[9] = 40'h037e10b4d0;
    stim[10] = 40'h4a2dd04499;
    stim[11] = 40'h8712333e1a;
    stim[12] = 40'h4d502d4dd3;
    stim[13] = 40'h70a935ef78;
    stim[14] = 40'h650cd8976e;
    stim[15] = 40'h9d02177fd6;
    stim[16] = 40'h63fb725b7e;
    stim[17] = 40'h26f9a3a250;
    stim[18] = 40'h71bca1d775;
    stim[19] = 40'h65a7d97de9;
    stim[20] = 40'h6e7d4cb8bf;
    stim[21] = 40'h68d1a7793f;
    stim[22] = 40'h4532ca26ac;
    stim[23] = 40'h7cfde4eae6;
    stim[24] = 40'h4ec0ee1919;
    stim[25] = 40'h4d2d550d07;
    stim[26] = 40'h01fee22f53;
    stim[27] = 40'h6eddaa29c7;
    stim[28] = 40'h0beecefeed;
    stim[29] = 40'h1a05b9262b;
    stim[30] = 40'h1507f1cf8a;
    stim[31] = 40'h1f620a00e3;
    stim[32] = 40'h32c3e14f8b;
    stim[33] = 40'h7f598aea76;
    stim[34] = 40'h23e220406a;
    stim[35] = 40'h65b94b8dd0;
    stim[36] = 40'h3cda1be53f;
    stim[37] = 40'h5b5d70fd42;
    stim[38] = 40'h085ed75894;
    stim[39] = 40'h386367f696;
    stim[40] = 40'h447700f12e;
    stim[41] = 40'h051753166a;
    stim[42] = 40'h0ce94ceec1;
    stim[43] = 40'h23bb1d1488;
    stim[44] = 40'h75b3115948;
    stim[45] = 40'h239cdc823b;
    stim[46] = 40'h3001fa181a;
    stim[47] = 40'h282ba7e1df;
    stim[48] = 40'h0ca616be33;
    stim[49] = 40'h3f2665d246;
    stim[50] = 40'h3321252b4e;
    stim[51] = 40'h6dda3b790b;
    stim[52] = 40'h14edca92ba;
    stim[53] = 40'h442f168396;
    stim[54] = 40'h54d4847d89;
    stim[55] = 40'h2b7ca72326;
    stim[56] = 40'h7aeef1f6fc;
    stim[57] = 40'h0e79de2400;
    stim[58] = 40'hb8496c7d1f;
    stim[59] = 40'h612df321d7;
    stim[60] = 40'h68f781dcd9;
    stim[61] = 40'h23930862ec;
    stim[62] = 40'h518c6b7ae3;
    stim[63] = 40'h102730cc44;
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
      expv[0] = 43'h0xxxxxxxxxx;
      expv[1] = 43'h0xxxxxxxxxx;
      expv[2] = 43'h0xxxxxxxxxx;
      expv[3] = 43'h0xxxxxxxxxx;
      expv[4] = 43'h0xxxxxxxxxx;
      expv[5] = 43'h0f2cd8e3436;
      expv[6] = 43'h0f2cd8e3436;
      expv[7] = 43'h0e917093b31;
      expv[8] = 43'h0eb564d921c;
      expv[9] = 43'h0e717c5e520;
      expv[10] = 43'h04717c5e520;
      expv[11] = 43'h04717c5e520;
      expv[12] = 43'h04717c5e520;
      expv[13] = 43'h052cd8e3436;
      expv[14] = 43'h1e6a816a6e9;
      expv[15] = 43'h046a816a6e9;
      expv[16] = 43'h046a816a6e9;
      expv[17] = 43'h046a816a6e9;
      expv[18] = 43'h171fdb92dbf;
      expv[19] = 43'h172866c4bb7;
      expv[20] = 43'h172866c4bb7;
      expv[21] = 43'h178de50ebba;
      expv[22] = 43'h178de50ebba;
      expv[23] = 43'h178de50ebba;
      expv[24] = 43'h1f8de50ebba;
      expv[25] = 43'h1f73ea65c5f;
      expv[26] = 43'h1f73ea65c5f;
      expv[27] = 43'h1e299651356;
      expv[28] = 43'h16299651356;
      expv[29] = 43'h1e760770c8c;
      expv[30] = 43'h16760770c8c;
      expv[31] = 43'h16760770c8c;
      expv[32] = 43'h1776ed514e3;
      expv[33] = 43'h0f76ed514e3;
      expv[34] = 43'h0f76ed514e3;
      expv[35] = 43'h1776ed514e3;
      expv[36] = 43'h1776ed514e3;
      expv[37] = 43'h1ffacc5753b;
      expv[38] = 43'h17facc5753b;
      expv[39] = 43'h1ffacc5753b;
      expv[40] = 43'h1ffacc5753b;
      expv[41] = 43'h1ffacc5753b;
      expv[42] = 43'h27facc5753b;
      expv[43] = 43'h272dca5c6e8;
      expv[44] = 43'h1f2dca5c6e8;
      expv[45] = 43'h1f2dca5c6e8;
      expv[46] = 43'h26daeb87ea1;
      expv[47] = 43'h1edaeb87ea1;
      expv[48] = 43'h1e23b807897;
      expv[49] = 43'h1623b807897;
      expv[50] = 43'h1623b807897;
      expv[51] = 43'h1623b807897;
      expv[52] = 43'h17ad988aca4;
      expv[53] = 43'h17ad988aca4;
      expv[54] = 43'h17ad988aca4;
      expv[55] = 43'h1f6ed1dbc85;
      expv[56] = 43'h176ed1dbc85;
      expv[57] = 43'h176ed1dbc85;
      expv[58] = 43'h056ed1dbc85;
      expv[59] = 43'h056ed1dbc85;
      expv[60] = 43'h052dca5c6e8;
      expv[61] = 43'h43096f990eb;
      expv[62] = 43'h4347bc0ee6c;
      expv[63] = 43'h42daeb87ea1;
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
