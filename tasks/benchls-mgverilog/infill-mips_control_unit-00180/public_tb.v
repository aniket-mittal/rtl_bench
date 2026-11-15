// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00180 dut (
    .OPcode(in_vec[14:9]),
    .Fun(in_vec[8:3]),
    .int_code(in_vec[2:2]),
    .MIO_ready(in_vec[1:1]),
    .zero(in_vec[0:0]),
    .RegDst(out_vec[13:13]),
    .ALUSrc_B(out_vec[12:12]),
    .DatatoReg(out_vec[11:10]),
    .Jal(out_vec[9:9]),
    .Branch(out_vec[8:7]),
    .RegWrite(out_vec[6:6]),
    .mem_w(out_vec[5:5]),
    .ALU_Control(out_vec[4:2]),
    .eret(out_vec[1:1]),
    .CPU_MIO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h45db;
    stim[1] = 15'h4d91;
    stim[2] = 15'h1edf;
    stim[3] = 15'h2895;
    stim[4] = 15'h67fd;
    stim[5] = 15'h190d;
    stim[6] = 15'h19a1;
    stim[7] = 15'h0821;
    stim[8] = 15'h6813;
    stim[9] = 15'h3772;
    stim[10] = 15'h25b5;
    stim[11] = 15'h7214;
    stim[12] = 15'h5a8a;
    stim[13] = 15'h70e0;
    stim[14] = 15'h7beb;
    stim[15] = 15'h0458;
    stim[16] = 15'h3091;
    stim[17] = 15'h4f1a;
    stim[18] = 15'h160c;
    stim[19] = 15'h367a;
    stim[20] = 15'h27d5;
    stim[21] = 15'h2969;
    stim[22] = 15'h7015;
    stim[23] = 15'h66fb;
    stim[24] = 15'h5a77;
    stim[25] = 15'h0df3;
    stim[26] = 15'h09aa;
    stim[27] = 15'h3b6e;
    stim[28] = 15'h69a5;
    stim[29] = 15'h440e;
    stim[30] = 15'h46e5;
    stim[31] = 15'h784f;
    stim[32] = 15'h3ea9;
    stim[33] = 15'h24e4;
    stim[34] = 15'h2516;
    stim[35] = 15'h5cec;
    stim[36] = 15'h4289;
    stim[37] = 15'h7d9c;
    stim[38] = 15'h19f9;
    stim[39] = 15'h614b;
    stim[40] = 15'h1ee6;
    stim[41] = 15'h722e;
    stim[42] = 15'h33f6;
    stim[43] = 15'h1989;
    stim[44] = 15'h7e00;
    stim[45] = 15'h7609;
    stim[46] = 15'h77b7;
    stim[47] = 15'h6bfa;
    stim[48] = 15'h47ba;
    stim[49] = 15'h1056;
    stim[50] = 15'h4ccc;
    stim[51] = 15'h7cb8;
    stim[52] = 15'h1615;
    stim[53] = 15'h0fbc;
    stim[54] = 15'h63b7;
    stim[55] = 15'h3d70;
    stim[56] = 15'h1c9b;
    stim[57] = 15'h649d;
    stim[58] = 15'h72af;
    stim[59] = 15'h7bf1;
    stim[60] = 15'h2eca;
    stim[61] = 15'h6912;
    stim[62] = 15'h3549;
    stim[63] = 15'h44f4;
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
      expv[0] = 14'h0008;
      expv[1] = 14'h0008;
      expv[2] = 14'h0848;
      expv[3] = 14'h0008;
      expv[4] = 14'h0008;
      expv[5] = 14'h1040;
      expv[6] = 14'h1040;
      expv[7] = 14'h0098;
      expv[8] = 14'h0008;
      expv[9] = 14'h0008;
      expv[10] = 14'h0008;
      expv[11] = 14'h0008;
      expv[12] = 14'h0008;
      expv[13] = 14'h0008;
      expv[14] = 14'h0008;
      expv[15] = 14'h0108;
      expv[16] = 14'h0008;
      expv[17] = 14'h0008;
      expv[18] = 14'h0008;
      expv[19] = 14'h0008;
      expv[20] = 14'h0008;
      expv[21] = 14'h0008;
      expv[22] = 14'h0008;
      expv[23] = 14'h0008;
      expv[24] = 14'h0008;
      expv[25] = 14'h0008;
      expv[26] = 14'h0018;
      expv[27] = 14'h0008;
      expv[28] = 14'h0008;
      expv[29] = 14'h0008;
      expv[30] = 14'h1448;
      expv[31] = 14'h0008;
      expv[32] = 14'h0008;
      expv[33] = 14'h0008;
      expv[34] = 14'h0008;
      expv[35] = 14'h0008;
      expv[36] = 14'h0008;
      expv[37] = 14'h0008;
      expv[38] = 14'h1040;
      expv[39] = 14'h0008;
      expv[40] = 14'h0848;
      expv[41] = 14'h0008;
      expv[42] = 14'h0008;
      expv[43] = 14'h1040;
      expv[44] = 14'h0008;
      expv[45] = 14'h0008;
      expv[46] = 14'h0008;
      expv[47] = 14'h0008;
      expv[48] = 14'h1448;
      expv[49] = 14'h1048;
      expv[50] = 14'h0008;
      expv[51] = 14'h0008;
      expv[52] = 14'h0008;
      expv[53] = 14'h0008;
      expv[54] = 14'h0008;
      expv[55] = 14'h0008;
      expv[56] = 14'h0008;
      expv[57] = 14'h0008;
      expv[58] = 14'h0008;
      expv[59] = 14'h0008;
      expv[60] = 14'h0008;
      expv[61] = 14'h0008;
      expv[62] = 14'h0008;
      expv[63] = 14'h0008;
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
