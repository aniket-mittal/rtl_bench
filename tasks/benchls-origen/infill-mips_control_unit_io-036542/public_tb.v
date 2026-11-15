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

  origen_036542 dut (
    .Opcode(in_vec[33:28]),
    .Alu_resultHigh(in_vec[27:6]),
    .Function_opcode(in_vec[5:0]),
    .RegDST(out_vec[16:16]),
    .ALUSrc(out_vec[15:15]),
    .MemorIOtoReg(out_vec[14:14]),
    .RegWrite(out_vec[13:13]),
    .MemRead(out_vec[12:12]),
    .MemWrite(out_vec[11:11]),
    .IORead(out_vec[10:10]),
    .IOWrite(out_vec[9:9]),
    .Branch(out_vec[8:8]),
    .nBranch(out_vec[7:7]),
    .Jmp(out_vec[6:6]),
    .Jal(out_vec[5:5]),
    .I_format(out_vec[4:4]),
    .Sftmd(out_vec[3:3]),
    .ALUOp(out_vec[2:1]),
    .Jrn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h245317304;
    stim[1] = 34'h282916f93;
    stim[2] = 34'h2e2314f69;
    stim[3] = 34'h067a4c989;
    stim[4] = 34'h24c63e260;
    stim[5] = 34'h054d828ce;
    stim[6] = 34'h00cfcf3a2;
    stim[7] = 34'h392056444;
    stim[8] = 34'h291966cf3;
    stim[9] = 34'h22c52aa6a;
    stim[10] = 34'h01f988e2c;
    stim[11] = 34'h2545619aa;
    stim[12] = 34'h2e182b0f1;
    stim[13] = 34'h1b349222f;
    stim[14] = 34'h2ff340698;
    stim[15] = 34'h0729feb09;
    stim[16] = 34'h2ca446d4e;
    stim[17] = 34'h369c701e3;
    stim[18] = 34'h26e9ae218;
    stim[19] = 34'h17f81d0f3;
    stim[20] = 34'h086d7f0c9;
    stim[21] = 34'h35bd1dcca;
    stim[22] = 34'h1d48b5544;
    stim[23] = 34'h3fe5f117d;
    stim[24] = 34'h01c651637;
    stim[25] = 34'h2beecaa3e;
    stim[26] = 34'h345b2e470;
    stim[27] = 34'h2d464c6ea;
    stim[28] = 34'h0fe92340b;
    stim[29] = 34'h09a431a50;
    stim[30] = 34'h3c90da71f;
    stim[31] = 34'h0fc0325b9;
    stim[32] = 34'h39e17688a;
    stim[33] = 34'h0820d5723;
    stim[34] = 34'h08e0764df;
    stim[35] = 34'h1d4b561fb;
    stim[36] = 34'h1c060d9d0;
    stim[37] = 34'h33efb6df5;
    stim[38] = 34'h238490af7;
    stim[39] = 34'h331ed0d55;
    stim[40] = 34'h32acad6bc;
    stim[41] = 34'h1f15a6d15;
    stim[42] = 34'h09e8a1455;
    stim[43] = 34'h035a4c41b;
    stim[44] = 34'h352fb69c2;
    stim[45] = 34'h30c661df7;
    stim[46] = 34'h1dcebef84;
    stim[47] = 34'h2a9d67109;
    stim[48] = 34'h37043edf2;
    stim[49] = 34'h22690983f;
    stim[50] = 34'h293d6176a;
    stim[51] = 34'h195332a27;
    stim[52] = 34'h25c3b3ab1;
    stim[53] = 34'h0e5ea135f;
    stim[54] = 34'h19b5134fc;
    stim[55] = 34'h3f576d5d3;
    stim[56] = 34'h19cc24758;
    stim[57] = 34'h18f145b16;
    stim[58] = 34'h2686b48fa;
    stim[59] = 34'h36abc63c9;
    stim[60] = 34'h25b11a96b;
    stim[61] = 34'h39b761031;
    stim[62] = 34'h2e77f866d;
    stim[63] = 34'h3c60f4cfd;
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
      expv[5] = 17'h00080;
      expv[6] = 17'h12004;
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
      expv[20] = 17'h0a016;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h08800;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h0a016;
      expv[29] = 17'h0a016;
      expv[30] = 17'h00000;
      expv[31] = 17'h0a016;
      expv[32] = 17'h00000;
      expv[33] = 17'h0a016;
      expv[34] = 17'h0a016;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h0f000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h0a016;
      expv[43] = 17'h02020;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h0a016;
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
