// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007695 dut (
    .addr(in_vec[35:4]),
    .num(in_vec[3:2]),
    .MemRead_i(in_vec[1:1]),
    .MemWrite_i(in_vec[0:0]),
    .MemRead_o(out_vec[3:3]),
    .MemWrite_o(out_vec[2:2]),
    .error_addressOverflow_o(out_vec[1:1]),
    .error_dataMisalign_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h443d9befd;
    stim[1] = 36'ha670b3357;
    stim[2] = 36'h2b619772d;
    stim[3] = 36'h22a1be910;
    stim[4] = 36'hda1e45d3b;
    stim[5] = 36'hea1d8f42d;
    stim[6] = 36'h43e1dc5a7;
    stim[7] = 36'hcf6ae7df7;
    stim[8] = 36'hb9eaf9e55;
    stim[9] = 36'h09397fe33;
    stim[10] = 36'h0fa8407ef;
    stim[11] = 36'hf6c0e9ad0;
    stim[12] = 36'h72ad2696f;
    stim[13] = 36'h59d68c7f1;
    stim[14] = 36'h96d4b9e5f;
    stim[15] = 36'he00dd4e84;
    stim[16] = 36'hb7296ed40;
    stim[17] = 36'h7126a62ba;
    stim[18] = 36'h4dd9574db;
    stim[19] = 36'h8018d52d2;
    stim[20] = 36'hfb1471170;
    stim[21] = 36'h30faea1ab;
    stim[22] = 36'hadeb43705;
    stim[23] = 36'h29d64b078;
    stim[24] = 36'hc985cf529;
    stim[25] = 36'h903c361d5;
    stim[26] = 36'h0dfd8367c;
    stim[27] = 36'h2dbc4f4c1;
    stim[28] = 36'h24bc620ea;
    stim[29] = 36'hbefdf6e8e;
    stim[30] = 36'h86b949915;
    stim[31] = 36'h660324b79;
    stim[32] = 36'h6d67b2dfc;
    stim[33] = 36'h354194ce8;
    stim[34] = 36'h3597361e9;
    stim[35] = 36'h456df2fef;
    stim[36] = 36'hd636b9e77;
    stim[37] = 36'h7ce160814;
    stim[38] = 36'h463b79fd4;
    stim[39] = 36'h826fc501e;
    stim[40] = 36'he93af9973;
    stim[41] = 36'hd7c1c84e8;
    stim[42] = 36'hac4732ecb;
    stim[43] = 36'heef9be6ca;
    stim[44] = 36'h731ae1f5b;
    stim[45] = 36'hf930e30a2;
    stim[46] = 36'hf6012c6be;
    stim[47] = 36'hc2c076e1b;
    stim[48] = 36'heab86492b;
    stim[49] = 36'h9cbff1f09;
    stim[50] = 36'hd6e475805;
    stim[51] = 36'h240e844d6;
    stim[52] = 36'hcdd9db294;
    stim[53] = 36'hd57428e90;
    stim[54] = 36'hde32927f3;
    stim[55] = 36'h1899e3951;
    stim[56] = 36'h2e098d26b;
    stim[57] = 36'he4f73dae0;
    stim[58] = 36'hc1c745545;
    stim[59] = 36'ha7e2e7e87;
    stim[60] = 36'h748810c4c;
    stim[61] = 36'he83ff90b7;
    stim[62] = 36'h0744bdd78;
    stim[63] = 36'hace7d551f;
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
      expv[0] = 4'h3;
      expv[1] = 4'h2;
      expv[2] = 4'h3;
      expv[3] = 4'h1;
      expv[4] = 4'h3;
      expv[5] = 4'h3;
      expv[6] = 4'h2;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'h1;
      expv[10] = 4'h3;
      expv[11] = 4'h1;
      expv[12] = 4'h3;
      expv[13] = 4'h1;
      expv[14] = 4'h3;
      expv[15] = 4'h2;
      expv[16] = 4'h1;
      expv[17] = 4'h3;
      expv[18] = 4'h3;
      expv[19] = 4'h1;
      expv[20] = 4'h1;
      expv[21] = 4'h2;
      expv[22] = 4'h2;
      expv[23] = 4'h3;
      expv[24] = 4'h2;
      expv[25] = 4'h2;
      expv[26] = 4'h3;
      expv[27] = 4'h1;
      expv[28] = 4'h2;
      expv[29] = 4'h2;
      expv[30] = 4'h2;
      expv[31] = 4'h3;
      expv[32] = 4'h3;
      expv[33] = 4'h2;
      expv[34] = 4'h2;
      expv[35] = 4'h3;
      expv[36] = 4'h2;
      expv[37] = 4'h2;
      expv[38] = 4'h2;
      expv[39] = 4'h3;
      expv[40] = 4'h1;
      expv[41] = 4'h2;
      expv[42] = 4'h2;
      expv[43] = 4'h2;
      expv[44] = 4'h3;
      expv[45] = 4'h1;
      expv[46] = 4'h3;
      expv[47] = 4'h3;
      expv[48] = 4'h2;
      expv[49] = 4'h2;
      expv[50] = 4'h2;
      expv[51] = 4'h2;
      expv[52] = 4'h2;
      expv[53] = 4'h1;
      expv[54] = 4'h1;
      expv[55] = 4'h1;
      expv[56] = 4'h2;
      expv[57] = 4'h1;
      expv[58] = 4'h2;
      expv[59] = 4'h2;
      expv[60] = 4'h2;
      expv[61] = 4'h2;
      expv[62] = 4'h3;
      expv[63] = 4'h3;
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
