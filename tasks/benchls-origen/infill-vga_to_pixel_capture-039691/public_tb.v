// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039691 dut (
    .DE(clk),
    .pixClk(in_vec[26:26]),
    .Vsync(in_vec[25:25]),
    .Hsync(in_vec[24:24]),
    .red(in_vec[23:16]),
    .green(in_vec[15:8]),
    .blue(in_vec[7:0]),
    .addr(out_vec[23:9]),
    .pixData(out_vec[8:1]),
    .wrPix(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h0cb6bb0;
    stim[1] = 27'h445cf65;
    stim[2] = 27'h32e0bb7;
    stim[3] = 27'h6234a65;
    stim[4] = 27'h7d9affa;
    stim[5] = 27'h627b04c;
    stim[6] = 27'h7e58f33;
    stim[7] = 27'h231137e;
    stim[8] = 27'h69dbb4c;
    stim[9] = 27'h2e3f46e;
    stim[10] = 27'h2b13617;
    stim[11] = 27'h68ac308;
    stim[12] = 27'h7c9bef9;
    stim[13] = 27'h7bed57b;
    stim[14] = 27'h0c13724;
    stim[15] = 27'h3859ea8;
    stim[16] = 27'h7a0344f;
    stim[17] = 27'h336ac90;
    stim[18] = 27'h2498ae5;
    stim[19] = 27'h7d39bfc;
    stim[20] = 27'h6e45dcf;
    stim[21] = 27'h37487b1;
    stim[22] = 27'h7cf21c4;
    stim[23] = 27'h70f56a9;
    stim[24] = 27'h6d4de20;
    stim[25] = 27'h26f87e8;
    stim[26] = 27'h7324eb8;
    stim[27] = 27'h77ee0c7;
    stim[28] = 27'h39c292e;
    stim[29] = 27'h73f0718;
    stim[30] = 27'h29f5653;
    stim[31] = 27'h6f6a24b;
    stim[32] = 27'h78db323;
    stim[33] = 27'h2490532;
    stim[34] = 27'h73dea54;
    stim[35] = 27'h30f14a2;
    stim[36] = 27'h78dea1b;
    stim[37] = 27'h74db855;
    stim[38] = 27'h733987d;
    stim[39] = 27'h3f6f89b;
    stim[40] = 27'h727e44a;
    stim[41] = 27'h2cdf74b;
    stim[42] = 27'h63d28ab;
    stim[43] = 27'h3217e2c;
    stim[44] = 27'h7e9ba46;
    stim[45] = 27'h6801ef0;
    stim[46] = 27'h749743d;
    stim[47] = 27'h792577c;
    stim[48] = 27'h7decf79;
    stim[49] = 27'h72da82c;
    stim[50] = 27'h30fd771;
    stim[51] = 27'h6c00480;
    stim[52] = 27'h2d17ec0;
    stim[53] = 27'h37d1607;
    stim[54] = 27'h6518402;
    stim[55] = 27'h7ba0c0f;
    stim[56] = 27'h3e2870e;
    stim[57] = 27'h2309d92;
    stim[58] = 27'h27219ca;
    stim[59] = 27'h7694faa;
    stim[60] = 27'h3e2a5cb;
    stim[61] = 27'h27cea9c;
    stim[62] = 27'h74ae993;
    stim[63] = 27'h27277ff;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hxxxxxx;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'hxxxxxx;
      expv[5] = 24'hxxxxxx;
      expv[6] = 24'hxxxxxx;
      expv[7] = 24'hxxxxxx;
      expv[8] = 24'hxxxxxx;
      expv[9] = 24'hxxxxxx;
      expv[10] = 24'hxxxxxx;
      expv[11] = 24'hxxxxxx;
      expv[12] = 24'hxxxxxx;
      expv[13] = 24'hxxxxxx;
      expv[14] = 24'hxxxxxx;
      expv[15] = 24'hxxxxxx;
      expv[16] = 24'h00axxx;
      expv[17] = 24'h014xxx;
      expv[18] = 24'h01exxx;
      expv[19] = 24'h028xxx;
      expv[20] = 24'h032xxx;
      expv[21] = 24'h03cxxx;
      expv[22] = 24'h046xxx;
      expv[23] = 24'h050xxx;
      expv[24] = 24'h05axxx;
      expv[25] = 24'h064xxx;
      expv[26] = 24'h06exxx;
      expv[27] = 24'h078xxx;
      expv[28] = 24'h082xxx;
      expv[29] = 24'h08cxxx;
      expv[30] = 24'h096xxx;
      expv[31] = 24'h0a0xxx;
      expv[32] = 24'h0aaxxx;
      expv[33] = 24'h0b4xxx;
      expv[34] = 24'h0bexxx;
      expv[35] = 24'h0c8xxx;
      expv[36] = 24'h0d2xxx;
      expv[37] = 24'h0dcxxx;
      expv[38] = 24'h0e6xxx;
      expv[39] = 24'h0f0xxx;
      expv[40] = 24'h0faxxx;
      expv[41] = 24'h104xxx;
      expv[42] = 24'h10exxx;
      expv[43] = 24'h118xxx;
      expv[44] = 24'h122xxx;
      expv[45] = 24'h12cxxx;
      expv[46] = 24'h136xxx;
      expv[47] = 24'h140xxx;
      expv[48] = 24'h14axxx;
      expv[49] = 24'h154xxx;
      expv[50] = 24'h15exxx;
      expv[51] = 24'h168xxx;
      expv[52] = 24'h172xxx;
      expv[53] = 24'h17cxxx;
      expv[54] = 24'h186xxx;
      expv[55] = 24'h190xxx;
      expv[56] = 24'h19axxx;
      expv[57] = 24'h1a4xxx;
      expv[58] = 24'h1aexxx;
      expv[59] = 24'h1b8xxx;
      expv[60] = 24'h1c2xxx;
      expv[61] = 24'h1ccxxx;
      expv[62] = 24'h1d6xxx;
      expv[63] = 24'h1e0xxx;
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
