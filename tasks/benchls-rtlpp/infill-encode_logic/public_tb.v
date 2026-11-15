// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  encode_logic dut (
    .clkin(clk),
    .rstin(in_vec[11:11]),
    .din(in_vec[10:3]),
    .c0(in_vec[2:2]),
    .c1(in_vec[1:1]),
    .de(in_vec[0:0]),
    .dout(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h335;
    stim[1] = 12'h74c;
    stim[2] = 12'ha88;
    stim[3] = 12'h116;
    stim[4] = 12'haa9;
    stim[5] = 12'h8b9;
    stim[6] = 12'hfdf;
    stim[7] = 12'ha05;
    stim[8] = 12'ha10;
    stim[9] = 12'haf8;
    stim[10] = 12'hd77;
    stim[11] = 12'hd19;
    stim[12] = 12'hc20;
    stim[13] = 12'hf8e;
    stim[14] = 12'h970;
    stim[15] = 12'ha33;
    stim[16] = 12'hf6e;
    stim[17] = 12'hcba;
    stim[18] = 12'haa0;
    stim[19] = 12'hc94;
    stim[20] = 12'hb58;
    stim[21] = 12'h837;
    stim[22] = 12'h9f2;
    stim[23] = 12'h8d4;
    stim[24] = 12'hf7c;
    stim[25] = 12'h876;
    stim[26] = 12'h970;
    stim[27] = 12'h1d4;
    stim[28] = 12'hfbc;
    stim[29] = 12'h899;
    stim[30] = 12'h2fb;
    stim[31] = 12'hd59;
    stim[32] = 12'hbe3;
    stim[33] = 12'he80;
    stim[34] = 12'he79;
    stim[35] = 12'he21;
    stim[36] = 12'hf2e;
    stim[37] = 12'ha54;
    stim[38] = 12'h9bd;
    stim[39] = 12'hdac;
    stim[40] = 12'hbc7;
    stim[41] = 12'hb0f;
    stim[42] = 12'hc6e;
    stim[43] = 12'hd0f;
    stim[44] = 12'h979;
    stim[45] = 12'hf0d;
    stim[46] = 12'hb93;
    stim[47] = 12'ha29;
    stim[48] = 12'hc87;
    stim[49] = 12'had6;
    stim[50] = 12'hdf8;
    stim[51] = 12'h9f6;
    stim[52] = 12'ha65;
    stim[53] = 12'h8b9;
    stim[54] = 12'h9ba;
    stim[55] = 12'hbb0;
    stim[56] = 12'h473;
    stim[57] = 12'h89f;
    stim[58] = 12'h96c;
    stim[59] = 12'hfcd;
    stim[60] = 12'h90f;
    stim[61] = 12'hac4;
    stim[62] = 12'ha38;
    stim[63] = 12'h828;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h166;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
