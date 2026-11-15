// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_221077 dut (
    .ins(in_vec[31:0]),
    .jump(out_vec[14:14]),
    .RegDst(out_vec[13:13]),
    .ALUSrc(out_vec[12:12]),
    .MemtoReg(out_vec[11:11]),
    .RegWrite(out_vec[10:10]),
    .MemWrite(out_vec[9:9]),
    .branch(out_vec[8:8]),
    .extop(out_vec[7:6]),
    .aluop(out_vec[5:3]),
    .sll_slt(out_vec[2:2]),
    .jr_slt(out_vec[1:1]),
    .jal_slt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hb92d2078;
    stim[1] = 32'h1aaa0baa;
    stim[2] = 32'h009d0950;
    stim[3] = 32'hd7c3e5e3;
    stim[4] = 32'h50752fbf;
    stim[5] = 32'h94c257e7;
    stim[6] = 32'h95ed0c30;
    stim[7] = 32'h6e48c75c;
    stim[8] = 32'hcb7329bf;
    stim[9] = 32'hd31f3e38;
    stim[10] = 32'h83652834;
    stim[11] = 32'hfb693b21;
    stim[12] = 32'h248ff819;
    stim[13] = 32'hb887797c;
    stim[14] = 32'h3855b5a1;
    stim[15] = 32'hd6aa9117;
    stim[16] = 32'h029ada0c;
    stim[17] = 32'h3b83f988;
    stim[18] = 32'h5c2a4079;
    stim[19] = 32'h1b088547;
    stim[20] = 32'he7dbe9da;
    stim[21] = 32'h4b8c7c50;
    stim[22] = 32'hc2532e09;
    stim[23] = 32'h4ff5dbd7;
    stim[24] = 32'hf3dc8e24;
    stim[25] = 32'h3ba4ceed;
    stim[26] = 32'h83fb7c91;
    stim[27] = 32'hdd66913f;
    stim[28] = 32'h56b43cbb;
    stim[29] = 32'hbdf4f813;
    stim[30] = 32'h5329fd28;
    stim[31] = 32'hfdf7a6d1;
    stim[32] = 32'hb401ac14;
    stim[33] = 32'hb0232c8b;
    stim[34] = 32'h8ec14b3b;
    stim[35] = 32'hc4d9df49;
    stim[36] = 32'h0d3db72c;
    stim[37] = 32'h6ceaffbf;
    stim[38] = 32'h0b5e31d0;
    stim[39] = 32'hf6c1fffd;
    stim[40] = 32'h14d39bb6;
    stim[41] = 32'he834d78f;
    stim[42] = 32'h29eab084;
    stim[43] = 32'h122468e1;
    stim[44] = 32'h089c14bd;
    stim[45] = 32'h5ccb2f65;
    stim[46] = 32'h775b45ee;
    stim[47] = 32'hd2ff7e73;
    stim[48] = 32'hd5441a6f;
    stim[49] = 32'h196b716f;
    stim[50] = 32'h77131516;
    stim[51] = 32'h5be4b418;
    stim[52] = 32'hdf5196b2;
    stim[53] = 32'h965624a0;
    stim[54] = 32'h8025d21f;
    stim[55] = 32'hd926a90c;
    stim[56] = 32'h69c8dcae;
    stim[57] = 32'h73cb8dd9;
    stim[58] = 32'h67e0bfba;
    stim[59] = 32'h46e77921;
    stim[60] = 32'h0ee9e96e;
    stim[61] = 32'h8321060b;
    stim[62] = 32'hf7efa3a0;
    stim[63] = 32'h96b79ac9;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h1c48;
      expv[35] = 15'h0000;
      expv[36] = 15'h4001;
      expv[37] = 15'h0000;
      expv[38] = 15'h4000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0128;
      expv[44] = 15'h4000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h4001;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
