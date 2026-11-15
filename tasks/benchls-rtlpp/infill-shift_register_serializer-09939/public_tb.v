// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09939 dut (
    .clk(clk),
    .load(in_vec[32:32]),
    .din(in_vec[31:0]),
    .sout(out_vec[1:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h000d86736;
    stim[1] = 33'h184e33055;
    stim[2] = 33'h0f1c496b0;
    stim[3] = 33'h0a21a86c6;
    stim[4] = 33'h0e711b2d8;
    stim[5] = 33'h0f6624724;
    stim[6] = 33'h072997215;
    stim[7] = 33'h073bf462a;
    stim[8] = 33'h009d40a23;
    stim[9] = 33'h1db59f685;
    stim[10] = 33'h0ebe02d61;
    stim[11] = 33'h1daa00510;
    stim[12] = 33'h1f03b2101;
    stim[13] = 33'h1c54f14aa;
    stim[14] = 33'h1cd54f71c;
    stim[15] = 33'h1a651441f;
    stim[16] = 33'h199b9e29e;
    stim[17] = 33'h0831c24f4;
    stim[18] = 33'h1d4307ec0;
    stim[19] = 33'h0dc44c71c;
    stim[20] = 33'h15b2d2712;
    stim[21] = 33'h0f7fc23c5;
    stim[22] = 33'h055d69b04;
    stim[23] = 33'h0e737f3a6;
    stim[24] = 33'h09a0ce86c;
    stim[25] = 33'h1003a21b1;
    stim[26] = 33'h0d012705a;
    stim[27] = 33'h1189e4f09;
    stim[28] = 33'h1d72a25dc;
    stim[29] = 33'h19e709f4b;
    stim[30] = 33'h1aee5a651;
    stim[31] = 33'h1c32f39eb;
    stim[32] = 33'h0c5daedc2;
    stim[33] = 33'h06ce0905a;
    stim[34] = 33'h09b0d7c6e;
    stim[35] = 33'h1503455ac;
    stim[36] = 33'h17e8f9193;
    stim[37] = 33'h12ab55a8f;
    stim[38] = 33'h08e6e6cfc;
    stim[39] = 33'h1ef5d577b;
    stim[40] = 33'h07dbdc482;
    stim[41] = 33'h0ea1cfc15;
    stim[42] = 33'h073c0b315;
    stim[43] = 33'h1977c0d38;
    stim[44] = 33'h1f3ec7f8c;
    stim[45] = 33'h160d70051;
    stim[46] = 33'h0df70a0dc;
    stim[47] = 33'h0202d8d86;
    stim[48] = 33'h01fe85089;
    stim[49] = 33'h0b74067c0;
    stim[50] = 33'h119216c6c;
    stim[51] = 33'h15fad3bd0;
    stim[52] = 33'h17a021069;
    stim[53] = 33'h1008a4b55;
    stim[54] = 33'h08cb49701;
    stim[55] = 33'h044dc5f4a;
    stim[56] = 33'h02bba5fcd;
    stim[57] = 33'h109ab2fb1;
    stim[58] = 33'h0e0791564;
    stim[59] = 33'h15580dbe9;
    stim[60] = 33'h1730445d8;
    stim[61] = 33'h16c7b3ab7;
    stim[62] = 33'h075584a3e;
    stim[63] = 33'h0bfdf5652;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'h2;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h2;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h2;
      expv[11] = 2'h2;
      expv[12] = 2'h2;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h0;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h0;
      expv[22] = 2'h2;
      expv[23] = 2'h0;
      expv[24] = 2'h2;
      expv[25] = 2'h2;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h2;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h0;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h0;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h2;
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
