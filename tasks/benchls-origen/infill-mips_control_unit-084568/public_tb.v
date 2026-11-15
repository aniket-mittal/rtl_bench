// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_084568 dut (
    .Op(in_vec[5:0]),
    .ALUOp(out_vec[13:10]),
    .ALUSrc(out_vec[9:9]),
    .RegDst(out_vec[8:8]),
    .MemWrite(out_vec[7:7]),
    .MemRead(out_vec[6:6]),
    .RegWrite(out_vec[5:5]),
    .MemtoReg(out_vec[4:4]),
    .Jump(out_vec[3:2]),
    .Branch(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h12;
    stim[1] = 6'h18;
    stim[2] = 6'h30;
    stim[3] = 6'h3a;
    stim[4] = 6'h19;
    stim[5] = 6'h19;
    stim[6] = 6'h3e;
    stim[7] = 6'h25;
    stim[8] = 6'h2c;
    stim[9] = 6'h20;
    stim[10] = 6'h13;
    stim[11] = 6'h05;
    stim[12] = 6'h31;
    stim[13] = 6'h2a;
    stim[14] = 6'h12;
    stim[15] = 6'h38;
    stim[16] = 6'h2b;
    stim[17] = 6'h14;
    stim[18] = 6'h1f;
    stim[19] = 6'h1c;
    stim[20] = 6'h1c;
    stim[21] = 6'h22;
    stim[22] = 6'h38;
    stim[23] = 6'h30;
    stim[24] = 6'h37;
    stim[25] = 6'h17;
    stim[26] = 6'h0b;
    stim[27] = 6'h27;
    stim[28] = 6'h15;
    stim[29] = 6'h25;
    stim[30] = 6'h14;
    stim[31] = 6'h0b;
    stim[32] = 6'h09;
    stim[33] = 6'h11;
    stim[34] = 6'h14;
    stim[35] = 6'h01;
    stim[36] = 6'h2c;
    stim[37] = 6'h3e;
    stim[38] = 6'h20;
    stim[39] = 6'h18;
    stim[40] = 6'h3c;
    stim[41] = 6'h3e;
    stim[42] = 6'h27;
    stim[43] = 6'h29;
    stim[44] = 6'h3c;
    stim[45] = 6'h02;
    stim[46] = 6'h11;
    stim[47] = 6'h3a;
    stim[48] = 6'h29;
    stim[49] = 6'h14;
    stim[50] = 6'h31;
    stim[51] = 6'h34;
    stim[52] = 6'h29;
    stim[53] = 6'h17;
    stim[54] = 6'h09;
    stim[55] = 6'h0e;
    stim[56] = 6'h1f;
    stim[57] = 6'h17;
    stim[58] = 6'h33;
    stim[59] = 6'h2f;
    stim[60] = 6'h26;
    stim[61] = 6'h02;
    stim[62] = 6'h3d;
    stim[63] = 6'h08;
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
      expv[11] = 14'h0402;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0a80;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
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
      expv[45] = 14'h0004;
      expv[46] = 14'h0000;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
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
      expv[61] = 14'h0004;
      expv[62] = 14'h0000;
      expv[63] = 14'h0a20;
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
