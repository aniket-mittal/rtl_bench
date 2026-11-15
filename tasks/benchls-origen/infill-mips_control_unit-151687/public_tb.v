// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151687 dut (
    .op(in_vec[12:7]),
    .func(in_vec[6:1]),
    .z(in_vec[0:0]),
    .wreg(out_vec[13:13]),
    .regrt(out_vec[12:12]),
    .jal(out_vec[11:11]),
    .m2reg(out_vec[10:10]),
    .shift(out_vec[9:9]),
    .aluimm(out_vec[8:8]),
    .sext(out_vec[7:7]),
    .wmem(out_vec[6:6]),
    .aluc(out_vec[5:2]),
    .pcsource(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h06c8;
    stim[1] = 13'h0f00;
    stim[2] = 13'h1352;
    stim[3] = 13'h17b7;
    stim[4] = 13'h1478;
    stim[5] = 13'h1f3b;
    stim[6] = 13'h0beb;
    stim[7] = 13'h1907;
    stim[8] = 13'h037c;
    stim[9] = 13'h129a;
    stim[10] = 13'h07a9;
    stim[11] = 13'h17e5;
    stim[12] = 13'h1286;
    stim[13] = 13'h1b00;
    stim[14] = 13'h0897;
    stim[15] = 13'h127a;
    stim[16] = 13'h0a1b;
    stim[17] = 13'h1471;
    stim[18] = 13'h1fb9;
    stim[19] = 13'h16cc;
    stim[20] = 13'h01d7;
    stim[21] = 13'h1a22;
    stim[22] = 13'h0305;
    stim[23] = 13'h0bca;
    stim[24] = 13'h162e;
    stim[25] = 13'h03b2;
    stim[26] = 13'h0b42;
    stim[27] = 13'h1c07;
    stim[28] = 13'h0725;
    stim[29] = 13'h1eef;
    stim[30] = 13'h1759;
    stim[31] = 13'h050d;
    stim[32] = 13'h04ca;
    stim[33] = 13'h125c;
    stim[34] = 13'h1a24;
    stim[35] = 13'h0844;
    stim[36] = 13'h142a;
    stim[37] = 13'h1efe;
    stim[38] = 13'h169e;
    stim[39] = 13'h0328;
    stim[40] = 13'h0b7e;
    stim[41] = 13'h01e6;
    stim[42] = 13'h1bf3;
    stim[43] = 13'h136b;
    stim[44] = 13'h1155;
    stim[45] = 13'h1f9f;
    stim[46] = 13'h11c4;
    stim[47] = 13'h1a06;
    stim[48] = 13'h0227;
    stim[49] = 13'h0d07;
    stim[50] = 13'h1fcd;
    stim[51] = 13'h1f8d;
    stim[52] = 13'h1a4e;
    stim[53] = 13'h1bc6;
    stim[54] = 13'h18c0;
    stim[55] = 13'h0639;
    stim[56] = 13'h1613;
    stim[57] = 13'h1518;
    stim[58] = 13'h0be1;
    stim[59] = 13'h02ae;
    stim[60] = 13'h1637;
    stim[61] = 13'h1008;
    stim[62] = 13'h11d0;
    stim[63] = 13'h17fb;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h01c8;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h01c8;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0002;
      expv[33] = 14'h0000;
      expv[34] = 14'h0000;
      expv[35] = 14'h0000;
      expv[36] = 14'h0000;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h0000;
      expv[46] = 14'h0000;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0000;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h01c8;
      expv[59] = 14'h0001;
      expv[60] = 14'h0000;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0000;
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
