// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151758 dut (
    .opcode(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .alu_op(out_vec[10:8]),
    .alu_src(out_vec[7:7]),
    .alu_shift(out_vec[6:6]),
    .branch(out_vec[5:5]),
    .mem_to_reg(out_vec[4:4]),
    .mem_read(out_vec[3:3]),
    .mem_write(out_vec[2:2]),
    .reg_dst(out_vec[1:1]),
    .reg_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbb3;
    stim[1] = 12'h651;
    stim[2] = 12'h582;
    stim[3] = 12'h7e9;
    stim[4] = 12'h5cd;
    stim[5] = 12'hddc;
    stim[6] = 12'h85b;
    stim[7] = 12'h73e;
    stim[8] = 12'h1d0;
    stim[9] = 12'h226;
    stim[10] = 12'h642;
    stim[11] = 12'h30c;
    stim[12] = 12'h862;
    stim[13] = 12'hba2;
    stim[14] = 12'hc70;
    stim[15] = 12'ha96;
    stim[16] = 12'h737;
    stim[17] = 12'h84f;
    stim[18] = 12'habd;
    stim[19] = 12'h54a;
    stim[20] = 12'h168;
    stim[21] = 12'h49f;
    stim[22] = 12'h346;
    stim[23] = 12'h725;
    stim[24] = 12'h0a0;
    stim[25] = 12'h66e;
    stim[26] = 12'h76b;
    stim[27] = 12'h43e;
    stim[28] = 12'hcad;
    stim[29] = 12'h73d;
    stim[30] = 12'h218;
    stim[31] = 12'h838;
    stim[32] = 12'hdcd;
    stim[33] = 12'h999;
    stim[34] = 12'hbf9;
    stim[35] = 12'h23b;
    stim[36] = 12'h2f2;
    stim[37] = 12'h313;
    stim[38] = 12'h140;
    stim[39] = 12'heb1;
    stim[40] = 12'h2af;
    stim[41] = 12'h12a;
    stim[42] = 12'h4e6;
    stim[43] = 12'hdca;
    stim[44] = 12'he16;
    stim[45] = 12'h6ed;
    stim[46] = 12'ha55;
    stim[47] = 12'hc77;
    stim[48] = 12'h6f7;
    stim[49] = 12'h014;
    stim[50] = 12'h83c;
    stim[51] = 12'hfb9;
    stim[52] = 12'h4af;
    stim[53] = 12'h1e6;
    stim[54] = 12'h078;
    stim[55] = 12'hc38;
    stim[56] = 12'h788;
    stim[57] = 12'h6c5;
    stim[58] = 12'h2df;
    stim[59] = 12'h332;
    stim[60] = 12'h218;
    stim[61] = 12'h9bb;
    stim[62] = 12'h234;
    stim[63] = 12'hb20;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h281;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h281;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h281;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h620;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h203;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h281;
      expv[61] = 11'h000;
      expv[62] = 11'h281;
      expv[63] = 11'h000;
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
