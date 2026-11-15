// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011620 dut (
    .clk(clk),
    .start(in_vec[48:48]),
    .bus_in(in_vec[47:0]),
    .done(out_vec[1:1]),
    .serial_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0b48a3c5888e8;
    stim[1] = 49'h16754b14687ad;
    stim[2] = 49'h07a2772aa88db;
    stim[3] = 49'h0d9b3e6cca877;
    stim[4] = 49'h038979dbd2183;
    stim[5] = 49'h0263da62516b0;
    stim[6] = 49'h134baa9979d04;
    stim[7] = 49'h0b82a1b2cac0e;
    stim[8] = 49'h14f5f9d1ef5ad;
    stim[9] = 49'h0e89007990aeb;
    stim[10] = 49'h0a82729e9f18b;
    stim[11] = 49'h06e27ee707575;
    stim[12] = 49'h19f7f41080ec9;
    stim[13] = 49'h1a07f8da9c0ff;
    stim[14] = 49'h0f8c5d94bdffe;
    stim[15] = 49'h15fea1a0e530d;
    stim[16] = 49'h1ed3fc57fbb41;
    stim[17] = 49'h003ce43db82ee;
    stim[18] = 49'h043ec579a8606;
    stim[19] = 49'h17af9cc0907ed;
    stim[20] = 49'h0dd745de02aa6;
    stim[21] = 49'h0a73ddba12deb;
    stim[22] = 49'h1f080cbde1b99;
    stim[23] = 49'h1a0802c77a1d3;
    stim[24] = 49'h1563c8b46da40;
    stim[25] = 49'h1e81a8a64d0c5;
    stim[26] = 49'h03fc196625923;
    stim[27] = 49'h0099c4b70c86c;
    stim[28] = 49'h0fdc2a23d7849;
    stim[29] = 49'h1dc17e5e47730;
    stim[30] = 49'h0f40c7606321d;
    stim[31] = 49'h0230118d598b5;
    stim[32] = 49'h069f8b555d9b1;
    stim[33] = 49'h03cea72c8682c;
    stim[34] = 49'h13cc1f59211e8;
    stim[35] = 49'h1c83995a284b2;
    stim[36] = 49'h1d5c318ced583;
    stim[37] = 49'h0474ed65f81f0;
    stim[38] = 49'h110e32062465e;
    stim[39] = 49'h1f88dcb600ffc;
    stim[40] = 49'h0c67d7f71abe1;
    stim[41] = 49'h16253e0c7c26b;
    stim[42] = 49'h002c82f3adc8c;
    stim[43] = 49'h1646c0e716bd9;
    stim[44] = 49'h09d95b7b06607;
    stim[45] = 49'h107da2f28c3ed;
    stim[46] = 49'h1715826a852c3;
    stim[47] = 49'h0ec24ffddcea5;
    stim[48] = 49'h149fc2ee28230;
    stim[49] = 49'h1555e51852603;
    stim[50] = 49'h02773005d6907;
    stim[51] = 49'h1f0b80dc83b1e;
    stim[52] = 49'h0bcffb82a1a2a;
    stim[53] = 49'h15b9c3ce7cdb7;
    stim[54] = 49'h0525e174b7c50;
    stim[55] = 49'h15d26d14c15b0;
    stim[56] = 49'h00b49a500b97d;
    stim[57] = 49'h1d89975c8a777;
    stim[58] = 49'h1330f4dd9f3eb;
    stim[59] = 49'h1f7cc182c7275;
    stim[60] = 49'h05d3263181045;
    stim[61] = 49'h08baa26015404;
    stim[62] = 49'h1e699d064da3b;
    stim[63] = 49'h0e4fb1ae4f064;
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
      expv[2] = 2'h1;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h1;
      expv[8] = 2'h0;
      expv[9] = 2'h1;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h0;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h1;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h1;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h0;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h0;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h1;
      expv[45] = 2'h0;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h0;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h0;
      expv[52] = 2'h1;
      expv[53] = 2'h0;
      expv[54] = 2'h1;
      expv[55] = 2'h0;
      expv[56] = 2'h1;
      expv[57] = 2'h0;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h1;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h1;
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
