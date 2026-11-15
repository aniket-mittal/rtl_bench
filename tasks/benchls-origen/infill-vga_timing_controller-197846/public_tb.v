// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_197846 dut (
    .pixelClock(clk),
    .sw(in_vec[45:44]),
    .btn(in_vec[43:40]),
    .ppu_addr(in_vec[39:24]),
    .vd(in_vec[23:0]),
    .red(out_vec[42:35]),
    .green(out_vec[34:27]),
    .blue(out_vec[26:19]),
    .hSync(out_vec[18:18]),
    .vSync(out_vec[17:17]),
    .blank(out_vec[16:16]),
    .va(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h36dc7ea05ddc;
    stim[1] = 46'h32db69e629c1;
    stim[2] = 46'h3f5692f546f4;
    stim[3] = 46'h02b2927aa523;
    stim[4] = 46'h1a153170e12f;
    stim[5] = 46'h0cbf536947c7;
    stim[6] = 46'h1efce6988287;
    stim[7] = 46'h1c7ecd83ad50;
    stim[8] = 46'h3a7be66508af;
    stim[9] = 46'h21041c8dfbc4;
    stim[10] = 46'h25d4b4a3f6bd;
    stim[11] = 46'h261c177be046;
    stim[12] = 46'h1a7379839d3b;
    stim[13] = 46'h18764829fb71;
    stim[14] = 46'h25d383c9e33d;
    stim[15] = 46'h2f85a95737ea;
    stim[16] = 46'h103beaba7a38;
    stim[17] = 46'h2455be87cc12;
    stim[18] = 46'h39b62012ac96;
    stim[19] = 46'h1915f5b1a1d4;
    stim[20] = 46'h21312dda15b7;
    stim[21] = 46'h074bc2bbce7a;
    stim[22] = 46'h33d4c2f8aebf;
    stim[23] = 46'h3879fdc6fee1;
    stim[24] = 46'h3d824a845173;
    stim[25] = 46'h208238a0496b;
    stim[26] = 46'h2c269f4617f4;
    stim[27] = 46'h12658f94e00e;
    stim[28] = 46'h10da800a9dcf;
    stim[29] = 46'h3ba19410e5cb;
    stim[30] = 46'h2197c80a1e99;
    stim[31] = 46'h02b5e6357738;
    stim[32] = 46'h0f54a3c8749c;
    stim[33] = 46'h033cee7ef718;
    stim[34] = 46'h0ff65ae5f5e5;
    stim[35] = 46'h14f09c5fb78d;
    stim[36] = 46'h2b1ed1842032;
    stim[37] = 46'h098b573678fd;
    stim[38] = 46'h0372433abff9;
    stim[39] = 46'h052586ded575;
    stim[40] = 46'h3c73d03fbbe9;
    stim[41] = 46'h015b638f4871;
    stim[42] = 46'h1e8e592636b9;
    stim[43] = 46'h2046e9ba7450;
    stim[44] = 46'h1b9f05ce75e3;
    stim[45] = 46'h32bdae7ade23;
    stim[46] = 46'h27cebba7bc71;
    stim[47] = 46'h23e046f42486;
    stim[48] = 46'h15b15e8a6d43;
    stim[49] = 46'h0dc3ac29eddf;
    stim[50] = 46'h1aba97d6e47f;
    stim[51] = 46'h17c7835604cb;
    stim[52] = 46'h0eb347638cec;
    stim[53] = 46'h0c160c8294fd;
    stim[54] = 46'h3e6f4be17965;
    stim[55] = 46'h26172dfe8579;
    stim[56] = 46'h2906cd030355;
    stim[57] = 46'h39550664b9fa;
    stim[58] = 46'h07b4075d1765;
    stim[59] = 46'h1169848a416b;
    stim[60] = 46'h1c5946c214d3;
    stim[61] = 46'h2b172e2e906e;
    stim[62] = 46'h3817bb39aa7f;
    stim[63] = 46'h052f01c86e41;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h7f800060000;
      expv[2] = 43'h7f800060000;
      expv[3] = 43'h7f800060000;
      expv[4] = 43'h3d5291e0000;
      expv[5] = 43'h7fff8060000;
      expv[6] = 43'h34a3e3e0000;
      expv[7] = 43'h7fff8060000;
      expv[8] = 43'h7fff8060000;
      expv[9] = 43'h7f800060000;
      expv[10] = 43'h007f8060000;
      expv[11] = 43'h007f8060000;
      expv[12] = 43'h007f8060000;
      expv[13] = 43'h7fff8060000;
      expv[14] = 43'h7fff8060000;
      expv[15] = 43'h007f8060000;
      expv[16] = 43'h007f8060000;
      expv[17] = 43'h7fff8060000;
      expv[18] = 43'h007f8060000;
      expv[19] = 43'h7f800060000;
      expv[20] = 43'h7fff8060000;
      expv[21] = 43'h007f8060000;
      expv[22] = 43'h5de73d60000;
      expv[23] = 43'h7f800060000;
      expv[24] = 43'h7f800060000;
      expv[25] = 43'h7f800060000;
      expv[26] = 43'h007f8060000;
      expv[27] = 43'h007f8060000;
      expv[28] = 43'h7fff8060000;
      expv[29] = 43'h7fff8060000;
      expv[30] = 43'h7f800060000;
      expv[31] = 43'h007f8060000;
      expv[32] = 43'h1abb9c60000;
      expv[33] = 43'h643a4e60000;
      expv[34] = 43'h3f7b8c60000;
      expv[35] = 43'h72faf2e0000;
      expv[36] = 43'h7fff8060000;
      expv[37] = 43'h007f8060000;
      expv[38] = 43'h1b3c7ee0000;
      expv[39] = 43'h1d5ffce0000;
      expv[40] = 43'h6f6abae0000;
      expv[41] = 43'h7f800060000;
      expv[42] = 43'h47a438e0000;
      expv[43] = 43'h7fff8060000;
      expv[44] = 43'h007f8060000;
      expv[45] = 43'h7fff8060000;
      expv[46] = 43'h7f800060000;
      expv[47] = 43'h007f8060000;
      expv[48] = 43'h007f8060000;
      expv[49] = 43'h7fff8060000;
      expv[50] = 43'h14f6efe0000;
      expv[51] = 43'h7fff8060000;
      expv[52] = 43'h7fff8060000;
      expv[53] = 43'h31c67660000;
      expv[54] = 43'h414a7ee0000;
      expv[55] = 43'h7f800060000;
      expv[56] = 43'h007f8060000;
      expv[57] = 43'h007f8060000;
      expv[58] = 43'h7f800060000;
      expv[59] = 43'h2e8bb2e0000;
      expv[60] = 43'h7fff8060000;
      expv[61] = 43'h7fff8060000;
      expv[62] = 43'h007f8060000;
      expv[63] = 43'h7f800060000;
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
