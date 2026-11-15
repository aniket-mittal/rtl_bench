// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_181635 dut (
    .iIR_opcode(in_vec[11:6]),
    .iIR_func(in_vec[5:0]),
    .oALUOp(out_vec[13:12]),
    .oMemToReg(out_vec[11:10]),
    .oMemWrite(out_vec[9:9]),
    .oRegDST(out_vec[8:7]),
    .oRegWrite(out_vec[6:6]),
    .oJump(out_vec[5:5]),
    .oALUSrc(out_vec[4:4]),
    .oBranch(out_vec[3:3]),
    .oExtOp(out_vec[2:2]),
    .oJAL(out_vec[1:1]),
    .oJR(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h6ff;
    stim[1] = 12'h210;
    stim[2] = 12'h46f;
    stim[3] = 12'h529;
    stim[4] = 12'h73c;
    stim[5] = 12'h614;
    stim[6] = 12'hae3;
    stim[7] = 12'hbe2;
    stim[8] = 12'ha10;
    stim[9] = 12'h117;
    stim[10] = 12'hac7;
    stim[11] = 12'h375;
    stim[12] = 12'h2be;
    stim[13] = 12'h1d7;
    stim[14] = 12'h4f9;
    stim[15] = 12'h8b0;
    stim[16] = 12'he52;
    stim[17] = 12'h93e;
    stim[18] = 12'h3b3;
    stim[19] = 12'h08d;
    stim[20] = 12'h07a;
    stim[21] = 12'h795;
    stim[22] = 12'h43d;
    stim[23] = 12'ha1b;
    stim[24] = 12'h180;
    stim[25] = 12'h2ed;
    stim[26] = 12'h268;
    stim[27] = 12'h000;
    stim[28] = 12'h818;
    stim[29] = 12'hcc2;
    stim[30] = 12'h4bc;
    stim[31] = 12'h4c9;
    stim[32] = 12'he69;
    stim[33] = 12'h488;
    stim[34] = 12'hb01;
    stim[35] = 12'had1;
    stim[36] = 12'h4b4;
    stim[37] = 12'h2c0;
    stim[38] = 12'hfcc;
    stim[39] = 12'ha20;
    stim[40] = 12'h65e;
    stim[41] = 12'h7d9;
    stim[42] = 12'hbf7;
    stim[43] = 12'hbf6;
    stim[44] = 12'h61b;
    stim[45] = 12'h5f5;
    stim[46] = 12'h72f;
    stim[47] = 12'h0fe;
    stim[48] = 12'h0ff;
    stim[49] = 12'h65c;
    stim[50] = 12'ha54;
    stim[51] = 12'h02b;
    stim[52] = 12'h8f3;
    stim[53] = 12'h493;
    stim[54] = 12'hc10;
    stim[55] = 12'h21b;
    stim[56] = 12'h52f;
    stim[57] = 12'hf25;
    stim[58] = 12'h2b8;
    stim[59] = 12'hb1a;
    stim[60] = 12'h2ee;
    stim[61] = 12'h9b3;
    stim[62] = 12'hb4d;
    stim[63] = 12'hd07;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0050;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0210;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0008;
      expv[10] = 14'h0210;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0020;
      expv[20] = 14'h0008;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h20c4;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
      expv[33] = 14'h0000;
      expv[34] = 14'h0000;
      expv[35] = 14'h0210;
      expv[36] = 14'h0000;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h0000;
      expv[46] = 14'h0000;
      expv[47] = 14'h0142;
      expv[48] = 14'h0142;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h20c4;
      expv[52] = 14'h0450;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0050;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h0000;
      expv[59] = 14'h0000;
      expv[60] = 14'h0000;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0000;
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
