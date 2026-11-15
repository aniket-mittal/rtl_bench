// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  VGA640x480 dut (
    .clk_25m(clk),
    .rst_n(in_vec[16:16]),
    .in_data(in_vec[15:0]),
    .vga_red(out_vec[34:30]),
    .vga_green(out_vec[29:24]),
    .vga_blue(out_vec[23:19]),
    .vga_hsync(out_vec[18:18]),
    .vga_vsync(out_vec[17:17]),
    .frame_addr(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h06fa3;
    stim[1] = 17'h0c049;
    stim[2] = 17'h160c4;
    stim[3] = 17'h15ef7;
    stim[4] = 17'h172b3;
    stim[5] = 17'h15eed;
    stim[6] = 17'h1dc6a;
    stim[7] = 17'h15bb9;
    stim[8] = 17'h1c214;
    stim[9] = 17'h1abb7;
    stim[10] = 17'h196ea;
    stim[11] = 17'h19573;
    stim[12] = 17'h1d734;
    stim[13] = 17'h1dcc0;
    stim[14] = 17'h1e179;
    stim[15] = 17'h103d3;
    stim[16] = 17'h1dee5;
    stim[17] = 17'h1e72b;
    stim[18] = 17'h1acdc;
    stim[19] = 17'h17afb;
    stim[20] = 17'h157b0;
    stim[21] = 17'h1501f;
    stim[22] = 17'h12d6b;
    stim[23] = 17'h126f7;
    stim[24] = 17'h1e7af;
    stim[25] = 17'h1b279;
    stim[26] = 17'h17d56;
    stim[27] = 17'h15cf5;
    stim[28] = 17'h1af41;
    stim[29] = 17'h17a58;
    stim[30] = 17'h14662;
    stim[31] = 17'h14771;
    stim[32] = 17'h1f950;
    stim[33] = 17'h19c90;
    stim[34] = 17'h1d3e6;
    stim[35] = 17'h18c2c;
    stim[36] = 17'h183c4;
    stim[37] = 17'h1fc00;
    stim[38] = 17'h15062;
    stim[39] = 17'h1b75c;
    stim[40] = 17'h16cbf;
    stim[41] = 17'h18aad;
    stim[42] = 17'h18f08;
    stim[43] = 17'h11926;
    stim[44] = 17'h110c7;
    stim[45] = 17'h15ffb;
    stim[46] = 17'h171d2;
    stim[47] = 17'h1e40b;
    stim[48] = 17'h1bd04;
    stim[49] = 17'h16e12;
    stim[50] = 17'h101f7;
    stim[51] = 17'h1a90d;
    stim[52] = 17'h1f7d2;
    stim[53] = 17'h1f1d4;
    stim[54] = 17'h1cbaa;
    stim[55] = 17'h12500;
    stim[56] = 17'h1a5b7;
    stim[57] = 17'h15182;
    stim[58] = 17'h1d4b2;
    stim[59] = 17'h14619;
    stim[60] = 17'h186c8;
    stim[61] = 17'h1f99c;
    stim[62] = 17'h1305b;
    stim[63] = 17'h1d94c;
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
      expv[0] = 35'h0000x0000;
      expv[1] = 35'h000060000;
      expv[2] = 35'h000060000;
      expv[3] = 35'h000060000;
      expv[4] = 35'h000060000;
      expv[5] = 35'h000060000;
      expv[6] = 35'h000060000;
      expv[7] = 35'h000060000;
      expv[8] = 35'h000060000;
      expv[9] = 35'h000060000;
      expv[10] = 35'h000060000;
      expv[11] = 35'h000060000;
      expv[12] = 35'h000060000;
      expv[13] = 35'h000060000;
      expv[14] = 35'h000060000;
      expv[15] = 35'h000060000;
      expv[16] = 35'h000060000;
      expv[17] = 35'h000060000;
      expv[18] = 35'h000060000;
      expv[19] = 35'h000060000;
      expv[20] = 35'h000060000;
      expv[21] = 35'h000060000;
      expv[22] = 35'h000060000;
      expv[23] = 35'h000060000;
      expv[24] = 35'h000060000;
      expv[25] = 35'h000060000;
      expv[26] = 35'h000060000;
      expv[27] = 35'h000060000;
      expv[28] = 35'h000060000;
      expv[29] = 35'h000060000;
      expv[30] = 35'h000060000;
      expv[31] = 35'h000060000;
      expv[32] = 35'h000060000;
      expv[33] = 35'h000060000;
      expv[34] = 35'h000060000;
      expv[35] = 35'h000060000;
      expv[36] = 35'h000060000;
      expv[37] = 35'h000060000;
      expv[38] = 35'h000060000;
      expv[39] = 35'h000060000;
      expv[40] = 35'h000060000;
      expv[41] = 35'h000060000;
      expv[42] = 35'h000060000;
      expv[43] = 35'h000060000;
      expv[44] = 35'h000060000;
      expv[45] = 35'h000060000;
      expv[46] = 35'h000060000;
      expv[47] = 35'h000060000;
      expv[48] = 35'h000060000;
      expv[49] = 35'h000060000;
      expv[50] = 35'h000060000;
      expv[51] = 35'h000060000;
      expv[52] = 35'h000060000;
      expv[53] = 35'h000060000;
      expv[54] = 35'h000060000;
      expv[55] = 35'h000060000;
      expv[56] = 35'h000060000;
      expv[57] = 35'h000060000;
      expv[58] = 35'h000060000;
      expv[59] = 35'h000060000;
      expv[60] = 35'h000060000;
      expv[61] = 35'h000060000;
      expv[62] = 35'h000060000;
      expv[63] = 35'h000060000;
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
