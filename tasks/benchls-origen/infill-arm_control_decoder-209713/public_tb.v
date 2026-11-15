// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_209713 dut (
    .Opcode(in_vec[10:0]),
    .Reg2Loc(out_vec[8:8]),
    .Branch(out_vec[7:7]),
    .MemRead(out_vec[6:6]),
    .MemtoReg(out_vec[5:5]),
    .ALUOp(out_vec[4:3]),
    .MemWrite(out_vec[2:2]),
    .ALUSrc(out_vec[1:1]),
    .RegWrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2c9;
    stim[1] = 11'h52e;
    stim[2] = 11'h4bf;
    stim[3] = 11'h714;
    stim[4] = 11'h5e0;
    stim[5] = 11'h0e2;
    stim[6] = 11'h730;
    stim[7] = 11'h4d5;
    stim[8] = 11'h12a;
    stim[9] = 11'h4e0;
    stim[10] = 11'h32d;
    stim[11] = 11'h14b;
    stim[12] = 11'h264;
    stim[13] = 11'h4b5;
    stim[14] = 11'h0d0;
    stim[15] = 11'h426;
    stim[16] = 11'h735;
    stim[17] = 11'h6c1;
    stim[18] = 11'h6c3;
    stim[19] = 11'h472;
    stim[20] = 11'h525;
    stim[21] = 11'h663;
    stim[22] = 11'h2bd;
    stim[23] = 11'h4f0;
    stim[24] = 11'h197;
    stim[25] = 11'h3b7;
    stim[26] = 11'h7be;
    stim[27] = 11'h1ee;
    stim[28] = 11'h6e0;
    stim[29] = 11'h480;
    stim[30] = 11'h68e;
    stim[31] = 11'h171;
    stim[32] = 11'h6e5;
    stim[33] = 11'h12d;
    stim[34] = 11'h7c3;
    stim[35] = 11'h714;
    stim[36] = 11'h689;
    stim[37] = 11'h5ba;
    stim[38] = 11'h54f;
    stim[39] = 11'h3d1;
    stim[40] = 11'h29d;
    stim[41] = 11'h226;
    stim[42] = 11'h4f8;
    stim[43] = 11'h7ed;
    stim[44] = 11'h02d;
    stim[45] = 11'h369;
    stim[46] = 11'h63b;
    stim[47] = 11'h6bd;
    stim[48] = 11'h0c3;
    stim[49] = 11'h631;
    stim[50] = 11'h781;
    stim[51] = 11'h7f7;
    stim[52] = 11'h298;
    stim[53] = 11'h638;
    stim[54] = 11'h4de;
    stim[55] = 11'h1d2;
    stim[56] = 11'h579;
    stim[57] = 11'h381;
    stim[58] = 11'h0d9;
    stim[59] = 11'h6d3;
    stim[60] = 11'h7dd;
    stim[61] = 11'h0ad;
    stim[62] = 11'h0e1;
    stim[63] = 11'h5fb;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
