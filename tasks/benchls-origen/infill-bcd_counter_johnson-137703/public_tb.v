// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137703 dut (
    .clk(clk),
    .reset_sync(in_vec[3:3]),
    .reset_async(in_vec[2:2]),
    .a(in_vec[1:1]),
    .b(in_vec[0:0]),
    .bcd_out(out_vec[16:1]),
    .final_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'ha;
    stim[1] = 4'hd;
    stim[2] = 4'h7;
    stim[3] = 4'h2;
    stim[4] = 4'h7;
    stim[5] = 4'h0;
    stim[6] = 4'h0;
    stim[7] = 4'h4;
    stim[8] = 4'h2;
    stim[9] = 4'h1;
    stim[10] = 4'h1;
    stim[11] = 4'h0;
    stim[12] = 4'h5;
    stim[13] = 4'h4;
    stim[14] = 4'h2;
    stim[15] = 4'h4;
    stim[16] = 4'h0;
    stim[17] = 4'h1;
    stim[18] = 4'h0;
    stim[19] = 4'h0;
    stim[20] = 4'h2;
    stim[21] = 4'h1;
    stim[22] = 4'h5;
    stim[23] = 4'h7;
    stim[24] = 4'h7;
    stim[25] = 4'h7;
    stim[26] = 4'h1;
    stim[27] = 4'h5;
    stim[28] = 4'h3;
    stim[29] = 4'h5;
    stim[30] = 4'h3;
    stim[31] = 4'h4;
    stim[32] = 4'h6;
    stim[33] = 4'h4;
    stim[34] = 4'h3;
    stim[35] = 4'h0;
    stim[36] = 4'h2;
    stim[37] = 4'h0;
    stim[38] = 4'h7;
    stim[39] = 4'h6;
    stim[40] = 4'h7;
    stim[41] = 4'h1;
    stim[42] = 4'hd;
    stim[43] = 4'h3;
    stim[44] = 4'h2;
    stim[45] = 4'h4;
    stim[46] = 4'h1;
    stim[47] = 4'h4;
    stim[48] = 4'h0;
    stim[49] = 4'h5;
    stim[50] = 4'h7;
    stim[51] = 4'h7;
    stim[52] = 4'h7;
    stim[53] = 4'h5;
    stim[54] = 4'h3;
    stim[55] = 4'h1;
    stim[56] = 4'h4;
    stim[57] = 4'h4;
    stim[58] = 4'h1;
    stim[59] = 4'h1;
    stim[60] = 4'h2;
    stim[61] = 4'h5;
    stim[62] = 4'h1;
    stim[63] = 4'h0;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00001;
      expv[2] = 17'h00000;
      expv[3] = 17'h00001;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00003;
      expv[7] = 17'h00000;
      expv[8] = 17'h00001;
      expv[9] = 17'h00002;
      expv[10] = 17'h00022;
      expv[11] = 17'h00223;
      expv[12] = 17'h00001;
      expv[13] = 17'h00000;
      expv[14] = 17'h00001;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00002;
      expv[18] = 17'h00023;
      expv[19] = 17'h00223;
      expv[20] = 17'h02222;
      expv[21] = 17'h02222;
      expv[22] = 17'h00001;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00001;
      expv[27] = 17'h00001;
      expv[28] = 17'h00000;
      expv[29] = 17'h00001;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00001;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00003;
      expv[36] = 17'h00022;
      expv[37] = 17'h00223;
      expv[38] = 17'h00000;
      expv[39] = 17'h00001;
      expv[40] = 17'h00000;
      expv[41] = 17'h00001;
      expv[42] = 17'h00001;
      expv[43] = 17'h00000;
      expv[44] = 17'h00002;
      expv[45] = 17'h00000;
      expv[46] = 17'h00001;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00001;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00001;
      expv[54] = 17'h00000;
      expv[55] = 17'h00002;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00001;
      expv[59] = 17'h00002;
      expv[60] = 17'h00022;
      expv[61] = 17'h00001;
      expv[62] = 17'h00001;
      expv[63] = 17'h00003;
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
