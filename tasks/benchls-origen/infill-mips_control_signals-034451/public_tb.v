// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034451 dut (
    .opcode(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegRead(out_vec[5:5]),
    .RegWrite(out_vec[4:4]),
    .MemRead(out_vec[3:3]),
    .MemWrite(out_vec[2:2]),
    .RegDst(out_vec[1:1]),
    .Branch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h0c0;
    stim[1] = 12'h4bb;
    stim[2] = 12'ha37;
    stim[3] = 12'h7b4;
    stim[4] = 12'h609;
    stim[5] = 12'h7b3;
    stim[6] = 12'h1e6;
    stim[7] = 12'h7c1;
    stim[8] = 12'hc2f;
    stim[9] = 12'h696;
    stim[10] = 12'h995;
    stim[11] = 12'h91d;
    stim[12] = 12'h19a;
    stim[13] = 12'h0da;
    stim[14] = 12'h191;
    stim[15] = 12'hced;
    stim[16] = 12'h09f;
    stim[17] = 12'h10b;
    stim[18] = 12'h7ac;
    stim[19] = 12'h42e;
    stim[20] = 12'haf5;
    stim[21] = 12'h597;
    stim[22] = 12'h0ea;
    stim[23] = 12'hbd9;
    stim[24] = 12'h0e8;
    stim[25] = 12'hc89;
    stim[26] = 12'he3d;
    stim[27] = 12'h32f;
    stim[28] = 12'h1ed;
    stim[29] = 12'hb9c;
    stim[30] = 12'hd5a;
    stim[31] = 12'h1a2;
    stim[32] = 12'h1f8;
    stim[33] = 12'h4f8;
    stim[34] = 12'h0b8;
    stim[35] = 12'h7a8;
    stim[36] = 12'h052;
    stim[37] = 12'h01a;
    stim[38] = 12'hc30;
    stim[39] = 12'h662;
    stim[40] = 12'hde4;
    stim[41] = 12'h568;
    stim[42] = 12'h7f8;
    stim[43] = 12'h2b8;
    stim[44] = 12'hb2b;
    stim[45] = 12'h369;
    stim[46] = 12'h259;
    stim[47] = 12'ha5a;
    stim[48] = 12'h96f;
    stim[49] = 12'hd35;
    stim[50] = 12'h37f;
    stim[51] = 12'h680;
    stim[52] = 12'h364;
    stim[53] = 12'h88f;
    stim[54] = 12'hfd9;
    stim[55] = 12'hf28;
    stim[56] = 12'h7c6;
    stim[57] = 12'h111;
    stim[58] = 12'hb47;
    stim[59] = 12'h49d;
    stim[60] = 12'hdfa;
    stim[61] = 12'hb34;
    stim[62] = 12'hda9;
    stim[63] = 12'h22f;
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
      expv[0] = 6'h20;
      expv[1] = 6'h20;
      expv[2] = 6'h24;
      expv[3] = 6'h20;
      expv[4] = 6'h20;
      expv[5] = 6'h20;
      expv[6] = 6'h20;
      expv[7] = 6'h20;
      expv[8] = 6'h20;
      expv[9] = 6'h20;
      expv[10] = 6'h20;
      expv[11] = 6'h38;
      expv[12] = 6'h20;
      expv[13] = 6'h20;
      expv[14] = 6'h20;
      expv[15] = 6'h20;
      expv[16] = 6'h20;
      expv[17] = 6'h21;
      expv[18] = 6'h20;
      expv[19] = 6'h20;
      expv[20] = 6'h24;
      expv[21] = 6'h20;
      expv[22] = 6'h20;
      expv[23] = 6'h20;
      expv[24] = 6'h20;
      expv[25] = 6'h20;
      expv[26] = 6'h20;
      expv[27] = 6'h30;
      expv[28] = 6'h20;
      expv[29] = 6'h20;
      expv[30] = 6'h20;
      expv[31] = 6'h20;
      expv[32] = 6'h20;
      expv[33] = 6'h20;
      expv[34] = 6'h20;
      expv[35] = 6'h20;
      expv[36] = 6'h20;
      expv[37] = 6'h32;
      expv[38] = 6'h20;
      expv[39] = 6'h20;
      expv[40] = 6'h20;
      expv[41] = 6'h20;
      expv[42] = 6'h20;
      expv[43] = 6'h30;
      expv[44] = 6'h20;
      expv[45] = 6'h30;
      expv[46] = 6'h30;
      expv[47] = 6'h24;
      expv[48] = 6'h38;
      expv[49] = 6'h20;
      expv[50] = 6'h30;
      expv[51] = 6'h20;
      expv[52] = 6'h30;
      expv[53] = 6'h38;
      expv[54] = 6'h20;
      expv[55] = 6'h20;
      expv[56] = 6'h20;
      expv[57] = 6'h21;
      expv[58] = 6'h20;
      expv[59] = 6'h20;
      expv[60] = 6'h20;
      expv[61] = 6'h20;
      expv[62] = 6'h20;
      expv[63] = 6'h30;
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
