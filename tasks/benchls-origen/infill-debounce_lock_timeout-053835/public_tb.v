// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053835 dut (
    .clk(clk),
    .reset(in_vec[34:34]),
    .sig_in(in_vec[33:33]),
    .unlock(in_vec[32:32]),
    .timeout(in_vec[31:0]),
    .sig_out(out_vec[9:9]),
    .sig_changed(out_vec[8:8]),
    .cycles(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h653b021d4;
    stim[1] = 35'h5eb1be514;
    stim[2] = 35'h0efa9a62a;
    stim[3] = 35'h07ac3c2d0;
    stim[4] = 35'h00b142dab;
    stim[5] = 35'h3d2ff8e24;
    stim[6] = 35'h053437788;
    stim[7] = 35'h30f2201c1;
    stim[8] = 35'h3c8cb67dc;
    stim[9] = 35'h297a00b1a;
    stim[10] = 35'h380249b95;
    stim[11] = 35'h25c04784a;
    stim[12] = 35'h0c3a638d4;
    stim[13] = 35'h18ae34247;
    stim[14] = 35'h20b84b616;
    stim[15] = 35'h35717962e;
    stim[16] = 35'h0079018e7;
    stim[17] = 35'h1e973bf7e;
    stim[18] = 35'h1654a6e3b;
    stim[19] = 35'h37a2ddd9b;
    stim[20] = 35'h27b93524c;
    stim[21] = 35'h1791aa9f1;
    stim[22] = 35'h2070e640f;
    stim[23] = 35'h18e17e6eb;
    stim[24] = 35'h09916c59c;
    stim[25] = 35'h0f81db199;
    stim[26] = 35'h00e9afbc6;
    stim[27] = 35'h31247d413;
    stim[28] = 35'h300db792b;
    stim[29] = 35'h3937155bf;
    stim[30] = 35'h0b927f357;
    stim[31] = 35'h05f3a9e24;
    stim[32] = 35'h2c146ac4b;
    stim[33] = 35'h351c0be96;
    stim[34] = 35'h3129bc31d;
    stim[35] = 35'h3670ca91b;
    stim[36] = 35'h0b6e43fed;
    stim[37] = 35'h218494a32;
    stim[38] = 35'h01d613499;
    stim[39] = 35'h2be10bb53;
    stim[40] = 35'h2b3b107e7;
    stim[41] = 35'h13b7d7d8a;
    stim[42] = 35'h28038beac;
    stim[43] = 35'h30c327f3b;
    stim[44] = 35'h23c5d7be5;
    stim[45] = 35'h04a1e3804;
    stim[46] = 35'h35b210601;
    stim[47] = 35'h0c02a87a8;
    stim[48] = 35'h0534dffa1;
    stim[49] = 35'h1c10895af;
    stim[50] = 35'h3446b9264;
    stim[51] = 35'h342ad0960;
    stim[52] = 35'h32d554f16;
    stim[53] = 35'h0592619d6;
    stim[54] = 35'h0c8e1f2d9;
    stim[55] = 35'h083197b08;
    stim[56] = 35'h2c6b4a5b6;
    stim[57] = 35'h0ad7f440a;
    stim[58] = 35'h271a073c6;
    stim[59] = 35'h2f7d5a5d7;
    stim[60] = 35'h39aa6505b;
    stim[61] = 35'h150d05eab;
    stim[62] = 35'h2aa80f38d;
    stim[63] = 35'h1f5a7547b;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
