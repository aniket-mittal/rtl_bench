// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062043 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h7413e6393a64e7;
    stim[1] = 55'h141e068f8b3418;
    stim[2] = 55'h730a663caa75aa;
    stim[3] = 55'h562a1f545e2580;
    stim[4] = 55'h5e0e79c26d3be9;
    stim[5] = 55'h4845914e95257b;
    stim[6] = 55'h152e3666c0a3cc;
    stim[7] = 55'h18ccdb821dd869;
    stim[8] = 55'h25568fffa557b0;
    stim[9] = 55'h002d0fd5c843f6;
    stim[10] = 55'h23a958992173b6;
    stim[11] = 55'h265bbb6ae3a95c;
    stim[12] = 55'h46ade83a80c2ef;
    stim[13] = 55'h02803c836f327b;
    stim[14] = 55'h5dd422f4750049;
    stim[15] = 55'h3e4ed0df5efb93;
    stim[16] = 55'h10e798dc512a28;
    stim[17] = 55'h17a19bbcc57e6e;
    stim[18] = 55'h549f7b616d7ac8;
    stim[19] = 55'h28842ee16d5d31;
    stim[20] = 55'h75076a71e028ca;
    stim[21] = 55'h60a140dabfcfca;
    stim[22] = 55'h39ed349a4b057a;
    stim[23] = 55'h5c056f77485f83;
    stim[24] = 55'h3951d4185b3b6a;
    stim[25] = 55'h6e77d936d5f8dd;
    stim[26] = 55'h4ca6ec21a6973e;
    stim[27] = 55'h71139b814f4ddf;
    stim[28] = 55'h3974a07926de21;
    stim[29] = 55'h45dbe45def3f98;
    stim[30] = 55'h08185733e96caa;
    stim[31] = 55'h2ce96699a3e78c;
    stim[32] = 55'h51cf43c17915a2;
    stim[33] = 55'h593441e5ad304f;
    stim[34] = 55'h49b032321a6c8b;
    stim[35] = 55'h15a4625c4a2eb2;
    stim[36] = 55'h0557c396a73381;
    stim[37] = 55'h6d389e39215dfa;
    stim[38] = 55'h694061fdbdca90;
    stim[39] = 55'h04060b85fc1aba;
    stim[40] = 55'h6d011290acbf06;
    stim[41] = 55'h733a2d00877ad9;
    stim[42] = 55'h6962441ed8add4;
    stim[43] = 55'h6b213919512b8b;
    stim[44] = 55'h5143a9ea1a198a;
    stim[45] = 55'h31dbee40feb5ab;
    stim[46] = 55'h04408334e0bd98;
    stim[47] = 55'h3d4c9517ea648f;
    stim[48] = 55'h2ba8d27224f821;
    stim[49] = 55'h647c53850ec4a2;
    stim[50] = 55'h62d22f3ad9eddc;
    stim[51] = 55'h704df966fc5268;
    stim[52] = 55'h1e41448f5fa30a;
    stim[53] = 55'h4d57a1ba29de77;
    stim[54] = 55'h796e3daf48cba6;
    stim[55] = 55'h223861887a580f;
    stim[56] = 55'h5d6832901f512b;
    stim[57] = 55'h3810be2a9335d2;
    stim[58] = 55'h5fb56b507b50a0;
    stim[59] = 55'h25319e572cf49f;
    stim[60] = 55'h033232b2a50cd0;
    stim[61] = 55'h09a6983418a361;
    stim[62] = 55'h171d8635cee9ca;
    stim[63] = 55'h7c9c531734bd46;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h7413e6393a64e7;
      expv[2] = 55'h141e068f8b3418;
      expv[3] = 55'h730a663caa75aa;
      expv[4] = 55'h562a1f545e2580;
      expv[5] = 55'h5e0e79c26d3be9;
      expv[6] = 55'h4845914e95257b;
      expv[7] = 55'h152e3666c0a3cc;
      expv[8] = 55'h18ccdb821dd869;
      expv[9] = 55'h25568fffa557b0;
      expv[10] = 55'h002d0fd5c843f6;
      expv[11] = 55'h23a958992173b6;
      expv[12] = 55'h265bbb6ae3a95c;
      expv[13] = 55'h46ade83a80c2ef;
      expv[14] = 55'h02803c836f327b;
      expv[15] = 55'h5dd422f4750049;
      expv[16] = 55'h3e4ed0df5efb93;
      expv[17] = 55'h10e798dc512a28;
      expv[18] = 55'h17a19bbcc57e6e;
      expv[19] = 55'h549f7b616d7ac8;
      expv[20] = 55'h28842ee16d5d31;
      expv[21] = 55'h75076a71e028ca;
      expv[22] = 55'h60a140dabfcfca;
      expv[23] = 55'h39ed349a4b057a;
      expv[24] = 55'h5c056f77485f83;
      expv[25] = 55'h3951d4185b3b6a;
      expv[26] = 55'h6e77d936d5f8dd;
      expv[27] = 55'h4ca6ec21a6973e;
      expv[28] = 55'h71139b814f4ddf;
      expv[29] = 55'h3974a07926de21;
      expv[30] = 55'h45dbe45def3f98;
      expv[31] = 55'h08185733e96caa;
      expv[32] = 55'h2ce96699a3e78c;
      expv[33] = 55'h51cf43c17915a2;
      expv[34] = 55'h593441e5ad304f;
      expv[35] = 55'h49b032321a6c8b;
      expv[36] = 55'h15a4625c4a2eb2;
      expv[37] = 55'h0557c396a73381;
      expv[38] = 55'h6d389e39215dfa;
      expv[39] = 55'h694061fdbdca90;
      expv[40] = 55'h04060b85fc1aba;
      expv[41] = 55'h6d011290acbf06;
      expv[42] = 55'h733a2d00877ad9;
      expv[43] = 55'h6962441ed8add4;
      expv[44] = 55'h6b213919512b8b;
      expv[45] = 55'h5143a9ea1a198a;
      expv[46] = 55'h31dbee40feb5ab;
      expv[47] = 55'h04408334e0bd98;
      expv[48] = 55'h3d4c9517ea648f;
      expv[49] = 55'h2ba8d27224f821;
      expv[50] = 55'h647c53850ec4a2;
      expv[51] = 55'h62d22f3ad9eddc;
      expv[52] = 55'h704df966fc5268;
      expv[53] = 55'h1e41448f5fa30a;
      expv[54] = 55'h4d57a1ba29de77;
      expv[55] = 55'h796e3daf48cba6;
      expv[56] = 55'h223861887a580f;
      expv[57] = 55'h5d6832901f512b;
      expv[58] = 55'h3810be2a9335d2;
      expv[59] = 55'h5fb56b507b50a0;
      expv[60] = 55'h25319e572cf49f;
      expv[61] = 55'h033232b2a50cd0;
      expv[62] = 55'h09a6983418a361;
      expv[63] = 55'h171d8635cee9ca;
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
