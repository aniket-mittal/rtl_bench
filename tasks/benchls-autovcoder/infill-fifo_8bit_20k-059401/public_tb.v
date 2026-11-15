// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059401 dut (
    .clk(clk),
    .reset(in_vec[12:12]),
    .if_write_ce(in_vec[11:11]),
    .if_write(in_vec[10:10]),
    .if_din(in_vec[9:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[9:9]),
    .if_empty_n(out_vec[8:8]),
    .if_dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1447;
    stim[1] = 13'h1dc6;
    stim[2] = 13'h0eeb;
    stim[3] = 13'h0c07;
    stim[4] = 13'h0550;
    stim[5] = 13'h0dc0;
    stim[6] = 13'h0d4b;
    stim[7] = 13'h05ad;
    stim[8] = 13'h028e;
    stim[9] = 13'h0e7f;
    stim[10] = 13'h0853;
    stim[11] = 13'h0afd;
    stim[12] = 13'h0798;
    stim[13] = 13'h0201;
    stim[14] = 13'h0b71;
    stim[15] = 13'h08e5;
    stim[16] = 13'h0093;
    stim[17] = 13'h0b96;
    stim[18] = 13'h0582;
    stim[19] = 13'h0524;
    stim[20] = 13'h0861;
    stim[21] = 13'h0b51;
    stim[22] = 13'h0f61;
    stim[23] = 13'h0377;
    stim[24] = 13'h071c;
    stim[25] = 13'h08e4;
    stim[26] = 13'h0120;
    stim[27] = 13'h0c3e;
    stim[28] = 13'h0266;
    stim[29] = 13'h005d;
    stim[30] = 13'h02f4;
    stim[31] = 13'h07e0;
    stim[32] = 13'h0b65;
    stim[33] = 13'h07d0;
    stim[34] = 13'h0788;
    stim[35] = 13'h0d04;
    stim[36] = 13'h0695;
    stim[37] = 13'h0375;
    stim[38] = 13'h0cbd;
    stim[39] = 13'h0990;
    stim[40] = 13'h0bac;
    stim[41] = 13'h0cd6;
    stim[42] = 13'h0468;
    stim[43] = 13'h0889;
    stim[44] = 13'h0944;
    stim[45] = 13'h0816;
    stim[46] = 13'h0177;
    stim[47] = 13'h0c24;
    stim[48] = 13'h0f10;
    stim[49] = 13'h094f;
    stim[50] = 13'h02f4;
    stim[51] = 13'h0672;
    stim[52] = 13'h0789;
    stim[53] = 13'h0381;
    stim[54] = 13'h0399;
    stim[55] = 13'h01c6;
    stim[56] = 13'h020b;
    stim[57] = 13'h0e71;
    stim[58] = 13'h0e84;
    stim[59] = 13'h02c5;
    stim[60] = 13'h0bef;
    stim[61] = 13'h0734;
    stim[62] = 13'h07fa;
    stim[63] = 13'h06f8;
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
      expv[0] = 10'h200;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h200;
      expv[4] = 10'h3ba;
      expv[5] = 10'h3ba;
      expv[6] = 10'h3ba;
      expv[7] = 10'h301;
      expv[8] = 10'h301;
      expv[9] = 10'h301;
      expv[10] = 10'h370;
      expv[11] = 10'h352;
      expv[12] = 10'h352;
      expv[13] = 10'h352;
      expv[14] = 10'h352;
      expv[15] = 10'h352;
      expv[16] = 10'h352;
      expv[17] = 10'h39f;
      expv[18] = 10'h39f;
      expv[19] = 10'h39f;
      expv[20] = 10'h39f;
      expv[21] = 10'h39f;
      expv[22] = 10'h39f;
      expv[23] = 10'h39f;
      expv[24] = 10'h3d8;
      expv[25] = 10'h3d8;
      expv[26] = 10'h3d8;
      expv[27] = 10'h3d8;
      expv[28] = 10'h3d8;
      expv[29] = 10'h3d8;
      expv[30] = 10'h3d8;
      expv[31] = 10'h3d8;
      expv[32] = 10'h3d8;
      expv[33] = 10'h3d8;
      expv[34] = 10'h3d8;
      expv[35] = 10'h3d8;
      expv[36] = 10'h3d8;
      expv[37] = 10'h3d8;
      expv[38] = 10'h3d8;
      expv[39] = 10'h3d8;
      expv[40] = 10'h3d8;
      expv[41] = 10'h3d8;
      expv[42] = 10'h3d8;
      expv[43] = 10'h3d8;
      expv[44] = 10'h3d8;
      expv[45] = 10'h3d8;
      expv[46] = 10'h3d8;
      expv[47] = 10'h30f;
      expv[48] = 10'h30f;
      expv[49] = 10'h30f;
      expv[50] = 10'h341;
      expv[51] = 10'h341;
      expv[52] = 10'h341;
      expv[53] = 10'h341;
      expv[54] = 10'h341;
      expv[55] = 10'h341;
      expv[56] = 10'h341;
      expv[57] = 10'h32f;
      expv[58] = 10'h32f;
      expv[59] = 10'h32f;
      expv[60] = 10'h32f;
      expv[61] = 10'h335;
      expv[62] = 10'h335;
      expv[63] = 10'h335;
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
