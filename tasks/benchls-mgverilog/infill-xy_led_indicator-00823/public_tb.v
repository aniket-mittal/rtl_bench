// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00823 dut (
    .clk(clk),
    .xpos(in_vec[21:12]),
    .ypos(in_vec[11:2]),
    .button(in_vec[1:0]),
    .LED(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h297a7b;
    stim[1] = 22'h2261e3;
    stim[2] = 22'h028937;
    stim[3] = 22'h1ac472;
    stim[4] = 22'h15f611;
    stim[5] = 22'h18a00d;
    stim[6] = 22'h3f15e1;
    stim[7] = 22'h0a41b9;
    stim[8] = 22'h1def4e;
    stim[9] = 22'h241622;
    stim[10] = 22'h36e5b1;
    stim[11] = 22'h252a15;
    stim[12] = 22'h1adc2f;
    stim[13] = 22'h3009d2;
    stim[14] = 22'h198b06;
    stim[15] = 22'h188cd5;
    stim[16] = 22'h3e1756;
    stim[17] = 22'h0e5e86;
    stim[18] = 22'h34faf3;
    stim[19] = 22'h33ae28;
    stim[20] = 22'h07ac67;
    stim[21] = 22'h053e79;
    stim[22] = 22'h3bc84a;
    stim[23] = 22'h273a37;
    stim[24] = 22'h08fdb0;
    stim[25] = 22'h3a71a1;
    stim[26] = 22'h099696;
    stim[27] = 22'h18468e;
    stim[28] = 22'h0d1f14;
    stim[29] = 22'h029c2f;
    stim[30] = 22'h272aae;
    stim[31] = 22'h3c8482;
    stim[32] = 22'h3cd68f;
    stim[33] = 22'h224d56;
    stim[34] = 22'h332d17;
    stim[35] = 22'h0a233a;
    stim[36] = 22'h2b07cf;
    stim[37] = 22'h1b8364;
    stim[38] = 22'h2bd9c2;
    stim[39] = 22'h1d74f5;
    stim[40] = 22'h0aaf2d;
    stim[41] = 22'h006e57;
    stim[42] = 22'h0f0fae;
    stim[43] = 22'h090f9e;
    stim[44] = 22'h2ea088;
    stim[45] = 22'h284999;
    stim[46] = 22'h203e4a;
    stim[47] = 22'h3d91d0;
    stim[48] = 22'h0fb435;
    stim[49] = 22'h0a3416;
    stim[50] = 22'h36c975;
    stim[51] = 22'h1b0887;
    stim[52] = 22'h1b8c52;
    stim[53] = 22'h1b057f;
    stim[54] = 22'h236875;
    stim[55] = 22'h173608;
    stim[56] = 22'h287372;
    stim[57] = 22'h344496;
    stim[58] = 22'h0707c0;
    stim[59] = 22'h240f95;
    stim[60] = 22'h279891;
    stim[61] = 22'h145634;
    stim[62] = 22'h339900;
    stim[63] = 22'h349197;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h19;
      expv[2] = 5'h05;
      expv[3] = 5'h03;
      expv[4] = 5'h05;
      expv[5] = 5'h03;
      expv[6] = 5'h05;
      expv[7] = 5'h0d;
      expv[8] = 5'h07;
      expv[9] = 5'h11;
      expv[10] = 5'h01;
      expv[11] = 5'h0d;
      expv[12] = 5'h11;
      expv[13] = 5'h11;
      expv[14] = 5'h09;
      expv[15] = 5'h11;
      expv[16] = 5'h11;
      expv[17] = 5'h09;
      expv[18] = 5'h13;
      expv[19] = 5'h18;
      expv[20] = 5'h19;
      expv[21] = 5'h13;
      expv[22] = 5'h13;
      expv[23] = 5'h09;
      expv[24] = 5'h10;
      expv[25] = 5'h13;
      expv[26] = 5'h0d;
      expv[27] = 5'h03;
      expv[28] = 5'h00;
      expv[29] = 5'h13;
      expv[30] = 5'h13;
      expv[31] = 5'h11;
      expv[32] = 5'h0d;
      expv[33] = 5'h09;
      expv[34] = 5'h11;
      expv[35] = 5'h19;
      expv[36] = 5'h07;
      expv[37] = 5'h08;
      expv[38] = 5'h05;
      expv[39] = 5'h09;
      expv[40] = 5'h05;
      expv[41] = 5'h13;
      expv[42] = 5'h13;
      expv[43] = 5'h13;
      expv[44] = 5'h12;
      expv[45] = 5'h0d;
      expv[46] = 5'h09;
      expv[47] = 5'h10;
      expv[48] = 5'h0d;
      expv[49] = 5'h07;
      expv[50] = 5'h07;
      expv[51] = 5'h09;
      expv[52] = 5'h01;
      expv[53] = 5'h11;
      expv[54] = 5'h05;
      expv[55] = 5'h00;
      expv[56] = 5'h03;
      expv[57] = 5'h0d;
      expv[58] = 5'h0c;
      expv[59] = 5'h03;
      expv[60] = 5'h11;
      expv[61] = 5'h00;
      expv[62] = 5'h02;
      expv[63] = 5'h09;
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
