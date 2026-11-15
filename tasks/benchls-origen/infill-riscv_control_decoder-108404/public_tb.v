// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_108404 dut (
    .Opcode(in_vec[6:0]),
    .ALUSrc(out_vec[13:13]),
    .MemtoReg(out_vec[12:11]),
    .RegWrite(out_vec[10:10]),
    .MemRead(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .Branch(out_vec[7:7]),
    .jalr(out_vec[6:6]),
    .lui(out_vec[5:5]),
    .jal(out_vec[4:4]),
    .ReadFlag(out_vec[3:3]),
    .WriteFlag(out_vec[2:2]),
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
    stim[0] = 7'h28;
    stim[1] = 7'h5c;
    stim[2] = 7'h15;
    stim[3] = 7'h31;
    stim[4] = 7'h2d;
    stim[5] = 7'h0a;
    stim[6] = 7'h4e;
    stim[7] = 7'h72;
    stim[8] = 7'h5a;
    stim[9] = 7'h04;
    stim[10] = 7'h02;
    stim[11] = 7'h78;
    stim[12] = 7'h10;
    stim[13] = 7'h18;
    stim[14] = 7'h55;
    stim[15] = 7'h44;
    stim[16] = 7'h05;
    stim[17] = 7'h64;
    stim[18] = 7'h23;
    stim[19] = 7'h15;
    stim[20] = 7'h38;
    stim[21] = 7'h56;
    stim[22] = 7'h22;
    stim[23] = 7'h57;
    stim[24] = 7'h34;
    stim[25] = 7'h7b;
    stim[26] = 7'h3e;
    stim[27] = 7'h17;
    stim[28] = 7'h42;
    stim[29] = 7'h0d;
    stim[30] = 7'h0b;
    stim[31] = 7'h51;
    stim[32] = 7'h25;
    stim[33] = 7'h39;
    stim[34] = 7'h01;
    stim[35] = 7'h12;
    stim[36] = 7'h77;
    stim[37] = 7'h76;
    stim[38] = 7'h53;
    stim[39] = 7'h78;
    stim[40] = 7'h4c;
    stim[41] = 7'h54;
    stim[42] = 7'h39;
    stim[43] = 7'h7f;
    stim[44] = 7'h2e;
    stim[45] = 7'h77;
    stim[46] = 7'h49;
    stim[47] = 7'h6f;
    stim[48] = 7'h32;
    stim[49] = 7'h6e;
    stim[50] = 7'h03;
    stim[51] = 7'h14;
    stim[52] = 7'h5a;
    stim[53] = 7'h4a;
    stim[54] = 7'h35;
    stim[55] = 7'h04;
    stim[56] = 7'h75;
    stim[57] = 7'h04;
    stim[58] = 7'h4e;
    stim[59] = 7'h32;
    stim[60] = 7'h69;
    stim[61] = 7'h76;
    stim[62] = 7'h1f;
    stim[63] = 7'h64;
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
      expv[6] = 14'h0000;
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
      expv[18] = 14'h2104;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h3c03;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
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
      expv[47] = 14'h1413;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h2e08;
      expv[51] = 14'h0000;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0000;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h0000;
      expv[59] = 14'h0000;
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
