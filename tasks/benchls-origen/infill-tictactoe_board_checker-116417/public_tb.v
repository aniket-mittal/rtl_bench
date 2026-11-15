// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116417 dut (
    .x(in_vec[17:9]),
    .o(in_vec[8:0]),
    .error(out_vec[4:4]),
    .full(out_vec[3:3]),
    .winX(out_vec[2:2]),
    .winO(out_vec[1:1]),
    .noWin(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2ccbc;
    stim[1] = 18'h2a663;
    stim[2] = 18'h28872;
    stim[3] = 18'h36be5;
    stim[4] = 18'h370ff;
    stim[5] = 18'h015b7;
    stim[6] = 18'h0ffdd;
    stim[7] = 18'h3c17e;
    stim[8] = 18'h0daa7;
    stim[9] = 18'h0687f;
    stim[10] = 18'h02e09;
    stim[11] = 18'h08fa8;
    stim[12] = 18'h19e20;
    stim[13] = 18'h3fad2;
    stim[14] = 18'h0e629;
    stim[15] = 18'h1a02d;
    stim[16] = 18'h0e50a;
    stim[17] = 18'h0bdb0;
    stim[18] = 18'h06ab1;
    stim[19] = 18'h16768;
    stim[20] = 18'h2c2e5;
    stim[21] = 18'h24f2e;
    stim[22] = 18'h11d1a;
    stim[23] = 18'h30c08;
    stim[24] = 18'h21915;
    stim[25] = 18'h2da79;
    stim[26] = 18'h2bfac;
    stim[27] = 18'h18bce;
    stim[28] = 18'h3f1f8;
    stim[29] = 18'h1e209;
    stim[30] = 18'h102b9;
    stim[31] = 18'h24b90;
    stim[32] = 18'h02807;
    stim[33] = 18'h15adc;
    stim[34] = 18'h1b2b3;
    stim[35] = 18'h10da6;
    stim[36] = 18'h164c4;
    stim[37] = 18'h30d7f;
    stim[38] = 18'h35925;
    stim[39] = 18'h3b121;
    stim[40] = 18'h0979e;
    stim[41] = 18'h0cbfe;
    stim[42] = 18'h2c86b;
    stim[43] = 18'h11851;
    stim[44] = 18'h0a095;
    stim[45] = 18'h0936a;
    stim[46] = 18'h20664;
    stim[47] = 18'h29caa;
    stim[48] = 18'h0a375;
    stim[49] = 18'h2a1c3;
    stim[50] = 18'h0d130;
    stim[51] = 18'h168da;
    stim[52] = 18'h2d9f3;
    stim[53] = 18'h04b37;
    stim[54] = 18'h00fb5;
    stim[55] = 18'h05dad;
    stim[56] = 18'h28ca0;
    stim[57] = 18'h297b1;
    stim[58] = 18'h24ef3;
    stim[59] = 18'h09b99;
    stim[60] = 18'h1d99c;
    stim[61] = 18'h14e50;
    stim[62] = 18'h381b3;
    stim[63] = 18'h1cb24;
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
      expv[0] = 5'h16;
      expv[1] = 5'h14;
      expv[2] = 5'h11;
      expv[3] = 5'h16;
      expv[4] = 5'h1e;
      expv[5] = 5'h12;
      expv[6] = 5'h1e;
      expv[7] = 5'h16;
      expv[8] = 5'h16;
      expv[9] = 5'h12;
      expv[10] = 5'h14;
      expv[11] = 5'h04;
      expv[12] = 5'h04;
      expv[13] = 5'h1e;
      expv[14] = 5'h11;
      expv[15] = 5'h01;
      expv[16] = 5'h11;
      expv[17] = 5'h14;
      expv[18] = 5'h11;
      expv[19] = 5'h14;
      expv[20] = 5'h11;
      expv[21] = 5'h16;
      expv[22] = 5'h11;
      expv[23] = 5'h01;
      expv[24] = 5'h12;
      expv[25] = 5'h16;
      expv[26] = 5'h1e;
      expv[27] = 5'h12;
      expv[28] = 5'h16;
      expv[29] = 5'h11;
      expv[30] = 5'h12;
      expv[31] = 5'h14;
      expv[32] = 5'h12;
      expv[33] = 5'h12;
      expv[34] = 5'h16;
      expv[35] = 5'h12;
      expv[36] = 5'h14;
      expv[37] = 5'h1a;
      expv[38] = 5'h16;
      expv[39] = 5'h14;
      expv[40] = 5'h16;
      expv[41] = 5'h1a;
      expv[42] = 5'h16;
      expv[43] = 5'h01;
      expv[44] = 5'h11;
      expv[45] = 5'h14;
      expv[46] = 5'h01;
      expv[47] = 5'h11;
      expv[48] = 5'h12;
      expv[49] = 5'h12;
      expv[50] = 5'h11;
      expv[51] = 5'h12;
      expv[52] = 5'h1e;
      expv[53] = 5'h12;
      expv[54] = 5'h16;
      expv[55] = 5'h12;
      expv[56] = 5'h01;
      expv[57] = 5'h16;
      expv[58] = 5'h16;
      expv[59] = 5'h16;
      expv[60] = 5'h11;
      expv[61] = 5'h04;
      expv[62] = 5'h16;
      expv[63] = 5'h12;
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
