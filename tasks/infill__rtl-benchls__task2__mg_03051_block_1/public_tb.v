// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03051 dut (
    .c(clk),
    .d(in_vec[9:2]),
    .dv(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2cb;
    stim[1] = 10'h2a3;
    stim[2] = 10'h038;
    stim[3] = 10'h1e2;
    stim[4] = 10'h062;
    stim[5] = 10'h1ec;
    stim[6] = 10'h13c;
    stim[7] = 10'h230;
    stim[8] = 10'h284;
    stim[9] = 10'h1cc;
    stim[10] = 10'h0a2;
    stim[11] = 10'h040;
    stim[12] = 10'h2f6;
    stim[13] = 10'h1f0;
    stim[14] = 10'h11c;
    stim[15] = 10'h210;
    stim[16] = 10'h121;
    stim[17] = 10'h0be;
    stim[18] = 10'h0ae;
    stim[19] = 10'h2c8;
    stim[20] = 10'h330;
    stim[21] = 10'h378;
    stim[22] = 10'h2b8;
    stim[23] = 10'h04e;
    stim[24] = 10'h25c;
    stim[25] = 10'h395;
    stim[26] = 10'h0ba;
    stim[27] = 10'h0c4;
    stim[28] = 10'h38a;
    stim[29] = 10'h37e;
    stim[30] = 10'h1b6;
    stim[31] = 10'h39a;
    stim[32] = 10'h37e;
    stim[33] = 10'h1b4;
    stim[34] = 10'h111;
    stim[35] = 10'h128;
    stim[36] = 10'h20e;
    stim[37] = 10'h340;
    stim[38] = 10'h214;
    stim[39] = 10'h3e6;
    stim[40] = 10'h2cc;
    stim[41] = 10'h39c;
    stim[42] = 10'h196;
    stim[43] = 10'h3fe;
    stim[44] = 10'h35c;
    stim[45] = 10'h392;
    stim[46] = 10'h06c;
    stim[47] = 10'h272;
    stim[48] = 10'h25c;
    stim[49] = 10'h268;
    stim[50] = 10'h032;
    stim[51] = 10'h20a;
    stim[52] = 10'h20a;
    stim[53] = 10'h174;
    stim[54] = 10'h29a;
    stim[55] = 10'h3e8;
    stim[56] = 10'h396;
    stim[57] = 10'h23c;
    stim[58] = 10'h20a;
    stim[59] = 10'h2f8;
    stim[60] = 10'h2dc;
    stim[61] = 10'h3b0;
    stim[62] = 10'h19b;
    stim[63] = 10'h344;
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
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h9d40;
      expv[5] = 16'h45dc;
      expv[6] = 16'h45dc;
      expv[7] = 16'h45dc;
      expv[8] = 16'h45dc;
      expv[9] = 16'h45dc;
      expv[10] = 16'h45dc;
      expv[11] = 16'h3804;
      expv[12] = 16'h3804;
      expv[13] = 16'h0db9;
      expv[14] = 16'h0db9;
      expv[15] = 16'h0db9;
      expv[16] = 16'h0db9;
      expv[17] = 16'h0000;
      expv[18] = 16'h6301;
      expv[19] = 16'h60a2;
      expv[20] = 16'h60a2;
      expv[21] = 16'h60a2;
      expv[22] = 16'h60a2;
      expv[23] = 16'h60a2;
      expv[24] = 16'hcbe0;
      expv[25] = 16'hcbe0;
      expv[26] = 16'h0000;
      expv[27] = 16'ha3c0;
      expv[28] = 16'ha3c0;
      expv[29] = 16'ha663;
      expv[30] = 16'h0ee7;
      expv[31] = 16'h18cf;
      expv[32] = 16'h6199;
      expv[33] = 16'h4da0;
      expv[34] = 16'h4da0;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h1e01;
      expv[38] = 16'h1e01;
      expv[39] = 16'h1e01;
      expv[40] = 16'h3d5f;
      expv[41] = 16'h3d5f;
      expv[42] = 16'h3d5f;
      expv[43] = 16'hacfd;
      expv[44] = 16'h7e6d;
      expv[45] = 16'h7e6d;
      expv[46] = 16'h19ff;
      expv[47] = 16'h19ff;
      expv[48] = 16'h9619;
      expv[49] = 16'h9619;
      expv[50] = 16'h9619;
      expv[51] = 16'h7017;
      expv[52] = 16'hd0f0;
      expv[53] = 16'h9a10;
      expv[54] = 16'h9a10;
      expv[55] = 16'h095b;
      expv[56] = 16'h095b;
      expv[57] = 16'hcfc9;
      expv[58] = 16'hcfc9;
      expv[59] = 16'h88cf;
      expv[60] = 16'h88cf;
      expv[61] = 16'h88cf;
      expv[62] = 16'h88cf;
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
