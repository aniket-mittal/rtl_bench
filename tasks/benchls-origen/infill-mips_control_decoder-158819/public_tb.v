// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_158819 dut (
    .op(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .RegDst(out_vec[9:9]),
    .ALUSrc(out_vec[8:8]),
    .MemtoReg(out_vec[7:7]),
    .RegWrite(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .nPC_sel(out_vec[4:4]),
    .ExtOp(out_vec[3:3]),
    .jmp(out_vec[2:2]),
    .ALUctr(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he04;
    stim[1] = 12'hd88;
    stim[2] = 12'hb54;
    stim[3] = 12'hf1d;
    stim[4] = 12'h478;
    stim[5] = 12'h158;
    stim[6] = 12'hef4;
    stim[7] = 12'h6a1;
    stim[8] = 12'h3e3;
    stim[9] = 12'h22e;
    stim[10] = 12'h9c2;
    stim[11] = 12'h004;
    stim[12] = 12'h703;
    stim[13] = 12'h158;
    stim[14] = 12'h95a;
    stim[15] = 12'h731;
    stim[16] = 12'hc80;
    stim[17] = 12'h47f;
    stim[18] = 12'h141;
    stim[19] = 12'h90f;
    stim[20] = 12'hb9e;
    stim[21] = 12'h714;
    stim[22] = 12'hdc6;
    stim[23] = 12'ha5e;
    stim[24] = 12'h1a9;
    stim[25] = 12'hfa9;
    stim[26] = 12'h9ea;
    stim[27] = 12'hd6e;
    stim[28] = 12'h6d8;
    stim[29] = 12'ha29;
    stim[30] = 12'h6a7;
    stim[31] = 12'h95a;
    stim[32] = 12'h1a3;
    stim[33] = 12'h2e5;
    stim[34] = 12'hb69;
    stim[35] = 12'hf17;
    stim[36] = 12'had0;
    stim[37] = 12'h1c5;
    stim[38] = 12'h236;
    stim[39] = 12'h8e7;
    stim[40] = 12'ha21;
    stim[41] = 12'h1b6;
    stim[42] = 12'h7cd;
    stim[43] = 12'h98a;
    stim[44] = 12'h20a;
    stim[45] = 12'hb44;
    stim[46] = 12'h7ea;
    stim[47] = 12'hadd;
    stim[48] = 12'h48a;
    stim[49] = 12'h4bc;
    stim[50] = 12'h829;
    stim[51] = 12'hcc4;
    stim[52] = 12'haac;
    stim[53] = 12'h56c;
    stim[54] = 12'h9ed;
    stim[55] = 12'ha6e;
    stim[56] = 12'h124;
    stim[57] = 12'h9b9;
    stim[58] = 12'h14d;
    stim[59] = 12'h363;
    stim[60] = 12'h275;
    stim[61] = 12'h0c4;
    stim[62] = 12'h63b;
    stim[63] = 12'hb61;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'h14b;
      expv[9] = 10'h14b;
      expv[10] = 10'h14b;
      expv[11] = 10'h14b;
      expv[12] = 10'h14b;
      expv[13] = 10'h14b;
      expv[14] = 10'h14b;
      expv[15] = 10'h14b;
      expv[16] = 10'h14b;
      expv[17] = 10'h14b;
      expv[18] = 10'h14b;
      expv[19] = 10'h14b;
      expv[20] = 10'h14b;
      expv[21] = 10'h14b;
      expv[22] = 10'h14b;
      expv[23] = 10'h14b;
      expv[24] = 10'h14b;
      expv[25] = 10'h14b;
      expv[26] = 10'h14b;
      expv[27] = 10'h14b;
      expv[28] = 10'h14b;
      expv[29] = 10'h14b;
      expv[30] = 10'h14b;
      expv[31] = 10'h14b;
      expv[32] = 10'h14b;
      expv[33] = 10'h14b;
      expv[34] = 10'h14b;
      expv[35] = 10'h14b;
      expv[36] = 10'hxx8;
      expv[37] = 10'hxx8;
      expv[38] = 10'hxx8;
      expv[39] = 10'h1c8;
      expv[40] = 10'h1c8;
      expv[41] = 10'h1c8;
      expv[42] = 10'h1c8;
      expv[43] = 10'h1c8;
      expv[44] = 10'h1c8;
      expv[45] = 10'h1c8;
      expv[46] = 10'h1c8;
      expv[47] = 10'hxx8;
      expv[48] = 10'hxx8;
      expv[49] = 10'hxx8;
      expv[50] = 10'hxx8;
      expv[51] = 10'hxx8;
      expv[52] = 10'hxx8;
      expv[53] = 10'hxx8;
      expv[54] = 10'hxx8;
      expv[55] = 10'hxx8;
      expv[56] = 10'hxx9;
      expv[57] = 10'hxx9;
      expv[58] = 10'hxx9;
      expv[59] = 10'h142;
      expv[60] = 10'h142;
      expv[61] = 10'h142;
      expv[62] = 10'h142;
      expv[63] = 10'h142;
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
