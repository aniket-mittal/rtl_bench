// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09311 dut (
    .clk(clk),
    .eai_csr_valid(in_vec[66:66]),
    .eai_csr_addr(in_vec[65:34]),
    .eai_csr_wr(in_vec[33:33]),
    .eai_csr_wdata(in_vec[32:1]),
    .rst_n(in_vec[0:0]),
    .eai_csr_ready(out_vec[32:32]),
    .eai_csr_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h6ea8ce9b895718a8a;
    stim[1] = 67'h6c75e33f5f5e6f796;
    stim[2] = 67'h1e6a3480e543498c1;
    stim[3] = 67'h189791221ca83b5a1;
    stim[4] = 67'h40de33ba0b3f8e5c7;
    stim[5] = 67'h4a2f2a9bbba21df4d;
    stim[6] = 67'h095996d128f5a5441;
    stim[7] = 67'h4732f3eae7fcfa203;
    stim[8] = 67'h5a21d97e1ada40d2f;
    stim[9] = 67'h4a242c9973de6273d;
    stim[10] = 67'h1f933e9be6a718841;
    stim[11] = 67'h562e84158ae4ebb13;
    stim[12] = 67'h6c922fb78a2bc83c7;
    stim[13] = 67'h0e6149e6ba113dfe1;
    stim[14] = 67'h17b21ee1fe480ab99;
    stim[15] = 67'h017b42829e3912f6b;
    stim[16] = 67'h6c9b6b3119cb88c11;
    stim[17] = 67'h24aa0f086203384f7;
    stim[18] = 67'h7f57b87ee9a65b82f;
    stim[19] = 67'h467ca1e37ca3a250d;
    stim[20] = 67'h206c8b5af33aec1b9;
    stim[21] = 67'h169b078e4a8a0eced;
    stim[22] = 67'h3f804b51e7d81a751;
    stim[23] = 67'h45821f97fce179ca9;
    stim[24] = 67'h6d3508c9fd88fc983;
    stim[25] = 67'h6fe099ae3c02ed69d;
    stim[26] = 67'h19de4cd9866dba3b1;
    stim[27] = 67'h4eb48a6b550bf4dc5;
    stim[28] = 67'h784405493c38afd05;
    stim[29] = 67'h78a6460b69522790f;
    stim[30] = 67'h709804152d65a0a69;
    stim[31] = 67'h3e7398db3a1d256bb;
    stim[32] = 67'h69618fa1f389b7a0b;
    stim[33] = 67'h0f1264089066434f9;
    stim[34] = 67'h3c363e9aafd31c837;
    stim[35] = 67'h751b232f82b4bba57;
    stim[36] = 67'h20d808a4c999e7e31;
    stim[37] = 67'h1e14206b09e369423;
    stim[38] = 67'h39a327f82110cc399;
    stim[39] = 67'h1e78af25ac810a187;
    stim[40] = 67'h35e81104aca118da9;
    stim[41] = 67'h3a3922521ffcc51f3;
    stim[42] = 67'h582a7d85971b62d47;
    stim[43] = 67'h55839ee22275a7049;
    stim[44] = 67'h2f6d06d721a1bec9d;
    stim[45] = 67'h3aac32bb11d6862e9;
    stim[46] = 67'h7d4bba5b03f81516f;
    stim[47] = 67'h28e19baa6b63fa1fd;
    stim[48] = 67'h729496c55734e66e9;
    stim[49] = 67'h698efe93f5e06de9f;
    stim[50] = 67'h6fa0756fc0782aa63;
    stim[51] = 67'h4b5d55383ff083e7b;
    stim[52] = 67'h70997433f43b3d61d;
    stim[53] = 67'h0e851224248f5771b;
    stim[54] = 67'h2e75d2521b5866593;
    stim[55] = 67'h2d1827b9d5e00bfc3;
    stim[56] = 67'h12f2d2908d17b3b91;
    stim[57] = 67'h71c61a3e1fbd6e78e;
    stim[58] = 67'h75431e2286a060d5b;
    stim[59] = 67'h366c15f1ac1d770bf;
    stim[60] = 67'h2bad835ebf95d807f;
    stim[61] = 67'h4bf978acfd70194e1;
    stim[62] = 67'h2c3b83a18002d3b0b;
    stim[63] = 67'h001ff969695ca4577;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h100000000;
      expv[1] = 33'h100000000;
      expv[2] = 33'h100000000;
      expv[3] = 33'h100000000;
      expv[4] = 33'h100000000;
      expv[5] = 33'h100000000;
      expv[6] = 33'h100000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000000;
      expv[10] = 33'h100000000;
      expv[11] = 33'h100000000;
      expv[12] = 33'h100000000;
      expv[13] = 33'h100000000;
      expv[14] = 33'h100000000;
      expv[15] = 33'h100000000;
      expv[16] = 33'h100000000;
      expv[17] = 33'h100000000;
      expv[18] = 33'h100000000;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000000;
      expv[22] = 33'h100000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000000;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000000;
      expv[46] = 33'h100000000;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000000;
      expv[54] = 33'h100000000;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000000;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000000;
      expv[61] = 33'h100000000;
      expv[62] = 33'h100000000;
      expv[63] = 33'h100000000;
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
