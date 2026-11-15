// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_025099 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .Branch(out_vec[11:11]),
    .Jump(out_vec[10:10]),
    .RegDst(out_vec[9:9]),
    .ALUSrc(out_vec[8:8]),
    .ALUctr(out_vec[7:4]),
    .MemtoReg(out_vec[3:3]),
    .RegWr(out_vec[2:2]),
    .MemWr(out_vec[1:1]),
    .ExtOp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hcb6;
    stim[1] = 12'h5d5;
    stim[2] = 12'hb08;
    stim[3] = 12'hc85;
    stim[4] = 12'h750;
    stim[5] = 12'h960;
    stim[6] = 12'h96b;
    stim[7] = 12'h9c4;
    stim[8] = 12'hc32;
    stim[9] = 12'hde2;
    stim[10] = 12'he28;
    stim[11] = 12'h1aa;
    stim[12] = 12'h64f;
    stim[13] = 12'h550;
    stim[14] = 12'h5af;
    stim[15] = 12'h2be;
    stim[16] = 12'hd62;
    stim[17] = 12'hcab;
    stim[18] = 12'h682;
    stim[19] = 12'h3a0;
    stim[20] = 12'h741;
    stim[21] = 12'h933;
    stim[22] = 12'h90f;
    stim[23] = 12'h988;
    stim[24] = 12'h1ca;
    stim[25] = 12'hf60;
    stim[26] = 12'h99f;
    stim[27] = 12'h155;
    stim[28] = 12'h21a;
    stim[29] = 12'h98f;
    stim[30] = 12'hb01;
    stim[31] = 12'ha59;
    stim[32] = 12'h96c;
    stim[33] = 12'ha8a;
    stim[34] = 12'hd35;
    stim[35] = 12'heb0;
    stim[36] = 12'h783;
    stim[37] = 12'h1ef;
    stim[38] = 12'h340;
    stim[39] = 12'h0d8;
    stim[40] = 12'h55a;
    stim[41] = 12'h81f;
    stim[42] = 12'hd44;
    stim[43] = 12'h4ec;
    stim[44] = 12'h115;
    stim[45] = 12'hec4;
    stim[46] = 12'ha20;
    stim[47] = 12'h29b;
    stim[48] = 12'ha8d;
    stim[49] = 12'h45f;
    stim[50] = 12'h270;
    stim[51] = 12'h6ca;
    stim[52] = 12'h6e0;
    stim[53] = 12'h605;
    stim[54] = 12'hbbb;
    stim[55] = 12'h283;
    stim[56] = 12'h969;
    stim[57] = 12'hbe8;
    stim[58] = 12'h320;
    stim[59] = 12'h56e;
    stim[60] = 12'h685;
    stim[61] = 12'h4a3;
    stim[62] = 12'h1d5;
    stim[63] = 12'h70d;
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
      expv[28] = 12'h115;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h134;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h841;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h105;
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
