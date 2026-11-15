// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052328 dut (
    .OpCode(in_vec[12:7]),
    .Funct(in_vec[6:1]),
    .Interrupt(in_vec[0:0]),
    .PCSrc(out_vec[19:17]),
    .Branch(out_vec[16:16]),
    .RegWrite(out_vec[15:15]),
    .RegDst(out_vec[14:13]),
    .MemRead(out_vec[12:12]),
    .MemWrite(out_vec[11:11]),
    .MemtoReg(out_vec[10:9]),
    .ALUSrc1(out_vec[8:8]),
    .ALUSrc2(out_vec[7:7]),
    .ExtOp(out_vec[6:6]),
    .LuOp(out_vec[5:5]),
    .ALUOp(out_vec[4:1]),
    .BadOp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1573;
    stim[1] = 13'h0a76;
    stim[2] = 13'h0b39;
    stim[3] = 13'h169e;
    stim[4] = 13'h05ef;
    stim[5] = 13'h07bb;
    stim[6] = 13'h01b8;
    stim[7] = 13'h0f92;
    stim[8] = 13'h0bd2;
    stim[9] = 13'h11f5;
    stim[10] = 13'h08ae;
    stim[11] = 13'h04f0;
    stim[12] = 13'h19a6;
    stim[13] = 13'h112c;
    stim[14] = 13'h07b4;
    stim[15] = 13'h127b;
    stim[16] = 13'h14e2;
    stim[17] = 13'h15d1;
    stim[18] = 13'h07c2;
    stim[19] = 13'h15a4;
    stim[20] = 13'h1e76;
    stim[21] = 13'h123c;
    stim[22] = 13'h0687;
    stim[23] = 13'h196a;
    stim[24] = 13'h17ca;
    stim[25] = 13'h1635;
    stim[26] = 13'h0cd5;
    stim[27] = 13'h1679;
    stim[28] = 13'h0ff7;
    stim[29] = 13'h037d;
    stim[30] = 13'h11c4;
    stim[31] = 13'h1e89;
    stim[32] = 13'h0590;
    stim[33] = 13'h005b;
    stim[34] = 13'h08dd;
    stim[35] = 13'h17c1;
    stim[36] = 13'h003b;
    stim[37] = 13'h06c3;
    stim[38] = 13'h01ba;
    stim[39] = 13'h1148;
    stim[40] = 13'h182a;
    stim[41] = 13'h10be;
    stim[42] = 13'h0001;
    stim[43] = 13'h0b5b;
    stim[44] = 13'h0b16;
    stim[45] = 13'h0c97;
    stim[46] = 13'h1350;
    stim[47] = 13'h1bfe;
    stim[48] = 13'h0b38;
    stim[49] = 13'h11c6;
    stim[50] = 13'h04c5;
    stim[51] = 13'h0ff5;
    stim[52] = 13'h0da2;
    stim[53] = 13'h169c;
    stim[54] = 13'h1a10;
    stim[55] = 13'h060f;
    stim[56] = 13'h0b4f;
    stim[57] = 13'h18cf;
    stim[58] = 13'h1912;
    stim[59] = 13'h0127;
    stim[60] = 13'h003d;
    stim[61] = 13'h1f65;
    stim[62] = 13'h0cca;
    stim[63] = 13'h082c;
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
      expv[0] = 20'h80001;
      expv[1] = 20'h00001;
      expv[2] = 20'h80001;
      expv[3] = 20'h00001;
      expv[4] = 20'h80001;
      expv[5] = 20'h880a0;
      expv[6] = 20'h4c400;
      expv[7] = 20'h00001;
      expv[8] = 20'h00001;
      expv[9] = 20'h892c0;
      expv[10] = 20'h00001;
      expv[11] = 20'h00001;
      expv[12] = 20'h00001;
      expv[13] = 20'h00001;
      expv[14] = 20'h080a0;
      expv[15] = 20'h80001;
      expv[16] = 20'h00001;
      expv[17] = 20'h808c0;
      expv[18] = 20'h080a0;
      expv[19] = 20'h008c0;
      expv[20] = 20'h00001;
      expv[21] = 20'h00001;
      expv[22] = 20'h88086;
      expv[23] = 20'h00001;
      expv[24] = 20'h00001;
      expv[25] = 20'h80001;
      expv[26] = 20'h80001;
      expv[27] = 20'h80001;
      expv[28] = 20'h80001;
      expv[29] = 20'h80001;
      expv[30] = 20'h092c0;
      expv[31] = 20'h80001;
      expv[32] = 20'h00001;
      expv[33] = 20'h8a01c;
      expv[34] = 20'h80001;
      expv[35] = 20'h80001;
      expv[36] = 20'h8a01c;
      expv[37] = 20'h88086;
      expv[38] = 20'h4c400;
      expv[39] = 20'h00001;
      expv[40] = 20'h00001;
      expv[41] = 20'h00001;
      expv[42] = 20'h8a010;
      expv[43] = 20'h80001;
      expv[44] = 20'h00001;
      expv[45] = 20'h80001;
      expv[46] = 20'h00001;
      expv[47] = 20'h00001;
      expv[48] = 20'h00001;
      expv[49] = 20'h092c0;
      expv[50] = 20'h80001;
      expv[51] = 20'h80001;
      expv[52] = 20'h00001;
      expv[53] = 20'h00001;
      expv[54] = 20'h00001;
      expv[55] = 20'h80001;
      expv[56] = 20'h80001;
      expv[57] = 20'h80001;
      expv[58] = 20'h00001;
      expv[59] = 20'h80000;
      expv[60] = 20'h8a01e;
      expv[61] = 20'h80001;
      expv[62] = 20'h00001;
      expv[63] = 20'h00001;
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
