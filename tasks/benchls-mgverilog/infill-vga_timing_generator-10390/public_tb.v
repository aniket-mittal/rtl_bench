// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10390 dut (
    .clk(clk),
    .pixel(in_vec[16:2]),
    .sync(in_vec[1:1]),
    .border(in_vec[0:0]),
    .vga_h(out_vec[43:43]),
    .vga_v(out_vec[42:42]),
    .vga_r(out_vec[41:38]),
    .vga_g(out_vec[37:34]),
    .vga_b(out_vec[33:30]),
    .vga_hcounter(out_vec[29:20]),
    .vga_vcounter(out_vec[19:10]),
    .next_pixel_x(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1a446;
    stim[1] = 17'h12fd4;
    stim[2] = 17'h125b6;
    stim[3] = 17'h1c1eb;
    stim[4] = 17'h0c2ae;
    stim[5] = 17'h00281;
    stim[6] = 17'h0612d;
    stim[7] = 17'h16891;
    stim[8] = 17'h124dd;
    stim[9] = 17'h1281e;
    stim[10] = 17'h07bab;
    stim[11] = 17'h12625;
    stim[12] = 17'h12815;
    stim[13] = 17'h15d22;
    stim[14] = 17'h176dc;
    stim[15] = 17'h1e175;
    stim[16] = 17'h168a8;
    stim[17] = 17'h07294;
    stim[18] = 17'h05a36;
    stim[19] = 17'h151d4;
    stim[20] = 17'h1bfcf;
    stim[21] = 17'h1d5d7;
    stim[22] = 17'h1aece;
    stim[23] = 17'h1982a;
    stim[24] = 17'h04ca1;
    stim[25] = 17'h060fe;
    stim[26] = 17'h00009;
    stim[27] = 17'h1bc6f;
    stim[28] = 17'h0aa3f;
    stim[29] = 17'h0ba10;
    stim[30] = 17'h19df3;
    stim[31] = 17'h09c77;
    stim[32] = 17'h03991;
    stim[33] = 17'h140fc;
    stim[34] = 17'h011ed;
    stim[35] = 17'h0aaf6;
    stim[36] = 17'h07f89;
    stim[37] = 17'h134a6;
    stim[38] = 17'h03418;
    stim[39] = 17'h09cc9;
    stim[40] = 17'h14c9a;
    stim[41] = 17'h0f39a;
    stim[42] = 17'h08215;
    stim[43] = 17'h05661;
    stim[44] = 17'h17159;
    stim[45] = 17'h0ee74;
    stim[46] = 17'h0e484;
    stim[47] = 17'h144cd;
    stim[48] = 17'h07de9;
    stim[49] = 17'h04d92;
    stim[50] = 17'h1ba02;
    stim[51] = 17'h17d69;
    stim[52] = 17'h146da;
    stim[53] = 17'h1fb45;
    stim[54] = 17'h1a584;
    stim[55] = 17'h0b2f1;
    stim[56] = 17'h06064;
    stim[57] = 17'h1ccdb;
    stim[58] = 17'h10f60;
    stim[59] = 17'h1f8df;
    stim[60] = 17'h0b1e5;
    stim[61] = 17'h1a595;
    stim[62] = 17'h1f99d;
    stim[63] = 17'h1b54c;
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
      expv[0] = 44'hxxxxxxxxx00;
      expv[1] = 44'hxxxx0000001;
      expv[2] = 44'hebe40100000;
      expv[3] = 44'hebe40000000;
      expv[4] = 44'hebe40000000;
      expv[5] = 44'hebe40000001;
      expv[6] = 44'hfffc0100002;
      expv[7] = 44'hfffc0200003;
      expv[8] = 44'hfffc0300004;
      expv[9] = 44'hfffc0400000;
      expv[10] = 44'hfffc0000000;
      expv[11] = 44'hfffc0000001;
      expv[12] = 44'hfffc0100002;
      expv[13] = 44'hfffc0200000;
      expv[14] = 44'hfffc0000001;
      expv[15] = 44'hedac0100002;
      expv[16] = 44'hfffc0200003;
      expv[17] = 44'hd62c0300004;
      expv[18] = 44'hc88c0400000;
      expv[19] = 44'hc88c0000001;
      expv[20] = 44'he8680100000;
      expv[21] = 44'he8680000000;
      expv[22] = 44'he8680000000;
      expv[23] = 44'he8680000000;
      expv[24] = 44'he8680000001;
      expv[25] = 44'hfffc0100000;
      expv[26] = 44'hfffc0000001;
      expv[27] = 44'hfffc0100000;
      expv[28] = 44'hfffc0000000;
      expv[29] = 44'hfffc0000001;
      expv[30] = 44'hca940100000;
      expv[31] = 44'hca940000000;
      expv[32] = 44'hca940000001;
      expv[33] = 44'hfffc0100002;
      expv[34] = 44'hfc280200003;
      expv[35] = 44'hfffc0300000;
      expv[36] = 44'hfffc0000001;
      expv[37] = 44'hfffc0100000;
      expv[38] = 44'hfffc0000001;
      expv[39] = 44'hcd040100002;
      expv[40] = 44'hfffc0200000;
      expv[41] = 44'hfffc0000000;
      expv[42] = 44'hfffc0000001;
      expv[43] = 44'hfffc0100002;
      expv[44] = 44'hfffc0200003;
      expv[45] = 44'hfffc0300004;
      expv[46] = 44'hfb9c0400005;
      expv[47] = 44'hc11c0500006;
      expv[48] = 44'hfffc0600007;
      expv[49] = 44'hfffc0700000;
      expv[50] = 44'hfffc0000000;
      expv[51] = 44'hfffc0000001;
      expv[52] = 44'hfffc0100000;
      expv[53] = 44'hfffc0000001;
      expv[54] = 44'hfffc0100002;
      expv[55] = 44'hc1740200003;
      expv[56] = 44'hfffc0300004;
      expv[57] = 44'hf00c0400000;
      expv[58] = 44'hf00c0000001;
      expv[59] = 44'hf3e00100000;
      expv[60] = 44'hf3e00000001;
      expv[61] = 44'hfffc0100002;
      expv[62] = 44'hfffc0200003;
      expv[63] = 44'hfffc0300004;
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
