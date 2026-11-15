// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_175867 dut (
    .Opcode(in_vec[12:7]),
    .Funct(in_vec[6:1]),
    .rst_n(in_vec[0:0]),
    .RegDst(out_vec[12:12]),
    .ALUSrc(out_vec[11:11]),
    .MemWrite(out_vec[10:10]),
    .RegWrite(out_vec[9:9]),
    .MemtoReg(out_vec[8:8]),
    .Branch_gtz(out_vec[7:7]),
    .Branch_ne(out_vec[6:6]),
    .Branch_eq(out_vec[5:5]),
    .Branch_gez(out_vec[4:4]),
    .Branch_lez(out_vec[3:3]),
    .Branch_ltz(out_vec[2:2]),
    .jump(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0810;
    stim[1] = 13'h0622;
    stim[2] = 13'h1529;
    stim[3] = 13'h0bff;
    stim[4] = 13'h00c5;
    stim[5] = 13'h0037;
    stim[6] = 13'h0b0f;
    stim[7] = 13'h0d2f;
    stim[8] = 13'h01c7;
    stim[9] = 13'h0d91;
    stim[10] = 13'h0ea3;
    stim[11] = 13'h1b7f;
    stim[12] = 13'h1beb;
    stim[13] = 13'h1547;
    stim[14] = 13'h1189;
    stim[15] = 13'h0875;
    stim[16] = 13'h0229;
    stim[17] = 13'h1f45;
    stim[18] = 13'h113d;
    stim[19] = 13'h147d;
    stim[20] = 13'h19a9;
    stim[21] = 13'h12bf;
    stim[22] = 13'h1dd1;
    stim[23] = 13'h0565;
    stim[24] = 13'h16d3;
    stim[25] = 13'h1477;
    stim[26] = 13'h1ca5;
    stim[27] = 13'h0d13;
    stim[28] = 13'h1cd1;
    stim[29] = 13'h1e01;
    stim[30] = 13'h0d1d;
    stim[31] = 13'h06d5;
    stim[32] = 13'h0fbd;
    stim[33] = 13'h0a75;
    stim[34] = 13'h133b;
    stim[35] = 13'h0239;
    stim[36] = 13'h121f;
    stim[37] = 13'h13d6;
    stim[38] = 13'h0895;
    stim[39] = 13'h13c5;
    stim[40] = 13'h0a51;
    stim[41] = 13'h16cf;
    stim[42] = 13'h139f;
    stim[43] = 13'h11f3;
    stim[44] = 13'h0575;
    stim[45] = 13'h1e2b;
    stim[46] = 13'h08d1;
    stim[47] = 13'h07bd;
    stim[48] = 13'h0c6f;
    stim[49] = 13'h0255;
    stim[50] = 13'h1c99;
    stim[51] = 13'h0485;
    stim[52] = 13'h0eb5;
    stim[53] = 13'h1c79;
    stim[54] = 13'h0c43;
    stim[55] = 13'h000d;
    stim[56] = 13'h12ff;
    stim[57] = 13'h18b1;
    stim[58] = 13'h1597;
    stim[59] = 13'h128d;
    stim[60] = 13'h1931;
    stim[61] = 13'h1bcb;
    stim[62] = 13'h001d;
    stim[63] = 13'h1719;
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
      expv[3] = 13'h1200;
      expv[4] = 13'h1108;
      expv[5] = 13'h1200;
      expv[6] = 13'h1200;
      expv[7] = 13'h1200;
      expv[8] = 13'h1200;
      expv[9] = 13'h1200;
      expv[10] = 13'h1200;
      expv[11] = 13'h1200;
      expv[12] = 13'h1200;
      expv[13] = 13'h1200;
      expv[14] = 13'h0b00;
      expv[15] = 13'h0b00;
      expv[16] = 13'h0120;
      expv[17] = 13'h0120;
      expv[18] = 13'h0120;
      expv[19] = 13'h0120;
      expv[20] = 13'h0120;
      expv[21] = 13'h0120;
      expv[22] = 13'h0120;
      expv[23] = 13'h0a00;
      expv[24] = 13'h0a00;
      expv[25] = 13'h0a00;
      expv[26] = 13'h0a00;
      expv[27] = 13'h0a00;
      expv[28] = 13'h0a00;
      expv[29] = 13'h0a00;
      expv[30] = 13'h0a00;
      expv[31] = 13'h0a00;
      expv[32] = 13'h0a00;
      expv[33] = 13'h0a00;
      expv[34] = 13'h0a00;
      expv[35] = 13'h0120;
      expv[36] = 13'h0120;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0b00;
      expv[44] = 13'h0a00;
      expv[45] = 13'h0a00;
      expv[46] = 13'h0a00;
      expv[47] = 13'h0a00;
      expv[48] = 13'h0a00;
      expv[49] = 13'h0120;
      expv[50] = 13'h0120;
      expv[51] = 13'h0a00;
      expv[52] = 13'h0a00;
      expv[53] = 13'h0a00;
      expv[54] = 13'h0a00;
      expv[55] = 13'h1200;
      expv[56] = 13'h1200;
      expv[57] = 13'h1200;
      expv[58] = 13'h1c00;
      expv[59] = 13'h1c00;
      expv[60] = 13'h1c00;
      expv[61] = 13'h1c00;
      expv[62] = 13'h1200;
      expv[63] = 13'h1200;
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
