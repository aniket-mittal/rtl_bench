// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_5 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'ha7ae4d75;
    stim[1] = 32'hcd060945;
    stim[2] = 32'h09cdfba4;
    stim[3] = 32'hc2460573;
    stim[4] = 32'hfe51525f;
    stim[5] = 32'h24f40d65;
    stim[6] = 32'h26bddace;
    stim[7] = 32'hc2a581e4;
    stim[8] = 32'h44bf04c0;
    stim[9] = 32'hab0a8140;
    stim[10] = 32'h3d39002b;
    stim[11] = 32'h3601d4ad;
    stim[12] = 32'h76f8c42e;
    stim[13] = 32'h9835409d;
    stim[14] = 32'h9c318800;
    stim[15] = 32'he0af11ed;
    stim[16] = 32'hff0138bd;
    stim[17] = 32'h502fcbdc;
    stim[18] = 32'h2aad542c;
    stim[19] = 32'heb4ec491;
    stim[20] = 32'he26dd443;
    stim[21] = 32'h96907a38;
    stim[22] = 32'h490716c0;
    stim[23] = 32'h0dd4ea07;
    stim[24] = 32'hb2ed969b;
    stim[25] = 32'h836eb44b;
    stim[26] = 32'hf153895e;
    stim[27] = 32'h89db2c10;
    stim[28] = 32'ha970dc0b;
    stim[29] = 32'hb945f1c5;
    stim[30] = 32'hd3f4dad0;
    stim[31] = 32'h99fe38c6;
    stim[32] = 32'h4567646e;
    stim[33] = 32'h5939bbd6;
    stim[34] = 32'h1487a161;
    stim[35] = 32'hf937d32a;
    stim[36] = 32'h1b4b110d;
    stim[37] = 32'hea23dd3b;
    stim[38] = 32'h29fde797;
    stim[39] = 32'h6f73822d;
    stim[40] = 32'hbe9914b4;
    stim[41] = 32'h281a7d4e;
    stim[42] = 32'haae2e5a4;
    stim[43] = 32'h7e169598;
    stim[44] = 32'h67525174;
    stim[45] = 32'h1315b111;
    stim[46] = 32'h24df6241;
    stim[47] = 32'hb5db7ffb;
    stim[48] = 32'he8e6ab35;
    stim[49] = 32'ha2d8f402;
    stim[50] = 32'hffc52271;
    stim[51] = 32'h1bd4d652;
    stim[52] = 32'h6fcbfc11;
    stim[53] = 32'h5cf28d2f;
    stim[54] = 32'h07b87e31;
    stim[55] = 32'h7a8f1755;
    stim[56] = 32'h379abb4a;
    stim[57] = 32'h413afb15;
    stim[58] = 32'hd8672bce;
    stim[59] = 32'hf0acff8d;
    stim[60] = 32'he6629b0b;
    stim[61] = 32'h47aa8acd;
    stim[62] = 32'h65fda724;
    stim[63] = 32'hcbcfd651;
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
      expv[0] = 32'hfd490ee4;
      expv[1] = 32'haf61e0dd;
      expv[2] = 32'h391f7c85;
      expv[3] = 32'h47c06e18;
      expv[4] = 32'hc64ab383;
      expv[5] = 32'h9c018cb4;
      expv[6] = 32'hd53b79d4;
      expv[7] = 32'h5bb0fcf8;
      expv[8] = 32'h92e0d828;
      expv[9] = 32'h69708041;
      expv[10] = 32'ha4403d7b;
      expv[11] = 32'hc3faa5be;
      expv[12] = 32'hd9d8f5f6;
      expv[13] = 32'h0d488bff;
      expv[14] = 32'h8dd1985f;
      expv[15] = 32'h1862ddcc;
      expv[16] = 32'hec47efc3;
      expv[17] = 32'h01b92ba2;
      expv[18] = 32'h578aad91;
      expv[19] = 32'h64f87a49;
      expv[20] = 32'h403a680c;
      expv[21] = 32'hd94fd75a;
      expv[22] = 32'h2542902d;
      expv[23] = 32'hba3d48e5;
      expv[24] = 32'h5472632e;
      expv[25] = 32'h67d60930;
      expv[26] = 32'h26b1dba6;
      expv[27] = 32'h31c50a55;
      expv[28] = 32'h263b2921;
      expv[29] = 32'h21de80eb;
      expv[30] = 32'h70db8a72;
      expv[31] = 32'h3427809f;
      expv[32] = 32'ha9eccde8;
      expv[33] = 32'h23d722e7;
      expv[34] = 32'h91b43c2a;
      expv[35] = 32'h2a9a9d23;
      expv[36] = 32'h688239af;
      expv[37] = 32'h495b4f09;
      expv[38] = 32'h3d9cdaf1;
      expv[39] = 32'he9502d99;
      expv[40] = 32'hda422ecb;
      expv[41] = 32'h016f81d1;
      expv[42] = 32'h547c1cc1;
      expv[43] = 32'hc4b2cb33;
      expv[44] = 32'hedca4ebc;
      expv[45] = 32'h63f6322a;
      expv[46] = 32'h996c6834;
      expv[47] = 32'hb2af4f2e;
      expv[48] = 32'h11f58ec9;
      expv[49] = 32'h539e2004;
      expv[50] = 32'hf4c4b643;
      expv[51] = 32'h7b7ad24f;
      expv[52] = 32'hfe5fea19;
      expv[53] = 32'h9ab1fdc7;
      expv[54] = 32'hf70fc620;
      expv[55] = 32'h57829293;
      expv[56] = 32'hf097595e;
      expv[57] = 32'h225f2288;
      expv[58] = 32'h0205a1b7;
      expv[59] = 32'h195f01c6;
      expv[60] = 32'hc1d3810c;
      expv[61] = 32'hf0511988;
      expv[62] = 32'hb83484bc;
      expv[63] = 32'h765a025d;
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
