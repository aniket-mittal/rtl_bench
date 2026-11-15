// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072079 dut (
    .Opcode(in_vec[12:7]),
    .Function(in_vec[6:1]),
    .Rst(in_vec[0:0]),
    .MemRead(out_vec[11:11]),
    .RegWrite(out_vec[10:10]),
    .MemWrite(out_vec[9:9]),
    .ALUSrc(out_vec[8:8]),
    .Is_Br(out_vec[7:7]),
    .Is_Imm(out_vec[6:6]),
    .StoreOrBranch(out_vec[5:5]),
    .ALUOprand(out_vec[4:2]),
    .BranchCommand(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0f6d;
    stim[1] = 13'h1ed9;
    stim[2] = 13'h19a2;
    stim[3] = 13'h14c6;
    stim[4] = 13'h12ea;
    stim[5] = 13'h06f0;
    stim[6] = 13'h1b38;
    stim[7] = 13'h0cbc;
    stim[8] = 13'h04f2;
    stim[9] = 13'h05ba;
    stim[10] = 13'h1cac;
    stim[11] = 13'h0b06;
    stim[12] = 13'h0008;
    stim[13] = 13'h1bea;
    stim[14] = 13'h15a2;
    stim[15] = 13'h16ac;
    stim[16] = 13'h0964;
    stim[17] = 13'h0b46;
    stim[18] = 13'h0b28;
    stim[19] = 13'h153a;
    stim[20] = 13'h01f0;
    stim[21] = 13'h0676;
    stim[22] = 13'h1290;
    stim[23] = 13'h0296;
    stim[24] = 13'h17a6;
    stim[25] = 13'h05b0;
    stim[26] = 13'h0b74;
    stim[27] = 13'h0a44;
    stim[28] = 13'h1a48;
    stim[29] = 13'h157e;
    stim[30] = 13'h194c;
    stim[31] = 13'h0e60;
    stim[32] = 13'h1e62;
    stim[33] = 13'h1fb4;
    stim[34] = 13'h14f0;
    stim[35] = 13'h1ce2;
    stim[36] = 13'h082c;
    stim[37] = 13'h01f2;
    stim[38] = 13'h0be2;
    stim[39] = 13'h0e02;
    stim[40] = 13'h0e28;
    stim[41] = 13'h0d02;
    stim[42] = 13'h128c;
    stim[43] = 13'h0ff8;
    stim[44] = 13'h176e;
    stim[45] = 13'h1060;
    stim[46] = 13'h0dd4;
    stim[47] = 13'h1eda;
    stim[48] = 13'h1074;
    stim[49] = 13'h08ca;
    stim[50] = 13'h1f78;
    stim[51] = 13'h1e52;
    stim[52] = 13'h0dd8;
    stim[53] = 13'h1f58;
    stim[54] = 13'h1a84;
    stim[55] = 13'h0d30;
    stim[56] = 13'h0956;
    stim[57] = 13'h0372;
    stim[58] = 13'h0fb2;
    stim[59] = 13'h08b8;
    stim[60] = 13'h132a;
    stim[61] = 13'h02e6;
    stim[62] = 13'h1596;
    stim[63] = 13'h077e;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h368;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h1c3;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h1c3;
      expv[62] = 12'h368;
      expv[63] = 12'h000;
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
