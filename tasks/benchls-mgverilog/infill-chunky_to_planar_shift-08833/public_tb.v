// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08833 dut (
    .clk(clk),
    .reset(in_vec[41:41]),
    .address_in(in_vec[40:18]),
    .data_in(in_vec[17:2]),
    .rd(in_vec[1:1]),
    .sel_akiko(in_vec[0:0]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h2056eb146c3;
    stim[1] = 42'h2f90dcc9297;
    stim[2] = 42'h0b9cbd38df1;
    stim[3] = 42'h11399dc57ba;
    stim[4] = 42'h16ffafd651d;
    stim[5] = 42'h0406dca956c;
    stim[6] = 42'h04cb7d58e74;
    stim[7] = 42'h0c87c21d01f;
    stim[8] = 42'h16b1f4c42d6;
    stim[9] = 42'h1d6443ced2a;
    stim[10] = 42'h0b1037a7642;
    stim[11] = 42'h00f4404b166;
    stim[12] = 42'h3ee80a1a776;
    stim[13] = 42'h01d96fc7bf1;
    stim[14] = 42'h11884023ee5;
    stim[15] = 42'h0f33a2f4e32;
    stim[16] = 42'h01b5eb5524a;
    stim[17] = 42'h0ac788ea5aa;
    stim[18] = 42'h01bae76472a;
    stim[19] = 42'h27082e88455;
    stim[20] = 42'h19af8fd4100;
    stim[21] = 42'h14bb677e2a8;
    stim[22] = 42'h12c60996fda;
    stim[23] = 42'h1be84c4559c;
    stim[24] = 42'h0fe08ead2c4;
    stim[25] = 42'h1b3367785d6;
    stim[26] = 42'h08f83fbffa8;
    stim[27] = 42'h001141aa2ad;
    stim[28] = 42'h1c64e434bb2;
    stim[29] = 42'h0acd5549da9;
    stim[30] = 42'h01c1b08d978;
    stim[31] = 42'h12e4ca190fe;
    stim[32] = 42'h1327da0d128;
    stim[33] = 42'h0722986aa04;
    stim[34] = 42'h14bdfcf0cae;
    stim[35] = 42'h06998b4cd5b;
    stim[36] = 42'h07f4aef4609;
    stim[37] = 42'h090c8ab7a5f;
    stim[38] = 42'h16a5e1bc2b3;
    stim[39] = 42'h0a0d88caca1;
    stim[40] = 42'h1bd46fa57ce;
    stim[41] = 42'h0e61c217a90;
    stim[42] = 42'h1eb07f6b9f1;
    stim[43] = 42'h041a50e67fa;
    stim[44] = 42'h05a82dfb3d8;
    stim[45] = 42'h17a3bd99b94;
    stim[46] = 42'h04fc574afdc;
    stim[47] = 42'h1d8daed7b50;
    stim[48] = 42'h020226fe5b7;
    stim[49] = 42'h14f40fa9cd6;
    stim[50] = 42'h10a297e4442;
    stim[51] = 42'h05b7604971f;
    stim[52] = 42'h18b3f75c443;
    stim[53] = 42'h0efa8e984ff;
    stim[54] = 42'h1018b605763;
    stim[55] = 42'h1f9b252f0bb;
    stim[56] = 42'h1cf3e2074ad;
    stim[57] = 42'h082d0e5ae49;
    stim[58] = 42'h16d702c45e5;
    stim[59] = 42'h1c6951210c9;
    stim[60] = 42'h03e5039a2a2;
    stim[61] = 42'h13fe8faf836;
    stim[62] = 42'h1096ec228c9;
    stim[63] = 42'h122a0c2249a;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'hxxxx;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'hxxxx;
      expv[36] = 16'h0000;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'hxxxx;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
