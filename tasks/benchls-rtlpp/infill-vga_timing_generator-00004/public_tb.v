// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00004 dut (
    .clk_pixel(clk),
    .test_picture(in_vec[24:24]),
    .red_byte(in_vec[23:16]),
    .green_byte(in_vec[15:8]),
    .blue_byte(in_vec[7:0]),
    .fetch_next(out_vec[31:31]),
    .line_repeat(out_vec[30:30]),
    .vga_r(out_vec[29:22]),
    .vga_g(out_vec[21:14]),
    .vga_b(out_vec[13:6]),
    .next_line(out_vec[5:5]),
    .next_field(out_vec[4:4]),
    .vga_hsync(out_vec[3:3]),
    .vga_vsync(out_vec[2:2]),
    .vga_vblank(out_vec[1:1]),
    .vga_blank(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1dc3a2a;
    stim[1] = 25'h0a9ed49;
    stim[2] = 25'h0370ca9;
    stim[3] = 25'h14d3c0e;
    stim[4] = 25'h048970f;
    stim[5] = 25'h03c7964;
    stim[6] = 25'h0dc1424;
    stim[7] = 25'h10a841b;
    stim[8] = 25'h0ee5d24;
    stim[9] = 25'h1d7525f;
    stim[10] = 25'h060366e;
    stim[11] = 25'h1adc9c0;
    stim[12] = 25'h0f5e213;
    stim[13] = 25'h02a8e7a;
    stim[14] = 25'h0976712;
    stim[15] = 25'h0066932;
    stim[16] = 25'h06a42d3;
    stim[17] = 25'h07d25ac;
    stim[18] = 25'h02c8ad3;
    stim[19] = 25'h0bce24f;
    stim[20] = 25'h0293804;
    stim[21] = 25'h082f310;
    stim[22] = 25'h1399806;
    stim[23] = 25'h12ade10;
    stim[24] = 25'h1b62177;
    stim[25] = 25'h15feba2;
    stim[26] = 25'h043f80c;
    stim[27] = 25'h1c6c4a4;
    stim[28] = 25'h1cd40d6;
    stim[29] = 25'h0c80781;
    stim[30] = 25'h0d4c4ad;
    stim[31] = 25'h1c07ebf;
    stim[32] = 25'h1c9b65e;
    stim[33] = 25'h0eac0fd;
    stim[34] = 25'h1f6461a;
    stim[35] = 25'h12cd3ee;
    stim[36] = 25'h19f8329;
    stim[37] = 25'h1a6c488;
    stim[38] = 25'h1ddc431;
    stim[39] = 25'h0337f98;
    stim[40] = 25'h09b3e2a;
    stim[41] = 25'h0e85e27;
    stim[42] = 25'h1f3d02a;
    stim[43] = 25'h0b1e21d;
    stim[44] = 25'h12b42ce;
    stim[45] = 25'h102ff07;
    stim[46] = 25'h1fd4839;
    stim[47] = 25'h0d3a66b;
    stim[48] = 25'h0322de6;
    stim[49] = 25'h01851dc;
    stim[50] = 25'h0885527;
    stim[51] = 25'h0a799fa;
    stim[52] = 25'h089273d;
    stim[53] = 25'h03d17fe;
    stim[54] = 25'h0a855d4;
    stim[55] = 25'h12c544f;
    stim[56] = 25'h1a12ff7;
    stim[57] = 25'h0a09f4d;
    stim[58] = 25'h15c3dc0;
    stim[59] = 25'h0085668;
    stim[60] = 25'h09e08a6;
    stim[61] = 25'h0e86dff;
    stim[62] = 25'h055558c;
    stim[63] = 25'h1dfab0f;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxx0x0xxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxx0xxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxx0xxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxx0xxx;
      expv[21] = 32'hx0xxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hx0xx0xxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxx0xx0xx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxx0xxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
