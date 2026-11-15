// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121320 dut (
    .clk(clk),
    .data(in_vec[14:5]),
    .ce(in_vec[4:4]),
    .a(in_vec[3:0]),
    .q(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h3813;
    stim[1] = 15'h0ef1;
    stim[2] = 15'h715e;
    stim[3] = 15'h0e3e;
    stim[4] = 15'h6a38;
    stim[5] = 15'h6a98;
    stim[6] = 15'h3948;
    stim[7] = 15'h2f05;
    stim[8] = 15'h229e;
    stim[9] = 15'h3c27;
    stim[10] = 15'h7d55;
    stim[11] = 15'h201f;
    stim[12] = 15'h0264;
    stim[13] = 15'h7120;
    stim[14] = 15'h470e;
    stim[15] = 15'h35fe;
    stim[16] = 15'h6a2c;
    stim[17] = 15'h775f;
    stim[18] = 15'h2f1f;
    stim[19] = 15'h62ae;
    stim[20] = 15'h3bbc;
    stim[21] = 15'h173c;
    stim[22] = 15'h6705;
    stim[23] = 15'h2d6a;
    stim[24] = 15'h4606;
    stim[25] = 15'h10ff;
    stim[26] = 15'h41b2;
    stim[27] = 15'h50ed;
    stim[28] = 15'h3980;
    stim[29] = 15'h3ca7;
    stim[30] = 15'h0eaa;
    stim[31] = 15'h6b58;
    stim[32] = 15'h09c0;
    stim[33] = 15'h2260;
    stim[34] = 15'h1e26;
    stim[35] = 15'h3a25;
    stim[36] = 15'h7ce9;
    stim[37] = 15'h2808;
    stim[38] = 15'h3743;
    stim[39] = 15'h031a;
    stim[40] = 15'h0e29;
    stim[41] = 15'h46c5;
    stim[42] = 15'h3df8;
    stim[43] = 15'h5e83;
    stim[44] = 15'h6442;
    stim[45] = 15'h6107;
    stim[46] = 15'h0e7b;
    stim[47] = 15'h20f3;
    stim[48] = 15'h4912;
    stim[49] = 15'h551b;
    stim[50] = 15'h1e47;
    stim[51] = 15'h79e8;
    stim[52] = 15'h6a38;
    stim[53] = 15'h413d;
    stim[54] = 15'h3d8d;
    stim[55] = 15'h5472;
    stim[56] = 15'h3780;
    stim[57] = 15'h3e5b;
    stim[58] = 15'h0fe5;
    stim[59] = 15'h3322;
    stim[60] = 15'h05f8;
    stim[61] = 15'h178f;
    stim[62] = 15'h62d8;
    stim[63] = 15'h4a26;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'h1c0;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'h077;
      expv[11] = 10'hxxx;
      expv[12] = 10'h351;
      expv[13] = 10'h100;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'h1c0;
      expv[17] = 10'h1c0;
      expv[18] = 10'h077;
      expv[19] = 10'h38a;
      expv[20] = 10'h38a;
      expv[21] = 10'h071;
      expv[22] = 10'h100;
      expv[23] = 10'h351;
      expv[24] = 10'h3ea;
      expv[25] = 10'h351;
      expv[26] = 10'h1dd;
      expv[27] = 10'h114;
      expv[28] = 10'h20d;
      expv[29] = 10'h100;
      expv[30] = 10'h114;
      expv[31] = 10'h3ea;
      expv[32] = 10'h35a;
      expv[33] = 10'h35a;
      expv[34] = 10'h3ba;
      expv[35] = 10'h178;
      expv[36] = 10'h3ea;
      expv[37] = 10'h100;
      expv[38] = 10'h0b9;
      expv[39] = 10'h3ea;
      expv[40] = 10'h100;
      expv[41] = 10'h1dd;
      expv[42] = 10'h1af;
      expv[43] = 10'h20d;
      expv[44] = 10'h35a;
      expv[45] = 10'h178;
      expv[46] = 10'h1af;
      expv[47] = 10'h35a;
      expv[48] = 10'h1ef;
      expv[49] = 10'h1dd;
      expv[50] = 10'h20d;
      expv[51] = 10'h087;
      expv[52] = 10'h087;
      expv[53] = 10'h087;
      expv[54] = 10'h20d;
      expv[55] = 10'h2a8;
      expv[56] = 10'h2a3;
      expv[57] = 10'h35a;
      expv[58] = 10'h248;
      expv[59] = 10'h209;
      expv[60] = 10'h1ef;
      expv[61] = 10'h1ef;
      expv[62] = 10'h073;
      expv[63] = 10'h2a8;
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
