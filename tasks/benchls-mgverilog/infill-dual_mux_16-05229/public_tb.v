// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05229 dut (
    .CLK(clk),
    .s1(in_vec[35:35]),
    .s2(in_vec[34:34]),
    .d1(in_vec[33:18]),
    .d2(in_vec[17:2]),
    .c1(in_vec[1:1]),
    .c2(in_vec[0:0]),
    .od(out_vec[17:2]),
    .os(out_vec[1:1]),
    .oc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h7534606e2;
    stim[1] = 36'h5c1fb798f;
    stim[2] = 36'h47e2ba87c;
    stim[3] = 36'he03a2b701;
    stim[4] = 36'hbd45b2fe8;
    stim[5] = 36'he6e805b03;
    stim[6] = 36'he0d479d99;
    stim[7] = 36'h0765e6428;
    stim[8] = 36'h2f20165ca;
    stim[9] = 36'h89d3111fe;
    stim[10] = 36'h352d67b8f;
    stim[11] = 36'hf07f36ea9;
    stim[12] = 36'hc08c67f46;
    stim[13] = 36'hafa71b245;
    stim[14] = 36'h38f1c45f7;
    stim[15] = 36'h138359037;
    stim[16] = 36'h3af4a1a15;
    stim[17] = 36'h03c5a1aed;
    stim[18] = 36'h4805d819b;
    stim[19] = 36'h03ae9ac2e;
    stim[20] = 36'h9c929cf0e;
    stim[21] = 36'he54509789;
    stim[22] = 36'h3ae52de5d;
    stim[23] = 36'h2811a3403;
    stim[24] = 36'h63654198d;
    stim[25] = 36'hfbda9af4b;
    stim[26] = 36'h89651412f;
    stim[27] = 36'h5934b4d15;
    stim[28] = 36'h634a45225;
    stim[29] = 36'hf893f9dde;
    stim[30] = 36'h2344334a7;
    stim[31] = 36'h674c83697;
    stim[32] = 36'hec873f8a4;
    stim[33] = 36'h67c79147a;
    stim[34] = 36'h848e1c30b;
    stim[35] = 36'he5469c622;
    stim[36] = 36'h7c4ba32b5;
    stim[37] = 36'h96e16b522;
    stim[38] = 36'he9ba67a90;
    stim[39] = 36'hab29ebfc2;
    stim[40] = 36'h63ae1cf3d;
    stim[41] = 36'h5462b456f;
    stim[42] = 36'h69fb7bcd7;
    stim[43] = 36'h0a5c48d29;
    stim[44] = 36'h67ee1fcb3;
    stim[45] = 36'ha2767b9c6;
    stim[46] = 36'hcb1ea8c39;
    stim[47] = 36'hee6bb1bfc;
    stim[48] = 36'h93c2d8b1d;
    stim[49] = 36'h180fde243;
    stim[50] = 36'hf964f7982;
    stim[51] = 36'hd947f932b;
    stim[52] = 36'hd2a4b1d5f;
    stim[53] = 36'hedfe49958;
    stim[54] = 36'hda2c5cb05;
    stim[55] = 36'ha83221471;
    stim[56] = 36'h94b5db199;
    stim[57] = 36'ha7d35e8c4;
    stim[58] = 36'h68d7451ed;
    stim[59] = 36'h1ed14db89;
    stim[60] = 36'hd1ba21dbb;
    stim[61] = 36'h4080381dd;
    stim[62] = 36'hb118c76dc;
    stim[63] = 36'h9ce8c5e61;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h206e3;
      expv[2] = 18'h3798f;
      expv[3] = 18'h3a87e;
      expv[4] = 18'h203a3;
      expv[5] = 18'h3d45a;
      expv[6] = 18'h26e83;
      expv[7] = 18'h20d47;
      expv[8] = 18'h00000;
      expv[9] = 18'h00001;
      expv[10] = 18'h09d33;
      expv[11] = 18'h00001;
      expv[12] = 18'h307f3;
      expv[13] = 18'h008c7;
      expv[14] = 18'h2fa73;
      expv[15] = 18'h00001;
      expv[16] = 18'h00001;
      expv[17] = 18'h00001;
      expv[18] = 18'h00001;
      expv[19] = 18'h1819b;
      expv[20] = 18'h00001;
      expv[21] = 18'h1c92b;
      expv[22] = 18'h25453;
      expv[23] = 18'h00001;
      expv[24] = 18'h00001;
      expv[25] = 18'h0198f;
      expv[26] = 18'h3bdab;
      expv[27] = 18'h09653;
      expv[28] = 18'h34d17;
      expv[29] = 18'h05227;
      expv[30] = 18'h3893f;
      expv[31] = 18'h00001;
      expv[32] = 18'h03697;
      expv[33] = 18'h2c872;
      expv[34] = 18'h1147b;
      expv[35] = 18'h048e3;
      expv[36] = 18'h2546b;
      expv[37] = 18'h232b7;
      expv[38] = 18'h16e17;
      expv[39] = 18'h29ba6;
      expv[40] = 18'h2b29f;
      expv[41] = 18'h1cf3f;
      expv[42] = 18'h3456f;
      expv[43] = 18'h3bcd7;
      expv[44] = 18'h00001;
      expv[45] = 18'h1fcb3;
      expv[46] = 18'h22767;
      expv[47] = 18'h0b1eb;
      expv[48] = 18'h2e6ba;
      expv[49] = 18'h13c2f;
      expv[50] = 18'h00001;
      expv[51] = 18'h3964f;
      expv[52] = 18'h1947f;
      expv[53] = 18'h12a4b;
      expv[54] = 18'h2dfe6;
      expv[55] = 18'h1a2c7;
      expv[56] = 18'h28323;
      expv[57] = 18'h14b5f;
      expv[58] = 18'h27d36;
      expv[59] = 18'h051ef;
      expv[60] = 18'h00001;
      expv[61] = 18'h11ba3;
      expv[62] = 18'h381df;
      expv[63] = 18'h3118e;
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
