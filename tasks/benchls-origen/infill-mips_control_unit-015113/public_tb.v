// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015113 dut (
    .Opcode(in_vec[13:8]),
    .funct(in_vec[7:2]),
    .IRQ(in_vec[1:1]),
    .ker(in_vec[0:0]),
    .PCSrc(out_vec[21:19]),
    .RegDst(out_vec[18:17]),
    .MemToReg(out_vec[16:15]),
    .ALUFun(out_vec[14:9]),
    .RegWr(out_vec[8:8]),
    .ALUSrc1(out_vec[7:7]),
    .ALUSrc2(out_vec[6:6]),
    .Sign(out_vec[5:5]),
    .MemWr(out_vec[4:4]),
    .MemRd(out_vec[3:3]),
    .EXTOp(out_vec[2:2]),
    .LUOp(out_vec[1:1]),
    .Interrupt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h29df;
    stim[1] = 14'h29ed;
    stim[2] = 14'h14c0;
    stim[3] = 14'h0dbb;
    stim[4] = 14'h0cc9;
    stim[5] = 14'h09b9;
    stim[6] = 14'h0fd3;
    stim[7] = 14'h29ca;
    stim[8] = 14'h07ad;
    stim[9] = 14'h1849;
    stim[10] = 14'h0e41;
    stim[11] = 14'h3e89;
    stim[12] = 14'h3692;
    stim[13] = 14'h1f49;
    stim[14] = 14'h017b;
    stim[15] = 14'h0012;
    stim[16] = 14'h3b4d;
    stim[17] = 14'h0801;
    stim[18] = 14'h13fc;
    stim[19] = 14'h30d6;
    stim[20] = 14'h28ef;
    stim[21] = 14'h1fea;
    stim[22] = 14'h3478;
    stim[23] = 14'h2a95;
    stim[24] = 14'h1293;
    stim[25] = 14'h39eb;
    stim[26] = 14'h0e67;
    stim[27] = 14'h019c;
    stim[28] = 14'h2546;
    stim[29] = 14'h1555;
    stim[30] = 14'h35f7;
    stim[31] = 14'h33fa;
    stim[32] = 14'h2c10;
    stim[33] = 14'h129d;
    stim[34] = 14'h3dbf;
    stim[35] = 14'h2614;
    stim[36] = 14'h39b7;
    stim[37] = 14'h287f;
    stim[38] = 14'h019c;
    stim[39] = 14'h061a;
    stim[40] = 14'h18af;
    stim[41] = 14'h2058;
    stim[42] = 14'h3dab;
    stim[43] = 14'h34c2;
    stim[44] = 14'h1b7f;
    stim[45] = 14'h1198;
    stim[46] = 14'h27a9;
    stim[47] = 14'h3389;
    stim[48] = 14'h2eb4;
    stim[49] = 14'h025d;
    stim[50] = 14'h3435;
    stim[51] = 14'h14ff;
    stim[52] = 14'h23b3;
    stim[53] = 14'h0686;
    stim[54] = 14'h09bd;
    stim[55] = 14'h0741;
    stim[56] = 14'h0cc3;
    stim[57] = 14'h3c82;
    stim[58] = 14'h1402;
    stim[59] = 14'h2f22;
    stim[60] = 14'h010c;
    stim[61] = 14'h0d1c;
    stim[62] = 14'h0556;
    stim[63] = 14'h2ab2;
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
      expv[0] = 22'h280020;
      expv[1] = 22'h280020;
      expv[2] = 22'h280020;
      expv[3] = 22'h280020;
      expv[4] = 22'h280020;
      expv[5] = 22'h280020;
      expv[6] = 22'h020162;
      expv[7] = 22'h270021;
      expv[8] = 22'h280020;
      expv[9] = 22'h280020;
      expv[10] = 22'h280020;
      expv[11] = 22'h280020;
      expv[12] = 22'h270021;
      expv[13] = 22'h280020;
      expv[14] = 22'h280020;
      expv[15] = 22'h270021;
      expv[16] = 22'h280020;
      expv[17] = 22'h020164;
      expv[18] = 22'h280020;
      expv[19] = 22'h270021;
      expv[20] = 22'h280020;
      expv[21] = 22'h270021;
      expv[22] = 22'h280020;
      expv[23] = 22'h280020;
      expv[24] = 22'h280020;
      expv[25] = 22'h280020;
      expv[26] = 22'h280020;
      expv[27] = 22'h280020;
      expv[28] = 22'h270021;
      expv[29] = 22'h280020;
      expv[30] = 22'h280020;
      expv[31] = 22'h270021;
      expv[32] = 22'h280020;
      expv[33] = 22'h280020;
      expv[34] = 22'h280020;
      expv[35] = 22'h280020;
      expv[36] = 22'h280020;
      expv[37] = 22'h280020;
      expv[38] = 22'h280020;
      expv[39] = 22'h270021;
      expv[40] = 22'h280020;
      expv[41] = 22'h280020;
      expv[42] = 22'h280020;
      expv[43] = 22'h270021;
      expv[44] = 22'h280020;
      expv[45] = 22'h280020;
      expv[46] = 22'h280020;
      expv[47] = 22'h280020;
      expv[48] = 22'h280020;
      expv[49] = 22'h100020;
      expv[50] = 22'h280020;
      expv[51] = 22'h280020;
      expv[52] = 22'h02816c;
      expv[53] = 22'h270021;
      expv[54] = 22'h280020;
      expv[55] = 22'h280020;
      expv[56] = 22'h280020;
      expv[57] = 22'h270021;
      expv[58] = 22'h270021;
      expv[59] = 22'h270021;
      expv[60] = 22'h280020;
      expv[61] = 22'h280020;
      expv[62] = 22'h270021;
      expv[63] = 22'h270021;
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
