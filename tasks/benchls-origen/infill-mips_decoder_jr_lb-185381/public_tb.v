// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185381 dut (
    .opcode(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .RegDst(out_vec[16:15]),
    .AluSrc(out_vec[14:14]),
    .MemWrite(out_vec[13:13]),
    .RegWrite(out_vec[12:12]),
    .wd_sel(out_vec[11:10]),
    .NpcSel(out_vec[9:7]),
    .ExtOp(out_vec[6:5]),
    .AluCtrl(out_vec[4:1]),
    .lb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hfbe;
    stim[1] = 12'hc63;
    stim[2] = 12'he06;
    stim[3] = 12'h990;
    stim[4] = 12'h4b9;
    stim[5] = 12'hc54;
    stim[6] = 12'h485;
    stim[7] = 12'h2e7;
    stim[8] = 12'h32c;
    stim[9] = 12'h48b;
    stim[10] = 12'h888;
    stim[11] = 12'hd39;
    stim[12] = 12'hb74;
    stim[13] = 12'h6f0;
    stim[14] = 12'hf33;
    stim[15] = 12'heac;
    stim[16] = 12'h5f7;
    stim[17] = 12'h8d1;
    stim[18] = 12'h65e;
    stim[19] = 12'h9d3;
    stim[20] = 12'h9a0;
    stim[21] = 12'h037;
    stim[22] = 12'h93a;
    stim[23] = 12'hb19;
    stim[24] = 12'h7d3;
    stim[25] = 12'h6ac;
    stim[26] = 12'h9f1;
    stim[27] = 12'heda;
    stim[28] = 12'hc29;
    stim[29] = 12'h2b0;
    stim[30] = 12'hc1a;
    stim[31] = 12'h597;
    stim[32] = 12'he12;
    stim[33] = 12'hc9e;
    stim[34] = 12'haee;
    stim[35] = 12'hf3e;
    stim[36] = 12'h7e2;
    stim[37] = 12'h415;
    stim[38] = 12'h04f;
    stim[39] = 12'hde5;
    stim[40] = 12'hfa2;
    stim[41] = 12'h78d;
    stim[42] = 12'h21f;
    stim[43] = 12'h8c8;
    stim[44] = 12'hfac;
    stim[45] = 12'h393;
    stim[46] = 12'hf6b;
    stim[47] = 12'hd29;
    stim[48] = 12'hf38;
    stim[49] = 12'h9be;
    stim[50] = 12'h7d5;
    stim[51] = 12'h11e;
    stim[52] = 12'h64e;
    stim[53] = 12'hc06;
    stim[54] = 12'h549;
    stim[55] = 12'hf1b;
    stim[56] = 12'h319;
    stim[57] = 12'h237;
    stim[58] = 12'h3ab;
    stim[59] = 12'hc41;
    stim[60] = 12'h9fc;
    stim[61] = 12'h3ef;
    stim[62] = 12'h3d4;
    stim[63] = 12'h1b0;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h09000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h06000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h05000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00082;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h05000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h0504a;
      expv[62] = 17'h0504a;
      expv[63] = 17'h00000;
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
