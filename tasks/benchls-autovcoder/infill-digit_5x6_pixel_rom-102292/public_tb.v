// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_102292 dut (
    .IN(in_vec[3:0]),
    .OUT(out_vec[29:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h0;
    stim[1] = 4'h4;
    stim[2] = 4'h9;
    stim[3] = 4'hb;
    stim[4] = 4'he;
    stim[5] = 4'hc;
    stim[6] = 4'h3;
    stim[7] = 4'h6;
    stim[8] = 4'hf;
    stim[9] = 4'he;
    stim[10] = 4'ha;
    stim[11] = 4'h7;
    stim[12] = 4'hf;
    stim[13] = 4'hb;
    stim[14] = 4'hc;
    stim[15] = 4'hf;
    stim[16] = 4'hc;
    stim[17] = 4'h0;
    stim[18] = 4'h8;
    stim[19] = 4'h6;
    stim[20] = 4'h3;
    stim[21] = 4'h3;
    stim[22] = 4'h1;
    stim[23] = 4'h4;
    stim[24] = 4'h0;
    stim[25] = 4'hb;
    stim[26] = 4'h6;
    stim[27] = 4'h1;
    stim[28] = 4'hf;
    stim[29] = 4'h1;
    stim[30] = 4'h9;
    stim[31] = 4'h2;
    stim[32] = 4'hb;
    stim[33] = 4'hd;
    stim[34] = 4'h6;
    stim[35] = 4'he;
    stim[36] = 4'h6;
    stim[37] = 4'hf;
    stim[38] = 4'h7;
    stim[39] = 4'h5;
    stim[40] = 4'h4;
    stim[41] = 4'h7;
    stim[42] = 4'h2;
    stim[43] = 4'hd;
    stim[44] = 4'h5;
    stim[45] = 4'h8;
    stim[46] = 4'h7;
    stim[47] = 4'h9;
    stim[48] = 4'hc;
    stim[49] = 4'h3;
    stim[50] = 4'hf;
    stim[51] = 4'hf;
    stim[52] = 4'h3;
    stim[53] = 4'h9;
    stim[54] = 4'h1;
    stim[55] = 4'hb;
    stim[56] = 4'h4;
    stim[57] = 4'hf;
    stim[58] = 4'h8;
    stim[59] = 4'hc;
    stim[60] = 4'h6;
    stim[61] = 4'h9;
    stim[62] = 4'h3;
    stim[63] = 4'h3;
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
      expv[0] = 30'h0c59a48c;
      expv[1] = 30'h0878a308;
      expv[2] = 30'h0c41c48c;
      expv[3] = 30'h00000000;
      expv[4] = 30'h00000000;
      expv[5] = 30'h00000000;
      expv[6] = 30'h0c48848c;
      expv[7] = 30'h0c48e08c;
      expv[8] = 30'h00000000;
      expv[9] = 30'h00000000;
      expv[10] = 30'h00000000;
      expv[11] = 30'h0410849e;
      expv[12] = 30'h00000000;
      expv[13] = 30'h00000000;
      expv[14] = 30'h00000000;
      expv[15] = 30'h00000000;
      expv[16] = 30'h00000000;
      expv[17] = 30'h0c59a48c;
      expv[18] = 30'h0c48c48c;
      expv[19] = 30'h0c48e08c;
      expv[20] = 30'h0c48848c;
      expv[21] = 30'h0c48848c;
      expv[22] = 30'h0e104184;
      expv[23] = 30'h0878a308;
      expv[24] = 30'h0c59a48c;
      expv[25] = 30'h00000000;
      expv[26] = 30'h0c48e08c;
      expv[27] = 30'h0e104184;
      expv[28] = 30'h00000000;
      expv[29] = 30'h0e104184;
      expv[30] = 30'h0c41c48c;
      expv[31] = 30'h1e10848c;
      expv[32] = 30'h00000000;
      expv[33] = 30'h00000000;
      expv[34] = 30'h0c48e08c;
      expv[35] = 30'h00000000;
      expv[36] = 30'h0c48e08c;
      expv[37] = 30'h00000000;
      expv[38] = 30'h0410849e;
      expv[39] = 30'h0c40c08e;
      expv[40] = 30'h0878a308;
      expv[41] = 30'h0410849e;
      expv[42] = 30'h1e10848c;
      expv[43] = 30'h00000000;
      expv[44] = 30'h0c40c08e;
      expv[45] = 30'h0c48c48c;
      expv[46] = 30'h0410849e;
      expv[47] = 30'h0c41c48c;
      expv[48] = 30'h00000000;
      expv[49] = 30'h0c48848c;
      expv[50] = 30'h00000000;
      expv[51] = 30'h00000000;
      expv[52] = 30'h0c48848c;
      expv[53] = 30'h0c41c48c;
      expv[54] = 30'h0e104184;
      expv[55] = 30'h00000000;
      expv[56] = 30'h0878a308;
      expv[57] = 30'h00000000;
      expv[58] = 30'h0c48c48c;
      expv[59] = 30'h00000000;
      expv[60] = 30'h0c48e08c;
      expv[61] = 30'h0c41c48c;
      expv[62] = 30'h0c48848c;
      expv[63] = 30'h0c48848c;
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
