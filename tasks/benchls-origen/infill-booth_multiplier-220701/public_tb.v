// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220701 dut (
    .clk(clk),
    .rst(in_vec[13:13]),
    .load(in_vec[12:12]),
    .a(in_vec[11:6]),
    .b(in_vec[5:0]),
    .slow_clk(out_vec[12:12]),
    .product(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h386d;
    stim[1] = 14'h2f5e;
    stim[2] = 14'h1773;
    stim[3] = 14'h0b78;
    stim[4] = 14'h1ec1;
    stim[5] = 14'h04f2;
    stim[6] = 14'h0fb2;
    stim[7] = 14'h1686;
    stim[8] = 14'h1853;
    stim[9] = 14'h04a1;
    stim[10] = 14'h1c25;
    stim[11] = 14'h0197;
    stim[12] = 14'h09b9;
    stim[13] = 14'h1fde;
    stim[14] = 14'h2cef;
    stim[15] = 14'h0b76;
    stim[16] = 14'h1928;
    stim[17] = 14'h16f6;
    stim[18] = 14'h10cb;
    stim[19] = 14'h0ec4;
    stim[20] = 14'h1874;
    stim[21] = 14'h16b0;
    stim[22] = 14'h1a76;
    stim[23] = 14'h0cdd;
    stim[24] = 14'h009c;
    stim[25] = 14'h0f60;
    stim[26] = 14'h023b;
    stim[27] = 14'h1e09;
    stim[28] = 14'h0fd0;
    stim[29] = 14'h1493;
    stim[30] = 14'h08c5;
    stim[31] = 14'h1628;
    stim[32] = 14'h14ad;
    stim[33] = 14'h0d35;
    stim[34] = 14'h1d10;
    stim[35] = 14'h0b99;
    stim[36] = 14'h188b;
    stim[37] = 14'h11a7;
    stim[38] = 14'h1113;
    stim[39] = 14'h03b1;
    stim[40] = 14'h0946;
    stim[41] = 14'h10c6;
    stim[42] = 14'h113a;
    stim[43] = 14'h04e2;
    stim[44] = 14'h05f2;
    stim[45] = 14'h12fe;
    stim[46] = 14'h0be9;
    stim[47] = 14'h0757;
    stim[48] = 14'h13fc;
    stim[49] = 14'h050d;
    stim[50] = 14'h0d39;
    stim[51] = 14'h1f7f;
    stim[52] = 14'h0c63;
    stim[53] = 14'h121e;
    stim[54] = 14'h0c79;
    stim[55] = 14'h08a5;
    stim[56] = 14'h1e74;
    stim[57] = 14'h089e;
    stim[58] = 14'h0ab2;
    stim[59] = 14'h02da;
    stim[60] = 14'h08c0;
    stim[61] = 14'h004a;
    stim[62] = 14'h00c4;
    stim[63] = 14'h05a2;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'hx000;
      expv[2] = 13'hx000;
      expv[3] = 13'hx000;
      expv[4] = 13'hx01d;
      expv[5] = 13'hx000;
      expv[6] = 13'hx03b;
      expv[7] = 13'hx01d;
      expv[8] = 13'hx000;
      expv[9] = 13'hx000;
      expv[10] = 13'hx021;
      expv[11] = 13'hx000;
      expv[12] = 13'hx030;
      expv[13] = 13'hx018;
      expv[14] = 13'hx000;
      expv[15] = 13'hx000;
      expv[16] = 13'hx03f;
      expv[17] = 13'hx000;
      expv[18] = 13'hx000;
      expv[19] = 13'hx000;
      expv[20] = 13'hx003;
      expv[21] = 13'hx000;
      expv[22] = 13'hx000;
      expv[23] = 13'hx000;
      expv[24] = 13'hx029;
      expv[25] = 13'hxd94;
      expv[26] = 13'hxd8a;
      expv[27] = 13'hx005;
      expv[28] = 13'hx000;
      expv[29] = 13'hx038;
      expv[30] = 13'hx000;
      expv[31] = 13'hx012;
      expv[32] = 13'hx000;
      expv[33] = 13'hx000;
      expv[34] = 13'hx012;
      expv[35] = 13'hx000;
      expv[36] = 13'hx034;
      expv[37] = 13'hx000;
      expv[38] = 13'hx000;
      expv[39] = 13'hx000;
      expv[40] = 13'hx004;
      expv[41] = 13'hx002;
      expv[42] = 13'hx000;
      expv[43] = 13'hx000;
      expv[44] = 13'hx004;
      expv[45] = 13'hx002;
      expv[46] = 13'hx000;
      expv[47] = 13'hx00b;
      expv[48] = 13'hx005;
      expv[49] = 13'hx000;
      expv[50] = 13'hx00f;
      expv[51] = 13'hx007;
      expv[52] = 13'hx000;
      expv[53] = 13'hx03d;
      expv[54] = 13'hx000;
      expv[55] = 13'hx008;
      expv[56] = 13'hx004;
      expv[57] = 13'hx000;
      expv[58] = 13'hx039;
      expv[59] = 13'hxd1c;
      expv[60] = 13'hxd0e;
      expv[61] = 13'hx007;
      expv[62] = 13'hx003;
      expv[63] = 13'hx001;
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
