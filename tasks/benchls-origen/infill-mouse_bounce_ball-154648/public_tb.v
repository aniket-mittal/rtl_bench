// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_154648 dut (
    .clk(clk),
    .mouse_left(in_vec[24:24]),
    .mouse_xpos(in_vec[23:12]),
    .mouse_ypos(in_vec[11:0]),
    .xpos(out_vec[23:12]),
    .ypos(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h04b3d0f;
    stim[1] = 25'h1b130e9;
    stim[2] = 25'h17986f1;
    stim[3] = 25'h1fc7744;
    stim[4] = 25'h0380d80;
    stim[5] = 25'h052c970;
    stim[6] = 25'h1005c3a;
    stim[7] = 25'h122b069;
    stim[8] = 25'h16499c4;
    stim[9] = 25'h0b8fa11;
    stim[10] = 25'h184a09a;
    stim[11] = 25'h1257619;
    stim[12] = 25'h1d37653;
    stim[13] = 25'h1310a68;
    stim[14] = 25'h155d461;
    stim[15] = 25'h11d1132;
    stim[16] = 25'h0df34f2;
    stim[17] = 25'h16b535d;
    stim[18] = 25'h1bb94ee;
    stim[19] = 25'h1fbadf9;
    stim[20] = 25'h1b7f9dd;
    stim[21] = 25'h1809b48;
    stim[22] = 25'h0edb06d;
    stim[23] = 25'h179bef6;
    stim[24] = 25'h1ef899c;
    stim[25] = 25'h1d15bb5;
    stim[26] = 25'h1c3f0c0;
    stim[27] = 25'h0d26cdc;
    stim[28] = 25'h163828c;
    stim[29] = 25'h1a3100d;
    stim[30] = 25'h01bc0a3;
    stim[31] = 25'h164e961;
    stim[32] = 25'h0e87cd8;
    stim[33] = 25'h0f2e743;
    stim[34] = 25'h031f153;
    stim[35] = 25'h052e15b;
    stim[36] = 25'h048c6ef;
    stim[37] = 25'h1c9710e;
    stim[38] = 25'h06b914e;
    stim[39] = 25'h161c7b3;
    stim[40] = 25'h1c35161;
    stim[41] = 25'h0e2692d;
    stim[42] = 25'h05d0113;
    stim[43] = 25'h05d762a;
    stim[44] = 25'h10fc165;
    stim[45] = 25'h164322a;
    stim[46] = 25'h0dbed52;
    stim[47] = 25'h1c63933;
    stim[48] = 25'h19acc88;
    stim[49] = 25'h177ab46;
    stim[50] = 25'h0cc9d8c;
    stim[51] = 25'h0f82fc0;
    stim[52] = 25'h1227df0;
    stim[53] = 25'h0f23334;
    stim[54] = 25'h11b41bc;
    stim[55] = 25'h09af4ad;
    stim[56] = 25'h079e297;
    stim[57] = 25'h0c55693;
    stim[58] = 25'h0245f5b;
    stim[59] = 25'h1e2dc7c;
    stim[60] = 25'h19eee8e;
    stim[61] = 25'h17d3aea;
    stim[62] = 25'h08e01f9;
    stim[63] = 25'h0f3b4af;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hb130e9;
      expv[3] = 24'hb13050;
      expv[4] = 24'hb13050;
      expv[5] = 24'hb13050;
      expv[6] = 24'hb13050;
      expv[7] = 24'hb13050;
      expv[8] = 24'hb13050;
      expv[9] = 24'hb13050;
      expv[10] = 24'hb13050;
      expv[11] = 24'hb13050;
      expv[12] = 24'hb13050;
      expv[13] = 24'hb13050;
      expv[14] = 24'hb13050;
      expv[15] = 24'hb13050;
      expv[16] = 24'hb13050;
      expv[17] = 24'hb13050;
      expv[18] = 24'hb13050;
      expv[19] = 24'hb13050;
      expv[20] = 24'hb13050;
      expv[21] = 24'hb13050;
      expv[22] = 24'hb13050;
      expv[23] = 24'hb13050;
      expv[24] = 24'hb13050;
      expv[25] = 24'hb13050;
      expv[26] = 24'hb13050;
      expv[27] = 24'hb13050;
      expv[28] = 24'hb13050;
      expv[29] = 24'hb13050;
      expv[30] = 24'hb13050;
      expv[31] = 24'hb13050;
      expv[32] = 24'hb13050;
      expv[33] = 24'hb13050;
      expv[34] = 24'hb13050;
      expv[35] = 24'hb13050;
      expv[36] = 24'hb13050;
      expv[37] = 24'hb13050;
      expv[38] = 24'hb13050;
      expv[39] = 24'hb13050;
      expv[40] = 24'hb13050;
      expv[41] = 24'hb13050;
      expv[42] = 24'hb13050;
      expv[43] = 24'hb13050;
      expv[44] = 24'hb13050;
      expv[45] = 24'hb13050;
      expv[46] = 24'hb13050;
      expv[47] = 24'hb13050;
      expv[48] = 24'hb13050;
      expv[49] = 24'hb13050;
      expv[50] = 24'hb13050;
      expv[51] = 24'hb13050;
      expv[52] = 24'hb13050;
      expv[53] = 24'hb13050;
      expv[54] = 24'hb13050;
      expv[55] = 24'hb13050;
      expv[56] = 24'hb13050;
      expv[57] = 24'hb13050;
      expv[58] = 24'hb13050;
      expv[59] = 24'hb13050;
      expv[60] = 24'hb13050;
      expv[61] = 24'hb13050;
      expv[62] = 24'hb13050;
      expv[63] = 24'hb13050;
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
