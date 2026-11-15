// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_077084 dut (
    .in(in_vec[3:0]),
    .mask(out_vec[15:0])
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
    stim[1] = 4'h1;
    stim[2] = 4'h7;
    stim[3] = 4'h6;
    stim[4] = 4'h8;
    stim[5] = 4'hf;
    stim[6] = 4'h4;
    stim[7] = 4'h8;
    stim[8] = 4'hf;
    stim[9] = 4'h1;
    stim[10] = 4'h2;
    stim[11] = 4'h7;
    stim[12] = 4'ha;
    stim[13] = 4'h1;
    stim[14] = 4'h0;
    stim[15] = 4'he;
    stim[16] = 4'h2;
    stim[17] = 4'hf;
    stim[18] = 4'h7;
    stim[19] = 4'hc;
    stim[20] = 4'h7;
    stim[21] = 4'h5;
    stim[22] = 4'h4;
    stim[23] = 4'h5;
    stim[24] = 4'hf;
    stim[25] = 4'h5;
    stim[26] = 4'h4;
    stim[27] = 4'h6;
    stim[28] = 4'h6;
    stim[29] = 4'h7;
    stim[30] = 4'hc;
    stim[31] = 4'h4;
    stim[32] = 4'he;
    stim[33] = 4'hf;
    stim[34] = 4'h0;
    stim[35] = 4'hb;
    stim[36] = 4'h1;
    stim[37] = 4'h2;
    stim[38] = 4'hc;
    stim[39] = 4'he;
    stim[40] = 4'h9;
    stim[41] = 4'hd;
    stim[42] = 4'hd;
    stim[43] = 4'h3;
    stim[44] = 4'hd;
    stim[45] = 4'h1;
    stim[46] = 4'hb;
    stim[47] = 4'h7;
    stim[48] = 4'hc;
    stim[49] = 4'h9;
    stim[50] = 4'h1;
    stim[51] = 4'h7;
    stim[52] = 4'h1;
    stim[53] = 4'h4;
    stim[54] = 4'h4;
    stim[55] = 4'h1;
    stim[56] = 4'h1;
    stim[57] = 4'h5;
    stim[58] = 4'h1;
    stim[59] = 4'h6;
    stim[60] = 4'he;
    stim[61] = 4'h2;
    stim[62] = 4'h4;
    stim[63] = 4'h5;
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
      expv[0] = 16'h8000;
      expv[1] = 16'hc000;
      expv[2] = 16'hff00;
      expv[3] = 16'hfe00;
      expv[4] = 16'hff80;
      expv[5] = 16'hffff;
      expv[6] = 16'hf800;
      expv[7] = 16'hff80;
      expv[8] = 16'hffff;
      expv[9] = 16'hc000;
      expv[10] = 16'he000;
      expv[11] = 16'hff00;
      expv[12] = 16'hffe0;
      expv[13] = 16'hc000;
      expv[14] = 16'h8000;
      expv[15] = 16'hfffe;
      expv[16] = 16'he000;
      expv[17] = 16'hffff;
      expv[18] = 16'hff00;
      expv[19] = 16'hfff8;
      expv[20] = 16'hff00;
      expv[21] = 16'hfc00;
      expv[22] = 16'hf800;
      expv[23] = 16'hfc00;
      expv[24] = 16'hffff;
      expv[25] = 16'hfc00;
      expv[26] = 16'hf800;
      expv[27] = 16'hfe00;
      expv[28] = 16'hfe00;
      expv[29] = 16'hff00;
      expv[30] = 16'hfff8;
      expv[31] = 16'hf800;
      expv[32] = 16'hfffe;
      expv[33] = 16'hffff;
      expv[34] = 16'h8000;
      expv[35] = 16'hfff0;
      expv[36] = 16'hc000;
      expv[37] = 16'he000;
      expv[38] = 16'hfff8;
      expv[39] = 16'hfffe;
      expv[40] = 16'hffc0;
      expv[41] = 16'hfffc;
      expv[42] = 16'hfffc;
      expv[43] = 16'hf000;
      expv[44] = 16'hfffc;
      expv[45] = 16'hc000;
      expv[46] = 16'hfff0;
      expv[47] = 16'hff00;
      expv[48] = 16'hfff8;
      expv[49] = 16'hffc0;
      expv[50] = 16'hc000;
      expv[51] = 16'hff00;
      expv[52] = 16'hc000;
      expv[53] = 16'hf800;
      expv[54] = 16'hf800;
      expv[55] = 16'hc000;
      expv[56] = 16'hc000;
      expv[57] = 16'hfc00;
      expv[58] = 16'hc000;
      expv[59] = 16'hfe00;
      expv[60] = 16'hfffe;
      expv[61] = 16'he000;
      expv[62] = 16'hf800;
      expv[63] = 16'hfc00;
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
