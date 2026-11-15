// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04840 dut (
    .clk(clk),
    .flash(in_vec[51:51]),
    .Hexs(in_vec[50:19]),
    .LES(in_vec[18:11]),
    .point(in_vec[10:3]),
    .rst(in_vec[2:2]),
    .Start(in_vec[1:1]),
    .SW0(in_vec[0:0]),
    .seg_clk(out_vec[3:3]),
    .seg_clrn(out_vec[2:2]),
    .SEG_PEN(out_vec[1:1]),
    .seg_sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h657400c59f54c;
    stim[1] = 52'h47a604584f5c4;
    stim[2] = 52'h9519432a15f6a;
    stim[3] = 52'hc23f199ce1043;
    stim[4] = 52'h01f6e5109d763;
    stim[5] = 52'h9837153d10b2a;
    stim[6] = 52'h1b408d935c989;
    stim[7] = 52'h489a2bd6143e3;
    stim[8] = 52'hab5b1f92956a0;
    stim[9] = 52'h642cb6584446b;
    stim[10] = 52'hfdea5b55adf40;
    stim[11] = 52'hcccee0eaa4182;
    stim[12] = 52'h0c2c13f5d0a79;
    stim[13] = 52'h6ac1b7da81353;
    stim[14] = 52'h9ccdb0b3e6a73;
    stim[15] = 52'h5fcd8a47646bb;
    stim[16] = 52'h6331ce27655d1;
    stim[17] = 52'h90564b7c798e3;
    stim[18] = 52'h4c47da058d9d6;
    stim[19] = 52'hcb48e24a8f113;
    stim[20] = 52'h2756ff276b928;
    stim[21] = 52'h7b5e231b428c8;
    stim[22] = 52'h11c01433db74b;
    stim[23] = 52'ha77f5b69d0640;
    stim[24] = 52'h9bb2763996e1b;
    stim[25] = 52'hef21d2cd5e46a;
    stim[26] = 52'h89ae8fb502a78;
    stim[27] = 52'h00ca1bed7c3d9;
    stim[28] = 52'h910215fe8d101;
    stim[29] = 52'h9b2cba3a5710b;
    stim[30] = 52'h3355cb8062a63;
    stim[31] = 52'h3e7342bb5e971;
    stim[32] = 52'he70ec7726d372;
    stim[33] = 52'h0ab9e52592699;
    stim[34] = 52'h483d104d5e919;
    stim[35] = 52'h66dbb6ee503b3;
    stim[36] = 52'hefe32acfb98f1;
    stim[37] = 52'h95f73ee3f7072;
    stim[38] = 52'h04fdf99d3d7a1;
    stim[39] = 52'h970c10eaca391;
    stim[40] = 52'h820a106a20250;
    stim[41] = 52'h64cc02febb8c1;
    stim[42] = 52'had7ccdd9f5bc0;
    stim[43] = 52'h2b52c64f48230;
    stim[44] = 52'hcc1584811f680;
    stim[45] = 52'h5f9284fa8a9c8;
    stim[46] = 52'hc2de6a6a98a71;
    stim[47] = 52'ha583e40867402;
    stim[48] = 52'h5596334633108;
    stim[49] = 52'hb6ee56729639b;
    stim[50] = 52'hb057a183349cb;
    stim[51] = 52'hd330edf89d908;
    stim[52] = 52'h0a458dea295d0;
    stim[53] = 52'hfdc4ae359d968;
    stim[54] = 52'hbea839ccde482;
    stim[55] = 52'ha4c8e18b7fc18;
    stim[56] = 52'h22cbc5f98947e;
    stim[57] = 52'hc12819fee4dcb;
    stim[58] = 52'h3175f72f853f1;
    stim[59] = 52'h56b59984bde2b;
    stim[60] = 52'hc32b09bd7111a;
    stim[61] = 52'h8220b5a5fb631;
    stim[62] = 52'ha8d9e272f14e8;
    stim[63] = 52'h562c9146ee589;
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
      expv[0] = 4'h6;
      expv[1] = 4'h6;
      expv[2] = 4'h2;
      expv[3] = 4'h2;
      expv[4] = 4'h2;
      expv[5] = 4'h2;
      expv[6] = 4'h2;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'h2;
      expv[10] = 4'h2;
      expv[11] = 4'h2;
      expv[12] = 4'h2;
      expv[13] = 4'h2;
      expv[14] = 4'h2;
      expv[15] = 4'h2;
      expv[16] = 4'h2;
      expv[17] = 4'h2;
      expv[18] = 4'h6;
      expv[19] = 4'h2;
      expv[20] = 4'h2;
      expv[21] = 4'h2;
      expv[22] = 4'h2;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'h2;
      expv[26] = 4'h2;
      expv[27] = 4'h2;
      expv[28] = 4'h2;
      expv[29] = 4'h2;
      expv[30] = 4'h2;
      expv[31] = 4'h2;
      expv[32] = 4'h2;
      expv[33] = 4'h2;
      expv[34] = 4'h2;
      expv[35] = 4'h2;
      expv[36] = 4'h2;
      expv[37] = 4'h2;
      expv[38] = 4'h2;
      expv[39] = 4'h2;
      expv[40] = 4'h2;
      expv[41] = 4'h2;
      expv[42] = 4'h2;
      expv[43] = 4'h2;
      expv[44] = 4'h2;
      expv[45] = 4'h2;
      expv[46] = 4'h2;
      expv[47] = 4'h2;
      expv[48] = 4'h2;
      expv[49] = 4'h2;
      expv[50] = 4'h2;
      expv[51] = 4'h2;
      expv[52] = 4'h2;
      expv[53] = 4'h2;
      expv[54] = 4'h2;
      expv[55] = 4'h2;
      expv[56] = 4'h6;
      expv[57] = 4'h2;
      expv[58] = 4'h2;
      expv[59] = 4'h2;
      expv[60] = 4'h2;
      expv[61] = 4'h2;
      expv[62] = 4'h2;
      expv[63] = 4'h2;
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
