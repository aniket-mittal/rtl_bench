// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02539 dut (
    .funct(in_vec[9:4]),
    .aluop(in_vec[3:0]),
    .alucontrol(out_vec[4:2]),
    .signd(out_vec[1:1]),
    .multseld(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h08d;
    stim[1] = 10'h024;
    stim[2] = 10'h2a2;
    stim[3] = 10'h081;
    stim[4] = 10'h05b;
    stim[5] = 10'h3a4;
    stim[6] = 10'h300;
    stim[7] = 10'h044;
    stim[8] = 10'h0cb;
    stim[9] = 10'h2fd;
    stim[10] = 10'h396;
    stim[11] = 10'h1c2;
    stim[12] = 10'h12e;
    stim[13] = 10'h394;
    stim[14] = 10'h29b;
    stim[15] = 10'h37c;
    stim[16] = 10'h207;
    stim[17] = 10'h209;
    stim[18] = 10'h32c;
    stim[19] = 10'h250;
    stim[20] = 10'h2a5;
    stim[21] = 10'h375;
    stim[22] = 10'h0f7;
    stim[23] = 10'h285;
    stim[24] = 10'h2fa;
    stim[25] = 10'h251;
    stim[26] = 10'h16e;
    stim[27] = 10'h376;
    stim[28] = 10'h280;
    stim[29] = 10'h02f;
    stim[30] = 10'h1f2;
    stim[31] = 10'h12c;
    stim[32] = 10'h143;
    stim[33] = 10'h12b;
    stim[34] = 10'h0c2;
    stim[35] = 10'h15b;
    stim[36] = 10'h3cc;
    stim[37] = 10'h07b;
    stim[38] = 10'h345;
    stim[39] = 10'h35b;
    stim[40] = 10'h1e4;
    stim[41] = 10'h255;
    stim[42] = 10'h0ab;
    stim[43] = 10'h336;
    stim[44] = 10'h3b0;
    stim[45] = 10'h2d4;
    stim[46] = 10'h3f9;
    stim[47] = 10'h2a1;
    stim[48] = 10'h1e2;
    stim[49] = 10'h355;
    stim[50] = 10'h007;
    stim[51] = 10'h226;
    stim[52] = 10'h2b1;
    stim[53] = 10'h350;
    stim[54] = 10'h2fa;
    stim[55] = 10'h21c;
    stim[56] = 10'h128;
    stim[57] = 10'h03f;
    stim[58] = 10'h1e8;
    stim[59] = 10'h075;
    stim[60] = 10'h3ef;
    stim[61] = 10'h1c5;
    stim[62] = 10'h269;
    stim[63] = 10'h395;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h02;
      expv[2] = 5'h1e;
      expv[3] = 5'h1a;
      expv[4] = 5'hxx;
      expv[5] = 5'h02;
      expv[6] = 5'h0a;
      expv[7] = 5'h02;
      expv[8] = 5'hxx;
      expv[9] = 5'hxx;
      expv[10] = 5'h1e;
      expv[11] = 5'hxx;
      expv[12] = 5'hxx;
      expv[13] = 5'h02;
      expv[14] = 5'hxx;
      expv[15] = 5'hxx;
      expv[16] = 5'h0c;
      expv[17] = 5'hxx;
      expv[18] = 5'hxx;
      expv[19] = 5'h0a;
      expv[20] = 5'h0e;
      expv[21] = 5'h0e;
      expv[22] = 5'h0c;
      expv[23] = 5'h0e;
      expv[24] = 5'hxx;
      expv[25] = 5'h1a;
      expv[26] = 5'hxx;
      expv[27] = 5'h1e;
      expv[28] = 5'h0a;
      expv[29] = 5'hxx;
      expv[30] = 5'hxx;
      expv[31] = 5'hxx;
      expv[32] = 5'h06;
      expv[33] = 5'hxx;
      expv[34] = 5'hxx;
      expv[35] = 5'hxx;
      expv[36] = 5'hxx;
      expv[37] = 5'hxx;
      expv[38] = 5'h0e;
      expv[39] = 5'hxx;
      expv[40] = 5'h02;
      expv[41] = 5'h0e;
      expv[42] = 5'hxx;
      expv[43] = 5'h1e;
      expv[44] = 5'h0a;
      expv[45] = 5'h02;
      expv[46] = 5'hxx;
      expv[47] = 5'h1a;
      expv[48] = 5'hxx;
      expv[49] = 5'h0e;
      expv[50] = 5'h0c;
      expv[51] = 5'h1e;
      expv[52] = 5'h1a;
      expv[53] = 5'h0a;
      expv[54] = 5'hxx;
      expv[55] = 5'hxx;
      expv[56] = 5'h1c;
      expv[57] = 5'hxx;
      expv[58] = 5'h1c;
      expv[59] = 5'h0e;
      expv[60] = 5'hxx;
      expv[61] = 5'h0e;
      expv[62] = 5'hxx;
      expv[63] = 5'h0e;
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
