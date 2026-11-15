// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185097 dut (
    .Opcode(in_vec[5:0]),
    .RegDst(out_vec[10:10]),
    .ALUSrc(out_vec[9:9]),
    .MemtoReg(out_vec[8:8]),
    .RegWrite(out_vec[7:7]),
    .MemRead(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .Branch(out_vec[4:4]),
    .ALUOp(out_vec[3:2]),
    .Jump(out_vec[1:1]),
    .SignZero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h35;
    stim[1] = 6'h16;
    stim[2] = 6'h32;
    stim[3] = 6'h2d;
    stim[4] = 6'h3b;
    stim[5] = 6'h19;
    stim[6] = 6'h3e;
    stim[7] = 6'h25;
    stim[8] = 6'h30;
    stim[9] = 6'h35;
    stim[10] = 6'h3b;
    stim[11] = 6'h2d;
    stim[12] = 6'h32;
    stim[13] = 6'h19;
    stim[14] = 6'h0b;
    stim[15] = 6'h30;
    stim[16] = 6'h1a;
    stim[17] = 6'h27;
    stim[18] = 6'h20;
    stim[19] = 6'h28;
    stim[20] = 6'h0b;
    stim[21] = 6'h19;
    stim[22] = 6'h2d;
    stim[23] = 6'h10;
    stim[24] = 6'h1e;
    stim[25] = 6'h06;
    stim[26] = 6'h02;
    stim[27] = 6'h01;
    stim[28] = 6'h3a;
    stim[29] = 6'h35;
    stim[30] = 6'h07;
    stim[31] = 6'h02;
    stim[32] = 6'h1d;
    stim[33] = 6'h3c;
    stim[34] = 6'h3b;
    stim[35] = 6'h01;
    stim[36] = 6'h17;
    stim[37] = 6'h0a;
    stim[38] = 6'h31;
    stim[39] = 6'h29;
    stim[40] = 6'h12;
    stim[41] = 6'h3f;
    stim[42] = 6'h27;
    stim[43] = 6'h0c;
    stim[44] = 6'h23;
    stim[45] = 6'h22;
    stim[46] = 6'h32;
    stim[47] = 6'h23;
    stim[48] = 6'h2c;
    stim[49] = 6'h32;
    stim[50] = 6'h09;
    stim[51] = 6'h01;
    stim[52] = 6'h22;
    stim[53] = 6'h0a;
    stim[54] = 6'h12;
    stim[55] = 6'h07;
    stim[56] = 6'h30;
    stim[57] = 6'h28;
    stim[58] = 6'h0b;
    stim[59] = 6'h33;
    stim[60] = 6'h33;
    stim[61] = 6'h25;
    stim[62] = 6'h1a;
    stim[63] = 6'h35;
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
      expv[0] = 11'hx0x;
      expv[1] = 11'hx0x;
      expv[2] = 11'hx0x;
      expv[3] = 11'hx0x;
      expv[4] = 11'hx0x;
      expv[5] = 11'hx0x;
      expv[6] = 11'hx0x;
      expv[7] = 11'hx0x;
      expv[8] = 11'hx0x;
      expv[9] = 11'hx0x;
      expv[10] = 11'hx0x;
      expv[11] = 11'hx0x;
      expv[12] = 11'hx0x;
      expv[13] = 11'hx0x;
      expv[14] = 11'hx0x;
      expv[15] = 11'hx0x;
      expv[16] = 11'hx0x;
      expv[17] = 11'hx0x;
      expv[18] = 11'hx0x;
      expv[19] = 11'hx0x;
      expv[20] = 11'hx0x;
      expv[21] = 11'hx0x;
      expv[22] = 11'hx0x;
      expv[23] = 11'hx0x;
      expv[24] = 11'hx0x;
      expv[25] = 11'hx0x;
      expv[26] = 11'hx0x;
      expv[27] = 11'hx0x;
      expv[28] = 11'hx0x;
      expv[29] = 11'hx0x;
      expv[30] = 11'hx0x;
      expv[31] = 11'hx0x;
      expv[32] = 11'hx0x;
      expv[33] = 11'hx0x;
      expv[34] = 11'hx0x;
      expv[35] = 11'hx0x;
      expv[36] = 11'hx0x;
      expv[37] = 11'hx0x;
      expv[38] = 11'hx0x;
      expv[39] = 11'hx0x;
      expv[40] = 11'hx0x;
      expv[41] = 11'hx0x;
      expv[42] = 11'hx0x;
      expv[43] = 11'hx0x;
      expv[44] = 11'h3c1;
      expv[45] = 11'hx0x;
      expv[46] = 11'hx0x;
      expv[47] = 11'h3c1;
      expv[48] = 11'hx0x;
      expv[49] = 11'hx0x;
      expv[50] = 11'hx0x;
      expv[51] = 11'hx0x;
      expv[52] = 11'hx0x;
      expv[53] = 11'hx0x;
      expv[54] = 11'hx0x;
      expv[55] = 11'hx0x;
      expv[56] = 11'hx0x;
      expv[57] = 11'hx0x;
      expv[58] = 11'hx0x;
      expv[59] = 11'hx0x;
      expv[60] = 11'hx0x;
      expv[61] = 11'hx0x;
      expv[62] = 11'hx0x;
      expv[63] = 11'hx0x;
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
