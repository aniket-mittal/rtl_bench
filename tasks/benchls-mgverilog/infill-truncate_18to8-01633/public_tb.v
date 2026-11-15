// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01633 dut (
    .Din(in_vec[17:0]),
    .Dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h054c5;
    stim[1] = 18'h25c69;
    stim[2] = 18'h24b24;
    stim[3] = 18'h2c812;
    stim[4] = 18'h2c4a3;
    stim[5] = 18'h0a974;
    stim[6] = 18'h25be3;
    stim[7] = 18'h121ed;
    stim[8] = 18'h2660e;
    stim[9] = 18'h006ce;
    stim[10] = 18'h30466;
    stim[11] = 18'h3c3f3;
    stim[12] = 18'h2d76c;
    stim[13] = 18'h2fefb;
    stim[14] = 18'h171ac;
    stim[15] = 18'h0520d;
    stim[16] = 18'h055f2;
    stim[17] = 18'h0d70d;
    stim[18] = 18'h12b85;
    stim[19] = 18'h35ee7;
    stim[20] = 18'h0975d;
    stim[21] = 18'h08df6;
    stim[22] = 18'h3467f;
    stim[23] = 18'h15dae;
    stim[24] = 18'h1a1d2;
    stim[25] = 18'h08c06;
    stim[26] = 18'h2da9b;
    stim[27] = 18'h249b0;
    stim[28] = 18'h07593;
    stim[29] = 18'h0b33e;
    stim[30] = 18'h064b8;
    stim[31] = 18'h16668;
    stim[32] = 18'h11ce5;
    stim[33] = 18'h028cf;
    stim[34] = 18'h3827b;
    stim[35] = 18'h397d6;
    stim[36] = 18'h0d2f8;
    stim[37] = 18'h279f5;
    stim[38] = 18'h175a9;
    stim[39] = 18'h3159e;
    stim[40] = 18'h3264a;
    stim[41] = 18'h0c326;
    stim[42] = 18'h3e482;
    stim[43] = 18'h05171;
    stim[44] = 18'h30114;
    stim[45] = 18'h201e6;
    stim[46] = 18'h08634;
    stim[47] = 18'h2111b;
    stim[48] = 18'h107ab;
    stim[49] = 18'h02ec1;
    stim[50] = 18'h0b285;
    stim[51] = 18'h0198a;
    stim[52] = 18'h16517;
    stim[53] = 18'h34699;
    stim[54] = 18'h2bdaa;
    stim[55] = 18'h177df;
    stim[56] = 18'h0615b;
    stim[57] = 18'h3cd2a;
    stim[58] = 18'h37a45;
    stim[59] = 18'h2c51b;
    stim[60] = 18'h09ee7;
    stim[61] = 18'h0c45c;
    stim[62] = 18'h285c9;
    stim[63] = 18'h2c36b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'hc5;
      expv[1] = 8'h69;
      expv[2] = 8'h24;
      expv[3] = 8'h12;
      expv[4] = 8'ha3;
      expv[5] = 8'h74;
      expv[6] = 8'he3;
      expv[7] = 8'hed;
      expv[8] = 8'h0e;
      expv[9] = 8'hce;
      expv[10] = 8'h66;
      expv[11] = 8'hf3;
      expv[12] = 8'h6c;
      expv[13] = 8'hfb;
      expv[14] = 8'hac;
      expv[15] = 8'h0d;
      expv[16] = 8'hf2;
      expv[17] = 8'h0d;
      expv[18] = 8'h85;
      expv[19] = 8'he7;
      expv[20] = 8'h5d;
      expv[21] = 8'hf6;
      expv[22] = 8'h7f;
      expv[23] = 8'hae;
      expv[24] = 8'hd2;
      expv[25] = 8'h06;
      expv[26] = 8'h9b;
      expv[27] = 8'hb0;
      expv[28] = 8'h93;
      expv[29] = 8'h3e;
      expv[30] = 8'hb8;
      expv[31] = 8'h68;
      expv[32] = 8'he5;
      expv[33] = 8'hcf;
      expv[34] = 8'h7b;
      expv[35] = 8'hd6;
      expv[36] = 8'hf8;
      expv[37] = 8'hf5;
      expv[38] = 8'ha9;
      expv[39] = 8'h9e;
      expv[40] = 8'h4a;
      expv[41] = 8'h26;
      expv[42] = 8'h82;
      expv[43] = 8'h71;
      expv[44] = 8'h14;
      expv[45] = 8'he6;
      expv[46] = 8'h34;
      expv[47] = 8'h1b;
      expv[48] = 8'hab;
      expv[49] = 8'hc1;
      expv[50] = 8'h85;
      expv[51] = 8'h8a;
      expv[52] = 8'h17;
      expv[53] = 8'h99;
      expv[54] = 8'haa;
      expv[55] = 8'hdf;
      expv[56] = 8'h5b;
      expv[57] = 8'h2a;
      expv[58] = 8'h45;
      expv[59] = 8'h1b;
      expv[60] = 8'he7;
      expv[61] = 8'h5c;
      expv[62] = 8'hc9;
      expv[63] = 8'h6b;
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
