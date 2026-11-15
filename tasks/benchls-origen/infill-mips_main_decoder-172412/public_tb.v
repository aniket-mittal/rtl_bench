// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_172412 dut (
    .Opcode(in_vec[33:28]),
    .Function_opcode(in_vec[27:22]),
    .Alu_resultHigh(in_vec[21:0]),
    .Jrn(out_vec[16:16]),
    .RegDST(out_vec[15:15]),
    .ALUSrc(out_vec[14:14]),
    .MemorIOtoReg(out_vec[13:13]),
    .RegWrite(out_vec[12:12]),
    .MemRead(out_vec[11:11]),
    .MemWrite(out_vec[10:10]),
    .IORead(out_vec[9:9]),
    .IOWrite(out_vec[8:8]),
    .Branch(out_vec[7:7]),
    .nBranch(out_vec[6:6]),
    .Jmp(out_vec[5:5]),
    .Jal(out_vec[4:4]),
    .I_format(out_vec[3:3]),
    .Sftmd(out_vec[2:2]),
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
    stim[0] = 34'h2e1a26a52;
    stim[1] = 34'h08e0d55eb;
    stim[2] = 34'h0a712ec12;
    stim[3] = 34'h277dcd8c1;
    stim[4] = 34'h04e03f266;
    stim[5] = 34'h1d8a54881;
    stim[6] = 34'h3d52b6921;
    stim[7] = 34'h1c9bcea1e;
    stim[8] = 34'h10db3dd65;
    stim[9] = 34'h199bafbb4;
    stim[10] = 34'h22c7e38f5;
    stim[11] = 34'h32bbe560c;
    stim[12] = 34'h29639c3cc;
    stim[13] = 34'h24a7ef583;
    stim[14] = 34'h12d77f61a;
    stim[15] = 34'h25de7fb41;
    stim[16] = 34'h2dd0bb582;
    stim[17] = 34'h30c1b921f;
    stim[18] = 34'h1ff1c93d5;
    stim[19] = 34'h18cbaa9c6;
    stim[20] = 34'h21274aecf;
    stim[21] = 34'h3ed4908fa;
    stim[22] = 34'h15e00bdc7;
    stim[23] = 34'h27fbb6ee2;
    stim[24] = 34'h054a66f29;
    stim[25] = 34'h11fe3fd54;
    stim[26] = 34'h26b9a27e9;
    stim[27] = 34'h04da58afe;
    stim[28] = 34'h26a8fd8ed;
    stim[29] = 34'h2b7e36547;
    stim[30] = 34'h2b29f58f4;
    stim[31] = 34'h083290003;
    stim[32] = 34'h1f5c165bf;
    stim[33] = 34'h32ca63414;
    stim[34] = 34'h3f9a43ed1;
    stim[35] = 34'h30f0375fa;
    stim[36] = 34'h299e5aa8a;
    stim[37] = 34'h0dd92bd96;
    stim[38] = 34'h2da51a473;
    stim[39] = 34'h068f861b8;
    stim[40] = 34'h06c3260d9;
    stim[41] = 34'h013a0fccb;
    stim[42] = 34'h2b2e48f60;
    stim[43] = 34'h356099c34;
    stim[44] = 34'h2fba55e36;
    stim[45] = 34'h10c576462;
    stim[46] = 34'h08e1eca53;
    stim[47] = 34'h14ecf5e10;
    stim[48] = 34'h2b3f1daea;
    stim[49] = 34'h36f8ac06c;
    stim[50] = 34'h194d7bd48;
    stim[51] = 34'h1864a66b7;
    stim[52] = 34'h086312d8d;
    stim[53] = 34'h2e3e5cb39;
    stim[54] = 34'h059c53ba7;
    stim[55] = 34'h05c057ec5;
    stim[56] = 34'h2f62938c5;
    stim[57] = 34'h19ef1bbfb;
    stim[58] = 34'h160654520;
    stim[59] = 34'h250bf9e01;
    stim[60] = 34'h1a91c20dc;
    stim[61] = 34'h085261088;
    stim[62] = 34'h093132dad;
    stim[63] = 34'h192cdf54e;
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
      expv[0] = 17'h05008;
      expv[1] = 17'h05008;
      expv[2] = 17'h05009;
      expv[3] = 17'h05008;
      expv[4] = 17'h00081;
      expv[5] = 17'h05008;
      expv[6] = 17'h05008;
      expv[7] = 17'h05008;
      expv[8] = 17'h05008;
      expv[9] = 17'h05008;
      expv[10] = 17'h05008;
      expv[11] = 17'h05008;
      expv[12] = 17'h04000;
      expv[13] = 17'h05008;
      expv[14] = 17'h05008;
      expv[15] = 17'h05008;
      expv[16] = 17'h05008;
      expv[17] = 17'h05008;
      expv[18] = 17'h05008;
      expv[19] = 17'h05008;
      expv[20] = 17'h07000;
      expv[21] = 17'h05008;
      expv[22] = 17'h05008;
      expv[23] = 17'h05008;
      expv[24] = 17'h00041;
      expv[25] = 17'h05008;
      expv[26] = 17'h05008;
      expv[27] = 17'h00081;
      expv[28] = 17'h05008;
      expv[29] = 17'h04000;
      expv[30] = 17'h04000;
      expv[31] = 17'h05008;
      expv[32] = 17'h05008;
      expv[33] = 17'h05008;
      expv[34] = 17'h05008;
      expv[35] = 17'h05008;
      expv[36] = 17'h04000;
      expv[37] = 17'h0500b;
      expv[38] = 17'h05008;
      expv[39] = 17'h05008;
      expv[40] = 17'h05008;
      expv[41] = 17'h05008;
      expv[42] = 17'h04000;
      expv[43] = 17'h05008;
      expv[44] = 17'h05008;
      expv[45] = 17'h05008;
      expv[46] = 17'h05008;
      expv[47] = 17'h05008;
      expv[48] = 17'h04000;
      expv[49] = 17'h05008;
      expv[50] = 17'h05008;
      expv[51] = 17'h05008;
      expv[52] = 17'h05008;
      expv[53] = 17'h05008;
      expv[54] = 17'h00041;
      expv[55] = 17'h00041;
      expv[56] = 17'h05008;
      expv[57] = 17'h05008;
      expv[58] = 17'h05008;
      expv[59] = 17'h05008;
      expv[60] = 17'h05008;
      expv[61] = 17'h05008;
      expv[62] = 17'h05008;
      expv[63] = 17'h05008;
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
