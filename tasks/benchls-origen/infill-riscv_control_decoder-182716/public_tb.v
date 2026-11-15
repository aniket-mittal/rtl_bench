// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182716 dut (
    .rst_n(in_vec[12:12]),
    .instr_op_i(in_vec[11:6]),
    .funct_i(in_vec[5:0]),
    .RegWrite_o(out_vec[11:11]),
    .ALU_op_o(out_vec[10:7]),
    .ALUSrc_o(out_vec[6:6]),
    .RegDst_o(out_vec[5:5]),
    .Branch_o(out_vec[4:4]),
    .Jump_o(out_vec[3:3]),
    .MemRead_o(out_vec[2:2]),
    .MemWrite_o(out_vec[1:1]),
    .MemtoReg_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h06a5;
    stim[1] = 13'h0e1e;
    stim[2] = 13'h1f67;
    stim[3] = 13'h14a7;
    stim[4] = 13'h1d68;
    stim[5] = 13'h1df8;
    stim[6] = 13'h1e8f;
    stim[7] = 13'h1f04;
    stim[8] = 13'h1ac4;
    stim[9] = 13'h1edf;
    stim[10] = 13'h1e7b;
    stim[11] = 13'h17c8;
    stim[12] = 13'h1835;
    stim[13] = 13'h1544;
    stim[14] = 13'h1172;
    stim[15] = 13'h1abe;
    stim[16] = 13'h1a73;
    stim[17] = 13'h117b;
    stim[18] = 13'h13e3;
    stim[19] = 13'h1eba;
    stim[20] = 13'h1bc1;
    stim[21] = 13'h1471;
    stim[22] = 13'h185d;
    stim[23] = 13'h14c4;
    stim[24] = 13'h156b;
    stim[25] = 13'h1e6d;
    stim[26] = 13'h1abc;
    stim[27] = 13'h1f37;
    stim[28] = 13'h1324;
    stim[29] = 13'h1316;
    stim[30] = 13'h16b1;
    stim[31] = 13'h1f0c;
    stim[32] = 13'h1df5;
    stim[33] = 13'h1aa4;
    stim[34] = 13'h14ad;
    stim[35] = 13'h1905;
    stim[36] = 13'h1a8d;
    stim[37] = 13'h1957;
    stim[38] = 13'h1810;
    stim[39] = 13'h1288;
    stim[40] = 13'h1cd3;
    stim[41] = 13'h13df;
    stim[42] = 13'h1b1c;
    stim[43] = 13'h1241;
    stim[44] = 13'h1454;
    stim[45] = 13'h141f;
    stim[46] = 13'h1b30;
    stim[47] = 13'h1438;
    stim[48] = 13'h182c;
    stim[49] = 13'h152f;
    stim[50] = 13'h1269;
    stim[51] = 13'h1827;
    stim[52] = 13'h1644;
    stim[53] = 13'h1153;
    stim[54] = 13'h15fc;
    stim[55] = 13'h140f;
    stim[56] = 13'h121a;
    stim[57] = 13'h1462;
    stim[58] = 13'h1695;
    stim[59] = 13'h1c4a;
    stim[60] = 13'h1cbc;
    stim[61] = 13'h14c8;
    stim[62] = 13'h1c2e;
    stim[63] = 13'h11eb;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h04x;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h31x;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h31x;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h31x;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
