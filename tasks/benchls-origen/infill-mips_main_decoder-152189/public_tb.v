// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_152189 dut (
    .Opcode(in_vec[11:6]),
    .Funct(in_vec[5:0]),
    .RegDst(out_vec[16:15]),
    .Jump(out_vec[14:14]),
    .Branch(out_vec[13:13]),
    .MemRead(out_vec[12:12]),
    .MemtoReg(out_vec[11:10]),
    .ALUOp(out_vec[9:4]),
    .MemWrite(out_vec[3:3]),
    .ALUSrc(out_vec[2:2]),
    .RegWrite(out_vec[1:1]),
    .JumpRegister(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb01;
    stim[1] = 12'h35a;
    stim[2] = 12'h7ac;
    stim[3] = 12'ha9a;
    stim[4] = 12'h757;
    stim[5] = 12'hb04;
    stim[6] = 12'h35e;
    stim[7] = 12'h043;
    stim[8] = 12'h7ab;
    stim[9] = 12'hd4c;
    stim[10] = 12'h2f0;
    stim[11] = 12'h348;
    stim[12] = 12'h723;
    stim[13] = 12'h734;
    stim[14] = 12'h45f;
    stim[15] = 12'h970;
    stim[16] = 12'hedf;
    stim[17] = 12'he5d;
    stim[18] = 12'h310;
    stim[19] = 12'hc75;
    stim[20] = 12'hfa5;
    stim[21] = 12'hd8d;
    stim[22] = 12'habb;
    stim[23] = 12'h192;
    stim[24] = 12'ha31;
    stim[25] = 12'habe;
    stim[26] = 12'h97d;
    stim[27] = 12'h6e9;
    stim[28] = 12'h7ed;
    stim[29] = 12'hc4f;
    stim[30] = 12'hb7b;
    stim[31] = 12'hef8;
    stim[32] = 12'hbb1;
    stim[33] = 12'h510;
    stim[34] = 12'h3c0;
    stim[35] = 12'h66d;
    stim[36] = 12'hc03;
    stim[37] = 12'h00d;
    stim[38] = 12'h737;
    stim[39] = 12'h7c1;
    stim[40] = 12'h3bc;
    stim[41] = 12'h5c1;
    stim[42] = 12'hc4e;
    stim[43] = 12'hed0;
    stim[44] = 12'h8ae;
    stim[45] = 12'hb03;
    stim[46] = 12'hd3f;
    stim[47] = 12'h7a2;
    stim[48] = 12'hc3b;
    stim[49] = 12'h40e;
    stim[50] = 12'hbb8;
    stim[51] = 12'h10b;
    stim[52] = 12'h87e;
    stim[53] = 12'h342;
    stim[54] = 12'hf1a;
    stim[55] = 12'hf9c;
    stim[56] = 12'h46b;
    stim[57] = 12'hba4;
    stim[58] = 12'hd7a;
    stim[59] = 12'h2a6;
    stim[60] = 12'hee6;
    stim[61] = 12'h2d4;
    stim[62] = 12'ha80;
    stim[63] = 12'hdf3;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h08202;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h02220;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
