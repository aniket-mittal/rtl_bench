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

  origen_042822 dut (
    .opcode(in_vec[5:0]),
    .RegDst(out_vec[11:11]),
    .ALUSrc(out_vec[10:10]),
    .MemtoReg(out_vec[9:9]),
    .RegWrite(out_vec[8:8]),
    .MemRead(out_vec[7:7]),
    .MemWrite(out_vec[6:6]),
    .Branch(out_vec[5:5]),
    .Jump(out_vec[4:4]),
    .ALUOp(out_vec[3:2]),
    .BneDst(out_vec[1:1]),
    .ExtndDst(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h20;
    stim[1] = 6'h37;
    stim[2] = 6'h16;
    stim[3] = 6'h35;
    stim[4] = 6'h3d;
    stim[5] = 6'h3e;
    stim[6] = 6'h07;
    stim[7] = 6'h37;
    stim[8] = 6'h19;
    stim[9] = 6'h37;
    stim[10] = 6'h2c;
    stim[11] = 6'h25;
    stim[12] = 6'h32;
    stim[13] = 6'h2f;
    stim[14] = 6'h2b;
    stim[15] = 6'h28;
    stim[16] = 6'h0d;
    stim[17] = 6'h3d;
    stim[18] = 6'h34;
    stim[19] = 6'h3b;
    stim[20] = 6'h10;
    stim[21] = 6'h38;
    stim[22] = 6'h07;
    stim[23] = 6'h1b;
    stim[24] = 6'h29;
    stim[25] = 6'h32;
    stim[26] = 6'h35;
    stim[27] = 6'h22;
    stim[28] = 6'h34;
    stim[29] = 6'h2e;
    stim[30] = 6'h18;
    stim[31] = 6'h31;
    stim[32] = 6'h3a;
    stim[33] = 6'h24;
    stim[34] = 6'h1d;
    stim[35] = 6'h04;
    stim[36] = 6'h1f;
    stim[37] = 6'h2d;
    stim[38] = 6'h1a;
    stim[39] = 6'h3e;
    stim[40] = 6'h0e;
    stim[41] = 6'h1c;
    stim[42] = 6'h3b;
    stim[43] = 6'h15;
    stim[44] = 6'h1d;
    stim[45] = 6'h30;
    stim[46] = 6'h19;
    stim[47] = 6'h34;
    stim[48] = 6'h03;
    stim[49] = 6'h0b;
    stim[50] = 6'h01;
    stim[51] = 6'h16;
    stim[52] = 6'h37;
    stim[53] = 6'h3a;
    stim[54] = 6'h0e;
    stim[55] = 6'h13;
    stim[56] = 6'h0a;
    stim[57] = 6'h0f;
    stim[58] = 6'h06;
    stim[59] = 6'h18;
    stim[60] = 6'h16;
    stim[61] = 6'h2d;
    stim[62] = 6'h23;
    stim[63] = 6'h15;
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
      expv[0] = 12'hx0x;
      expv[1] = 12'hx0x;
      expv[2] = 12'hx0x;
      expv[3] = 12'hx0x;
      expv[4] = 12'hx0x;
      expv[5] = 12'hx0x;
      expv[6] = 12'hx0x;
      expv[7] = 12'hx0x;
      expv[8] = 12'hx0x;
      expv[9] = 12'hx0x;
      expv[10] = 12'hx0x;
      expv[11] = 12'hx0x;
      expv[12] = 12'hx0x;
      expv[13] = 12'hx0x;
      expv[14] = 12'hx41;
      expv[15] = 12'hx0x;
      expv[16] = 12'h50c;
      expv[17] = 12'hx0x;
      expv[18] = 12'hx0x;
      expv[19] = 12'hx0x;
      expv[20] = 12'hx0x;
      expv[21] = 12'hx0x;
      expv[22] = 12'hx0x;
      expv[23] = 12'hx0x;
      expv[24] = 12'hx0x;
      expv[25] = 12'hx0x;
      expv[26] = 12'hx0x;
      expv[27] = 12'hx0x;
      expv[28] = 12'hx0x;
      expv[29] = 12'hx0x;
      expv[30] = 12'hx0x;
      expv[31] = 12'hx0x;
      expv[32] = 12'hx0x;
      expv[33] = 12'hx0x;
      expv[34] = 12'hx0x;
      expv[35] = 12'hx25;
      expv[36] = 12'hx0x;
      expv[37] = 12'hx0x;
      expv[38] = 12'hx0x;
      expv[39] = 12'hx0x;
      expv[40] = 12'hx0x;
      expv[41] = 12'hx0x;
      expv[42] = 12'hx0x;
      expv[43] = 12'hx0x;
      expv[44] = 12'hx0x;
      expv[45] = 12'hx0x;
      expv[46] = 12'hx0x;
      expv[47] = 12'hx0x;
      expv[48] = 12'hx0x;
      expv[49] = 12'hx0x;
      expv[50] = 12'hx0x;
      expv[51] = 12'hx0x;
      expv[52] = 12'hx0x;
      expv[53] = 12'hx0x;
      expv[54] = 12'hx0x;
      expv[55] = 12'hx0x;
      expv[56] = 12'hx0x;
      expv[57] = 12'hx0x;
      expv[58] = 12'hx0x;
      expv[59] = 12'hx0x;
      expv[60] = 12'hx0x;
      expv[61] = 12'hx0x;
      expv[62] = 12'h781;
      expv[63] = 12'hx0x;
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
