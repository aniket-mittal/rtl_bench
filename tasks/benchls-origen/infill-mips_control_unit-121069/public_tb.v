// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_121069 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegDst(out_vec[10:10]),
    .ALUSrc(out_vec[9:9]),
    .MemToReg(out_vec[8:8]),
    .RegWr(out_vec[7:7]),
    .MemWr(out_vec[6:6]),
    .Jump(out_vec[5:5]),
    .JumpR(out_vec[4:4]),
    .readRs(out_vec[3:3]),
    .readRt(out_vec[2:2]),
    .ALUcntrl(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h43a;
    stim[1] = 12'h7c0;
    stim[2] = 12'hfd4;
    stim[3] = 12'h6b0;
    stim[4] = 12'h322;
    stim[5] = 12'hc2d;
    stim[6] = 12'h739;
    stim[7] = 12'h6a0;
    stim[8] = 12'ha57;
    stim[9] = 12'h1b5;
    stim[10] = 12'h627;
    stim[11] = 12'h70b;
    stim[12] = 12'hd4a;
    stim[13] = 12'h77c;
    stim[14] = 12'h8bc;
    stim[15] = 12'h1f2;
    stim[16] = 12'hf3d;
    stim[17] = 12'h177;
    stim[18] = 12'hdb8;
    stim[19] = 12'h732;
    stim[20] = 12'h99b;
    stim[21] = 12'h2ac;
    stim[22] = 12'hc01;
    stim[23] = 12'hcbf;
    stim[24] = 12'hf7a;
    stim[25] = 12'h493;
    stim[26] = 12'h5ba;
    stim[27] = 12'h20e;
    stim[28] = 12'h206;
    stim[29] = 12'h565;
    stim[30] = 12'hae9;
    stim[31] = 12'ha81;
    stim[32] = 12'h962;
    stim[33] = 12'he3c;
    stim[34] = 12'hf82;
    stim[35] = 12'hd6f;
    stim[36] = 12'h86d;
    stim[37] = 12'h774;
    stim[38] = 12'h8e3;
    stim[39] = 12'hd5e;
    stim[40] = 12'h123;
    stim[41] = 12'h0e5;
    stim[42] = 12'h943;
    stim[43] = 12'h590;
    stim[44] = 12'h473;
    stim[45] = 12'h3f9;
    stim[46] = 12'hc25;
    stim[47] = 12'hefc;
    stim[48] = 12'hb63;
    stim[49] = 12'hdef;
    stim[50] = 12'h157;
    stim[51] = 12'h504;
    stim[52] = 12'h3dc;
    stim[53] = 12'h8f1;
    stim[54] = 12'h5d2;
    stim[55] = 12'h854;
    stim[56] = 12'he36;
    stim[57] = 12'h766;
    stim[58] = 12'hc6a;
    stim[59] = 12'h6c0;
    stim[60] = 12'h359;
    stim[61] = 12'he2d;
    stim[62] = 12'h8c8;
    stim[63] = 12'he69;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h288;
      expv[28] = 11'h288;
      expv[29] = 11'h000;
      expv[30] = 11'h24c;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h388;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h388;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h388;
      expv[63] = 11'h000;
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
