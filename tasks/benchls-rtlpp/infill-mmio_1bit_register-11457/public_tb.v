// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11457 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h141c31edc9;
    stim[1] = 37'h05894af6fb;
    stim[2] = 37'h1fb11d0d58;
    stim[3] = 37'h0238d79823;
    stim[4] = 37'h0f221de65c;
    stim[5] = 37'h1aebee0c72;
    stim[6] = 37'h121d66a697;
    stim[7] = 37'h0e0fc7d52e;
    stim[8] = 37'h1f4857736d;
    stim[9] = 37'h1a2a69d36e;
    stim[10] = 37'h0f35bc13bb;
    stim[11] = 37'h1642bba158;
    stim[12] = 37'h0656399e9a;
    stim[13] = 37'h0260784319;
    stim[14] = 37'h17cfc70d1d;
    stim[15] = 37'h12a64b208b;
    stim[16] = 37'h1700a8b342;
    stim[17] = 37'h17c154f974;
    stim[18] = 37'h0745636b98;
    stim[19] = 37'h034ce04c8e;
    stim[20] = 37'h1e54a4133d;
    stim[21] = 37'h0769f1bbe6;
    stim[22] = 37'h03ddb00a5d;
    stim[23] = 37'h0f2fe39370;
    stim[24] = 37'h137715cff8;
    stim[25] = 37'h1f5e8bf479;
    stim[26] = 37'h1296829b44;
    stim[27] = 37'h1f74975c69;
    stim[28] = 37'h1a96492288;
    stim[29] = 37'h1b747f5ace;
    stim[30] = 37'h0b21ad500b;
    stim[31] = 37'h1b983edddf;
    stim[32] = 37'h071200139a;
    stim[33] = 37'h1294521885;
    stim[34] = 37'h0a0b21369e;
    stim[35] = 37'h12fe7e6321;
    stim[36] = 37'h1786d83bce;
    stim[37] = 37'h0f3c7b6d54;
    stim[38] = 37'h130e69b214;
    stim[39] = 37'h1cb7774e7c;
    stim[40] = 37'h022b9f8768;
    stim[41] = 37'h1edd298d37;
    stim[42] = 37'h02cce9b861;
    stim[43] = 37'h034c66015e;
    stim[44] = 37'h0bdf1c0598;
    stim[45] = 37'h0ecaae4700;
    stim[46] = 37'h0bde45042e;
    stim[47] = 37'h1f6a7dc3e3;
    stim[48] = 37'h0b1ded8181;
    stim[49] = 37'h02968d0abc;
    stim[50] = 37'h16752971e9;
    stim[51] = 37'h17f1ff0712;
    stim[52] = 37'h0360bed9f5;
    stim[53] = 37'h18ec37e496;
    stim[54] = 37'h1e1bc2783f;
    stim[55] = 37'h0f816a0c1c;
    stim[56] = 37'h13208da375;
    stim[57] = 37'h1e0e2eba92;
    stim[58] = 37'h0a4064759a;
    stim[59] = 37'h16909ce211;
    stim[60] = 37'h1f49e23b16;
    stim[61] = 37'h06631c27ec;
    stim[62] = 37'h16de54fe23;
    stim[63] = 37'h02071883a6;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
