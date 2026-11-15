// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_017688 dut (
    .clk(clk),
    .cs(in_vec[20:20]),
    .rd(in_vec[19:19]),
    .wr(in_vec[18:18]),
    .addr(in_vec[17:8]),
    .wdata(in_vec[7:0]),
    .rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h153416;
    stim[1] = 21'h079633;
    stim[2] = 21'h0a58f2;
    stim[3] = 21'h1a8404;
    stim[4] = 21'h190da5;
    stim[5] = 21'h0f4ec4;
    stim[6] = 21'h16031e;
    stim[7] = 21'h16edb3;
    stim[8] = 21'h0ea6e9;
    stim[9] = 21'h0e31b1;
    stim[10] = 21'h1a0d10;
    stim[11] = 21'h0deb88;
    stim[12] = 21'h0ee797;
    stim[13] = 21'h0cf8c8;
    stim[14] = 21'h0fb036;
    stim[15] = 21'h0e7e78;
    stim[16] = 21'h097bdb;
    stim[17] = 21'h0f1d82;
    stim[18] = 21'h04480c;
    stim[19] = 21'h115336;
    stim[20] = 21'h0aee13;
    stim[21] = 21'h0f303c;
    stim[22] = 21'h190670;
    stim[23] = 21'h0d5b24;
    stim[24] = 21'h0d5842;
    stim[25] = 21'h1e33f9;
    stim[26] = 21'h0310a3;
    stim[27] = 21'h093a04;
    stim[28] = 21'h02ef6c;
    stim[29] = 21'h1e057c;
    stim[30] = 21'h13c40d;
    stim[31] = 21'h04268f;
    stim[32] = 21'h000550;
    stim[33] = 21'h1f3d0f;
    stim[34] = 21'h1dc0d0;
    stim[35] = 21'h13297a;
    stim[36] = 21'h0cae99;
    stim[37] = 21'h0e2d0c;
    stim[38] = 21'h1f0cc2;
    stim[39] = 21'h14a21d;
    stim[40] = 21'h170786;
    stim[41] = 21'h1aad30;
    stim[42] = 21'h0f9ac3;
    stim[43] = 21'h12255f;
    stim[44] = 21'h188061;
    stim[45] = 21'h12e093;
    stim[46] = 21'h0dd9db;
    stim[47] = 21'h0e6a33;
    stim[48] = 21'h143d69;
    stim[49] = 21'h1ffaa6;
    stim[50] = 21'h11a850;
    stim[51] = 21'h080620;
    stim[52] = 21'h191494;
    stim[53] = 21'h0c7039;
    stim[54] = 21'h14fd59;
    stim[55] = 21'h1837d3;
    stim[56] = 21'h0a6b75;
    stim[57] = 21'h0f8c92;
    stim[58] = 21'h1f5351;
    stim[59] = 21'h0e30f3;
    stim[60] = 21'h0bc125;
    stim[61] = 21'h0ee873;
    stim[62] = 21'h08fe49;
    stim[63] = 21'h0d5446;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hff;
      expv[2] = 8'hff;
      expv[3] = 8'hff;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hff;
      expv[7] = 8'hff;
      expv[8] = 8'hff;
      expv[9] = 8'hff;
      expv[10] = 8'hff;
      expv[11] = 8'hxx;
      expv[12] = 8'hff;
      expv[13] = 8'hff;
      expv[14] = 8'hff;
      expv[15] = 8'hff;
      expv[16] = 8'hff;
      expv[17] = 8'hff;
      expv[18] = 8'hff;
      expv[19] = 8'hff;
      expv[20] = 8'hff;
      expv[21] = 8'hff;
      expv[22] = 8'hff;
      expv[23] = 8'hxx;
      expv[24] = 8'hff;
      expv[25] = 8'hff;
      expv[26] = 8'hxx;
      expv[27] = 8'hff;
      expv[28] = 8'hff;
      expv[29] = 8'hff;
      expv[30] = 8'hxx;
      expv[31] = 8'hff;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hff;
      expv[37] = 8'hff;
      expv[38] = 8'hff;
      expv[39] = 8'hxx;
      expv[40] = 8'hff;
      expv[41] = 8'hff;
      expv[42] = 8'hxx;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hxx;
      expv[46] = 8'hff;
      expv[47] = 8'hff;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hxx;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hxx;
      expv[54] = 8'hff;
      expv[55] = 8'hff;
      expv[56] = 8'hxx;
      expv[57] = 8'hff;
      expv[58] = 8'hff;
      expv[59] = 8'hxx;
      expv[60] = 8'hff;
      expv[61] = 8'hff;
      expv[62] = 8'hff;
      expv[63] = 8'hff;
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
