// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02412 dut (
    .clk(clk),
    .wr(in_vec[16:16]),
    .data_in(in_vec[15:0]),
    .data_out(out_vec[20:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h08502;
    stim[1] = 17'h1a7ce;
    stim[2] = 17'h1bca3;
    stim[3] = 17'h18114;
    stim[4] = 17'h10912;
    stim[5] = 17'h11c67;
    stim[6] = 17'h06511;
    stim[7] = 17'h1412c;
    stim[8] = 17'h15300;
    stim[9] = 17'h0c2e3;
    stim[10] = 17'h1ab54;
    stim[11] = 17'h1afef;
    stim[12] = 17'h09499;
    stim[13] = 17'h05058;
    stim[14] = 17'h12928;
    stim[15] = 17'h0b8ab;
    stim[16] = 17'h0fb07;
    stim[17] = 17'h1b331;
    stim[18] = 17'h0c9b9;
    stim[19] = 17'h090dd;
    stim[20] = 17'h05df0;
    stim[21] = 17'h1fac1;
    stim[22] = 17'h07abf;
    stim[23] = 17'h02246;
    stim[24] = 17'h036d7;
    stim[25] = 17'h1e4c2;
    stim[26] = 17'h08c14;
    stim[27] = 17'h06760;
    stim[28] = 17'h196c7;
    stim[29] = 17'h0a4d5;
    stim[30] = 17'h0e41c;
    stim[31] = 17'h02700;
    stim[32] = 17'h0ebcc;
    stim[33] = 17'h01bcb;
    stim[34] = 17'h1ff84;
    stim[35] = 17'h192af;
    stim[36] = 17'h1f99f;
    stim[37] = 17'h12525;
    stim[38] = 17'h1b241;
    stim[39] = 17'h00996;
    stim[40] = 17'h1c11e;
    stim[41] = 17'h1b152;
    stim[42] = 17'h0f216;
    stim[43] = 17'h11de6;
    stim[44] = 17'h0887c;
    stim[45] = 17'h0e40b;
    stim[46] = 17'h078c3;
    stim[47] = 17'h09024;
    stim[48] = 17'h01630;
    stim[49] = 17'h1d6c4;
    stim[50] = 17'h1ace2;
    stim[51] = 17'h0d953;
    stim[52] = 17'h0dce1;
    stim[53] = 17'h195eb;
    stim[54] = 17'h1a1db;
    stim[55] = 17'h1b82e;
    stim[56] = 17'h09376;
    stim[57] = 17'h0da7b;
    stim[58] = 17'h14575;
    stim[59] = 17'h1590f;
    stim[60] = 17'h16dfb;
    stim[61] = 17'h179c6;
    stim[62] = 17'h1fafc;
    stim[63] = 17'h054cc;
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
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'hxxxxxx;
      expv[2] = 21'hxxxxxx;
      expv[3] = 21'hxxxxxx;
      expv[4] = 21'hxxxxxx;
      expv[5] = 21'hxxxxxx;
      expv[6] = 21'hxxxxxx;
      expv[7] = 21'hxxxxxx;
      expv[8] = 21'hxxxxxx;
      expv[9] = 21'hxxxxxx;
      expv[10] = 21'hxxxxxx;
      expv[11] = 21'hxxxxxx;
      expv[12] = 21'hxxxxxx;
      expv[13] = 21'hxxxxxx;
      expv[14] = 21'hxxxxxx;
      expv[15] = 21'hxxxxxx;
      expv[16] = 21'hxxxxxx;
      expv[17] = 21'hxxxxxx;
      expv[18] = 21'hxxxxxx;
      expv[19] = 21'hxxxxxx;
      expv[20] = 21'hxxxxxx;
      expv[21] = 21'hxxxxxx;
      expv[22] = 21'hxxxxxx;
      expv[23] = 21'hxxxxxx;
      expv[24] = 21'hxxxxxx;
      expv[25] = 21'hxxxxxx;
      expv[26] = 21'hxxxxxx;
      expv[27] = 21'hxxxxxx;
      expv[28] = 21'hxxxxxx;
      expv[29] = 21'hxxxxxx;
      expv[30] = 21'hxxxxxx;
      expv[31] = 21'hxxxxxx;
      expv[32] = 21'hxxxxxx;
      expv[33] = 21'hxxxxxx;
      expv[34] = 21'h131486;
      expv[35] = 21'h131486;
      expv[36] = 21'h131486;
      expv[37] = 21'h131486;
      expv[38] = 21'h131486;
      expv[39] = 21'h131486;
      expv[40] = 21'h131486;
      expv[41] = 21'h131486;
      expv[42] = 21'h131486;
      expv[43] = 21'h131486;
      expv[44] = 21'h131486;
      expv[45] = 21'h131486;
      expv[46] = 21'h131486;
      expv[47] = 21'h131486;
      expv[48] = 21'h131486;
      expv[49] = 21'h131486;
      expv[50] = 21'h131486;
      expv[51] = 21'h131486;
      expv[52] = 21'h131486;
      expv[53] = 21'h131486;
      expv[54] = 21'h131486;
      expv[55] = 21'h131486;
      expv[56] = 21'h131486;
      expv[57] = 21'h131486;
      expv[58] = 21'h131486;
      expv[59] = 21'h131486;
      expv[60] = 21'h131486;
      expv[61] = 21'h131486;
      expv[62] = 21'h131486;
      expv[63] = 21'h131486;
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
