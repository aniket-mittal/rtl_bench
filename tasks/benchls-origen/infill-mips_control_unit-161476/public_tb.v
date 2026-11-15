// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161476 dut (
    .OpCode(in_vec[5:0]),
    .RegDest(out_vec[11:11]),
    .Branch(out_vec[10:10]),
    .MemRead(out_vec[9:9]),
    .MemToReg(out_vec[8:7]),
    .ALUOp(out_vec[6:4]),
    .MemWrite(out_vec[3:3]),
    .ALUSrc(out_vec[2:2]),
    .RegWrite(out_vec[1:1]),
    .Jump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h03;
    stim[1] = 6'h0c;
    stim[2] = 6'h3a;
    stim[3] = 6'h21;
    stim[4] = 6'h0f;
    stim[5] = 6'h0f;
    stim[6] = 6'h08;
    stim[7] = 6'h3b;
    stim[8] = 6'h0d;
    stim[9] = 6'h14;
    stim[10] = 6'h15;
    stim[11] = 6'h22;
    stim[12] = 6'h3c;
    stim[13] = 6'h0c;
    stim[14] = 6'h16;
    stim[15] = 6'h2e;
    stim[16] = 6'h0f;
    stim[17] = 6'h36;
    stim[18] = 6'h36;
    stim[19] = 6'h18;
    stim[20] = 6'h0a;
    stim[21] = 6'h05;
    stim[22] = 6'h28;
    stim[23] = 6'h02;
    stim[24] = 6'h30;
    stim[25] = 6'h04;
    stim[26] = 6'h1f;
    stim[27] = 6'h22;
    stim[28] = 6'h29;
    stim[29] = 6'h28;
    stim[30] = 6'h11;
    stim[31] = 6'h25;
    stim[32] = 6'h2c;
    stim[33] = 6'h15;
    stim[34] = 6'h28;
    stim[35] = 6'h25;
    stim[36] = 6'h11;
    stim[37] = 6'h31;
    stim[38] = 6'h35;
    stim[39] = 6'h1b;
    stim[40] = 6'h0f;
    stim[41] = 6'h31;
    stim[42] = 6'h03;
    stim[43] = 6'h32;
    stim[44] = 6'h21;
    stim[45] = 6'h3e;
    stim[46] = 6'h36;
    stim[47] = 6'h18;
    stim[48] = 6'h0f;
    stim[49] = 6'h07;
    stim[50] = 6'h3f;
    stim[51] = 6'h34;
    stim[52] = 6'h2d;
    stim[53] = 6'h07;
    stim[54] = 6'h2e;
    stim[55] = 6'h28;
    stim[56] = 6'h25;
    stim[57] = 6'h3d;
    stim[58] = 6'h02;
    stim[59] = 6'h3c;
    stim[60] = 6'h1c;
    stim[61] = 6'h34;
    stim[62] = 6'h03;
    stim[63] = 6'h19;
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
      expv[0] = 12'h1xx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'hxxx;
      expv[12] = 12'hxxx;
      expv[13] = 12'hxxx;
      expv[14] = 12'hxxx;
      expv[15] = 12'hxxx;
      expv[16] = 12'hxxx;
      expv[17] = 12'hxxx;
      expv[18] = 12'hxxx;
      expv[19] = 12'hxxx;
      expv[20] = 12'hxxx;
      expv[21] = 12'hxxx;
      expv[22] = 12'hxxx;
      expv[23] = 12'hxxx;
      expv[24] = 12'hxxx;
      expv[25] = 12'hxx0;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'hxxx;
      expv[29] = 12'hxxx;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'hxxx;
      expv[36] = 12'hxxx;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hxxx;
      expv[42] = 12'h1xx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'hxxx;
      expv[48] = 12'hxxx;
      expv[49] = 12'hxxx;
      expv[50] = 12'hxxx;
      expv[51] = 12'hxxx;
      expv[52] = 12'hxxx;
      expv[53] = 12'hxxx;
      expv[54] = 12'hxxx;
      expv[55] = 12'hxxx;
      expv[56] = 12'hxxx;
      expv[57] = 12'hxxx;
      expv[58] = 12'hxxx;
      expv[59] = 12'hxxx;
      expv[60] = 12'hxxx;
      expv[61] = 12'hxxx;
      expv[62] = 12'h1xx;
      expv[63] = 12'hxxx;
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
