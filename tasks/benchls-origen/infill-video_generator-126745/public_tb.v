// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 85;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_126745 dut (
    .clk_cog(clk),
    .clk_vid(in_vec[84:84]),
    .ena(in_vec[83:83]),
    .setvid(in_vec[82:82]),
    .setscl(in_vec[81:81]),
    .data(in_vec[80:49]),
    .pixel(in_vec[48:41]),
    .color(in_vec[40:17]),
    .aural(in_vec[16:1]),
    .carrier(in_vec[0:0]),
    .ack(out_vec[1:1]),
    .pin_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 85'h0c334c664592e821a163e5;
    stim[1] = 85'h1df7e2926fbed58e2f76ea;
    stim[2] = 85'h0829a8bf5f7acbea78a521;
    stim[3] = 85'h1f0feb75c363513b5ead7c;
    stim[4] = 85'h19c580226e478f70da1093;
    stim[5] = 85'h0ee83e4a5b3e87d2bf0748;
    stim[6] = 85'h12076019227a3269b37bbf;
    stim[7] = 85'h134c8d49e70547c9a3c406;
    stim[8] = 85'h0eb58c9f22c141b1b5f6bb;
    stim[9] = 85'h183aa9524e37ea77fdc73f;
    stim[10] = 85'h0e49277ffef3b6378bd200;
    stim[11] = 85'h146cc7d4ba4e457ac1f70f;
    stim[12] = 85'h0a523b509810bb26d84437;
    stim[13] = 85'h1b766ad132717b43d922f3;
    stim[14] = 85'h1383221fcf80ee0859d6b2;
    stim[15] = 85'h1a0ba2f37b2b14af7dcfef;
    stim[16] = 85'h0d7ef28481bd7f8b1bce66;
    stim[17] = 85'h0a7f95ee392355ceee0017;
    stim[18] = 85'h0f840ef29ce5aaa358e25f;
    stim[19] = 85'h17b9f5a5e677280b73a7ae;
    stim[20] = 85'h0aa36a80979712350619df;
    stim[21] = 85'h183697c5cf4f2f8def161a;
    stim[22] = 85'h01788d54262de8c96931e3;
    stim[23] = 85'h1eca253a2b654408ca9ed2;
    stim[24] = 85'h08220d78c011d190391dab;
    stim[25] = 85'h1d98b21eeecaccc36bc96f;
    stim[26] = 85'h0f88e156be47182607271e;
    stim[27] = 85'h00f0e684030be29104aa1b;
    stim[28] = 85'h0ee4fbbbaa836686af0d67;
    stim[29] = 85'h0742de846cad453e751784;
    stim[30] = 85'h122437e01d1d690cc0893d;
    stim[31] = 85'h139bce2b2cb3cbf2b405bc;
    stim[32] = 85'h101162a558d17cef5f0935;
    stim[33] = 85'h085b643468428eb4e72110;
    stim[34] = 85'h1c93c0dc1e0d823126674a;
    stim[35] = 85'h009841c6129ae1fe5ab4ce;
    stim[36] = 85'h0ecc9c52781d284d359d3e;
    stim[37] = 85'h013fb7a5257c65940cdbd3;
    stim[38] = 85'h0e55a12253d0dface06647;
    stim[39] = 85'h068766a7394ba6f27aeece;
    stim[40] = 85'h19901875b1e637fc8be396;
    stim[41] = 85'h1095d4471d3b8a6b9c26a2;
    stim[42] = 85'h0bebb45b0d47f5283f5c01;
    stim[43] = 85'h0ea61ae9cd0a9144d9a6b5;
    stim[44] = 85'h0d91e2568d799e9ea47f1d;
    stim[45] = 85'h09e2497c32f9601cd0e3eb;
    stim[46] = 85'h01d006bbc808705bd3c12f;
    stim[47] = 85'h1dbed67811b9ec566d74ab;
    stim[48] = 85'h14b25bfdb696daa0d299af;
    stim[49] = 85'h0217fd00eacede6023273e;
    stim[50] = 85'h19d0d21bf4e28ca63d8d9d;
    stim[51] = 85'h082854edaa43c4331dc552;
    stim[52] = 85'h038fe349d5d838e2de8a10;
    stim[53] = 85'h1e51f7349c0a34b783b5c1;
    stim[54] = 85'h14d52614777af7ab8f988b;
    stim[55] = 85'h11a1fff05ae27364f43817;
    stim[56] = 85'h11522d0f6ce358ca5911bf;
    stim[57] = 85'h0897e32c0b517e3b66feb4;
    stim[58] = 85'h133341073955ea301795cb;
    stim[59] = 85'h17afdc625a75f1aaaea037;
    stim[60] = 85'h076d9b682520b5c72241fc;
    stim[61] = 85'h15f59eed5b0a53af520919;
    stim[62] = 85'h1e509033784130d0b90265;
    stim[63] = 85'h1ff99b9fd7357a1d2776d9;
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
      expv[2] = 2'hx;
      expv[3] = 2'hx;
      expv[4] = 2'hx;
      expv[5] = 2'hx;
      expv[6] = 2'hx;
      expv[7] = 2'hx;
      expv[8] = 2'hx;
      expv[9] = 2'h3;
      expv[10] = 2'hx;
      expv[11] = 2'h3;
      expv[12] = 2'h2;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h3;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h3;
      expv[20] = 2'h3;
      expv[21] = 2'h3;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h3;
      expv[25] = 2'h1;
      expv[26] = 2'h2;
      expv[27] = 2'h3;
      expv[28] = 2'h0;
      expv[29] = 2'h2;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h3;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h3;
      expv[36] = 2'h1;
      expv[37] = 2'h3;
      expv[38] = 2'h1;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h3;
      expv[49] = 2'h2;
      expv[50] = 2'h3;
      expv[51] = 2'h1;
      expv[52] = 2'h0;
      expv[53] = 2'h2;
      expv[54] = 2'h3;
      expv[55] = 2'h3;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h0;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h3;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
