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

  autovcoder_020687 dut (
    .clk(clk),
    .reset(in_vec[3:3]),
    .enable(in_vec[2:2]),
    .init(in_vec[1:1]),
    .data_in(in_vec[0:0]),
    .crc_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hc;
    stim[1] = 4'h8;
    stim[2] = 4'hb;
    stim[3] = 4'h3;
    stim[4] = 4'h6;
    stim[5] = 4'h1;
    stim[6] = 4'ha;
    stim[7] = 4'h5;
    stim[8] = 4'h4;
    stim[9] = 4'h1;
    stim[10] = 4'h7;
    stim[11] = 4'h1;
    stim[12] = 4'h7;
    stim[13] = 4'h4;
    stim[14] = 4'h1;
    stim[15] = 4'h1;
    stim[16] = 4'h5;
    stim[17] = 4'h3;
    stim[18] = 4'h0;
    stim[19] = 4'h8;
    stim[20] = 4'h2;
    stim[21] = 4'h0;
    stim[22] = 4'h4;
    stim[23] = 4'h3;
    stim[24] = 4'h4;
    stim[25] = 4'h7;
    stim[26] = 4'h5;
    stim[27] = 4'h2;
    stim[28] = 4'h1;
    stim[29] = 4'h2;
    stim[30] = 4'h3;
    stim[31] = 4'h2;
    stim[32] = 4'h6;
    stim[33] = 4'h6;
    stim[34] = 4'h0;
    stim[35] = 4'h6;
    stim[36] = 4'h2;
    stim[37] = 4'h5;
    stim[38] = 4'h7;
    stim[39] = 4'h5;
    stim[40] = 4'h7;
    stim[41] = 4'h4;
    stim[42] = 4'h4;
    stim[43] = 4'h2;
    stim[44] = 4'h6;
    stim[45] = 4'h4;
    stim[46] = 4'h1;
    stim[47] = 4'h6;
    stim[48] = 4'h2;
    stim[49] = 4'h5;
    stim[50] = 4'h7;
    stim[51] = 4'h6;
    stim[52] = 4'h2;
    stim[53] = 4'h1;
    stim[54] = 4'h4;
    stim[55] = 4'h5;
    stim[56] = 4'h0;
    stim[57] = 4'h0;
    stim[58] = 4'h4;
    stim[59] = 4'h0;
    stim[60] = 4'h5;
    stim[61] = 4'h7;
    stim[62] = 4'h4;
    stim[63] = 4'h7;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hffff;
      expv[2] = 16'hffff;
      expv[3] = 16'hffff;
      expv[4] = 16'hffff;
      expv[5] = 16'hffff;
      expv[6] = 16'hffff;
      expv[7] = 16'hffff;
      expv[8] = 16'hfffe;
      expv[9] = 16'hefdd;
      expv[10] = 16'hefdd;
      expv[11] = 16'hffff;
      expv[12] = 16'hffff;
      expv[13] = 16'hffff;
      expv[14] = 16'hefdf;
      expv[15] = 16'hefdf;
      expv[16] = 16'hefdf;
      expv[17] = 16'hdfbe;
      expv[18] = 16'hdfbe;
      expv[19] = 16'hdfbe;
      expv[20] = 16'hffff;
      expv[21] = 16'hffff;
      expv[22] = 16'hffff;
      expv[23] = 16'hefdf;
      expv[24] = 16'hefdf;
      expv[25] = 16'hcf9f;
      expv[26] = 16'hffff;
      expv[27] = 16'hfffe;
      expv[28] = 16'hfffe;
      expv[29] = 16'hfffe;
      expv[30] = 16'hfffe;
      expv[31] = 16'hfffe;
      expv[32] = 16'hfffe;
      expv[33] = 16'hffff;
      expv[34] = 16'hffff;
      expv[35] = 16'hffff;
      expv[36] = 16'hffff;
      expv[37] = 16'hffff;
      expv[38] = 16'hfffe;
      expv[39] = 16'hffff;
      expv[40] = 16'hfffe;
      expv[41] = 16'hffff;
      expv[42] = 16'hefdf;
      expv[43] = 16'hcf9f;
      expv[44] = 16'hcf9f;
      expv[45] = 16'hffff;
      expv[46] = 16'hefdf;
      expv[47] = 16'hefdf;
      expv[48] = 16'hffff;
      expv[49] = 16'hffff;
      expv[50] = 16'hfffe;
      expv[51] = 16'hffff;
      expv[52] = 16'hffff;
      expv[53] = 16'hffff;
      expv[54] = 16'hffff;
      expv[55] = 16'hefdf;
      expv[56] = 16'hdfbe;
      expv[57] = 16'hdfbe;
      expv[58] = 16'hdfbe;
      expv[59] = 16'haf5d;
      expv[60] = 16'haf5d;
      expv[61] = 16'h5eba;
      expv[62] = 16'hffff;
      expv[63] = 16'hefdf;
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
