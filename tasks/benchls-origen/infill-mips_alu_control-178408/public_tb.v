// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178408 dut (
    .OpCode(in_vec[11:6]),
    .FuncCode(in_vec[5:0]),
    .RegDst(out_vec[8:8]),
    .RegWrite(out_vec[7:7]),
    .AluSrc(out_vec[6:6]),
    .MemRead(out_vec[5:5]),
    .MemWrite(out_vec[4:4]),
    .MemToReg(out_vec[3:3]),
    .ALUOperation(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h601;
    stim[1] = 12'ha8e;
    stim[2] = 12'hf29;
    stim[3] = 12'h3b4;
    stim[4] = 12'h792;
    stim[5] = 12'h7c9;
    stim[6] = 12'hc61;
    stim[7] = 12'hc2d;
    stim[8] = 12'heff;
    stim[9] = 12'hc25;
    stim[10] = 12'h7ab;
    stim[11] = 12'h987;
    stim[12] = 12'h505;
    stim[13] = 12'hb68;
    stim[14] = 12'h134;
    stim[15] = 12'h1a3;
    stim[16] = 12'h651;
    stim[17] = 12'hfa2;
    stim[18] = 12'haa5;
    stim[19] = 12'hecd;
    stim[20] = 12'h38f;
    stim[21] = 12'h1da;
    stim[22] = 12'hdbd;
    stim[23] = 12'hde7;
    stim[24] = 12'hca6;
    stim[25] = 12'hc6c;
    stim[26] = 12'h84a;
    stim[27] = 12'h566;
    stim[28] = 12'h67e;
    stim[29] = 12'h774;
    stim[30] = 12'h092;
    stim[31] = 12'hfcf;
    stim[32] = 12'hcb2;
    stim[33] = 12'h2ac;
    stim[34] = 12'hfd6;
    stim[35] = 12'h6e5;
    stim[36] = 12'hd0c;
    stim[37] = 12'h542;
    stim[38] = 12'h58b;
    stim[39] = 12'hb6f;
    stim[40] = 12'hb6f;
    stim[41] = 12'h64b;
    stim[42] = 12'h4b0;
    stim[43] = 12'h39c;
    stim[44] = 12'hb2e;
    stim[45] = 12'h08b;
    stim[46] = 12'h030;
    stim[47] = 12'he2d;
    stim[48] = 12'h870;
    stim[49] = 12'he36;
    stim[50] = 12'haba;
    stim[51] = 12'h449;
    stim[52] = 12'hf96;
    stim[53] = 12'hce1;
    stim[54] = 12'h6fe;
    stim[55] = 12'h7ee;
    stim[56] = 12'h546;
    stim[57] = 12'h1de;
    stim[58] = 12'ha58;
    stim[59] = 12'he51;
    stim[60] = 12'h8f5;
    stim[61] = 12'h529;
    stim[62] = 12'h0d6;
    stim[63] = 12'h148;
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
      expv[46] = 9'h100;
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
      expv[60] = 9'h0ea;
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
