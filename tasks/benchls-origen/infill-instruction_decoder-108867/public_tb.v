// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_108867 dut (
    .clk(clk),
    .init(in_vec[11:11]),
    .decoder_en(in_vec[10:10]),
    .inst(in_vec[9:1]),
    .cmp(in_vec[0:0]),
    .r1(out_vec[33:30]),
    .r2(out_vec[29:26]),
    .inst_type(out_vec[25:23]),
    .funct(out_vec[22:19]),
    .immediate(out_vec[18:11]),
    .branch(out_vec[10:10]),
    .branchi(out_vec[9:9]),
    .jump(out_vec[8:8]),
    .reg_hi_en(out_vec[7:7]),
    .reg_lo_en(out_vec[6:6]),
    .reg_readx_en(out_vec[5:5]),
    .reg_ready_en(out_vec[4:4]),
    .reg_swap_en(out_vec[3:3]),
    .y_is_imm(out_vec[2:2]),
    .is_cmp(out_vec[1:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h66b;
    stim[1] = 12'h013;
    stim[2] = 12'hdf6;
    stim[3] = 12'h433;
    stim[4] = 12'h293;
    stim[5] = 12'hc1e;
    stim[6] = 12'hb71;
    stim[7] = 12'ha88;
    stim[8] = 12'h7f4;
    stim[9] = 12'hd90;
    stim[10] = 12'h7e9;
    stim[11] = 12'hc89;
    stim[12] = 12'hd62;
    stim[13] = 12'hcaa;
    stim[14] = 12'hd99;
    stim[15] = 12'h902;
    stim[16] = 12'hadb;
    stim[17] = 12'h50c;
    stim[18] = 12'hba2;
    stim[19] = 12'h363;
    stim[20] = 12'h1df;
    stim[21] = 12'hb09;
    stim[22] = 12'h230;
    stim[23] = 12'h589;
    stim[24] = 12'h9a2;
    stim[25] = 12'hd93;
    stim[26] = 12'hefb;
    stim[27] = 12'h324;
    stim[28] = 12'hdf8;
    stim[29] = 12'h082;
    stim[30] = 12'h445;
    stim[31] = 12'h99d;
    stim[32] = 12'heb5;
    stim[33] = 12'hc7b;
    stim[34] = 12'h0ec;
    stim[35] = 12'h599;
    stim[36] = 12'hed3;
    stim[37] = 12'h451;
    stim[38] = 12'h541;
    stim[39] = 12'h1eb;
    stim[40] = 12'h207;
    stim[41] = 12'h799;
    stim[42] = 12'h9b4;
    stim[43] = 12'h73b;
    stim[44] = 12'h9bd;
    stim[45] = 12'hefd;
    stim[46] = 12'h5dd;
    stim[47] = 12'h397;
    stim[48] = 12'h159;
    stim[49] = 12'h499;
    stim[50] = 12'hb10;
    stim[51] = 12'h04c;
    stim[52] = 12'h8f3;
    stim[53] = 12'h866;
    stim[54] = 12'h1bc;
    stim[55] = 12'hd70;
    stim[56] = 12'h664;
    stim[57] = 12'h440;
    stim[58] = 12'h5fb;
    stim[59] = 12'h8a4;
    stim[60] = 12'h206;
    stim[61] = 12'h165;
    stim[62] = 12'h1ae;
    stim[63] = 12'h6fa;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxx00;
      expv[2] = 34'hxxxxxxx00;
      expv[3] = 34'h000000000;
      expv[4] = 34'h242880032;
      expv[5] = 34'h242880032;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h180c00030;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h310800030;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000000;
      expv[31] = 34'h082900030;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h330880030;
      expv[37] = 34'h000000000;
      expv[38] = 34'h202900030;
      expv[39] = 34'h000d00030;
      expv[40] = 34'h000d00030;
      expv[41] = 34'h000d00030;
      expv[42] = 34'h000d00000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h3b8a80030;
      expv[48] = 34'h3b8a80030;
      expv[49] = 34'h3b8a80030;
      expv[50] = 34'h300a00030;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h000000000;
      expv[54] = 34'h000000000;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h000000000;
      expv[58] = 34'h002900030;
      expv[59] = 34'h3f4b80030;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000000;
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
