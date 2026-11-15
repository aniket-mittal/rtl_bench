// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055696 dut (
    .instr_op_i(in_vec[5:0]),
    .RegWrite_o(out_vec[12:12]),
    .ALU_op_o(out_vec[11:9]),
    .ALUSrc_o(out_vec[8:8]),
    .RegDst_o(out_vec[7:6]),
    .Branch_o(out_vec[5:5]),
    .Jump_o(out_vec[4:4]),
    .MemRead_o(out_vec[3:3]),
    .MemWrite_o(out_vec[2:2]),
    .MemtoReg_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h38;
    stim[1] = 6'h3e;
    stim[2] = 6'h25;
    stim[3] = 6'h3b;
    stim[4] = 6'h03;
    stim[5] = 6'h00;
    stim[6] = 6'h1d;
    stim[7] = 6'h39;
    stim[8] = 6'h3b;
    stim[9] = 6'h34;
    stim[10] = 6'h11;
    stim[11] = 6'h30;
    stim[12] = 6'h0b;
    stim[13] = 6'h0b;
    stim[14] = 6'h06;
    stim[15] = 6'h03;
    stim[16] = 6'h38;
    stim[17] = 6'h04;
    stim[18] = 6'h25;
    stim[19] = 6'h34;
    stim[20] = 6'h36;
    stim[21] = 6'h08;
    stim[22] = 6'h1a;
    stim[23] = 6'h0a;
    stim[24] = 6'h0a;
    stim[25] = 6'h2a;
    stim[26] = 6'h06;
    stim[27] = 6'h0e;
    stim[28] = 6'h2d;
    stim[29] = 6'h0a;
    stim[30] = 6'h0a;
    stim[31] = 6'h3e;
    stim[32] = 6'h14;
    stim[33] = 6'h0e;
    stim[34] = 6'h33;
    stim[35] = 6'h0b;
    stim[36] = 6'h2d;
    stim[37] = 6'h3d;
    stim[38] = 6'h31;
    stim[39] = 6'h35;
    stim[40] = 6'h22;
    stim[41] = 6'h1a;
    stim[42] = 6'h24;
    stim[43] = 6'h14;
    stim[44] = 6'h25;
    stim[45] = 6'h3d;
    stim[46] = 6'h32;
    stim[47] = 6'h11;
    stim[48] = 6'h3d;
    stim[49] = 6'h08;
    stim[50] = 6'h0f;
    stim[51] = 6'h06;
    stim[52] = 6'h2e;
    stim[53] = 6'h38;
    stim[54] = 6'h21;
    stim[55] = 6'h39;
    stim[56] = 6'h15;
    stim[57] = 6'h28;
    stim[58] = 6'h34;
    stim[59] = 6'h3a;
    stim[60] = 6'h06;
    stim[61] = 6'h14;
    stim[62] = 6'h19;
    stim[63] = 6'h34;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h1092;
      expv[5] = 13'h1440;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h1092;
      expv[16] = 13'h0000;
      expv[17] = 13'h0220;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h1700;
      expv[22] = 13'h0000;
      expv[23] = 13'h1700;
      expv[24] = 13'h1700;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h1700;
      expv[30] = 13'h1700;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h1700;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
