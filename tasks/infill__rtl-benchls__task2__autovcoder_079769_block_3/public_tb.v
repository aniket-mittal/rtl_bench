// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079769 dut (
    .axaddr(in_vec[31:0]),
    .reg_decode_num(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h40d88291;
    stim[1] = 32'h4107396b;
    stim[2] = 32'h082652c9;
    stim[3] = 32'h55c7bb8b;
    stim[4] = 32'h218d34f8;
    stim[5] = 32'hb2252a99;
    stim[6] = 32'h8a9044d9;
    stim[7] = 32'h114320dd;
    stim[8] = 32'h6936cda4;
    stim[9] = 32'ha8a69af5;
    stim[10] = 32'hb79df08b;
    stim[11] = 32'h1abc458a;
    stim[12] = 32'hbc70b57a;
    stim[13] = 32'h6585d901;
    stim[14] = 32'h32a1b680;
    stim[15] = 32'hf3ffd886;
    stim[16] = 32'ha54896ad;
    stim[17] = 32'hd8c146a0;
    stim[18] = 32'hfca1b252;
    stim[19] = 32'hac8e9a4e;
    stim[20] = 32'hea81bf8f;
    stim[21] = 32'h49706a52;
    stim[22] = 32'h7344a229;
    stim[23] = 32'hdb3cea25;
    stim[24] = 32'hcdbb90cd;
    stim[25] = 32'ha9a0400d;
    stim[26] = 32'h9ca09e42;
    stim[27] = 32'h8ba2b1a1;
    stim[28] = 32'h390fd785;
    stim[29] = 32'h02aaf15e;
    stim[30] = 32'hf004033a;
    stim[31] = 32'h65f21afb;
    stim[32] = 32'hdc7986f6;
    stim[33] = 32'h41f781ea;
    stim[34] = 32'hc4f8176b;
    stim[35] = 32'h3a99a15c;
    stim[36] = 32'h77e2b044;
    stim[37] = 32'hdff2defe;
    stim[38] = 32'ha19ea0ff;
    stim[39] = 32'hb670bee5;
    stim[40] = 32'h2746f3a2;
    stim[41] = 32'he7426cbf;
    stim[42] = 32'h54b043bb;
    stim[43] = 32'hc4182834;
    stim[44] = 32'hf84be28a;
    stim[45] = 32'h2d34057d;
    stim[46] = 32'h17fd8711;
    stim[47] = 32'hd410b8cc;
    stim[48] = 32'hf6f79bfb;
    stim[49] = 32'h8daf5bd4;
    stim[50] = 32'h0a2b1ae9;
    stim[51] = 32'h4ed4322a;
    stim[52] = 32'ha59d7cc7;
    stim[53] = 32'h1151e829;
    stim[54] = 32'hc66bf24c;
    stim[55] = 32'hbd062bfc;
    stim[56] = 32'h51626dba;
    stim[57] = 32'h07af40b2;
    stim[58] = 32'hb6428da6;
    stim[59] = 32'h27494db6;
    stim[60] = 32'hd11cc78a;
    stim[61] = 32'hebd81818;
    stim[62] = 32'h87a88916;
    stim[63] = 32'ha44a52c8;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h2;
      expv[9] = 3'h2;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h2;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h2;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h2;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h2;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h2;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h2;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h2;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h2;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h2;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h2;
      expv[59] = 3'h2;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h2;
      expv[63] = 3'h0;
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
