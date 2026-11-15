// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_086760 dut (
    .Op(in_vec[4:3]),
    .Funct5(in_vec[2:2]),
    .Funct4(in_vec[1:1]),
    .Funct1(in_vec[0:0]),
    .Branch(out_vec[10:10]),
    .RegW(out_vec[9:9]),
    .MemW(out_vec[8:8]),
    .MemtoReg(out_vec[7:7]),
    .ALUSrc(out_vec[6:6]),
    .ALUOp(out_vec[5:5]),
    .link(out_vec[4:4]),
    .ImmSrc(out_vec[3:2]),
    .RegSrc(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1d;
    stim[1] = 5'h07;
    stim[2] = 5'h0e;
    stim[3] = 5'h00;
    stim[4] = 5'h0b;
    stim[5] = 5'h1b;
    stim[6] = 5'h00;
    stim[7] = 5'h05;
    stim[8] = 5'h06;
    stim[9] = 5'h0f;
    stim[10] = 5'h19;
    stim[11] = 5'h07;
    stim[12] = 5'h1b;
    stim[13] = 5'h19;
    stim[14] = 5'h0d;
    stim[15] = 5'h06;
    stim[16] = 5'h1c;
    stim[17] = 5'h1e;
    stim[18] = 5'h1c;
    stim[19] = 5'h05;
    stim[20] = 5'h01;
    stim[21] = 5'h1b;
    stim[22] = 5'h03;
    stim[23] = 5'h03;
    stim[24] = 5'h01;
    stim[25] = 5'h1a;
    stim[26] = 5'h18;
    stim[27] = 5'h04;
    stim[28] = 5'h0f;
    stim[29] = 5'h07;
    stim[30] = 5'h1d;
    stim[31] = 5'h07;
    stim[32] = 5'h17;
    stim[33] = 5'h06;
    stim[34] = 5'h05;
    stim[35] = 5'h0f;
    stim[36] = 5'h0a;
    stim[37] = 5'h0f;
    stim[38] = 5'h09;
    stim[39] = 5'h05;
    stim[40] = 5'h0d;
    stim[41] = 5'h12;
    stim[42] = 5'h12;
    stim[43] = 5'h1e;
    stim[44] = 5'h17;
    stim[45] = 5'h04;
    stim[46] = 5'h1d;
    stim[47] = 5'h15;
    stim[48] = 5'h1e;
    stim[49] = 5'h19;
    stim[50] = 5'h0d;
    stim[51] = 5'h0b;
    stim[52] = 5'h13;
    stim[53] = 5'h02;
    stim[54] = 5'h0c;
    stim[55] = 5'h0a;
    stim[56] = 5'h09;
    stim[57] = 5'h1d;
    stim[58] = 5'h1f;
    stim[59] = 5'h0b;
    stim[60] = 5'h0c;
    stim[61] = 5'h03;
    stim[62] = 5'h12;
    stim[63] = 5'h0f;
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
      expv[0] = 11'h000;
      expv[1] = 11'h260;
      expv[2] = 11'h146;
      expv[3] = 11'h220;
      expv[4] = 11'h2c4;
      expv[5] = 11'h000;
      expv[6] = 11'h220;
      expv[7] = 11'h260;
      expv[8] = 11'h260;
      expv[9] = 11'h2c4;
      expv[10] = 11'h000;
      expv[11] = 11'h260;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h2c4;
      expv[15] = 11'h260;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h260;
      expv[20] = 11'h220;
      expv[21] = 11'h000;
      expv[22] = 11'h220;
      expv[23] = 11'h220;
      expv[24] = 11'h220;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h260;
      expv[28] = 11'h2c4;
      expv[29] = 11'h260;
      expv[30] = 11'h000;
      expv[31] = 11'h260;
      expv[32] = 11'h618;
      expv[33] = 11'h260;
      expv[34] = 11'h260;
      expv[35] = 11'h2c4;
      expv[36] = 11'h146;
      expv[37] = 11'h2c4;
      expv[38] = 11'h2c4;
      expv[39] = 11'h260;
      expv[40] = 11'h2c4;
      expv[41] = 11'h618;
      expv[42] = 11'h618;
      expv[43] = 11'h000;
      expv[44] = 11'h618;
      expv[45] = 11'h260;
      expv[46] = 11'h000;
      expv[47] = 11'h409;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h2c4;
      expv[51] = 11'h2c4;
      expv[52] = 11'h618;
      expv[53] = 11'h220;
      expv[54] = 11'h146;
      expv[55] = 11'h146;
      expv[56] = 11'h2c4;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h2c4;
      expv[60] = 11'h146;
      expv[61] = 11'h220;
      expv[62] = 11'h618;
      expv[63] = 11'h2c4;
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
