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

  origen_213104 dut (
    .Opcode(in_vec[33:28]),
    .Function_opcode(in_vec[27:22]),
    .Alu_resultHigh(in_vec[21:0]),
    .Jrn(out_vec[16:16]),
    .RegDST(out_vec[15:15]),
    .ALUSrc(out_vec[14:14]),
    .MemIOtoReg(out_vec[13:13]),
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
    stim[0] = 34'h37a532a68;
    stim[1] = 34'h384ee73f0;
    stim[2] = 34'h21641988e;
    stim[3] = 34'h0ba5f8b85;
    stim[4] = 34'h2bb9227e3;
    stim[5] = 34'h329246c5e;
    stim[6] = 34'h17521b6b1;
    stim[7] = 34'h157764ae9;
    stim[8] = 34'h2c8947954;
    stim[9] = 34'h199793a6b;
    stim[10] = 34'h319a61daa;
    stim[11] = 34'h138373ced;
    stim[12] = 34'h08ff48372;
    stim[13] = 34'h3537a2471;
    stim[14] = 34'h249124e09;
    stim[15] = 34'h3fda9c87b;
    stim[16] = 34'h32acb1a64;
    stim[17] = 34'h1aea9751a;
    stim[18] = 34'h1fd171db6;
    stim[19] = 34'h08e50bded;
    stim[20] = 34'h0a899cf64;
    stim[21] = 34'h21e2fc483;
    stim[22] = 34'h0eecafe5d;
    stim[23] = 34'h15e8ccb72;
    stim[24] = 34'h20a495639;
    stim[25] = 34'h36cdca045;
    stim[26] = 34'h227684297;
    stim[27] = 34'h00a2d9e3c;
    stim[28] = 34'h3338efca3;
    stim[29] = 34'h3042c76d0;
    stim[30] = 34'h1551d8042;
    stim[31] = 34'h0192b7428;
    stim[32] = 34'h3e2cfaaec;
    stim[33] = 34'h0f5674ce8;
    stim[34] = 34'h068b7eac9;
    stim[35] = 34'h3658068b6;
    stim[36] = 34'h25ae9c4b6;
    stim[37] = 34'h396fcca44;
    stim[38] = 34'h2112bb694;
    stim[39] = 34'h067a05640;
    stim[40] = 34'h25d44f01c;
    stim[41] = 34'h0dbdfd3de;
    stim[42] = 34'h25dd27e25;
    stim[43] = 34'h0d5cc5616;
    stim[44] = 34'h3f8d9697e;
    stim[45] = 34'h02dfbb970;
    stim[46] = 34'h1953c50ee;
    stim[47] = 34'h0ca03f148;
    stim[48] = 34'h330139575;
    stim[49] = 34'h1e31896e7;
    stim[50] = 34'h1ff09eadd;
    stim[51] = 34'h349a777f0;
    stim[52] = 34'h078f2a9a6;
    stim[53] = 34'h2b29cad47;
    stim[54] = 34'h1105f9910;
    stim[55] = 34'h33aace743;
    stim[56] = 34'h384596f5a;
    stim[57] = 34'h3ac40df07;
    stim[58] = 34'h2eedb0088;
    stim[59] = 34'h299764c5b;
    stim[60] = 34'h045798f7d;
    stim[61] = 34'h2e6f8cc2f;
    stim[62] = 34'h343e87718;
    stim[63] = 34'h03e9d0095;
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
      expv[2] = 17'h05008;
      expv[3] = 17'h05008;
      expv[4] = 17'h04400;
      expv[5] = 17'h05008;
      expv[6] = 17'h05008;
      expv[7] = 17'h05008;
      expv[8] = 17'h05008;
      expv[9] = 17'h05008;
      expv[10] = 17'h05008;
      expv[11] = 17'h05008;
      expv[12] = 17'h05008;
      expv[13] = 17'h05008;
      expv[14] = 17'h05008;
      expv[15] = 17'h05008;
      expv[16] = 17'h05008;
      expv[17] = 17'h05008;
      expv[18] = 17'h05008;
      expv[19] = 17'h05008;
      expv[20] = 17'h05008;
      expv[21] = 17'h05008;
      expv[22] = 17'h05008;
      expv[23] = 17'h05008;
      expv[24] = 17'h05008;
      expv[25] = 17'h05008;
      expv[26] = 17'h05008;
      expv[27] = 17'h09002;
      expv[28] = 17'h05008;
      expv[29] = 17'h05008;
      expv[30] = 17'h05008;
      expv[31] = 17'h05008;
      expv[32] = 17'h05008;
      expv[33] = 17'h05008;
      expv[34] = 17'h05008;
      expv[35] = 17'h05008;
      expv[36] = 17'h05008;
      expv[37] = 17'h05008;
      expv[38] = 17'h05008;
      expv[39] = 17'h05008;
      expv[40] = 17'h05008;
      expv[41] = 17'h05008;
      expv[42] = 17'h05008;
      expv[43] = 17'h05008;
      expv[44] = 17'h05008;
      expv[45] = 17'h00020;
      expv[46] = 17'h05008;
      expv[47] = 17'h05008;
      expv[48] = 17'h05008;
      expv[49] = 17'h05008;
      expv[50] = 17'h05008;
      expv[51] = 17'h05008;
      expv[52] = 17'h05008;
      expv[53] = 17'h04400;
      expv[54] = 17'h05008;
      expv[55] = 17'h05008;
      expv[56] = 17'h05008;
      expv[57] = 17'h05008;
      expv[58] = 17'h05008;
      expv[59] = 17'h05008;
      expv[60] = 17'h00081;
      expv[61] = 17'h05008;
      expv[62] = 17'h05008;
      expv[63] = 17'h01010;
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
