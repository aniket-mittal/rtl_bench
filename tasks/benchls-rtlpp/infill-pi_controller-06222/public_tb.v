// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06222 dut (
    .clk(clk),
    .reset_n(in_vec[33:33]),
    .data_in_0(in_vec[32:17]),
    .data_in_1(in_vec[16:1]),
    .data_ready(in_vec[0:0]),
    .u(out_vec[16:1]),
    .pi_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h0b6a1fc6e;
    stim[1] = 34'h13fe07b6e;
    stim[2] = 34'h2ea079e48;
    stim[3] = 34'h2a65bac73;
    stim[4] = 34'h3a689aa66;
    stim[5] = 34'h2b0749a01;
    stim[6] = 34'h257b3f070;
    stim[7] = 34'h233309991;
    stim[8] = 34'h2046b7121;
    stim[9] = 34'h2d55c41f3;
    stim[10] = 34'h395371c31;
    stim[11] = 34'h36dd25b5a;
    stim[12] = 34'h2e33f50c8;
    stim[13] = 34'h258936526;
    stim[14] = 34'h2d3189da7;
    stim[15] = 34'h3e207626f;
    stim[16] = 34'h216b84ffb;
    stim[17] = 34'h3c2f11690;
    stim[18] = 34'h38521aa2b;
    stim[19] = 34'h370d558c9;
    stim[20] = 34'h36dab7c3d;
    stim[21] = 34'h38c7e8030;
    stim[22] = 34'h3926c1577;
    stim[23] = 34'h36ab460c3;
    stim[24] = 34'h23a290d12;
    stim[25] = 34'h2ca2ef8d6;
    stim[26] = 34'h390f924b1;
    stim[27] = 34'h26e035996;
    stim[28] = 34'h20bfddd43;
    stim[29] = 34'h2eb91a572;
    stim[30] = 34'h2aee4a668;
    stim[31] = 34'h323dbaad7;
    stim[32] = 34'h39f8ed857;
    stim[33] = 34'h31af58cde;
    stim[34] = 34'h2c541757a;
    stim[35] = 34'h3c7d73c72;
    stim[36] = 34'h341e735ff;
    stim[37] = 34'h27371f6c8;
    stim[38] = 34'h2e02e4633;
    stim[39] = 34'h2a2b7ccc6;
    stim[40] = 34'h2ef44a9f0;
    stim[41] = 34'h333858b79;
    stim[42] = 34'h2689cad9d;
    stim[43] = 34'h2f6988aec;
    stim[44] = 34'h227d0b30d;
    stim[45] = 34'h1dc5a9fe5;
    stim[46] = 34'h3ab5ec45b;
    stim[47] = 34'h20b00145b;
    stim[48] = 34'h2c1ae8a3f;
    stim[49] = 34'h3b18c263c;
    stim[50] = 34'h3dc65c5c7;
    stim[51] = 34'h244af7b60;
    stim[52] = 34'h322ca7bb5;
    stim[53] = 34'h22f330a7d;
    stim[54] = 34'h2f120802f;
    stim[55] = 34'h3de28fc2e;
    stim[56] = 34'h38891c0e3;
    stim[57] = 34'h28192aad6;
    stim[58] = 34'h30177e974;
    stim[59] = 34'h2a09cd71d;
    stim[60] = 34'h244babc9a;
    stim[61] = 34'h3b1bdb2dc;
    stim[62] = 34'h3a08300dc;
    stim[63] = 34'h3f33030e2;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00001;
      expv[4] = 17'h00001;
      expv[5] = 17'h00001;
      expv[6] = 17'h00000;
      expv[7] = 17'h00001;
      expv[8] = 17'h00001;
      expv[9] = 17'h00001;
      expv[10] = 17'h00001;
      expv[11] = 17'h00000;
      expv[12] = 17'hxxxxx;
      expv[13] = 17'hxxxxx;
      expv[14] = 17'hxxxxx;
      expv[15] = 17'hxxxxx;
      expv[16] = 17'hxxxxx;
      expv[17] = 17'h1f8d7;
      expv[18] = 17'h1f8d6;
      expv[19] = 17'h1f8d7;
      expv[20] = 17'h1f8d7;
      expv[21] = 17'h1f8d7;
      expv[22] = 17'h1f8d7;
      expv[23] = 17'h1f8d6;
      expv[24] = 17'hxxxxx;
      expv[25] = 17'hxxxxx;
      expv[26] = 17'hxxxxx;
      expv[27] = 17'hxxxxx;
      expv[28] = 17'hxxxxx;
      expv[29] = 17'h10de1;
      expv[30] = 17'h10de1;
      expv[31] = 17'h10de1;
      expv[32] = 17'h10de1;
      expv[33] = 17'h10de1;
      expv[34] = 17'h10de0;
      expv[35] = 17'h10de0;
      expv[36] = 17'h10de0;
      expv[37] = 17'h10de0;
      expv[38] = 17'h10de0;
      expv[39] = 17'h10de0;
      expv[40] = 17'hxxxxx;
      expv[41] = 17'h08e64;
      expv[42] = 17'h08e65;
      expv[43] = 17'h08e65;
      expv[44] = 17'h08e65;
      expv[45] = 17'h08e65;
      expv[46] = 17'h00000;
      expv[47] = 17'h00001;
      expv[48] = 17'h00001;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'hxxxxx;
      expv[56] = 17'h0b2b0;
      expv[57] = 17'h0b2b1;
      expv[58] = 17'h0b2b1;
      expv[59] = 17'h0b2b1;
      expv[60] = 17'h0b2b1;
      expv[61] = 17'h0b2b1;
      expv[62] = 17'h0b2b0;
      expv[63] = 17'h0b2b1;
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
