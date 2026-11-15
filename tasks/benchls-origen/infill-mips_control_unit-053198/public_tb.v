// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053198 dut (
    .OpCode(in_vec[12:7]),
    .Funct(in_vec[6:1]),
    .IRQ(in_vec[0:0]),
    .PCSrc(out_vec[22:20]),
    .RegDst(out_vec[19:18]),
    .ExtOp(out_vec[17:17]),
    .LuOp(out_vec[16:16]),
    .Branch(out_vec[15:15]),
    .BranchOp(out_vec[14:12]),
    .ALUOp(out_vec[11:8]),
    .ALUSrc1(out_vec[7:7]),
    .ALUSrc2(out_vec[6:6]),
    .MemRead(out_vec[5:5]),
    .MemWrite(out_vec[4:4]),
    .MemToReg(out_vec[3:2]),
    .RegWrite(out_vec[1:1]),
    .Exception(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h11fe;
    stim[1] = 13'h01ea;
    stim[2] = 13'h0ee0;
    stim[3] = 13'h1921;
    stim[4] = 13'h0a4e;
    stim[5] = 13'h1326;
    stim[6] = 13'h0427;
    stim[7] = 13'h1d67;
    stim[8] = 13'h0ef1;
    stim[9] = 13'h13c7;
    stim[10] = 13'h0fc8;
    stim[11] = 13'h1d7e;
    stim[12] = 13'h055f;
    stim[13] = 13'h15e3;
    stim[14] = 13'h0ee4;
    stim[15] = 13'h0e7f;
    stim[16] = 13'h0b4b;
    stim[17] = 13'h169e;
    stim[18] = 13'h1d1a;
    stim[19] = 13'h180a;
    stim[20] = 13'h04d0;
    stim[21] = 13'h10d2;
    stim[22] = 13'h0be2;
    stim[23] = 13'h02a6;
    stim[24] = 13'h0153;
    stim[25] = 13'h1afb;
    stim[26] = 13'h0b09;
    stim[27] = 13'h0f7d;
    stim[28] = 13'h07ac;
    stim[29] = 13'h05f7;
    stim[30] = 13'h07f3;
    stim[31] = 13'h0849;
    stim[32] = 13'h11c7;
    stim[33] = 13'h1491;
    stim[34] = 13'h17ba;
    stim[35] = 13'h1485;
    stim[36] = 13'h0eda;
    stim[37] = 13'h1140;
    stim[38] = 13'h1552;
    stim[39] = 13'h0522;
    stim[40] = 13'h1289;
    stim[41] = 13'h04e7;
    stim[42] = 13'h0129;
    stim[43] = 13'h01dd;
    stim[44] = 13'h039e;
    stim[45] = 13'h099f;
    stim[46] = 13'h0acf;
    stim[47] = 13'h18be;
    stim[48] = 13'h09c1;
    stim[49] = 13'h18dd;
    stim[50] = 13'h03d2;
    stim[51] = 13'h0da3;
    stim[52] = 13'h1ce8;
    stim[53] = 13'h1420;
    stim[54] = 13'h1847;
    stim[55] = 13'h0125;
    stim[56] = 13'h126f;
    stim[57] = 13'h0747;
    stim[58] = 13'h12e0;
    stim[59] = 13'h17c5;
    stim[60] = 13'h1102;
    stim[61] = 13'h0695;
    stim[62] = 13'h0a28;
    stim[63] = 13'h0d16;
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
      expv[0] = 23'h020066;
      expv[1] = 23'h18000a;
      expv[2] = 23'h000001;
      expv[3] = 23'h400000;
      expv[4] = 23'h000001;
      expv[5] = 23'h000001;
      expv[6] = 23'h400000;
      expv[7] = 23'h400000;
      expv[8] = 23'h400000;
      expv[9] = 23'h400000;
      expv[10] = 23'h000001;
      expv[11] = 23'h000001;
      expv[12] = 23'h400000;
      expv[13] = 23'h400000;
      expv[14] = 23'h000001;
      expv[15] = 23'h400000;
      expv[16] = 23'h400000;
      expv[17] = 23'h000001;
      expv[18] = 23'h000001;
      expv[19] = 23'h000001;
      expv[20] = 23'h000001;
      expv[21] = 23'h000001;
      expv[22] = 23'h000001;
      expv[23] = 23'h009100;
      expv[24] = 23'h400000;
      expv[25] = 23'h400000;
      expv[26] = 23'h400000;
      expv[27] = 23'h400000;
      expv[28] = 23'h010002;
      expv[29] = 23'h400000;
      expv[30] = 23'h400000;
      expv[31] = 23'h400000;
      expv[32] = 23'h400000;
      expv[33] = 23'h400000;
      expv[34] = 23'h000001;
      expv[35] = 23'h400000;
      expv[36] = 23'h000001;
      expv[37] = 23'h000001;
      expv[38] = 23'h000001;
      expv[39] = 23'h000001;
      expv[40] = 23'h400000;
      expv[41] = 23'h400000;
      expv[42] = 23'h400000;
      expv[43] = 23'h400000;
      expv[44] = 23'h000001;
      expv[45] = 23'h400000;
      expv[46] = 23'h400000;
      expv[47] = 23'h000001;
      expv[48] = 23'h400000;
      expv[49] = 23'h400000;
      expv[50] = 23'h000001;
      expv[51] = 23'h400000;
      expv[52] = 23'h000001;
      expv[53] = 23'h000001;
      expv[54] = 23'h400000;
      expv[55] = 23'h400000;
      expv[56] = 23'h400000;
      expv[57] = 23'h400000;
      expv[58] = 23'h000001;
      expv[59] = 23'h400000;
      expv[60] = 23'h000001;
      expv[61] = 23'h400000;
      expv[62] = 23'h000001;
      expv[63] = 23'h000001;
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
