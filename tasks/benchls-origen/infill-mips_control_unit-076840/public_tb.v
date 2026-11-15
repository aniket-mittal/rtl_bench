// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_076840 dut (
    .OP(in_vec[13:8]),
    .FUNCT(in_vec[7:2]),
    .zero(in_vec[1:1]),
    .overflow(in_vec[0:0]),
    .RegDst(out_vec[15:15]),
    .RegWr(out_vec[14:14]),
    .MemWr(out_vec[13:13]),
    .MemToReg(out_vec[12:12]),
    .ALUctrl(out_vec[11:8]),
    .ALUsrc(out_vec[7:7]),
    .IsJump(out_vec[6:6]),
    .IsJAL(out_vec[5:5]),
    .IsJR(out_vec[4:4]),
    .IsBranch(out_vec[3:3]),
    .pcEnable(out_vec[2:2]),
    .controlLUT0(out_vec[1:1]),
    .if_Idreg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2d25;
    stim[1] = 14'h11a8;
    stim[2] = 14'h0411;
    stim[3] = 14'h1f86;
    stim[4] = 14'h1ec9;
    stim[5] = 14'h25c6;
    stim[6] = 14'h1c89;
    stim[7] = 14'h0b99;
    stim[8] = 14'h2939;
    stim[9] = 14'h2bf1;
    stim[10] = 14'h2d48;
    stim[11] = 14'h2b10;
    stim[12] = 14'h2447;
    stim[13] = 14'h222e;
    stim[14] = 14'h2fd3;
    stim[15] = 14'h3e54;
    stim[16] = 14'h22b7;
    stim[17] = 14'h2e0a;
    stim[18] = 14'h01cb;
    stim[19] = 14'h3f8b;
    stim[20] = 14'h3f24;
    stim[21] = 14'h0006;
    stim[22] = 14'h1abe;
    stim[23] = 14'h1cbf;
    stim[24] = 14'h2098;
    stim[25] = 14'h2af9;
    stim[26] = 14'h39db;
    stim[27] = 14'h0e0d;
    stim[28] = 14'h057d;
    stim[29] = 14'h217e;
    stim[30] = 14'h3a69;
    stim[31] = 14'h021b;
    stim[32] = 14'h2b5f;
    stim[33] = 14'h016f;
    stim[34] = 14'h3e60;
    stim[35] = 14'h2e2a;
    stim[36] = 14'h2ea7;
    stim[37] = 14'h0fd6;
    stim[38] = 14'h05ed;
    stim[39] = 14'h035c;
    stim[40] = 14'h1ca5;
    stim[41] = 14'h377e;
    stim[42] = 14'h0f31;
    stim[43] = 14'h1b87;
    stim[44] = 14'h05f0;
    stim[45] = 14'h1751;
    stim[46] = 14'h0f18;
    stim[47] = 14'h3d61;
    stim[48] = 14'h36fb;
    stim[49] = 14'h2446;
    stim[50] = 14'h26a5;
    stim[51] = 14'h2c0b;
    stim[52] = 14'h29a0;
    stim[53] = 14'h38a9;
    stim[54] = 14'h0164;
    stim[55] = 14'h0f77;
    stim[56] = 14'h1d65;
    stim[57] = 14'h18f9;
    stim[58] = 14'h1238;
    stim[59] = 14'h0e45;
    stim[60] = 14'h2dff;
    stim[61] = 14'h2808;
    stim[62] = 14'h35e3;
    stim[63] = 14'h0959;
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
      expv[0] = 16'h4087;
      expv[1] = 16'h4087;
      expv[2] = 16'h0008;
      expv[3] = 16'h4087;
      expv[4] = 16'h4087;
      expv[5] = 16'h4087;
      expv[6] = 16'h4087;
      expv[7] = 16'h4087;
      expv[8] = 16'h4087;
      expv[9] = 16'h2287;
      expv[10] = 16'h4087;
      expv[11] = 16'h2287;
      expv[12] = 16'h4087;
      expv[13] = 16'h4087;
      expv[14] = 16'h4087;
      expv[15] = 16'h4087;
      expv[16] = 16'h4087;
      expv[17] = 16'h4087;
      expv[18] = 16'h4087;
      expv[19] = 16'h4087;
      expv[20] = 16'h4087;
      expv[21] = 16'hc007;
      expv[22] = 16'h4087;
      expv[23] = 16'h4087;
      expv[24] = 16'h4087;
      expv[25] = 16'h4087;
      expv[26] = 16'h4087;
      expv[27] = 16'h4087;
      expv[28] = 16'h0008;
      expv[29] = 16'h4087;
      expv[30] = 16'h4087;
      expv[31] = 16'h0040;
      expv[32] = 16'h2287;
      expv[33] = 16'h4087;
      expv[34] = 16'h4087;
      expv[35] = 16'h4087;
      expv[36] = 16'h4087;
      expv[37] = 16'h4087;
      expv[38] = 16'h0008;
      expv[39] = 16'h0060;
      expv[40] = 16'h4087;
      expv[41] = 16'h4087;
      expv[42] = 16'h4087;
      expv[43] = 16'h4087;
      expv[44] = 16'h0008;
      expv[45] = 16'h4087;
      expv[46] = 16'h4087;
      expv[47] = 16'h4087;
      expv[48] = 16'h4087;
      expv[49] = 16'h4087;
      expv[50] = 16'h4087;
      expv[51] = 16'h4087;
      expv[52] = 16'h4087;
      expv[53] = 16'h4087;
      expv[54] = 16'h4087;
      expv[55] = 16'h4087;
      expv[56] = 16'h4087;
      expv[57] = 16'h4087;
      expv[58] = 16'h4087;
      expv[59] = 16'h4087;
      expv[60] = 16'h4087;
      expv[61] = 16'h4087;
      expv[62] = 16'h4087;
      expv[63] = 16'h4087;
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
