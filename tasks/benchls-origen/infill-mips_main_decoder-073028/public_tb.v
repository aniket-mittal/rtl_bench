// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_073028 dut (
    .Op(in_vec[14:9]),
    .Funct(in_vec[8:3]),
    .Equal(in_vec[2:2]),
    .EQZ(in_vec[1:1]),
    .LTZ(in_vec[0:0]),
    .NPCOp(out_vec[19:18]),
    .RegWrite(out_vec[17:17]),
    .ALUOp(out_vec[16:13]),
    .MemWrite(out_vec[12:12]),
    .OpWidth(out_vec[11:10]),
    .LoadSigned(out_vec[9:9]),
    .ExtOp(out_vec[8:7]),
    .PCSrc(out_vec[6:5]),
    .RegDst(out_vec[4:3]),
    .RegSrc(out_vec[2:1]),
    .ALUSrc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h72b5;
    stim[1] = 15'h4ca2;
    stim[2] = 15'h5a71;
    stim[3] = 15'h7a54;
    stim[4] = 15'h69c5;
    stim[5] = 15'h16bd;
    stim[6] = 15'h42fe;
    stim[7] = 15'h2312;
    stim[8] = 15'h0b46;
    stim[9] = 15'h3a79;
    stim[10] = 15'h357d;
    stim[11] = 15'h0de2;
    stim[12] = 15'h7d85;
    stim[13] = 15'h2540;
    stim[14] = 15'h5f37;
    stim[15] = 15'h0314;
    stim[16] = 15'h1093;
    stim[17] = 15'h2674;
    stim[18] = 15'h5d25;
    stim[19] = 15'h3336;
    stim[20] = 15'h31e2;
    stim[21] = 15'h5df3;
    stim[22] = 15'h6de2;
    stim[23] = 15'h36c6;
    stim[24] = 15'h60b2;
    stim[25] = 15'h3a02;
    stim[26] = 15'h557d;
    stim[27] = 15'h5bab;
    stim[28] = 15'h79d8;
    stim[29] = 15'h77bc;
    stim[30] = 15'h6db9;
    stim[31] = 15'h1ff0;
    stim[32] = 15'h09d8;
    stim[33] = 15'h4d49;
    stim[34] = 15'h0249;
    stim[35] = 15'h7cf2;
    stim[36] = 15'h39da;
    stim[37] = 15'h6c25;
    stim[38] = 15'h3366;
    stim[39] = 15'h4c0a;
    stim[40] = 15'h2f52;
    stim[41] = 15'h75f1;
    stim[42] = 15'h6435;
    stim[43] = 15'h6460;
    stim[44] = 15'h13c5;
    stim[45] = 15'h6985;
    stim[46] = 15'h7f7a;
    stim[47] = 15'h55bd;
    stim[48] = 15'h0423;
    stim[49] = 15'h5174;
    stim[50] = 15'h5d7c;
    stim[51] = 15'h57a4;
    stim[52] = 15'h60ec;
    stim[53] = 15'h5473;
    stim[54] = 15'h4dbf;
    stim[55] = 15'h240e;
    stim[56] = 15'h1b7c;
    stim[57] = 15'h7f6b;
    stim[58] = 15'h2298;
    stim[59] = 15'h3914;
    stim[60] = 15'h0020;
    stim[61] = 15'h7d77;
    stim[62] = 15'h4ffb;
    stim[63] = 15'h485b;
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
      expv[0] = 20'h00a00;
      expv[1] = 20'h00a00;
      expv[2] = 20'h00a00;
      expv[3] = 20'h00a00;
      expv[4] = 20'h00a00;
      expv[5] = 20'h00a00;
      expv[6] = 20'h00a00;
      expv[7] = 20'h00a00;
      expv[8] = 20'h00a00;
      expv[9] = 20'h00a00;
      expv[10] = 20'h00a00;
      expv[11] = 20'h00a00;
      expv[12] = 20'h00a00;
      expv[13] = 20'h00a00;
      expv[14] = 20'h00a00;
      expv[15] = 20'h00a00;
      expv[16] = 20'h00a00;
      expv[17] = 20'h00a00;
      expv[18] = 20'h00a00;
      expv[19] = 20'h00a00;
      expv[20] = 20'h00a00;
      expv[21] = 20'h00a00;
      expv[22] = 20'h00a00;
      expv[23] = 20'h00a00;
      expv[24] = 20'h00a00;
      expv[25] = 20'h00a00;
      expv[26] = 20'h00a00;
      expv[27] = 20'h00a00;
      expv[28] = 20'h00a00;
      expv[29] = 20'h00a00;
      expv[30] = 20'h00a00;
      expv[31] = 20'h20b04;
      expv[32] = 20'h42a80;
      expv[33] = 20'h00a00;
      expv[34] = 20'h00a00;
      expv[35] = 20'h00a00;
      expv[36] = 20'h00a00;
      expv[37] = 20'h00a00;
      expv[38] = 20'h00a00;
      expv[39] = 20'h00a00;
      expv[40] = 20'h00a00;
      expv[41] = 20'h00a00;
      expv[42] = 20'h00a00;
      expv[43] = 20'h00a00;
      expv[44] = 20'h00a00;
      expv[45] = 20'h00a00;
      expv[46] = 20'h00a00;
      expv[47] = 20'h00a00;
      expv[48] = 20'h00a00;
      expv[49] = 20'h00a00;
      expv[50] = 20'h00a00;
      expv[51] = 20'h01a81;
      expv[52] = 20'h00a00;
      expv[53] = 20'h00a00;
      expv[54] = 20'h00a00;
      expv[55] = 20'h00a00;
      expv[56] = 20'h24a01;
      expv[57] = 20'h00a00;
      expv[58] = 20'h00a00;
      expv[59] = 20'h00a00;
      expv[60] = 20'h00a00;
      expv[61] = 20'h00a00;
      expv[62] = 20'h00a00;
      expv[63] = 20'h00a00;
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
