// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00245 dut (
    .prog_clk(clk),
    .ccff_head(in_vec[0:0]),
    .ccff_tail(out_vec[6:6]),
    .mem_out(out_vec[5:3]),
    .mem_outb(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h1;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h1;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h0;
    stim[17] = 1'h1;
    stim[18] = 1'h0;
    stim[19] = 1'h1;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h1;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h1;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h1;
    stim[35] = 1'h0;
    stim[36] = 1'h1;
    stim[37] = 1'h0;
    stim[38] = 1'h1;
    stim[39] = 1'h0;
    stim[40] = 1'h1;
    stim[41] = 1'h0;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h1;
    stim[49] = 1'h0;
    stim[50] = 1'h1;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 7'hxx;
      expv[1] = 7'hxx;
      expv[2] = 7'hxx;
      expv[3] = 7'h31;
      expv[4] = 7'h78;
      expv[5] = 7'h5c;
      expv[6] = 7'h4e;
      expv[7] = 7'h23;
      expv[8] = 7'h31;
      expv[9] = 7'h5c;
      expv[10] = 7'h4e;
      expv[11] = 7'h23;
      expv[12] = 7'h15;
      expv[13] = 7'h4e;
      expv[14] = 7'h23;
      expv[15] = 7'h31;
      expv[16] = 7'h78;
      expv[17] = 7'h5c;
      expv[18] = 7'h6a;
      expv[19] = 7'h15;
      expv[20] = 7'h6a;
      expv[21] = 7'h15;
      expv[22] = 7'h4e;
      expv[23] = 7'h07;
      expv[24] = 7'h07;
      expv[25] = 7'h07;
      expv[26] = 7'h23;
      expv[27] = 7'h15;
      expv[28] = 7'h4e;
      expv[29] = 7'h23;
      expv[30] = 7'h15;
      expv[31] = 7'h4e;
      expv[32] = 7'h07;
      expv[33] = 7'h07;
      expv[34] = 7'h07;
      expv[35] = 7'h23;
      expv[36] = 7'h15;
      expv[37] = 7'h6a;
      expv[38] = 7'h15;
      expv[39] = 7'h6a;
      expv[40] = 7'h15;
      expv[41] = 7'h6a;
      expv[42] = 7'h15;
      expv[43] = 7'h6a;
      expv[44] = 7'h31;
      expv[45] = 7'h5c;
      expv[46] = 7'h4e;
      expv[47] = 7'h07;
      expv[48] = 7'h07;
      expv[49] = 7'h23;
      expv[50] = 7'h15;
      expv[51] = 7'h6a;
      expv[52] = 7'h15;
      expv[53] = 7'h4e;
      expv[54] = 7'h07;
      expv[55] = 7'h23;
      expv[56] = 7'h31;
      expv[57] = 7'h78;
      expv[58] = 7'h78;
      expv[59] = 7'h78;
      expv[60] = 7'h78;
      expv[61] = 7'h78;
      expv[62] = 7'h78;
      expv[63] = 7'h78;
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
