// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07951 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h0920aaceba5;
    stim[1] = 42'h05a37249255;
    stim[2] = 42'h14612c75c63;
    stim[3] = 42'h0cb047fdf29;
    stim[4] = 42'h3a668cef041;
    stim[5] = 42'h17f25a57f7d;
    stim[6] = 42'h28f4dd692e0;
    stim[7] = 42'h29c9b3895dd;
    stim[8] = 42'h24892184cd1;
    stim[9] = 42'h0dcaecce862;
    stim[10] = 42'h04fc7d4507f;
    stim[11] = 42'h38456882e2d;
    stim[12] = 42'h24e52c0497d;
    stim[13] = 42'h157463a1144;
    stim[14] = 42'h24e799562a5;
    stim[15] = 42'h0abbb3b2520;
    stim[16] = 42'h34eee206776;
    stim[17] = 42'h073aac4d486;
    stim[18] = 42'h01c82d0ff84;
    stim[19] = 42'h12e9ffd669a;
    stim[20] = 42'h35d9d7f6568;
    stim[21] = 42'h021095f1956;
    stim[22] = 42'h23d13c4d6b6;
    stim[23] = 42'h12f3e99410c;
    stim[24] = 42'h01baf23fe32;
    stim[25] = 42'h0ef4b5ae483;
    stim[26] = 42'h295e9c9d788;
    stim[27] = 42'h0bf183e14c2;
    stim[28] = 42'h2844e7bce4a;
    stim[29] = 42'h0ae27b5aecc;
    stim[30] = 42'h15710f26d64;
    stim[31] = 42'h115d993aa22;
    stim[32] = 42'h397ecf522a6;
    stim[33] = 42'h2026d499817;
    stim[34] = 42'h14abbd90374;
    stim[35] = 42'h3ffaa3f16d3;
    stim[36] = 42'h2764a54564a;
    stim[37] = 42'h1bd5fcfd79a;
    stim[38] = 42'h3f7b886d7f0;
    stim[39] = 42'h1a805c9c5f0;
    stim[40] = 42'h3160b529bb4;
    stim[41] = 42'h382d23ddbec;
    stim[42] = 42'h3bdbf53e5d9;
    stim[43] = 42'h2e71e406d39;
    stim[44] = 42'h33acb8cd2c5;
    stim[45] = 42'h186c9d3c73b;
    stim[46] = 42'h226d4e2e754;
    stim[47] = 42'h32f22679698;
    stim[48] = 42'h3737c30e6ac;
    stim[49] = 42'h378a0c00960;
    stim[50] = 42'h13ef401c385;
    stim[51] = 42'h2aa4115e25a;
    stim[52] = 42'h0725577bfdc;
    stim[53] = 42'h16d28ff32fe;
    stim[54] = 42'h3bd753f0c48;
    stim[55] = 42'h20935521cfc;
    stim[56] = 42'h116f8df8d4a;
    stim[57] = 42'h16f5e0f4399;
    stim[58] = 42'h3a8a5817f6e;
    stim[59] = 42'h27a67b131c5;
    stim[60] = 42'h2764a6a3bc0;
    stim[61] = 42'h2d0d7524451;
    stim[62] = 42'h01c44d4e6bd;
    stim[63] = 42'h1f8666f9c99;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxx000;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'h3f92d2bfbexxx;
      expv[7] = 51'h3f92d2bfbe000;
      expv[8] = 51'h3f92d2bfbe000;
      expv[9] = 51'h3f92d2bfbe000;
      expv[10] = 51'h3f92d2bfbe000;
      expv[11] = 51'h3f92d2bfbe000;
      expv[12] = 51'h3f92d2bfbe000;
      expv[13] = 51'h27296024be002;
      expv[14] = 51'h27296024be000;
      expv[15] = 51'h27296024be000;
      expv[16] = 51'h27296024be000;
      expv[17] = 51'h27296024be000;
      expv[18] = 51'h27296024be000;
      expv[19] = 51'h27296024be000;
      expv[20] = 51'h174ffeb34c100;
      expv[21] = 51'h174ffeb34c000;
      expv[22] = 51'h174ffeb34c000;
      expv[23] = 51'h1e89e26b5a100;
      expv[24] = 51'h1e89e26b5a000;
      expv[25] = 51'h0dd791ff18200;
      expv[26] = 51'h0dd791ff18000;
      expv[27] = 51'h0dd791ff18000;
      expv[28] = 51'h5f8c1f0a60100;
      expv[29] = 51'h5f8c1f0a60000;
      expv[30] = 51'h5f8c1f0a60000;
      expv[31] = 51'h2b887936b2008;
      expv[32] = 51'h2b887936b2000;
      expv[33] = 51'h2b887936b2000;
      expv[34] = 51'h2b887936b2000;
      expv[35] = 51'h255dec81ba008;
      expv[36] = 51'h255dec81ba000;
      expv[37] = 51'h255dec81ba000;
      expv[38] = 51'h255dec81ba000;
      expv[39] = 51'h7bdc436bf8080;
      expv[40] = 51'h7bdc436bf8000;
      expv[41] = 51'h7bdc436bf8000;
      expv[42] = 51'h7bdc436bf8000;
      expv[43] = 51'h7bdc436bf8000;
      expv[44] = 51'h7bdc436bf8000;
      expv[45] = 51'h7bdc436bf8000;
      expv[46] = 51'h7bdc436bf8000;
      expv[47] = 51'h7bdc436bf8000;
      expv[48] = 51'h7bdc436bf8000;
      expv[49] = 51'h39be187356040;
      expv[50] = 51'h39be187356000;
      expv[51] = 51'h39be187356000;
      expv[52] = 51'h39be187356000;
      expv[53] = 51'h39be187356000;
      expv[54] = 51'h39be187356000;
      expv[55] = 51'h5eba9f8624020;
      expv[56] = 51'h5eba9f8624000;
      expv[57] = 51'h0b7c6fc6a4001;
      expv[58] = 51'h0b7c6fc6a4000;
      expv[59] = 51'h0b7c6fc6a4000;
      expv[60] = 51'h3d33d898e2040;
      expv[61] = 51'h3d33d898e2000;
      expv[62] = 51'h686ba92228800;
      expv[63] = 51'h686ba92228000;
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
