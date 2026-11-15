// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072026 dut (
    .instruction(in_vec[31:0]),
    .alusrc(out_vec[11:11]),
    .writeback_ctrl(out_vec[10:9]),
    .mem_read(out_vec[8:8]),
    .regwrite(out_vec[7:7]),
    .mem_write(out_vec[6:6]),
    .alu_ctrl(out_vec[5:3]),
    .bge(out_vec[2:2]),
    .beq(out_vec[1:1]),
    .jalr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hdd14969e;
    stim[1] = 32'h3d38a0e2;
    stim[2] = 32'hf4a90617;
    stim[3] = 32'h769617e5;
    stim[4] = 32'h83af2599;
    stim[5] = 32'h73765ada;
    stim[6] = 32'hd787d7ff;
    stim[7] = 32'ha2ea0fb2;
    stim[8] = 32'h3d5fa131;
    stim[9] = 32'h3a071e5f;
    stim[10] = 32'h1a95145d;
    stim[11] = 32'h3c10aef6;
    stim[12] = 32'hb6b915da;
    stim[13] = 32'h6ac2cb42;
    stim[14] = 32'h5766d6df;
    stim[15] = 32'h52bdc574;
    stim[16] = 32'h0d9b1c80;
    stim[17] = 32'h1e2f2abb;
    stim[18] = 32'h34814bf2;
    stim[19] = 32'h3e3e5125;
    stim[20] = 32'h72feaefb;
    stim[21] = 32'h4f5f5d7b;
    stim[22] = 32'hdad7f81f;
    stim[23] = 32'h66e38429;
    stim[24] = 32'ha9086ba1;
    stim[25] = 32'hfe401a01;
    stim[26] = 32'h7ae3e1eb;
    stim[27] = 32'h449d35a8;
    stim[28] = 32'hf57accb2;
    stim[29] = 32'h8fe3cc3a;
    stim[30] = 32'h829057db;
    stim[31] = 32'h3459050b;
    stim[32] = 32'had0d2f5b;
    stim[33] = 32'h3f8a17b8;
    stim[34] = 32'hccb7600d;
    stim[35] = 32'hd0849691;
    stim[36] = 32'h786a67ea;
    stim[37] = 32'h46fc1cf3;
    stim[38] = 32'h6b63758a;
    stim[39] = 32'h20efb976;
    stim[40] = 32'h42052225;
    stim[41] = 32'h7fe064e5;
    stim[42] = 32'h41112b7c;
    stim[43] = 32'h16a27644;
    stim[44] = 32'h925c7599;
    stim[45] = 32'h72a050d0;
    stim[46] = 32'h2943c8b7;
    stim[47] = 32'h93504b1b;
    stim[48] = 32'h404a1583;
    stim[49] = 32'h9fa81069;
    stim[50] = 32'hf4d71941;
    stim[51] = 32'hdcbfeeaf;
    stim[52] = 32'hd165c3ee;
    stim[53] = 32'h7dd72d4a;
    stim[54] = 32'h1f442b79;
    stim[55] = 32'h181ba467;
    stim[56] = 32'h53569445;
    stim[57] = 32'h6529d6ba;
    stim[58] = 32'h0790597e;
    stim[59] = 32'he34d53b1;
    stim[60] = 32'h21b187ff;
    stim[61] = 32'hb90b0150;
    stim[62] = 32'ha5d7aa47;
    stim[63] = 32'h9566c69e;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hx02;
      expv[2] = 12'hxxx;
      expv[3] = 12'hc81;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hxxx;
      expv[7] = 12'h080;
      expv[8] = 12'h080;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'hxxx;
      expv[12] = 12'hxxx;
      expv[13] = 12'hxxx;
      expv[14] = 12'hxxx;
      expv[15] = 12'hxxx;
      expv[16] = 12'hb80;
      expv[17] = 12'hxxx;
      expv[18] = 12'hxxx;
      expv[19] = 12'hxxx;
      expv[20] = 12'hxxx;
      expv[21] = 12'hxxx;
      expv[22] = 12'hxxx;
      expv[23] = 12'hxxx;
      expv[24] = 12'hx40;
      expv[25] = 12'hb80;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'h090;
      expv[29] = 12'hxxx;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'h888;
      expv[36] = 12'hxxx;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hc81;
      expv[42] = 12'hxxx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'hxxx;
      expv[48] = 12'hb80;
      expv[49] = 12'hxxx;
      expv[50] = 12'hxxx;
      expv[51] = 12'hxxx;
      expv[52] = 12'hxxx;
      expv[53] = 12'hxxx;
      expv[54] = 12'hxxx;
      expv[55] = 12'hc81;
      expv[56] = 12'hxxx;
      expv[57] = 12'hxxx;
      expv[58] = 12'hxxx;
      expv[59] = 12'h090;
      expv[60] = 12'hxxx;
      expv[61] = 12'hxxx;
      expv[62] = 12'hxxx;
      expv[63] = 12'hxxx;
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
