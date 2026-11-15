// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056449 dut (
    .address0(in_vec[2:2]),
    .address1(in_vec[1:1]),
    .enable(in_vec[0:0]),
    .out0(out_vec[3:3]),
    .out1(out_vec[2:2]),
    .out2(out_vec[1:1]),
    .out3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h1;
    stim[1] = 3'h6;
    stim[2] = 3'h3;
    stim[3] = 3'h6;
    stim[4] = 3'h7;
    stim[5] = 3'h3;
    stim[6] = 3'h1;
    stim[7] = 3'h6;
    stim[8] = 3'h7;
    stim[9] = 3'h6;
    stim[10] = 3'h0;
    stim[11] = 3'h5;
    stim[12] = 3'h3;
    stim[13] = 3'h0;
    stim[14] = 3'h3;
    stim[15] = 3'h4;
    stim[16] = 3'h2;
    stim[17] = 3'h7;
    stim[18] = 3'h0;
    stim[19] = 3'h1;
    stim[20] = 3'h6;
    stim[21] = 3'h5;
    stim[22] = 3'h1;
    stim[23] = 3'h3;
    stim[24] = 3'h7;
    stim[25] = 3'h6;
    stim[26] = 3'h7;
    stim[27] = 3'h4;
    stim[28] = 3'h7;
    stim[29] = 3'h0;
    stim[30] = 3'h2;
    stim[31] = 3'h6;
    stim[32] = 3'h1;
    stim[33] = 3'h4;
    stim[34] = 3'h5;
    stim[35] = 3'h2;
    stim[36] = 3'h1;
    stim[37] = 3'h0;
    stim[38] = 3'h5;
    stim[39] = 3'h5;
    stim[40] = 3'h2;
    stim[41] = 3'h4;
    stim[42] = 3'h2;
    stim[43] = 3'h0;
    stim[44] = 3'h3;
    stim[45] = 3'h5;
    stim[46] = 3'h7;
    stim[47] = 3'h0;
    stim[48] = 3'h3;
    stim[49] = 3'h4;
    stim[50] = 3'h1;
    stim[51] = 3'h0;
    stim[52] = 3'h5;
    stim[53] = 3'h4;
    stim[54] = 3'h5;
    stim[55] = 3'h4;
    stim[56] = 3'h4;
    stim[57] = 3'h0;
    stim[58] = 3'h4;
    stim[59] = 3'h2;
    stim[60] = 3'h6;
    stim[61] = 3'h7;
    stim[62] = 3'h6;
    stim[63] = 3'h2;
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
      expv[0] = 4'h8;
      expv[1] = 4'h0;
      expv[2] = 4'h2;
      expv[3] = 4'h0;
      expv[4] = 4'h1;
      expv[5] = 4'h2;
      expv[6] = 4'h8;
      expv[7] = 4'h0;
      expv[8] = 4'h1;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h4;
      expv[12] = 4'h2;
      expv[13] = 4'h0;
      expv[14] = 4'h2;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h1;
      expv[18] = 4'h0;
      expv[19] = 4'h8;
      expv[20] = 4'h0;
      expv[21] = 4'h4;
      expv[22] = 4'h8;
      expv[23] = 4'h2;
      expv[24] = 4'h1;
      expv[25] = 4'h0;
      expv[26] = 4'h1;
      expv[27] = 4'h0;
      expv[28] = 4'h1;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h8;
      expv[33] = 4'h0;
      expv[34] = 4'h4;
      expv[35] = 4'h0;
      expv[36] = 4'h8;
      expv[37] = 4'h0;
      expv[38] = 4'h4;
      expv[39] = 4'h4;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h2;
      expv[45] = 4'h4;
      expv[46] = 4'h1;
      expv[47] = 4'h0;
      expv[48] = 4'h2;
      expv[49] = 4'h0;
      expv[50] = 4'h8;
      expv[51] = 4'h0;
      expv[52] = 4'h4;
      expv[53] = 4'h0;
      expv[54] = 4'h4;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h1;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
