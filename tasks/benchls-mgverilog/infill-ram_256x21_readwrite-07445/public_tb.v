// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07445 dut (
    .clk(clk),
    .data(in_vec[29:9]),
    .we(in_vec[8:8]),
    .addr(in_vec[7:0]),
    .out(out_vec[20:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h0b6bf4e9;
    stim[1] = 30'h3a626ca1;
    stim[2] = 30'h3cd4d1f3;
    stim[3] = 30'h11cc4230;
    stim[4] = 30'h162a51f0;
    stim[5] = 30'h02b6f095;
    stim[6] = 30'h19a12d01;
    stim[7] = 30'h006c2851;
    stim[8] = 30'h1d1e823a;
    stim[9] = 30'h03c28d07;
    stim[10] = 30'h316f8ed5;
    stim[11] = 30'h09de1c5d;
    stim[12] = 30'h1773bcbf;
    stim[13] = 30'h0a44c0a0;
    stim[14] = 30'h0b3ec97e;
    stim[15] = 30'h007be33f;
    stim[16] = 30'h2068b30f;
    stim[17] = 30'h1f3d7544;
    stim[18] = 30'h08590ee4;
    stim[19] = 30'h030836a5;
    stim[20] = 30'h129c23e4;
    stim[21] = 30'h0f7918f7;
    stim[22] = 30'h31c8b16d;
    stim[23] = 30'h142a0685;
    stim[24] = 30'h1b1b7def;
    stim[25] = 30'h1c3b1aab;
    stim[26] = 30'h0709bc9b;
    stim[27] = 30'h0172d72c;
    stim[28] = 30'h0929e800;
    stim[29] = 30'h331f6199;
    stim[30] = 30'h27c9757e;
    stim[31] = 30'h3ffba5fd;
    stim[32] = 30'h37a1f1ee;
    stim[33] = 30'h2c958a48;
    stim[34] = 30'h2cba0bf7;
    stim[35] = 30'h2cfab67c;
    stim[36] = 30'h29a58bd3;
    stim[37] = 30'h35e3961e;
    stim[38] = 30'h3384e9bb;
    stim[39] = 30'h2113b148;
    stim[40] = 30'h069b20e0;
    stim[41] = 30'h30c2807c;
    stim[42] = 30'h17532875;
    stim[43] = 30'h2b89f1ef;
    stim[44] = 30'h06cd6368;
    stim[45] = 30'h17c36561;
    stim[46] = 30'h04c051ca;
    stim[47] = 30'h1e9924ce;
    stim[48] = 30'h16ddb080;
    stim[49] = 30'h3ea362f0;
    stim[50] = 30'h0d92235c;
    stim[51] = 30'h1ddc3bc6;
    stim[52] = 30'h21c04fbd;
    stim[53] = 30'h2fa76914;
    stim[54] = 30'h276ebef7;
    stim[55] = 30'h26dae634;
    stim[56] = 30'h13264d5e;
    stim[57] = 30'h3d4bc360;
    stim[58] = 30'h2b95ab6e;
    stim[59] = 30'h18e1956c;
    stim[60] = 30'h0323139a;
    stim[61] = 30'h1437df50;
    stim[62] = 30'h13699a10;
    stim[63] = 30'h37bc7dea;
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
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'hxxxxxx;
      expv[2] = 21'hxxxxxx;
      expv[3] = 21'hxxxxxx;
      expv[4] = 21'hxxxxxx;
      expv[5] = 21'hxxxxxx;
      expv[6] = 21'hxxxxxx;
      expv[7] = 21'hxxxxxx;
      expv[8] = 21'hxxxxxx;
      expv[9] = 21'hxxxxxx;
      expv[10] = 21'hxxxxxx;
      expv[11] = 21'hxxxxxx;
      expv[12] = 21'hxxxxxx;
      expv[13] = 21'hxxxxxx;
      expv[14] = 21'hxxxxxx;
      expv[15] = 21'hxxxxxx;
      expv[16] = 21'hxxxxxx;
      expv[17] = 21'hxxxxxx;
      expv[18] = 21'hxxxxxx;
      expv[19] = 21'hxxxxxx;
      expv[20] = 21'hxxxxxx;
      expv[21] = 21'hxxxxxx;
      expv[22] = 21'hxxxxxx;
      expv[23] = 21'hxxxxxx;
      expv[24] = 21'hxxxxxx;
      expv[25] = 21'hxxxxxx;
      expv[26] = 21'hxxxxxx;
      expv[27] = 21'hxxxxxx;
      expv[28] = 21'hxxxxxx;
      expv[29] = 21'hxxxxxx;
      expv[30] = 21'hxxxxxx;
      expv[31] = 21'h059f64;
      expv[32] = 21'hxxxxxx;
      expv[33] = 21'hxxxxxx;
      expv[34] = 21'hxxxxxx;
      expv[35] = 21'hxxxxxx;
      expv[36] = 21'hxxxxxx;
      expv[37] = 21'hxxxxxx;
      expv[38] = 21'hxxxxxx;
      expv[39] = 21'hxxxxxx;
      expv[40] = 21'hxxxxxx;
      expv[41] = 21'hxxxxxx;
      expv[42] = 21'hxxxxxx;
      expv[43] = 21'hxxxxxx;
      expv[44] = 21'h0d8dbe;
      expv[45] = 21'hxxxxxx;
      expv[46] = 21'hxxxxxx;
      expv[47] = 21'hxxxxxx;
      expv[48] = 21'hxxxxxx;
      expv[49] = 21'hxxxxxx;
      expv[50] = 21'hxxxxxx;
      expv[51] = 21'hxxxxxx;
      expv[52] = 21'hxxxxxx;
      expv[53] = 21'hxxxxxx;
      expv[54] = 21'hxxxxxx;
      expv[55] = 21'hxxxxxx;
      expv[56] = 21'hxxxxxx;
      expv[57] = 21'hxxxxxx;
      expv[58] = 21'hxxxxxx;
      expv[59] = 21'hxxxxxx;
      expv[60] = 21'hxxxxxx;
      expv[61] = 21'hxxxxxx;
      expv[62] = 21'hxxxxxx;
      expv[63] = 21'hxxxxxx;
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
