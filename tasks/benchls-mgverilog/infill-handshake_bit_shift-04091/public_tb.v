// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04091 dut (
    .out_0r(in_vec[19:19]),
    .inp_0a(in_vec[18:18]),
    .inp_0d(in_vec[17:0]),
    .out_0a(out_vec[17:17]),
    .out_0d(out_vec[16:1]),
    .inp_0r(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h3ec16;
    stim[1] = 20'h48b7e;
    stim[2] = 20'hcc8eb;
    stim[3] = 20'h59d92;
    stim[4] = 20'h9b217;
    stim[5] = 20'h4cd76;
    stim[6] = 20'h8bf7d;
    stim[7] = 20'hcd902;
    stim[8] = 20'h09f57;
    stim[9] = 20'h51539;
    stim[10] = 20'h27937;
    stim[11] = 20'h4d216;
    stim[12] = 20'he1058;
    stim[13] = 20'he89b2;
    stim[14] = 20'h91a86;
    stim[15] = 20'h7de95;
    stim[16] = 20'h49208;
    stim[17] = 20'h3dc86;
    stim[18] = 20'h90ede;
    stim[19] = 20'he197c;
    stim[20] = 20'hbf98c;
    stim[21] = 20'h3cf33;
    stim[22] = 20'h0912c;
    stim[23] = 20'h33277;
    stim[24] = 20'h776d9;
    stim[25] = 20'hfe68e;
    stim[26] = 20'h1e31b;
    stim[27] = 20'hac719;
    stim[28] = 20'h0df47;
    stim[29] = 20'h31307;
    stim[30] = 20'he8ca5;
    stim[31] = 20'h5662f;
    stim[32] = 20'hb1e68;
    stim[33] = 20'h0b397;
    stim[34] = 20'hec1d7;
    stim[35] = 20'hae4f4;
    stim[36] = 20'hccac3;
    stim[37] = 20'h1cfd1;
    stim[38] = 20'h11610;
    stim[39] = 20'h64121;
    stim[40] = 20'h3dc7e;
    stim[41] = 20'hceba8;
    stim[42] = 20'h87c07;
    stim[43] = 20'h4ecb3;
    stim[44] = 20'h7eb9d;
    stim[45] = 20'h68df5;
    stim[46] = 20'h1fe1d;
    stim[47] = 20'h459b3;
    stim[48] = 20'hf4c0a;
    stim[49] = 20'h93823;
    stim[50] = 20'hc3321;
    stim[51] = 20'hc352c;
    stim[52] = 20'h7d5f2;
    stim[53] = 20'hf3d98;
    stim[54] = 20'h59126;
    stim[55] = 20'hb4f32;
    stim[56] = 20'h0b987;
    stim[57] = 20'hac522;
    stim[58] = 20'h24d14;
    stim[59] = 20'hb6a79;
    stim[60] = 20'h31af8;
    stim[61] = 20'h8050d;
    stim[62] = 20'hbfcb4;
    stim[63] = 20'h5f097;
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
      expv[0] = 18'h1ec16;
      expv[1] = 18'h28b7e;
      expv[2] = 18'h2c8eb;
      expv[3] = 18'h39d92;
      expv[4] = 18'h1b217;
      expv[5] = 18'h2cd76;
      expv[6] = 18'h0bf7d;
      expv[7] = 18'h2d903;
      expv[8] = 18'h09f56;
      expv[9] = 18'h31538;
      expv[10] = 18'h07936;
      expv[11] = 18'h2d216;
      expv[12] = 18'h21059;
      expv[13] = 18'h289b3;
      expv[14] = 18'h11a87;
      expv[15] = 18'h3de94;
      expv[16] = 18'h29208;
      expv[17] = 18'h1dc86;
      expv[18] = 18'h10edf;
      expv[19] = 18'h2197d;
      expv[20] = 18'h1f98d;
      expv[21] = 18'h1cf32;
      expv[22] = 18'h0912c;
      expv[23] = 18'h13276;
      expv[24] = 18'h376d8;
      expv[25] = 18'h3e68f;
      expv[26] = 18'h1e31a;
      expv[27] = 18'h0c719;
      expv[28] = 18'h0df46;
      expv[29] = 18'h11306;
      expv[30] = 18'h28ca5;
      expv[31] = 18'h3662e;
      expv[32] = 18'h11e69;
      expv[33] = 18'h0b396;
      expv[34] = 18'h2c1d7;
      expv[35] = 18'h0e4f5;
      expv[36] = 18'h2cac3;
      expv[37] = 18'h1cfd0;
      expv[38] = 18'h11610;
      expv[39] = 18'h24120;
      expv[40] = 18'h1dc7e;
      expv[41] = 18'h2eba9;
      expv[42] = 18'h07c07;
      expv[43] = 18'h2ecb2;
      expv[44] = 18'h3eb9c;
      expv[45] = 18'h28df4;
      expv[46] = 18'h1fe1c;
      expv[47] = 18'h259b2;
      expv[48] = 18'h34c0b;
      expv[49] = 18'h13823;
      expv[50] = 18'h23321;
      expv[51] = 18'h2352d;
      expv[52] = 18'h3d5f2;
      expv[53] = 18'h33d99;
      expv[54] = 18'h39126;
      expv[55] = 18'h14f33;
      expv[56] = 18'h0b986;
      expv[57] = 18'h0c523;
      expv[58] = 18'h04d14;
      expv[59] = 18'h16a79;
      expv[60] = 18'h11af8;
      expv[61] = 18'h0050d;
      expv[62] = 18'h1fcb5;
      expv[63] = 18'h3f096;
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
