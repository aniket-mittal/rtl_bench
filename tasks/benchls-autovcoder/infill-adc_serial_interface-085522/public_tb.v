// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085522 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .sdin0(in_vec[1:1]),
    .sdin1(in_vec[0:0]),
    .cs(out_vec[34:34]),
    .sclk(out_vec[33:33]),
    .dout0(out_vec[32:17]),
    .dout1(out_vec[16:1]),
    .w_dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h5;
    stim[1] = 3'h5;
    stim[2] = 3'h1;
    stim[3] = 3'h0;
    stim[4] = 3'h0;
    stim[5] = 3'h7;
    stim[6] = 3'h0;
    stim[7] = 3'h0;
    stim[8] = 3'h1;
    stim[9] = 3'h1;
    stim[10] = 3'h1;
    stim[11] = 3'h0;
    stim[12] = 3'h2;
    stim[13] = 3'h3;
    stim[14] = 3'h0;
    stim[15] = 3'h1;
    stim[16] = 3'h2;
    stim[17] = 3'h1;
    stim[18] = 3'h0;
    stim[19] = 3'h0;
    stim[20] = 3'h2;
    stim[21] = 3'h0;
    stim[22] = 3'h2;
    stim[23] = 3'h2;
    stim[24] = 3'h2;
    stim[25] = 3'h3;
    stim[26] = 3'h1;
    stim[27] = 3'h2;
    stim[28] = 3'h3;
    stim[29] = 3'h2;
    stim[30] = 3'h1;
    stim[31] = 3'h2;
    stim[32] = 3'h0;
    stim[33] = 3'h1;
    stim[34] = 3'h3;
    stim[35] = 3'h1;
    stim[36] = 3'h2;
    stim[37] = 3'h0;
    stim[38] = 3'h2;
    stim[39] = 3'h2;
    stim[40] = 3'h0;
    stim[41] = 3'h0;
    stim[42] = 3'h2;
    stim[43] = 3'h1;
    stim[44] = 3'h1;
    stim[45] = 3'h2;
    stim[46] = 3'h0;
    stim[47] = 3'h3;
    stim[48] = 3'h2;
    stim[49] = 3'h2;
    stim[50] = 3'h2;
    stim[51] = 3'h2;
    stim[52] = 3'h0;
    stim[53] = 3'h1;
    stim[54] = 3'h3;
    stim[55] = 3'h3;
    stim[56] = 3'h2;
    stim[57] = 3'h2;
    stim[58] = 3'h3;
    stim[59] = 3'h0;
    stim[60] = 3'h0;
    stim[61] = 3'h1;
    stim[62] = 3'h2;
    stim[63] = 3'h0;
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
      expv[0] = 35'hx0000000x;
      expv[1] = 35'hx0000000x;
      expv[2] = 35'hx0000000x;
      expv[3] = 35'hx0000000x;
      expv[4] = 35'hx0000000x;
      expv[5] = 35'hx0000000x;
      expv[6] = 35'hx0000000x;
      expv[7] = 35'hx0000000x;
      expv[8] = 35'hx0000000x;
      expv[9] = 35'hx0000000x;
      expv[10] = 35'hx0000000x;
      expv[11] = 35'hx0000000x;
      expv[12] = 35'hx0000000x;
      expv[13] = 35'hx0000000x;
      expv[14] = 35'hx0000000x;
      expv[15] = 35'hx0000000x;
      expv[16] = 35'hx0000000x;
      expv[17] = 35'hx0000000x;
      expv[18] = 35'hx0000000x;
      expv[19] = 35'hx0000000x;
      expv[20] = 35'hx0000000x;
      expv[21] = 35'hx0000000x;
      expv[22] = 35'hx0000000x;
      expv[23] = 35'hx0000000x;
      expv[24] = 35'hx0000000x;
      expv[25] = 35'hx0000000x;
      expv[26] = 35'hx0000000x;
      expv[27] = 35'hx0000000x;
      expv[28] = 35'hx0000000x;
      expv[29] = 35'hx0000000x;
      expv[30] = 35'hx0000000x;
      expv[31] = 35'hx0000000x;
      expv[32] = 35'hx0000000x;
      expv[33] = 35'hx0000000x;
      expv[34] = 35'hx0000000x;
      expv[35] = 35'hx0000000x;
      expv[36] = 35'hx0000000x;
      expv[37] = 35'hx0000000x;
      expv[38] = 35'hx0000000x;
      expv[39] = 35'hx0000000x;
      expv[40] = 35'hx0000000x;
      expv[41] = 35'hx0000000x;
      expv[42] = 35'hx0000000x;
      expv[43] = 35'hx0000000x;
      expv[44] = 35'hx0000000x;
      expv[45] = 35'hx0000000x;
      expv[46] = 35'hx0000000x;
      expv[47] = 35'hx0000000x;
      expv[48] = 35'hx0000000x;
      expv[49] = 35'hx0000000x;
      expv[50] = 35'hx0000000x;
      expv[51] = 35'hx0000000x;
      expv[52] = 35'hx0000000x;
      expv[53] = 35'hx0000000x;
      expv[54] = 35'hx0000000x;
      expv[55] = 35'hx0000000x;
      expv[56] = 35'hx0000000x;
      expv[57] = 35'hx0000000x;
      expv[58] = 35'hx0000000x;
      expv[59] = 35'hx0000000x;
      expv[60] = 35'hx0000000x;
      expv[61] = 35'hx0000000x;
      expv[62] = 35'hx0000000x;
      expv[63] = 35'hx0000000x;
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
