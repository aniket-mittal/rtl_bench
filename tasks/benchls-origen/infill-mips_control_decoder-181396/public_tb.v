// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_181396 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegWrite_id(out_vec[14:14]),
    .MemWrite_id(out_vec[13:13]),
    .ALUSrc_id(out_vec[12:12]),
    .Branch_id(out_vec[11:11]),
    .j_id(out_vec[10:10]),
    .jal_id(out_vec[9:9]),
    .jr_id(out_vec[8:8]),
    .EXTop_id(out_vec[7:6]),
    .MemtoReg_id(out_vec[5:4]),
    .ALUop_id(out_vec[3:2]),
    .RegDst_id(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h878;
    stim[1] = 12'hf25;
    stim[2] = 12'hfeb;
    stim[3] = 12'h842;
    stim[4] = 12'h9c8;
    stim[5] = 12'h2f2;
    stim[6] = 12'h4f4;
    stim[7] = 12'h234;
    stim[8] = 12'h206;
    stim[9] = 12'ha44;
    stim[10] = 12'h229;
    stim[11] = 12'ha59;
    stim[12] = 12'h688;
    stim[13] = 12'heca;
    stim[14] = 12'h9cb;
    stim[15] = 12'heed;
    stim[16] = 12'h57a;
    stim[17] = 12'h3a8;
    stim[18] = 12'h907;
    stim[19] = 12'h848;
    stim[20] = 12'h297;
    stim[21] = 12'h2cd;
    stim[22] = 12'hdef;
    stim[23] = 12'h360;
    stim[24] = 12'h617;
    stim[25] = 12'h1aa;
    stim[26] = 12'hc0b;
    stim[27] = 12'hd3c;
    stim[28] = 12'h10a;
    stim[29] = 12'h1a2;
    stim[30] = 12'h50d;
    stim[31] = 12'hda0;
    stim[32] = 12'h3d6;
    stim[33] = 12'h685;
    stim[34] = 12'he5c;
    stim[35] = 12'hb6f;
    stim[36] = 12'h78b;
    stim[37] = 12'h94e;
    stim[38] = 12'h91a;
    stim[39] = 12'h59c;
    stim[40] = 12'h430;
    stim[41] = 12'hcf7;
    stim[42] = 12'h796;
    stim[43] = 12'h6f8;
    stim[44] = 12'h0b3;
    stim[45] = 12'h9ec;
    stim[46] = 12'ha62;
    stim[47] = 12'hf59;
    stim[48] = 12'h27b;
    stim[49] = 12'haed;
    stim[50] = 12'h6b1;
    stim[51] = 12'hc9a;
    stim[52] = 12'hd44;
    stim[53] = 12'h097;
    stim[54] = 12'hac3;
    stim[55] = 12'h717;
    stim[56] = 12'heab;
    stim[57] = 12'h232;
    stim[58] = 12'h56e;
    stim[59] = 12'hc36;
    stim[60] = 12'hf4d;
    stim[61] = 12'hdb4;
    stim[62] = 12'hb0b;
    stim[63] = 12'h7f7;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h500c;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0804;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h5040;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h0000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0400;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h5000;
      expv[49] = 15'h3000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0400;
      expv[54] = 15'h3000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
