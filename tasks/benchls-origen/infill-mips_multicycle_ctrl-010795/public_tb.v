// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_010795 dut (
    .Op(in_vec[9:4]),
    .state(in_vec[3:0]),
    .next(out_vec[18:15]),
    .PCWrite(out_vec[14:14]),
    .PCWriteCond(out_vec[13:13]),
    .IorD(out_vec[12:12]),
    .MemRead(out_vec[11:11]),
    .MemWrite(out_vec[10:10]),
    .IRWrite(out_vec[9:9]),
    .MemtoReg(out_vec[8:8]),
    .PCSource(out_vec[7:7]),
    .ALUSrcA(out_vec[6:6]),
    .RegWrite(out_vec[5:5]),
    .RegDst(out_vec[4:4]),
    .ALUSrcB(out_vec[3:2]),
    .ALUOp(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3c5;
    stim[1] = 10'h2e5;
    stim[2] = 10'h185;
    stim[3] = 10'h09d;
    stim[4] = 10'h0fa;
    stim[5] = 10'h18b;
    stim[6] = 10'h2eb;
    stim[7] = 10'h0c4;
    stim[8] = 10'h2c1;
    stim[9] = 10'h1e7;
    stim[10] = 10'h1d6;
    stim[11] = 10'h335;
    stim[12] = 10'h17c;
    stim[13] = 10'h00d;
    stim[14] = 10'h288;
    stim[15] = 10'h388;
    stim[16] = 10'h0b8;
    stim[17] = 10'h0dc;
    stim[18] = 10'h092;
    stim[19] = 10'h37d;
    stim[20] = 10'h07d;
    stim[21] = 10'h1bc;
    stim[22] = 10'h0e9;
    stim[23] = 10'h193;
    stim[24] = 10'h307;
    stim[25] = 10'h237;
    stim[26] = 10'h3e0;
    stim[27] = 10'h129;
    stim[28] = 10'h3fd;
    stim[29] = 10'h1e4;
    stim[30] = 10'h3ff;
    stim[31] = 10'h346;
    stim[32] = 10'h33f;
    stim[33] = 10'h0e8;
    stim[34] = 10'h1d1;
    stim[35] = 10'h3b0;
    stim[36] = 10'h159;
    stim[37] = 10'h06e;
    stim[38] = 10'h2fe;
    stim[39] = 10'h0fe;
    stim[40] = 10'h20f;
    stim[41] = 10'h263;
    stim[42] = 10'h075;
    stim[43] = 10'h26a;
    stim[44] = 10'h3e1;
    stim[45] = 10'h263;
    stim[46] = 10'h129;
    stim[47] = 10'h094;
    stim[48] = 10'h0ff;
    stim[49] = 10'h148;
    stim[50] = 10'h211;
    stim[51] = 10'h170;
    stim[52] = 10'h1c7;
    stim[53] = 10'h1f4;
    stim[54] = 10'h00f;
    stim[55] = 10'h019;
    stim[56] = 10'h1fe;
    stim[57] = 10'h0d8;
    stim[58] = 10'h2dd;
    stim[59] = 10'h325;
    stim[60] = 10'h3ea;
    stim[61] = 10'h1e5;
    stim[62] = 10'h384;
    stim[63] = 10'h311;
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
      expv[0] = 19'h01400;
      expv[1] = 19'h01400;
      expv[2] = 19'h01400;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00120;
      expv[8] = 19'h0000c;
      expv[9] = 19'h00030;
      expv[10] = 19'h38042;
      expv[11] = 19'h01400;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h020c1;
      expv[15] = 19'h020c1;
      expv[16] = 19'h020c1;
      expv[17] = 19'h00000;
      expv[18] = 19'h28048;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h04080;
      expv[23] = 19'h21800;
      expv[24] = 19'h00030;
      expv[25] = 19'h00030;
      expv[26] = 19'h0ca04;
      expv[27] = 19'h04080;
      expv[28] = 19'h00000;
      expv[29] = 19'h00120;
      expv[30] = 19'h00000;
      expv[31] = 19'h38042;
      expv[32] = 19'h00000;
      expv[33] = 19'h020c1;
      expv[34] = 19'h0000c;
      expv[35] = 19'h0ca04;
      expv[36] = 19'h04080;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h21800;
      expv[42] = 19'h01400;
      expv[43] = 19'h00000;
      expv[44] = 19'h0000c;
      expv[45] = 19'h21800;
      expv[46] = 19'h04080;
      expv[47] = 19'h00120;
      expv[48] = 19'h00000;
      expv[49] = 19'h020c1;
      expv[50] = 19'h0000c;
      expv[51] = 19'h0ca04;
      expv[52] = 19'h00030;
      expv[53] = 19'h00120;
      expv[54] = 19'h00000;
      expv[55] = 19'h04080;
      expv[56] = 19'h00000;
      expv[57] = 19'h020c1;
      expv[58] = 19'h00000;
      expv[59] = 19'h01400;
      expv[60] = 19'h00000;
      expv[61] = 19'h01400;
      expv[62] = 19'h00120;
      expv[63] = 19'h0000c;
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
