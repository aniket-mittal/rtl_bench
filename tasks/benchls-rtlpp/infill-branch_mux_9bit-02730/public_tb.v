// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02730 dut (
    .branch(in_vec[18:18]),
    .br_ins(in_vec[17:9]),
    .inc_ins(in_vec[8:0]),
    .ins_out(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h386ce;
    stim[1] = 19'h7516b;
    stim[2] = 19'h3eb73;
    stim[3] = 19'h74230;
    stim[4] = 19'h11130;
    stim[5] = 19'h7e05e;
    stim[6] = 19'h360dc;
    stim[7] = 19'h5b57c;
    stim[8] = 19'h641cb;
    stim[9] = 19'h66d17;
    stim[10] = 19'h197a7;
    stim[11] = 19'h014da;
    stim[12] = 19'h7fdf4;
    stim[13] = 19'h105ac;
    stim[14] = 19'h7b988;
    stim[15] = 19'h56ab6;
    stim[16] = 19'h78fca;
    stim[17] = 19'h67c29;
    stim[18] = 19'h4e86a;
    stim[19] = 19'h4836e;
    stim[20] = 19'h21354;
    stim[21] = 19'h52400;
    stim[22] = 19'h117cf;
    stim[23] = 19'h7dacc;
    stim[24] = 19'h0f218;
    stim[25] = 19'h70816;
    stim[26] = 19'h352a3;
    stim[27] = 19'h11aa3;
    stim[28] = 19'h38181;
    stim[29] = 19'h2eb7e;
    stim[30] = 19'h357e1;
    stim[31] = 19'h4bfe8;
    stim[32] = 19'h37a5b;
    stim[33] = 19'h5d987;
    stim[34] = 19'h7e1ca;
    stim[35] = 19'h300e1;
    stim[36] = 19'h46220;
    stim[37] = 19'h5e18d;
    stim[38] = 19'h4edfd;
    stim[39] = 19'h35503;
    stim[40] = 19'h6e621;
    stim[41] = 19'h1a68f;
    stim[42] = 19'h42798;
    stim[43] = 19'h4fde1;
    stim[44] = 19'h53a4e;
    stim[45] = 19'h597d4;
    stim[46] = 19'h063a2;
    stim[47] = 19'h7ce84;
    stim[48] = 19'h21891;
    stim[49] = 19'h49a26;
    stim[50] = 19'h44126;
    stim[51] = 19'h644a9;
    stim[52] = 19'h2c714;
    stim[53] = 19'h48133;
    stim[54] = 19'h73afc;
    stim[55] = 19'h4a132;
    stim[56] = 19'h247da;
    stim[57] = 19'h22569;
    stim[58] = 19'h0284e;
    stim[59] = 19'h041a4;
    stim[60] = 19'h52577;
    stim[61] = 19'h18589;
    stim[62] = 19'h7e8a7;
    stim[63] = 19'h7cb73;
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
      expv[0] = 9'h0ce;
      expv[1] = 9'h1a8;
      expv[2] = 9'h173;
      expv[3] = 9'h1a1;
      expv[4] = 9'h130;
      expv[5] = 9'h1f0;
      expv[6] = 9'h0dc;
      expv[7] = 9'h0da;
      expv[8] = 9'h120;
      expv[9] = 9'h136;
      expv[10] = 9'h1a7;
      expv[11] = 9'h0da;
      expv[12] = 9'h1fe;
      expv[13] = 9'h1ac;
      expv[14] = 9'h1dc;
      expv[15] = 9'h0b5;
      expv[16] = 9'h1c7;
      expv[17] = 9'h13e;
      expv[18] = 9'h074;
      expv[19] = 9'h041;
      expv[20] = 9'h154;
      expv[21] = 9'h092;
      expv[22] = 9'h1cf;
      expv[23] = 9'h1ed;
      expv[24] = 9'h018;
      expv[25] = 9'h184;
      expv[26] = 9'h0a3;
      expv[27] = 9'h0a3;
      expv[28] = 9'h181;
      expv[29] = 9'h17e;
      expv[30] = 9'h1e1;
      expv[31] = 9'h05f;
      expv[32] = 9'h05b;
      expv[33] = 9'h0ec;
      expv[34] = 9'h1f0;
      expv[35] = 9'h0e1;
      expv[36] = 9'h031;
      expv[37] = 9'h0f0;
      expv[38] = 9'h076;
      expv[39] = 9'h103;
      expv[40] = 9'h173;
      expv[41] = 9'h08f;
      expv[42] = 9'h013;
      expv[43] = 9'h07e;
      expv[44] = 9'h09d;
      expv[45] = 9'h0cb;
      expv[46] = 9'h1a2;
      expv[47] = 9'h1e7;
      expv[48] = 9'h091;
      expv[49] = 9'h04d;
      expv[50] = 9'h020;
      expv[51] = 9'h122;
      expv[52] = 9'h114;
      expv[53] = 9'h040;
      expv[54] = 9'h19d;
      expv[55] = 9'h050;
      expv[56] = 9'h1da;
      expv[57] = 9'h169;
      expv[58] = 9'h04e;
      expv[59] = 9'h1a4;
      expv[60] = 9'h092;
      expv[61] = 9'h189;
      expv[62] = 9'h1f4;
      expv[63] = 9'h1e5;
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
