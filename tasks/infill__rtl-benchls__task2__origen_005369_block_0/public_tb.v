// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005369 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegDst(out_vec[14:13]),
    .ALUSrc(out_vec[12:12]),
    .MemtoReg(out_vec[11:10]),
    .RegWrite(out_vec[9:9]),
    .MemRead(out_vec[8:8]),
    .MemWrite(out_vec[7:7]),
    .IfBeq(out_vec[6:6]),
    .ExtOp(out_vec[5:4]),
    .ALUOp(out_vec[3:2]),
    .jr(out_vec[1:1]),
    .jal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf40;
    stim[1] = 12'h4f8;
    stim[2] = 12'hc3e;
    stim[3] = 12'h4a2;
    stim[4] = 12'h245;
    stim[5] = 12'h1a2;
    stim[6] = 12'h2a1;
    stim[7] = 12'h8c1;
    stim[8] = 12'h423;
    stim[9] = 12'h8f5;
    stim[10] = 12'hd30;
    stim[11] = 12'h590;
    stim[12] = 12'h005;
    stim[13] = 12'hd7c;
    stim[14] = 12'h248;
    stim[15] = 12'hf68;
    stim[16] = 12'h837;
    stim[17] = 12'hf54;
    stim[18] = 12'h6af;
    stim[19] = 12'h126;
    stim[20] = 12'h2f8;
    stim[21] = 12'h1e3;
    stim[22] = 12'h904;
    stim[23] = 12'h1b1;
    stim[24] = 12'h6f8;
    stim[25] = 12'h1c1;
    stim[26] = 12'h76f;
    stim[27] = 12'h106;
    stim[28] = 12'h013;
    stim[29] = 12'h17f;
    stim[30] = 12'hea2;
    stim[31] = 12'h6ac;
    stim[32] = 12'hc2d;
    stim[33] = 12'h821;
    stim[34] = 12'hcc0;
    stim[35] = 12'h8b6;
    stim[36] = 12'hb97;
    stim[37] = 12'h0f4;
    stim[38] = 12'he13;
    stim[39] = 12'h322;
    stim[40] = 12'h1c6;
    stim[41] = 12'h879;
    stim[42] = 12'h34a;
    stim[43] = 12'h564;
    stim[44] = 12'h18d;
    stim[45] = 12'h9d0;
    stim[46] = 12'he10;
    stim[47] = 12'hdc9;
    stim[48] = 12'haaa;
    stim[49] = 12'h2df;
    stim[50] = 12'h563;
    stim[51] = 12'hec8;
    stim[52] = 12'hb2d;
    stim[53] = 12'h8f4;
    stim[54] = 12'hc3d;
    stim[55] = 12'h07d;
    stim[56] = 12'h08e;
    stim[57] = 12'h3cd;
    stim[58] = 12'h860;
    stim[59] = 12'hb76;
    stim[60] = 12'hfc1;
    stim[61] = 12'haf7;
    stim[62] = 12'h6f0;
    stim[63] = 12'ha87;
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
      expv[6] = 15'h121c;
      expv[7] = 15'h1710;
      expv[8] = 15'h0000;
      expv[9] = 15'h1710;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h2208;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0054;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0054;
      expv[28] = 15'h2208;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h0000;
      expv[37] = 15'h4a01;
      expv[38] = 15'h0000;
      expv[39] = 15'h120c;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h120c;
      expv[43] = 15'h0000;
      expv[44] = 15'h0000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h1710;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h1090;
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
