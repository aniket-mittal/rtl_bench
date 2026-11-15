// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_077554 dut (
    .clk(clk),
    .rst_n(in_vec[16:16]),
    .wr_en(in_vec[15:15]),
    .wr_data(in_vec[14:1]),
    .rd_en(in_vec[0:0]),
    .fifo_full(out_vec[23:23]),
    .fifo_count(out_vec[22:16]),
    .rd_data(out_vec[15:2]),
    .fifo_empty(out_vec[1:1]),
    .fifo_almst_empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h00674;
    stim[1] = 17'h06047;
    stim[2] = 17'h1bf25;
    stim[3] = 17'h07a25;
    stim[4] = 17'h1da2b;
    stim[5] = 17'h1f042;
    stim[6] = 17'h1e3a3;
    stim[7] = 17'h100dc;
    stim[8] = 17'h131e4;
    stim[9] = 17'h13fa7;
    stim[10] = 17'h1e345;
    stim[11] = 17'h10fcc;
    stim[12] = 17'h12602;
    stim[13] = 17'h14d01;
    stim[14] = 17'h1e68f;
    stim[15] = 17'h1a0eb;
    stim[16] = 17'h1246b;
    stim[17] = 17'h191ad;
    stim[18] = 17'h1d457;
    stim[19] = 17'h1be09;
    stim[20] = 17'h1a4a5;
    stim[21] = 17'h18047;
    stim[22] = 17'h13344;
    stim[23] = 17'h19521;
    stim[24] = 17'h10b2f;
    stim[25] = 17'h1abb9;
    stim[26] = 17'h1a687;
    stim[27] = 17'h162ba;
    stim[28] = 17'h17380;
    stim[29] = 17'h161bf;
    stim[30] = 17'h19c5d;
    stim[31] = 17'h179ec;
    stim[32] = 17'h103e9;
    stim[33] = 17'h1ca7b;
    stim[34] = 17'h1f6b5;
    stim[35] = 17'h1c7d0;
    stim[36] = 17'h12aa7;
    stim[37] = 17'h1a4ab;
    stim[38] = 17'h170da;
    stim[39] = 17'h1ba06;
    stim[40] = 17'h11633;
    stim[41] = 17'h18dad;
    stim[42] = 17'h185f7;
    stim[43] = 17'h1509d;
    stim[44] = 17'h186c2;
    stim[45] = 17'h1a0b3;
    stim[46] = 17'h1e902;
    stim[47] = 17'h12429;
    stim[48] = 17'h1047b;
    stim[49] = 17'h14143;
    stim[50] = 17'h1f0a8;
    stim[51] = 17'h12423;
    stim[52] = 17'h105bd;
    stim[53] = 17'h14c55;
    stim[54] = 17'h1c53a;
    stim[55] = 17'h16665;
    stim[56] = 17'h1f4bc;
    stim[57] = 17'h1f5d0;
    stim[58] = 17'h1f500;
    stim[59] = 17'h1ebeb;
    stim[60] = 17'h1e96d;
    stim[61] = 17'h167b5;
    stim[62] = 17'h1cc2a;
    stim[63] = 17'h13767;
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
      expv[0] = 24'h00xxxx;
      expv[1] = 24'h00xxxx;
      expv[2] = 24'h00xxxx;
      expv[3] = 24'h00xxxx;
      expv[4] = 24'h00xxxx;
      expv[5] = 24'h01xxxx;
      expv[6] = 24'h02xxxx;
      expv[7] = 24'h01b455;
      expv[8] = 24'h01b455;
      expv[9] = 24'h01b455;
      expv[10] = 24'h00e085;
      expv[11] = 24'h7fc747;
      expv[12] = 24'h7fc744;
      expv[13] = 24'h7fc744;
      expv[14] = 24'h7ec688;
      expv[15] = 24'h7dxxxx;
      expv[16] = 24'h7cxxxx;
      expv[17] = 24'h7bxxxx;
      expv[18] = 24'h7axxxx;
      expv[19] = 24'h79xxxx;
      expv[20] = 24'h78xxxx;
      expv[21] = 24'h77xxxx;
      expv[22] = 24'h76xxxx;
      expv[23] = 24'h76xxxx;
      expv[24] = 24'h75xxxx;
      expv[25] = 24'h74xxxx;
      expv[26] = 24'h73xxxx;
      expv[27] = 24'h72xxxx;
      expv[28] = 24'h72xxxx;
      expv[29] = 24'h72xxxx;
      expv[30] = 24'h71xxxx;
      expv[31] = 24'h70xxxx;
      expv[32] = 24'h70xxxx;
      expv[33] = 24'h6fxxxx;
      expv[34] = 24'h6exxxx;
      expv[35] = 24'h6dxxxx;
      expv[36] = 24'h6exxxx;
      expv[37] = 24'h6dxxxx;
      expv[38] = 24'h6cxxxx;
      expv[39] = 24'h6cxxxx;
      expv[40] = 24'h6dxxxx;
      expv[41] = 24'h6cxxxx;
      expv[42] = 24'h6bxxxx;
      expv[43] = 24'h6axxxx;
      expv[44] = 24'h69xxxx;
      expv[45] = 24'h6axxxx;
      expv[46] = 24'h69xxxx;
      expv[47] = 24'h6axxxx;
      expv[48] = 24'h69xxxx;
      expv[49] = 24'h68xxxx;
      expv[50] = 24'h67xxxx;
      expv[51] = 24'h68xxxx;
      expv[52] = 24'h67xxxx;
      expv[53] = 24'h66xxxx;
      expv[54] = 24'h65xxxx;
      expv[55] = 24'h66xxxx;
      expv[56] = 24'h65xxxx;
      expv[57] = 24'h66xxxx;
      expv[58] = 24'h67xxxx;
      expv[59] = 24'h68xxxx;
      expv[60] = 24'h67xxxx;
      expv[61] = 24'h66xxxx;
      expv[62] = 24'h65xxxx;
      expv[63] = 24'h66xxxx;
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
