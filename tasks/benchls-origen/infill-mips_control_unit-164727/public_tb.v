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

  origen_164727 dut (
    .opcode(in_vec[5:0]),
    .regDst(out_vec[11:11]),
    .branch(out_vec[10:10]),
    .memRead(out_vec[9:9]),
    .mentoReg(out_vec[8:8]),
    .aluOP1(out_vec[7:6]),
    .aluOP2(out_vec[5:4]),
    .memWrite(out_vec[3:3]),
    .aluSrc(out_vec[2:2]),
    .regWrite(out_vec[1:1]),
    .jump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h11;
    stim[1] = 6'h36;
    stim[2] = 6'h19;
    stim[3] = 6'h11;
    stim[4] = 6'h26;
    stim[5] = 6'h38;
    stim[6] = 6'h0e;
    stim[7] = 6'h0a;
    stim[8] = 6'h01;
    stim[9] = 6'h18;
    stim[10] = 6'h34;
    stim[11] = 6'h36;
    stim[12] = 6'h2c;
    stim[13] = 6'h34;
    stim[14] = 6'h38;
    stim[15] = 6'h10;
    stim[16] = 6'h39;
    stim[17] = 6'h0f;
    stim[18] = 6'h3b;
    stim[19] = 6'h0e;
    stim[20] = 6'h2f;
    stim[21] = 6'h30;
    stim[22] = 6'h13;
    stim[23] = 6'h0b;
    stim[24] = 6'h1d;
    stim[25] = 6'h1f;
    stim[26] = 6'h10;
    stim[27] = 6'h2e;
    stim[28] = 6'h05;
    stim[29] = 6'h3e;
    stim[30] = 6'h15;
    stim[31] = 6'h22;
    stim[32] = 6'h1d;
    stim[33] = 6'h0b;
    stim[34] = 6'h32;
    stim[35] = 6'h05;
    stim[36] = 6'h3c;
    stim[37] = 6'h38;
    stim[38] = 6'h3f;
    stim[39] = 6'h18;
    stim[40] = 6'h04;
    stim[41] = 6'h2e;
    stim[42] = 6'h34;
    stim[43] = 6'h1f;
    stim[44] = 6'h33;
    stim[45] = 6'h25;
    stim[46] = 6'h05;
    stim[47] = 6'h33;
    stim[48] = 6'h03;
    stim[49] = 6'h24;
    stim[50] = 6'h12;
    stim[51] = 6'h33;
    stim[52] = 6'h20;
    stim[53] = 6'h28;
    stim[54] = 6'h0d;
    stim[55] = 6'h03;
    stim[56] = 6'h32;
    stim[57] = 6'h03;
    stim[58] = 6'h05;
    stim[59] = 6'h29;
    stim[60] = 6'h0b;
    stim[61] = 6'h32;
    stim[62] = 6'h2f;
    stim[63] = 6'h0e;
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
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
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
      expv[40] = 12'h440;
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
      expv[61] = 12'h000;
      expv[62] = 12'h000;
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
