// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02252 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0949e2;
    stim[1] = 22'h05e8e8;
    stim[2] = 22'h27e063;
    stim[3] = 22'h33a20e;
    stim[4] = 22'h37808e;
    stim[5] = 22'h0b74a1;
    stim[6] = 22'h22c0bb;
    stim[7] = 22'h3eb35d;
    stim[8] = 22'h1bfeeb;
    stim[9] = 22'h172a81;
    stim[10] = 22'h071cb9;
    stim[11] = 22'h12b3d4;
    stim[12] = 22'h1f304a;
    stim[13] = 22'h256bf1;
    stim[14] = 22'h1ed0db;
    stim[15] = 22'h0b8bba;
    stim[16] = 22'h07447c;
    stim[17] = 22'h2308b7;
    stim[18] = 22'h1f6ffc;
    stim[19] = 22'h2f8fde;
    stim[20] = 22'h0edafd;
    stim[21] = 22'h0bdd66;
    stim[22] = 22'h121825;
    stim[23] = 22'h067dc6;
    stim[24] = 22'h132972;
    stim[25] = 22'h179bfa;
    stim[26] = 22'h03ab14;
    stim[27] = 22'h2211c9;
    stim[28] = 22'h1fd7a5;
    stim[29] = 22'h3a7d9e;
    stim[30] = 22'h0e13ca;
    stim[31] = 22'h3e73ff;
    stim[32] = 22'h0a9fd8;
    stim[33] = 22'h126755;
    stim[34] = 22'h0206ab;
    stim[35] = 22'h221e96;
    stim[36] = 22'h3b0e1a;
    stim[37] = 22'h2b0f4e;
    stim[38] = 22'h237c33;
    stim[39] = 22'h235c69;
    stim[40] = 22'h1e211a;
    stim[41] = 22'h12c92f;
    stim[42] = 22'h1ee65e;
    stim[43] = 22'h02518d;
    stim[44] = 22'h02e5c1;
    stim[45] = 22'h1fe2ba;
    stim[46] = 22'h1d1646;
    stim[47] = 22'h0ea49f;
    stim[48] = 22'h07ec4d;
    stim[49] = 22'h067af6;
    stim[50] = 22'h37ae7d;
    stim[51] = 22'h1ae53b;
    stim[52] = 22'h239ea5;
    stim[53] = 22'h3a54fd;
    stim[54] = 22'h229857;
    stim[55] = 22'h26c469;
    stim[56] = 22'h0e5244;
    stim[57] = 22'h2ac22d;
    stim[58] = 22'h1e536d;
    stim[59] = 22'h149e3f;
    stim[60] = 22'h1baa66;
    stim[61] = 22'h172cbb;
    stim[62] = 22'h2b2946;
    stim[63] = 22'h0633a1;
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
      expv[10] = 17'h0c34f;
      expv[11] = 17'h00000;
      expv[12] = 17'h0c34f;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h0d0db;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h0000d;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h00002;
      expv[25] = 17'h0c34f;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00002;
      expv[28] = 17'h00000;
      expv[29] = 17'h0d0db;
      expv[30] = 17'h00000;
      expv[31] = 17'h0000d;
      expv[32] = 17'h00000;
      expv[33] = 17'h0000a;
      expv[34] = 17'h0c34f;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h0d0db;
      expv[42] = 17'h0c34f;
      expv[43] = 17'h0211a;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00002;
      expv[50] = 17'h00002;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h0000f;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h0c34f;
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
