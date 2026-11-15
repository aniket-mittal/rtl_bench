// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_009464 dut (
    .in(in_vec[31:0]),
    .sum(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hd5ed9c15;
    stim[1] = 32'h3e4325f1;
    stim[2] = 32'hb328b729;
    stim[3] = 32'h4734fc96;
    stim[4] = 32'h114a8877;
    stim[5] = 32'h78584b29;
    stim[6] = 32'haef22ab5;
    stim[7] = 32'hbc2b3821;
    stim[8] = 32'h071ac19f;
    stim[9] = 32'h977fb54c;
    stim[10] = 32'h101fb637;
    stim[11] = 32'hb38bb333;
    stim[12] = 32'hd345e5bc;
    stim[13] = 32'hf6f31be2;
    stim[14] = 32'h88f6961d;
    stim[15] = 32'hfaa32f17;
    stim[16] = 32'hb6922e18;
    stim[17] = 32'h205fd667;
    stim[18] = 32'hf9656d9b;
    stim[19] = 32'hcc653966;
    stim[20] = 32'h2064e3e1;
    stim[21] = 32'h7cb44b56;
    stim[22] = 32'hac4e7cbe;
    stim[23] = 32'h65d60153;
    stim[24] = 32'h5e68b690;
    stim[25] = 32'h26c1a4da;
    stim[26] = 32'hc74c1590;
    stim[27] = 32'h155ed3ec;
    stim[28] = 32'h147b1bb5;
    stim[29] = 32'h3eae1572;
    stim[30] = 32'he14ee344;
    stim[31] = 32'h0e195b6b;
    stim[32] = 32'h7c8f8f01;
    stim[33] = 32'hf8db3347;
    stim[34] = 32'hc80e60a9;
    stim[35] = 32'h4e5812be;
    stim[36] = 32'hf2e76d7b;
    stim[37] = 32'hd7e9c7aa;
    stim[38] = 32'h9f5bb5e8;
    stim[39] = 32'h9543b3ed;
    stim[40] = 32'h5f7d71eb;
    stim[41] = 32'h8a579066;
    stim[42] = 32'h710781e1;
    stim[43] = 32'haacc1a08;
    stim[44] = 32'h2c934e41;
    stim[45] = 32'h41726019;
    stim[46] = 32'hbe55e4a3;
    stim[47] = 32'haae3040e;
    stim[48] = 32'h8d3c8f12;
    stim[49] = 32'h7c26f03a;
    stim[50] = 32'h0d17d383;
    stim[51] = 32'h413c4ede;
    stim[52] = 32'hff2c5ffd;
    stim[53] = 32'hffac8a52;
    stim[54] = 32'h29625c25;
    stim[55] = 32'h43fd0a84;
    stim[56] = 32'h5fc080a6;
    stim[57] = 32'h0d844cbf;
    stim[58] = 32'h558d3bb4;
    stim[59] = 32'hb4763d45;
    stim[60] = 32'h87e61a02;
    stim[61] = 32'hdc367ea4;
    stim[62] = 32'h997e36ed;
    stim[63] = 32'hf67b84c2;
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
      expv[0] = 6'h02;
      expv[1] = 6'h00;
      expv[2] = 6'h02;
      expv[3] = 6'h01;
      expv[4] = 6'h01;
      expv[5] = 6'h02;
      expv[6] = 6'h00;
      expv[7] = 6'h02;
      expv[8] = 6'h01;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h02;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h01;
      expv[16] = 6'h00;
      expv[17] = 6'h01;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h01;
      expv[21] = 6'h01;
      expv[22] = 6'h01;
      expv[23] = 6'h02;
      expv[24] = 6'h01;
      expv[25] = 6'h00;
      expv[26] = 6'h01;
      expv[27] = 6'h00;
      expv[28] = 6'h01;
      expv[29] = 6'h01;
      expv[30] = 6'h01;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h01;
      expv[34] = 6'h00;
      expv[35] = 6'h01;
      expv[36] = 6'h02;
      expv[37] = 6'h02;
      expv[38] = 6'h02;
      expv[39] = 6'h02;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h01;
      expv[43] = 6'h00;
      expv[44] = 6'h01;
      expv[45] = 6'h01;
      expv[46] = 6'h00;
      expv[47] = 6'h01;
      expv[48] = 6'h01;
      expv[49] = 6'h00;
      expv[50] = 6'h01;
      expv[51] = 6'h00;
      expv[52] = 6'h02;
      expv[53] = 6'h00;
      expv[54] = 6'h01;
      expv[55] = 6'h00;
      expv[56] = 6'h01;
      expv[57] = 6'h01;
      expv[58] = 6'h01;
      expv[59] = 6'h01;
      expv[60] = 6'h01;
      expv[61] = 6'h02;
      expv[62] = 6'h00;
      expv[63] = 6'h01;
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
