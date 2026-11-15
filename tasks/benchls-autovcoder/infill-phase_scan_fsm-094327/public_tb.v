// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094327 dut (
    .psclk(clk),
    .pscmd(in_vec[35:35]),
    .psmode(in_vec[34:34]),
    .psstep(in_vec[33:18]),
    .psdone(in_vec[17:17]),
    .deser_dout(in_vec[16:1]),
    .reset(in_vec[0:0]),
    .psen(out_vec[1:1]),
    .psscan_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hea021a79f;
    stim[1] = 36'hf061de09b;
    stim[2] = 36'h74081eeb0;
    stim[3] = 36'hab544ecb0;
    stim[4] = 36'hac9b58d78;
    stim[5] = 36'h2b0c83cc6;
    stim[6] = 36'h8e36df558;
    stim[7] = 36'h111dcb21a;
    stim[8] = 36'hccb2ba3a8;
    stim[9] = 36'h24afa7330;
    stim[10] = 36'h30749b0aa;
    stim[11] = 36'he83ea2186;
    stim[12] = 36'ha9ed4b62e;
    stim[13] = 36'h91203c50e;
    stim[14] = 36'h37a84fefe;
    stim[15] = 36'hf392d3420;
    stim[16] = 36'hd59e78190;
    stim[17] = 36'hcbad35e9c;
    stim[18] = 36'h45bbea282;
    stim[19] = 36'h26e6283a6;
    stim[20] = 36'hb2ea32782;
    stim[21] = 36'h2e8ce0618;
    stim[22] = 36'h9de0a6130;
    stim[23] = 36'h0b1ea28aa;
    stim[24] = 36'h54434e6c0;
    stim[25] = 36'h1ba10ded8;
    stim[26] = 36'hcb42db965;
    stim[27] = 36'h823ff569c;
    stim[28] = 36'h040b659ea;
    stim[29] = 36'h0c18d9d82;
    stim[30] = 36'h145ee5212;
    stim[31] = 36'h5f6ccc5fa;
    stim[32] = 36'h3beb0bcb0;
    stim[33] = 36'hc8b0e0956;
    stim[34] = 36'h7dd6e8eb4;
    stim[35] = 36'h800f2aad6;
    stim[36] = 36'h681ee1428;
    stim[37] = 36'h7084efb3a;
    stim[38] = 36'haee5c0e04;
    stim[39] = 36'h71d1c9dbe;
    stim[40] = 36'heb6d1fb72;
    stim[41] = 36'ha9a0cb7f8;
    stim[42] = 36'hc7d8dfdca;
    stim[43] = 36'hc910925d0;
    stim[44] = 36'h7063fcc0a;
    stim[45] = 36'hfc650d1ca;
    stim[46] = 36'h6b7f4afe6;
    stim[47] = 36'h9d22cd8ca;
    stim[48] = 36'hf90986dc8;
    stim[49] = 36'h64bbf9702;
    stim[50] = 36'h42083800e;
    stim[51] = 36'h8880bee5e;
    stim[52] = 36'h8c8239666;
    stim[53] = 36'h9784009cc;
    stim[54] = 36'h9cc9cfcd8;
    stim[55] = 36'h965073266;
    stim[56] = 36'hb7484dc92;
    stim[57] = 36'h67d1dfe6a;
    stim[58] = 36'hb97d797be;
    stim[59] = 36'h955b68643;
    stim[60] = 36'h4cde50f26;
    stim[61] = 36'h635098c08;
    stim[62] = 36'h67d5eaf04;
    stim[63] = 36'h196113ef4;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h3;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h3;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h3;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h3;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h3;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h3;
      expv[26] = 2'h1;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h3;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h3;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h3;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h3;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h3;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h3;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h3;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h3;
      expv[59] = 2'h1;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
