// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035113 dut (
    .fpga_clk(clk),
    .reset(in_vec[6:6]),
    .vga_clk(in_vec[5:5]),
    .display_area(in_vec[4:4]),
    .shifter_output(in_vec[3:3]),
    .Rin(in_vec[2:2]),
    .Gin(in_vec[1:1]),
    .Bin(in_vec[0:0]),
    .Redout(out_vec[8:6]),
    .Greenout(out_vec[5:3]),
    .Blueout(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h79;
    stim[1] = 7'h6f;
    stim[2] = 7'h12;
    stim[3] = 7'h20;
    stim[4] = 7'h1a;
    stim[5] = 7'h28;
    stim[6] = 7'h08;
    stim[7] = 7'h3d;
    stim[8] = 7'h08;
    stim[9] = 7'h03;
    stim[10] = 7'h23;
    stim[11] = 7'h33;
    stim[12] = 7'h3a;
    stim[13] = 7'h23;
    stim[14] = 7'h32;
    stim[15] = 7'h33;
    stim[16] = 7'h23;
    stim[17] = 7'h2b;
    stim[18] = 7'h0a;
    stim[19] = 7'h11;
    stim[20] = 7'h1f;
    stim[21] = 7'h22;
    stim[22] = 7'h29;
    stim[23] = 7'h1d;
    stim[24] = 7'h2d;
    stim[25] = 7'h14;
    stim[26] = 7'h06;
    stim[27] = 7'h1b;
    stim[28] = 7'h4f;
    stim[29] = 7'h1c;
    stim[30] = 7'h27;
    stim[31] = 7'h21;
    stim[32] = 7'h3f;
    stim[33] = 7'h25;
    stim[34] = 7'h0a;
    stim[35] = 7'h14;
    stim[36] = 7'h31;
    stim[37] = 7'h00;
    stim[38] = 7'h15;
    stim[39] = 7'h22;
    stim[40] = 7'h37;
    stim[41] = 7'h15;
    stim[42] = 7'h28;
    stim[43] = 7'h0b;
    stim[44] = 7'h3f;
    stim[45] = 7'h1e;
    stim[46] = 7'h32;
    stim[47] = 7'h18;
    stim[48] = 7'h3b;
    stim[49] = 7'h21;
    stim[50] = 7'h2c;
    stim[51] = 7'h04;
    stim[52] = 7'h21;
    stim[53] = 7'h06;
    stim[54] = 7'h3c;
    stim[55] = 7'h06;
    stim[56] = 7'h3d;
    stim[57] = 7'h16;
    stim[58] = 7'h33;
    stim[59] = 7'h2c;
    stim[60] = 7'h15;
    stim[61] = 7'h2f;
    stim[62] = 7'h28;
    stim[63] = 7'h2c;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h010;
      expv[8] = 9'h010;
      expv[9] = 9'h010;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h1f6;
      expv[45] = 9'h1f6;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h175;
      expv[49] = 9'h175;
      expv[50] = 9'h175;
      expv[51] = 9'h175;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h0a2;
      expv[55] = 9'h0a2;
      expv[56] = 9'h01a;
      expv[57] = 9'h01a;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
