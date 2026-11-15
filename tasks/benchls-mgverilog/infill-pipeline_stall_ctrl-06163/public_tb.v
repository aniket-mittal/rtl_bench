// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06163 dut (
    .flush_except(in_vec[6:6]),
    .flush_branch(in_vec[5:5]),
    .if_stall(in_vec[4:4]),
    .lsu_stall(in_vec[3:3]),
    .multicycle_cnt(in_vec[2:1]),
    .asyn_stall(in_vec[0:0]),
    .flushpipe(out_vec[5:5]),
    .pc_freeze(out_vec[4:4]),
    .if_freeze(out_vec[3:3]),
    .id_freeze(out_vec[2:2]),
    .ex_freeze(out_vec[1:1]),
    .wb_freeze(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h6b;
    stim[1] = 7'h56;
    stim[2] = 7'h5a;
    stim[3] = 7'h05;
    stim[4] = 7'h40;
    stim[5] = 7'h67;
    stim[6] = 7'h0f;
    stim[7] = 7'h01;
    stim[8] = 7'h17;
    stim[9] = 7'h68;
    stim[10] = 7'h03;
    stim[11] = 7'h78;
    stim[12] = 7'h55;
    stim[13] = 7'h13;
    stim[14] = 7'h2d;
    stim[15] = 7'h37;
    stim[16] = 7'h05;
    stim[17] = 7'h0c;
    stim[18] = 7'h3a;
    stim[19] = 7'h58;
    stim[20] = 7'h3d;
    stim[21] = 7'h47;
    stim[22] = 7'h20;
    stim[23] = 7'h22;
    stim[24] = 7'h2b;
    stim[25] = 7'h32;
    stim[26] = 7'h4a;
    stim[27] = 7'h1d;
    stim[28] = 7'h24;
    stim[29] = 7'h47;
    stim[30] = 7'h56;
    stim[31] = 7'h0f;
    stim[32] = 7'h51;
    stim[33] = 7'h43;
    stim[34] = 7'h29;
    stim[35] = 7'h7b;
    stim[36] = 7'h6a;
    stim[37] = 7'h09;
    stim[38] = 7'h20;
    stim[39] = 7'h4b;
    stim[40] = 7'h20;
    stim[41] = 7'h13;
    stim[42] = 7'h1a;
    stim[43] = 7'h61;
    stim[44] = 7'h12;
    stim[45] = 7'h0e;
    stim[46] = 7'h15;
    stim[47] = 7'h48;
    stim[48] = 7'h1b;
    stim[49] = 7'h07;
    stim[50] = 7'h33;
    stim[51] = 7'h25;
    stim[52] = 7'h7f;
    stim[53] = 7'h22;
    stim[54] = 7'h60;
    stim[55] = 7'h5f;
    stim[56] = 7'h6d;
    stim[57] = 7'h59;
    stim[58] = 7'h21;
    stim[59] = 7'h70;
    stim[60] = 7'h67;
    stim[61] = 7'h4b;
    stim[62] = 7'h6a;
    stim[63] = 7'h15;
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
      expv[0] = 6'h3f;
      expv[1] = 6'h3f;
      expv[2] = 6'h3f;
      expv[3] = 6'h0f;
      expv[4] = 6'h30;
      expv[5] = 6'h3f;
      expv[6] = 6'h0f;
      expv[7] = 6'h0e;
      expv[8] = 6'h0f;
      expv[9] = 6'h3f;
      expv[10] = 6'h0f;
      expv[11] = 6'h3f;
      expv[12] = 6'h3f;
      expv[13] = 6'h0f;
      expv[14] = 6'h3f;
      expv[15] = 6'h3f;
      expv[16] = 6'h0f;
      expv[17] = 6'h0f;
      expv[18] = 6'h3f;
      expv[19] = 6'h3f;
      expv[20] = 6'h3f;
      expv[21] = 6'h3f;
      expv[22] = 6'h30;
      expv[23] = 6'h3f;
      expv[24] = 6'h3f;
      expv[25] = 6'h3f;
      expv[26] = 6'h3f;
      expv[27] = 6'h0f;
      expv[28] = 6'h3f;
      expv[29] = 6'h3f;
      expv[30] = 6'h3f;
      expv[31] = 6'h0f;
      expv[32] = 6'h3e;
      expv[33] = 6'h3f;
      expv[34] = 6'h3f;
      expv[35] = 6'h3f;
      expv[36] = 6'h3f;
      expv[37] = 6'h0f;
      expv[38] = 6'h30;
      expv[39] = 6'h3f;
      expv[40] = 6'h30;
      expv[41] = 6'h0f;
      expv[42] = 6'h0f;
      expv[43] = 6'h3e;
      expv[44] = 6'h0f;
      expv[45] = 6'h0f;
      expv[46] = 6'h0f;
      expv[47] = 6'h3f;
      expv[48] = 6'h0f;
      expv[49] = 6'h0f;
      expv[50] = 6'h3f;
      expv[51] = 6'h3f;
      expv[52] = 6'h3f;
      expv[53] = 6'h3f;
      expv[54] = 6'h30;
      expv[55] = 6'h3f;
      expv[56] = 6'h3f;
      expv[57] = 6'h3f;
      expv[58] = 6'h3e;
      expv[59] = 6'h38;
      expv[60] = 6'h3f;
      expv[61] = 6'h3f;
      expv[62] = 6'h3f;
      expv[63] = 6'h0f;
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
