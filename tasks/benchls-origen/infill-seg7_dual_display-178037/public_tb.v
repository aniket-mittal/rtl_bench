// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178037 dut (
    .clk(clk),
    .seg01(in_vec[28:22]),
    .seg02(in_vec[21:15]),
    .seg11(in_vec[14:8]),
    .seg12(in_vec[7:1]),
    .rst(in_vec[0:0]),
    .seg0(out_vec[15:9]),
    .seg1(out_vec[8:2]),
    .cat0(out_vec[1:1]),
    .cat1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h1c3eb9af;
    stim[1] = 29'h04cb69c5;
    stim[2] = 29'h1fa3f070;
    stim[3] = 29'h16e3ab60;
    stim[4] = 29'h1369cef2;
    stim[5] = 29'h0ac3b890;
    stim[6] = 29'h144dc8fe;
    stim[7] = 29'h129de83e;
    stim[8] = 29'h14cde7b8;
    stim[9] = 29'h0629d1ae;
    stim[10] = 29'h0854d194;
    stim[11] = 29'h06caf9e2;
    stim[12] = 29'h136f25d4;
    stim[13] = 29'h120598e4;
    stim[14] = 29'h1eefd622;
    stim[15] = 29'h1a07fa06;
    stim[16] = 29'h0b64355a;
    stim[17] = 29'h078f3916;
    stim[18] = 29'h04d178f2;
    stim[19] = 29'h1d561b98;
    stim[20] = 29'h1d4b9a80;
    stim[21] = 29'h1c845866;
    stim[22] = 29'h1c6c62e6;
    stim[23] = 29'h07393072;
    stim[24] = 29'h099a5e14;
    stim[25] = 29'h18f5b256;
    stim[26] = 29'h17df8452;
    stim[27] = 29'h0743026e;
    stim[28] = 29'h02dd29d8;
    stim[29] = 29'h0824befc;
    stim[30] = 29'h0d9e8eba;
    stim[31] = 29'h00ea7279;
    stim[32] = 29'h199fab2c;
    stim[33] = 29'h0f92c05a;
    stim[34] = 29'h02e679a2;
    stim[35] = 29'h11f47f6a;
    stim[36] = 29'h12f69d94;
    stim[37] = 29'h1970a21c;
    stim[38] = 29'h1a098e1e;
    stim[39] = 29'h192e1f3e;
    stim[40] = 29'h08744c06;
    stim[41] = 29'h0c8525e0;
    stim[42] = 29'h148c4138;
    stim[43] = 29'h156b4740;
    stim[44] = 29'h1b124b1a;
    stim[45] = 29'h19461fe2;
    stim[46] = 29'h0a42b8ce;
    stim[47] = 29'h019589c8;
    stim[48] = 29'h1d9e6000;
    stim[49] = 29'h1458185a;
    stim[50] = 29'h18b9d12e;
    stim[51] = 29'h1e8e7f22;
    stim[52] = 29'h1f3f3391;
    stim[53] = 29'h08336842;
    stim[54] = 29'h1228c7ee;
    stim[55] = 29'h0ac413a8;
    stim[56] = 29'h126169a8;
    stim[57] = 29'h00c12fcc;
    stim[58] = 29'h0b90c030;
    stim[59] = 29'h08d2f9f0;
    stim[60] = 29'h1a176c3a;
    stim[61] = 29'h0a7cf7e2;
    stim[62] = 29'h0b120b2c;
    stim[63] = 29'h1ef959c2;
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
      expv[0] = 16'hffff;
      expv[1] = 16'he1fd;
      expv[2] = 16'hffff;
      expv[3] = 16'hffff;
      expv[4] = 16'hffff;
      expv[5] = 16'hffff;
      expv[6] = 16'hffff;
      expv[7] = 16'hffff;
      expv[8] = 16'hffff;
      expv[9] = 16'hffff;
      expv[10] = 16'hffff;
      expv[11] = 16'hffff;
      expv[12] = 16'hffff;
      expv[13] = 16'hffff;
      expv[14] = 16'hffff;
      expv[15] = 16'hffff;
      expv[16] = 16'hffff;
      expv[17] = 16'hffff;
      expv[18] = 16'hffff;
      expv[19] = 16'hffff;
      expv[20] = 16'hffff;
      expv[21] = 16'hffff;
      expv[22] = 16'hffff;
      expv[23] = 16'hffff;
      expv[24] = 16'hffff;
      expv[25] = 16'hffff;
      expv[26] = 16'hffff;
      expv[27] = 16'hffff;
      expv[28] = 16'hffff;
      expv[29] = 16'hffff;
      expv[30] = 16'hffff;
      expv[31] = 16'hffff;
      expv[32] = 16'hffff;
      expv[33] = 16'hffff;
      expv[34] = 16'hffff;
      expv[35] = 16'hffff;
      expv[36] = 16'hffff;
      expv[37] = 16'hffff;
      expv[38] = 16'hffff;
      expv[39] = 16'hffff;
      expv[40] = 16'hffff;
      expv[41] = 16'hffff;
      expv[42] = 16'hffff;
      expv[43] = 16'hffff;
      expv[44] = 16'hffff;
      expv[45] = 16'hffff;
      expv[46] = 16'hffff;
      expv[47] = 16'hffff;
      expv[48] = 16'hffff;
      expv[49] = 16'hffff;
      expv[50] = 16'hffff;
      expv[51] = 16'hffff;
      expv[52] = 16'hffff;
      expv[53] = 16'hffff;
      expv[54] = 16'hffff;
      expv[55] = 16'hffff;
      expv[56] = 16'hffff;
      expv[57] = 16'hffff;
      expv[58] = 16'hffff;
      expv[59] = 16'hffff;
      expv[60] = 16'hffff;
      expv[61] = 16'hffff;
      expv[62] = 16'hffff;
      expv[63] = 16'hffff;
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
