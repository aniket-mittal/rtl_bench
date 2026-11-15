// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140539 dut (
    .a(in_vec[17:10]),
    .b(in_vec[9:2]),
    .add_sub(in_vec[1:1]),
    .select(in_vec[0:0]),
    .max_value(out_vec[8:1]),
    .max_source(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h37947;
    stim[1] = 18'h24ce8;
    stim[2] = 18'h06dd7;
    stim[3] = 18'h07760;
    stim[4] = 18'h019db;
    stim[5] = 18'h130c0;
    stim[6] = 18'h1c8dd;
    stim[7] = 18'h29661;
    stim[8] = 18'h00abf;
    stim[9] = 18'h16cb7;
    stim[10] = 18'h2e279;
    stim[11] = 18'h2fec6;
    stim[12] = 18'h24d98;
    stim[13] = 18'h140ff;
    stim[14] = 18'h2f9ee;
    stim[15] = 18'h125c8;
    stim[16] = 18'h24a5e;
    stim[17] = 18'h04e4f;
    stim[18] = 18'h0f63a;
    stim[19] = 18'h28af3;
    stim[20] = 18'h1e8bd;
    stim[21] = 18'h32c15;
    stim[22] = 18'h0c1cf;
    stim[23] = 18'h298d7;
    stim[24] = 18'h2dc49;
    stim[25] = 18'h292dc;
    stim[26] = 18'h1a4b0;
    stim[27] = 18'h35bd8;
    stim[28] = 18'h19ede;
    stim[29] = 18'h3e163;
    stim[30] = 18'h06e5c;
    stim[31] = 18'h0380c;
    stim[32] = 18'h2898b;
    stim[33] = 18'h26261;
    stim[34] = 18'h055fb;
    stim[35] = 18'h15cec;
    stim[36] = 18'h2d6e1;
    stim[37] = 18'h2619e;
    stim[38] = 18'h3bf93;
    stim[39] = 18'h2523a;
    stim[40] = 18'h3bc4e;
    stim[41] = 18'h00d34;
    stim[42] = 18'h17d4d;
    stim[43] = 18'h3bcc4;
    stim[44] = 18'h0a7ab;
    stim[45] = 18'h2e0d5;
    stim[46] = 18'h221e5;
    stim[47] = 18'h1ce14;
    stim[48] = 18'h344af;
    stim[49] = 18'h271af;
    stim[50] = 18'h2a612;
    stim[51] = 18'h31c56;
    stim[52] = 18'h10710;
    stim[53] = 18'h1242a;
    stim[54] = 18'h2988e;
    stim[55] = 18'h10d45;
    stim[56] = 18'h3600d;
    stim[57] = 18'h3e72d;
    stim[58] = 18'h20b35;
    stim[59] = 18'h07798;
    stim[60] = 18'h34a34;
    stim[61] = 18'h0ee92;
    stim[62] = 18'h3c8a5;
    stim[63] = 18'h2f390;
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
      expv[0] = 9'h1bd;
      expv[1] = 9'h19a;
      expv[2] = 9'h037;
      expv[3] = 9'h1ea;
      expv[4] = 9'h0ed;
      expv[5] = 9'h0f8;
      expv[6] = 9'h06f;
      expv[7] = 9'h131;
      expv[8] = 9'h15f;
      expv[9] = 9'h05b;
      expv[10] = 9'h13d;
      expv[11] = 9'h01c;
      expv[12] = 9'h1f2;
      expv[13] = 9'h07f;
      expv[14] = 9'h086;
      expv[15] = 9'h176;
      expv[16] = 9'h1f6;
      expv[17] = 9'h127;
      expv[18] = 9'h15e;
      expv[19] = 9'h179;
      expv[20] = 9'h05f;
      expv[21] = 9'h197;
      expv[22] = 9'h0e7;
      expv[23] = 9'h14d;
      expv[24] = 9'h16f;
      expv[25] = 9'h0b6;
      expv[26] = 9'h12a;
      expv[27] = 9'h198;
      expv[28] = 9'h160;
      expv[29] = 9'h0b1;
      expv[30] = 9'h164;
      expv[31] = 9'h022;
      expv[32] = 9'h0c5;
      expv[33] = 9'h131;
      expv[34] = 9'h0fd;
      expv[35] = 9'h124;
      expv[36] = 9'h171;
      expv[37] = 9'h062;
      expv[38] = 9'h1df;
      expv[39] = 9'h00c;
      expv[40] = 9'h1b8;
      expv[41] = 9'h0a0;
      expv[42] = 9'h0bf;
      expv[43] = 9'h040;
      expv[44] = 9'h1d5;
      expv[45] = 9'h171;
      expv[46] = 9'h0f3;
      expv[47] = 9'h1f0;
      expv[48] = 9'h057;
      expv[49] = 9'h139;
      expv[50] = 9'h04a;
      expv[51] = 9'h164;
      expv[52] = 9'h00a;
      expv[53] = 9'h07e;
      expv[54] = 9'h106;
      expv[55] = 9'h087;
      expv[56] = 9'h1b1;
      expv[57] = 9'h197;
      expv[58] = 9'h19b;
      expv[59] = 9'h006;
      expv[60] = 9'h0be;
      expv[61] = 9'h12e;
      expv[62] = 9'h053;
      expv[63] = 9'h140;
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
