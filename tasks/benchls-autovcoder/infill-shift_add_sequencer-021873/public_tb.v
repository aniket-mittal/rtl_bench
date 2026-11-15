// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021873 dut (
    .clk(clk),
    .fov(in_vec[4:4]),
    .fcarry(in_vec[3:3]),
    .fneg(in_vec[2:2]),
    .fzero(in_vec[1:1]),
    .rst_in(in_vec[0:0]),
    .selection_sr(out_vec[36:29]),
    .selection_multa(out_vec[28:21]),
    .selection_alu(out_vec[20:13]),
    .selection_multb(out_vec[12:5]),
    .rst_out(out_vec[4:4]),
    .writer(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h10;
    stim[1] = 5'h02;
    stim[2] = 5'h19;
    stim[3] = 5'h0b;
    stim[4] = 5'h13;
    stim[5] = 5'h01;
    stim[6] = 5'h15;
    stim[7] = 5'h03;
    stim[8] = 5'h17;
    stim[9] = 5'h11;
    stim[10] = 5'h19;
    stim[11] = 5'h1b;
    stim[12] = 5'h07;
    stim[13] = 5'h07;
    stim[14] = 5'h01;
    stim[15] = 5'h01;
    stim[16] = 5'h01;
    stim[17] = 5'h01;
    stim[18] = 5'h07;
    stim[19] = 5'h07;
    stim[20] = 5'h0b;
    stim[21] = 5'h1f;
    stim[22] = 5'h01;
    stim[23] = 5'h1d;
    stim[24] = 5'h19;
    stim[25] = 5'h0b;
    stim[26] = 5'h01;
    stim[27] = 5'h09;
    stim[28] = 5'h15;
    stim[29] = 5'h0b;
    stim[30] = 5'h01;
    stim[31] = 5'h19;
    stim[32] = 5'h05;
    stim[33] = 5'h09;
    stim[34] = 5'h01;
    stim[35] = 5'h03;
    stim[36] = 5'h1d;
    stim[37] = 5'h11;
    stim[38] = 5'h15;
    stim[39] = 5'h0b;
    stim[40] = 5'h0f;
    stim[41] = 5'h17;
    stim[42] = 5'h1f;
    stim[43] = 5'h0f;
    stim[44] = 5'h0b;
    stim[45] = 5'h1b;
    stim[46] = 5'h01;
    stim[47] = 5'h1b;
    stim[48] = 5'h09;
    stim[49] = 5'h03;
    stim[50] = 5'h1b;
    stim[51] = 5'h1f;
    stim[52] = 5'h05;
    stim[53] = 5'h0d;
    stim[54] = 5'h0b;
    stim[55] = 5'h1d;
    stim[56] = 5'h09;
    stim[57] = 5'h13;
    stim[58] = 5'h0b;
    stim[59] = 5'h1f;
    stim[60] = 5'h07;
    stim[61] = 5'h19;
    stim[62] = 5'h03;
    stim[63] = 5'h15;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'hxxxxxxxxxx;
      expv[2] = 37'h0000402060;
      expv[3] = 37'h0000402060;
      expv[4] = 37'h0000402060;
      expv[5] = 37'h0000402060;
      expv[6] = 37'h0000402060;
      expv[7] = 37'h0000402060;
      expv[8] = 37'h0000402060;
      expv[9] = 37'h0000402060;
      expv[10] = 37'h0000402060;
      expv[11] = 37'h0000402060;
      expv[12] = 37'h0000402060;
      expv[13] = 37'h0000402060;
      expv[14] = 37'h0000402060;
      expv[15] = 37'h0000402060;
      expv[16] = 37'h0000402060;
      expv[17] = 37'h0000402060;
      expv[18] = 37'h0000402060;
      expv[19] = 37'h0000402060;
      expv[20] = 37'h0000402060;
      expv[21] = 37'h0000402060;
      expv[22] = 37'h0000402060;
      expv[23] = 37'h0000402060;
      expv[24] = 37'h0000402060;
      expv[25] = 37'h0000402060;
      expv[26] = 37'h0000402060;
      expv[27] = 37'h0000402060;
      expv[28] = 37'h0000402060;
      expv[29] = 37'h0000402060;
      expv[30] = 37'h0000402060;
      expv[31] = 37'h0000402060;
      expv[32] = 37'h0000402060;
      expv[33] = 37'h0000402060;
      expv[34] = 37'h0000402060;
      expv[35] = 37'h0000402060;
      expv[36] = 37'h0000402060;
      expv[37] = 37'h0000402060;
      expv[38] = 37'h0000402060;
      expv[39] = 37'h0000402060;
      expv[40] = 37'h0000402060;
      expv[41] = 37'h0000402060;
      expv[42] = 37'h0000402060;
      expv[43] = 37'h0000402060;
      expv[44] = 37'h0000402060;
      expv[45] = 37'h0000402060;
      expv[46] = 37'h0000402060;
      expv[47] = 37'h0000402060;
      expv[48] = 37'h0000402060;
      expv[49] = 37'h0000402060;
      expv[50] = 37'h0000402060;
      expv[51] = 37'h0000402060;
      expv[52] = 37'h0000402060;
      expv[53] = 37'h0000402060;
      expv[54] = 37'h0000402060;
      expv[55] = 37'h0000402060;
      expv[56] = 37'h0000402060;
      expv[57] = 37'h0000402060;
      expv[58] = 37'h0000402060;
      expv[59] = 37'h0000402060;
      expv[60] = 37'h0000402060;
      expv[61] = 37'h0000402060;
      expv[62] = 37'h0000402060;
      expv[63] = 37'h0000402060;
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
