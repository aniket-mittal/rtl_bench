// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07897 dut (
    .clk(clk),
    .rst(in_vec[14:14]),
    .stackCntrl(in_vec[13:12]),
    .pushValue(in_vec[11:0]),
    .popValue(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h49c3;
    stim[1] = 15'h4e24;
    stim[2] = 15'h13d4;
    stim[3] = 15'h2572;
    stim[4] = 15'h08e9;
    stim[5] = 15'h3978;
    stim[6] = 15'h6309;
    stim[7] = 15'h00e3;
    stim[8] = 15'h00c9;
    stim[9] = 15'h081d;
    stim[10] = 15'h0280;
    stim[11] = 15'h3a70;
    stim[12] = 15'h14e8;
    stim[13] = 15'h22e4;
    stim[14] = 15'h110f;
    stim[15] = 15'h2a60;
    stim[16] = 15'h0aa9;
    stim[17] = 15'h132d;
    stim[18] = 15'h2267;
    stim[19] = 15'h17d8;
    stim[20] = 15'h25ad;
    stim[21] = 15'h2b9f;
    stim[22] = 15'h2d62;
    stim[23] = 15'h2fa5;
    stim[24] = 15'h2008;
    stim[25] = 15'h1c3f;
    stim[26] = 15'h178e;
    stim[27] = 15'h0d57;
    stim[28] = 15'h215e;
    stim[29] = 15'h197e;
    stim[30] = 15'h17ad;
    stim[31] = 15'h1018;
    stim[32] = 15'h22ee;
    stim[33] = 15'h3c54;
    stim[34] = 15'h37b3;
    stim[35] = 15'h0560;
    stim[36] = 15'h3976;
    stim[37] = 15'h2a2d;
    stim[38] = 15'h1475;
    stim[39] = 15'h2203;
    stim[40] = 15'h04c8;
    stim[41] = 15'h376f;
    stim[42] = 15'h0a2d;
    stim[43] = 15'h3e89;
    stim[44] = 15'h052e;
    stim[45] = 15'h19c8;
    stim[46] = 15'h27ef;
    stim[47] = 15'h2da1;
    stim[48] = 15'h2b01;
    stim[49] = 15'h0766;
    stim[50] = 15'h27e0;
    stim[51] = 15'h0750;
    stim[52] = 15'h15e4;
    stim[53] = 15'h25a3;
    stim[54] = 15'h091f;
    stim[55] = 15'h05f6;
    stim[56] = 15'h2ce8;
    stim[57] = 15'h1ba4;
    stim[58] = 15'h3c90;
    stim[59] = 15'h36e7;
    stim[60] = 15'h005a;
    stim[61] = 15'h05ef;
    stim[62] = 15'h0722;
    stim[63] = 15'h2e46;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'h3d5;
      expv[5] = 12'h3d5;
      expv[6] = 12'h3d5;
      expv[7] = 12'h3d5;
      expv[8] = 12'h3d5;
      expv[9] = 12'h3d5;
      expv[10] = 12'h3d5;
      expv[11] = 12'h3d5;
      expv[12] = 12'h3d5;
      expv[13] = 12'hxxx;
      expv[14] = 12'h4e9;
      expv[15] = 12'hxxx;
      expv[16] = 12'h110;
      expv[17] = 12'h110;
      expv[18] = 12'hxxx;
      expv[19] = 12'h32e;
      expv[20] = 12'hxxx;
      expv[21] = 12'h7d9;
      expv[22] = 12'hxxx;
      expv[23] = 12'hxxx;
      expv[24] = 12'hxxx;
      expv[25] = 12'hxxx;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'hxxx;
      expv[29] = 12'h78f;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'h7d9;
      expv[33] = 12'h019;
      expv[34] = 12'h019;
      expv[35] = 12'h019;
      expv[36] = 12'h019;
      expv[37] = 12'h019;
      expv[38] = 12'h7ae;
      expv[39] = 12'h019;
      expv[40] = 12'h476;
      expv[41] = 12'h476;
      expv[42] = 12'h476;
      expv[43] = 12'h476;
      expv[44] = 12'h476;
      expv[45] = 12'h476;
      expv[46] = 12'h019;
      expv[47] = 12'h9c9;
      expv[48] = 12'h97f;
      expv[49] = 12'hc40;
      expv[50] = 12'hc40;
      expv[51] = 12'hxxx;
      expv[52] = 12'hxxx;
      expv[53] = 12'hc40;
      expv[54] = 12'h5e5;
      expv[55] = 12'h5e5;
      expv[56] = 12'h5e5;
      expv[57] = 12'hxxx;
      expv[58] = 12'h5e5;
      expv[59] = 12'h5e5;
      expv[60] = 12'h5e5;
      expv[61] = 12'h5e5;
      expv[62] = 12'h5e5;
      expv[63] = 12'h5e5;
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
