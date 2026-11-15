// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_017796 dut (
    .opcode(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .RegRead(out_vec[5:5]),
    .RegWrite(out_vec[4:4]),
    .MemRead(out_vec[3:3]),
    .MemWrite(out_vec[2:2]),
    .RegDst(out_vec[1:1]),
    .Branch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h0c1;
    stim[1] = 12'h1e1;
    stim[2] = 12'hc00;
    stim[3] = 12'hf0c;
    stim[4] = 12'he18;
    stim[5] = 12'h66a;
    stim[6] = 12'hfb4;
    stim[7] = 12'h906;
    stim[8] = 12'ha8e;
    stim[9] = 12'h717;
    stim[10] = 12'h313;
    stim[11] = 12'h8af;
    stim[12] = 12'hc01;
    stim[13] = 12'heb5;
    stim[14] = 12'he44;
    stim[15] = 12'hf32;
    stim[16] = 12'h1cc;
    stim[17] = 12'h4b8;
    stim[18] = 12'hd19;
    stim[19] = 12'h9a9;
    stim[20] = 12'h8b6;
    stim[21] = 12'ha1d;
    stim[22] = 12'h391;
    stim[23] = 12'heca;
    stim[24] = 12'h76d;
    stim[25] = 12'hc4f;
    stim[26] = 12'hef4;
    stim[27] = 12'h90a;
    stim[28] = 12'h5cb;
    stim[29] = 12'h77f;
    stim[30] = 12'hd95;
    stim[31] = 12'h169;
    stim[32] = 12'h757;
    stim[33] = 12'h8e7;
    stim[34] = 12'h295;
    stim[35] = 12'h26a;
    stim[36] = 12'haaa;
    stim[37] = 12'hc88;
    stim[38] = 12'hb44;
    stim[39] = 12'he8e;
    stim[40] = 12'h678;
    stim[41] = 12'hcfb;
    stim[42] = 12'hc38;
    stim[43] = 12'h5e4;
    stim[44] = 12'h927;
    stim[45] = 12'hc7d;
    stim[46] = 12'h7b1;
    stim[47] = 12'hdf4;
    stim[48] = 12'h2e2;
    stim[49] = 12'hfbf;
    stim[50] = 12'h3a8;
    stim[51] = 12'hee8;
    stim[52] = 12'hdad;
    stim[53] = 12'h7c8;
    stim[54] = 12'h102;
    stim[55] = 12'hfa8;
    stim[56] = 12'h291;
    stim[57] = 12'hc34;
    stim[58] = 12'h2d4;
    stim[59] = 12'he35;
    stim[60] = 12'hfa9;
    stim[61] = 12'h045;
    stim[62] = 12'hf12;
    stim[63] = 12'hcbf;
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
      expv[0] = 6'h30;
      expv[1] = 6'h30;
      expv[2] = 6'h30;
      expv[3] = 6'h30;
      expv[4] = 6'h30;
      expv[5] = 6'h30;
      expv[6] = 6'h30;
      expv[7] = 6'h30;
      expv[8] = 6'h30;
      expv[9] = 6'h30;
      expv[10] = 6'h30;
      expv[11] = 6'h30;
      expv[12] = 6'h30;
      expv[13] = 6'h30;
      expv[14] = 6'h30;
      expv[15] = 6'h30;
      expv[16] = 6'h30;
      expv[17] = 6'h30;
      expv[18] = 6'h30;
      expv[19] = 6'h30;
      expv[20] = 6'h30;
      expv[21] = 6'h24;
      expv[22] = 6'h30;
      expv[23] = 6'h30;
      expv[24] = 6'h30;
      expv[25] = 6'h30;
      expv[26] = 6'h30;
      expv[27] = 6'h30;
      expv[28] = 6'h30;
      expv[29] = 6'h30;
      expv[30] = 6'h30;
      expv[31] = 6'h21;
      expv[32] = 6'h30;
      expv[33] = 6'h28;
      expv[34] = 6'h30;
      expv[35] = 6'h30;
      expv[36] = 6'h30;
      expv[37] = 6'h30;
      expv[38] = 6'h30;
      expv[39] = 6'h30;
      expv[40] = 6'h30;
      expv[41] = 6'h30;
      expv[42] = 6'h30;
      expv[43] = 6'h30;
      expv[44] = 6'h30;
      expv[45] = 6'h30;
      expv[46] = 6'h30;
      expv[47] = 6'h30;
      expv[48] = 6'h30;
      expv[49] = 6'h30;
      expv[50] = 6'h30;
      expv[51] = 6'h30;
      expv[52] = 6'h30;
      expv[53] = 6'h30;
      expv[54] = 6'h21;
      expv[55] = 6'h30;
      expv[56] = 6'h30;
      expv[57] = 6'h30;
      expv[58] = 6'h30;
      expv[59] = 6'h30;
      expv[60] = 6'h30;
      expv[61] = 6'h30;
      expv[62] = 6'h30;
      expv[63] = 6'h30;
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
