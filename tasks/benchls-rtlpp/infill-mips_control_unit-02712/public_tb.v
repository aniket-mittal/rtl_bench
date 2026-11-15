// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02712 dut (
    .Fun(in_vec[12:7]),
    .MIO_ready(in_vec[6:6]),
    .OPcode(in_vec[5:0]),
    .ALUSrc_B(out_vec[10:10]),
    .ALU_Control(out_vec[9:7]),
    .Branch(out_vec[6:6]),
    .CPU_MIO(out_vec[5:5]),
    .Jump(out_vec[4:4]),
    .MemtoReg(out_vec[3:3]),
    .mem_w(out_vec[2:2]),
    .RegDst(out_vec[1:1]),
    .RegWrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h069b;
    stim[1] = 13'h1049;
    stim[2] = 13'h127a;
    stim[3] = 13'h1c28;
    stim[4] = 13'h0b69;
    stim[5] = 13'h1338;
    stim[6] = 13'h11d9;
    stim[7] = 13'h044b;
    stim[8] = 13'h1bd6;
    stim[9] = 13'h018c;
    stim[10] = 13'h1b43;
    stim[11] = 13'h1b5a;
    stim[12] = 13'h0ee6;
    stim[13] = 13'h077d;
    stim[14] = 13'h0ccd;
    stim[15] = 13'h18e7;
    stim[16] = 13'h0cd6;
    stim[17] = 13'h0f59;
    stim[18] = 13'h0c1f;
    stim[19] = 13'h1075;
    stim[20] = 13'h19bc;
    stim[21] = 13'h141e;
    stim[22] = 13'h056f;
    stim[23] = 13'h0837;
    stim[24] = 13'h02d3;
    stim[25] = 13'h193d;
    stim[26] = 13'h168e;
    stim[27] = 13'h10fa;
    stim[28] = 13'h17fc;
    stim[29] = 13'h11fe;
    stim[30] = 13'h0ebf;
    stim[31] = 13'h050a;
    stim[32] = 13'h1731;
    stim[33] = 13'h1754;
    stim[34] = 13'h04a6;
    stim[35] = 13'h1592;
    stim[36] = 13'h17bc;
    stim[37] = 13'h1e46;
    stim[38] = 13'h0ba9;
    stim[39] = 13'h09e8;
    stim[40] = 13'h0da0;
    stim[41] = 13'h0835;
    stim[42] = 13'h1d35;
    stim[43] = 13'h188a;
    stim[44] = 13'h19bd;
    stim[45] = 13'h1cbc;
    stim[46] = 13'h00af;
    stim[47] = 13'h1a03;
    stim[48] = 13'h17a8;
    stim[49] = 13'h01f4;
    stim[50] = 13'h1477;
    stim[51] = 13'h1f17;
    stim[52] = 13'h1f41;
    stim[53] = 13'h04b0;
    stim[54] = 13'h03ff;
    stim[55] = 13'h026f;
    stim[56] = 13'h1ce8;
    stim[57] = 13'h12f3;
    stim[58] = 13'h12e4;
    stim[59] = 13'h104e;
    stim[60] = 13'h14b8;
    stim[61] = 13'h1efe;
    stim[62] = 13'h1426;
    stim[63] = 13'h0d1d;
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
      expv[0] = 11'h1x0;
      expv[1] = 11'h1x0;
      expv[2] = 11'h1x0;
      expv[3] = 11'h1x0;
      expv[4] = 11'h1x0;
      expv[5] = 11'h1x0;
      expv[6] = 11'h1x0;
      expv[7] = 11'h1x0;
      expv[8] = 11'h1x0;
      expv[9] = 11'h1x0;
      expv[10] = 11'h1x0;
      expv[11] = 11'h1x0;
      expv[12] = 11'h1x0;
      expv[13] = 11'h1x0;
      expv[14] = 11'h1x0;
      expv[15] = 11'h1x0;
      expv[16] = 11'h1x0;
      expv[17] = 11'h1x0;
      expv[18] = 11'h1x0;
      expv[19] = 11'h1x0;
      expv[20] = 11'h1x0;
      expv[21] = 11'h1x0;
      expv[22] = 11'h7xd;
      expv[23] = 11'h1x0;
      expv[24] = 11'h1x0;
      expv[25] = 11'h1x0;
      expv[26] = 11'h1x0;
      expv[27] = 11'h1x0;
      expv[28] = 11'h1x0;
      expv[29] = 11'h1x0;
      expv[30] = 11'h7xd;
      expv[31] = 11'h1x0;
      expv[32] = 11'h1x0;
      expv[33] = 11'h1x0;
      expv[34] = 11'h1x0;
      expv[35] = 11'h1x0;
      expv[36] = 11'h1x0;
      expv[37] = 11'h1x0;
      expv[38] = 11'h1x0;
      expv[39] = 11'h1x0;
      expv[40] = 11'h1x0;
      expv[41] = 11'h1x0;
      expv[42] = 11'h1x0;
      expv[43] = 11'h1x0;
      expv[44] = 11'h1x0;
      expv[45] = 11'h1x0;
      expv[46] = 11'h7xd;
      expv[47] = 11'h1x0;
      expv[48] = 11'h1x0;
      expv[49] = 11'h1x0;
      expv[50] = 11'h1x0;
      expv[51] = 11'h1x0;
      expv[52] = 11'h1x0;
      expv[53] = 11'h1x0;
      expv[54] = 11'h7xd;
      expv[55] = 11'h7xd;
      expv[56] = 11'h1x0;
      expv[57] = 11'h1x0;
      expv[58] = 11'h1x0;
      expv[59] = 11'h1x0;
      expv[60] = 11'h1x0;
      expv[61] = 11'h1x0;
      expv[62] = 11'h1x0;
      expv[63] = 11'h1x0;
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
