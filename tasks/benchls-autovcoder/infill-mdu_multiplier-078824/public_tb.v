// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_078824 dut (
    .i_clk(clk),
    .i_rst(in_vec[68:68]),
    .i_mdu_rs1(in_vec[67:36]),
    .i_mdu_rs2(in_vec[35:4]),
    .i_mdu_op(in_vec[3:1]),
    .i_mdu_valid(in_vec[0:0]),
    .o_mdu_ready(out_vec[32:32]),
    .o_mdu_rd(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h12657657c28ed245c3;
    stim[1] = 69'h1f8786d1fc8cb5e2c0;
    stim[2] = 69'h0d7aff7348a12e049d;
    stim[3] = 69'h0badc65626a50f791e;
    stim[4] = 69'h02f612d9c8c71a2cb2;
    stim[5] = 69'h08665e0975cf40caeb;
    stim[6] = 69'h0cb7ab568c079d7d5e;
    stim[7] = 69'h099c03bc73710e7afa;
    stim[8] = 69'h0d33bd949dd52d2562;
    stim[9] = 69'h087ad128787ad90152;
    stim[10] = 69'h0130cd5c9af5147de3;
    stim[11] = 69'h03722258bd9829c056;
    stim[12] = 69'h08c0853219f9c15f86;
    stim[13] = 69'h072be7e88372ae1e31;
    stim[14] = 69'h06418cfa8d2fed49e5;
    stim[15] = 69'h06434fc80c2583e42f;
    stim[16] = 69'h0bccc1f54593a07037;
    stim[17] = 69'h041384426a2c977a9d;
    stim[18] = 69'h01ebdae76e00de4cb9;
    stim[19] = 69'h071477a3e63ad75a01;
    stim[20] = 69'h077989d2185d367a40;
    stim[21] = 69'h046cb2b96adf5fd01e;
    stim[22] = 69'h07cc459661c1713725;
    stim[23] = 69'h09c08253375b930fa5;
    stim[24] = 69'h09b0ab84d3e7d630a6;
    stim[25] = 69'h04a68cff2157611240;
    stim[26] = 69'h073a7f07497657060f;
    stim[27] = 69'h08fe823c0ccb8ed3da;
    stim[28] = 69'h0c693c7daebd025bcc;
    stim[29] = 69'h0a7429941a1b43a62e;
    stim[30] = 69'h0358ceda3a9a114863;
    stim[31] = 69'h0d10ae0c6abef96363;
    stim[32] = 69'h08819a9f1f9f316c9d;
    stim[33] = 69'h067509c06d6e78e790;
    stim[34] = 69'h07866a5f727f035019;
    stim[35] = 69'h08eb2466eb5e49cccf;
    stim[36] = 69'h011ed99f2b05bc39e3;
    stim[37] = 69'h0916a4bc493b330db8;
    stim[38] = 69'h077aa86c0faf6fcedf;
    stim[39] = 69'h0b379caa49a4c5f4c8;
    stim[40] = 69'h05ffe6d08cf139c3a3;
    stim[41] = 69'h020dc2dd1affff85a6;
    stim[42] = 69'h04026458a81c33f01c;
    stim[43] = 69'h02faa95879ed0c4d2a;
    stim[44] = 69'h0d9585667af5693cf0;
    stim[45] = 69'h0abf51eab707f333d0;
    stim[46] = 69'h0dc2aa9b962173ac8a;
    stim[47] = 69'h0ce03fbc63e640c91e;
    stim[48] = 69'h04ff22431ff7177f1f;
    stim[49] = 69'h070383001bc8bdac9c;
    stim[50] = 69'h0345b07910bc434425;
    stim[51] = 69'h1c7b8465c8d0ad0541;
    stim[52] = 69'h0272982ffb35cdf81e;
    stim[53] = 69'h1bff90316317883266;
    stim[54] = 69'h0dd2c7c0e94a0359e6;
    stim[55] = 69'h0e746f3ba1b37429ab;
    stim[56] = 69'h0cb2e03ee20062b538;
    stim[57] = 69'h078318a5bc10c7ecd9;
    stim[58] = 69'h073dd9e9d8af9ad890;
    stim[59] = 69'h11323437575890796f;
    stim[60] = 69'h0e1909612459062c8c;
    stim[61] = 69'h0017b5ddf63a872af0;
    stim[62] = 69'h0460c1c83ad54f81cf;
    stim[63] = 69'h01a1662cceba8d73b9;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'h1xxxxxxxx;
      expv[3] = 33'h0xxxxxxxx;
      expv[4] = 33'h0xxxxxxxx;
      expv[5] = 33'h0xxxxxxxx;
      expv[6] = 33'h0xxxxxxxx;
      expv[7] = 33'h0xxxxxxxx;
      expv[8] = 33'h0xxxxxxxx;
      expv[9] = 33'h0xxxxxxxx;
      expv[10] = 33'h0xxxxxxxx;
      expv[11] = 33'h0xxxxxxxx;
      expv[12] = 33'h0f9fefcc4;
      expv[13] = 33'h02005234e;
      expv[14] = 33'h0f9fefcc4;
      expv[15] = 33'h1xxxxxxxx;
      expv[16] = 33'h118ba25af;
      expv[17] = 33'h0xxxxxxxx;
      expv[18] = 33'h1xxxxxxxx;
      expv[19] = 33'h0266fba98;
      expv[20] = 33'h0266fba98;
      expv[21] = 33'h0xxxxxxxx;
      expv[22] = 33'h02c1b65a0;
      expv[23] = 33'h02c1b65a0;
      expv[24] = 33'h00db0b8e5;
      expv[25] = 33'h017c8e3ce;
      expv[26] = 33'h0xxxxxxxx;
      expv[27] = 33'h0xxxxxxxx;
      expv[28] = 33'h0xxxxxxxx;
      expv[29] = 33'h0xxxxxxxx;
      expv[30] = 33'h0d20767c3;
      expv[31] = 33'h0d20767c3;
      expv[32] = 33'h1xxxxxxxx;
      expv[33] = 33'h018d81f52;
      expv[34] = 33'h0xxxxxxxx;
      expv[35] = 33'h0xxxxxxxx;
      expv[36] = 33'h0edeecd2a;
      expv[37] = 33'h0xxxxxxxx;
      expv[38] = 33'h1xxxxxxxx;
      expv[39] = 33'h12971d3e9;
      expv[40] = 33'h0edeecd2a;
      expv[41] = 33'h0edeecd2a;
      expv[42] = 33'h02971d3e9;
      expv[43] = 33'h02971d3e9;
      expv[44] = 33'h059ad93d0;
      expv[45] = 33'h059ad93d0;
      expv[46] = 33'h02971d3e9;
      expv[47] = 33'h02971d3e9;
      expv[48] = 33'h02971d3e9;
      expv[49] = 33'h02971d3e9;
      expv[50] = 33'h0eda7a798;
      expv[51] = 33'h059ad93d0;
      expv[52] = 33'h02971d3e9;
      expv[53] = 33'h0eda7a798;
      expv[54] = 33'h0eda7a798;
      expv[55] = 33'h02971d3e9;
      expv[56] = 33'h02971d3e9;
      expv[57] = 33'h02971d3e9;
      expv[58] = 33'h059ad93d0;
      expv[59] = 33'h02971d3e9;
      expv[60] = 33'h02971d3e9;
      expv[61] = 33'h059ad93d0;
      expv[62] = 33'h02971d3e9;
      expv[63] = 33'h02971d3e9;
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
