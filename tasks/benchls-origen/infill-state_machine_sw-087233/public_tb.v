// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087233 dut (
    .KEY0(clk),
    .SW(in_vec[2:0]),
    .HEX0(out_vec[16:10]),
    .HEX1(out_vec[9:3]),
    .LEDG0(out_vec[2:2]),
    .LEDR(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h2;
    stim[1] = 3'h2;
    stim[2] = 3'h2;
    stim[3] = 3'h5;
    stim[4] = 3'h0;
    stim[5] = 3'h7;
    stim[6] = 3'h4;
    stim[7] = 3'h5;
    stim[8] = 3'h5;
    stim[9] = 3'h6;
    stim[10] = 3'h5;
    stim[11] = 3'h3;
    stim[12] = 3'h2;
    stim[13] = 3'h6;
    stim[14] = 3'h7;
    stim[15] = 3'h1;
    stim[16] = 3'h6;
    stim[17] = 3'h7;
    stim[18] = 3'h0;
    stim[19] = 3'h7;
    stim[20] = 3'h1;
    stim[21] = 3'h2;
    stim[22] = 3'h4;
    stim[23] = 3'h0;
    stim[24] = 3'h1;
    stim[25] = 3'h3;
    stim[26] = 3'h1;
    stim[27] = 3'h7;
    stim[28] = 3'h0;
    stim[29] = 3'h3;
    stim[30] = 3'h6;
    stim[31] = 3'h6;
    stim[32] = 3'h5;
    stim[33] = 3'h7;
    stim[34] = 3'h0;
    stim[35] = 3'h3;
    stim[36] = 3'h1;
    stim[37] = 3'h7;
    stim[38] = 3'h7;
    stim[39] = 3'h5;
    stim[40] = 3'h0;
    stim[41] = 3'h0;
    stim[42] = 3'h1;
    stim[43] = 3'h5;
    stim[44] = 3'h6;
    stim[45] = 3'h1;
    stim[46] = 3'h6;
    stim[47] = 3'h5;
    stim[48] = 3'h6;
    stim[49] = 3'h7;
    stim[50] = 3'h6;
    stim[51] = 3'h6;
    stim[52] = 3'h1;
    stim[53] = 3'h4;
    stim[54] = 3'h5;
    stim[55] = 3'h4;
    stim[56] = 3'h2;
    stim[57] = 3'h1;
    stim[58] = 3'h5;
    stim[59] = 3'h1;
    stim[60] = 3'h3;
    stim[61] = 3'h2;
    stim[62] = 3'h0;
    stim[63] = 3'h7;
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
      expv[1] = 17'h1e7f8;
      expv[2] = 17'h023fc;
      expv[3] = 17'h01bf8;
      expv[4] = 17'h01bf8;
      expv[5] = 17'h1e7f8;
      expv[6] = 17'h11bf9;
      expv[7] = 17'h11bf9;
      expv[8] = 17'h00ffc;
      expv[9] = 17'h00ffc;
      expv[10] = 17'h00ffc;
      expv[11] = 17'h00ffc;
      expv[12] = 17'h00ffc;
      expv[13] = 17'h00ffc;
      expv[14] = 17'h00ffc;
      expv[15] = 17'h00ffc;
      expv[16] = 17'h00ffc;
      expv[17] = 17'h00ffc;
      expv[18] = 17'h00ffc;
      expv[19] = 17'h1e7f8;
      expv[20] = 17'h11bf9;
      expv[21] = 17'h00ffc;
      expv[22] = 17'h00ffc;
      expv[23] = 17'h1e7f8;
      expv[24] = 17'h1e7f8;
      expv[25] = 17'h00ffc;
      expv[26] = 17'h00ffc;
      expv[27] = 17'h00ffc;
      expv[28] = 17'h00ffc;
      expv[29] = 17'h1e7f8;
      expv[30] = 17'h11bf9;
      expv[31] = 17'h11bf9;
      expv[32] = 17'h11bf9;
      expv[33] = 17'h00ffc;
      expv[34] = 17'h00ffc;
      expv[35] = 17'h1e7f8;
      expv[36] = 17'h11bf9;
      expv[37] = 17'h00ffc;
      expv[38] = 17'h00ffc;
      expv[39] = 17'h00ffc;
      expv[40] = 17'h00ffc;
      expv[41] = 17'h1e7f8;
      expv[42] = 17'h1e7f8;
      expv[43] = 17'h00ffc;
      expv[44] = 17'h00ffc;
      expv[45] = 17'h00ffc;
      expv[46] = 17'h00ffc;
      expv[47] = 17'h00ffc;
      expv[48] = 17'h00ffc;
      expv[49] = 17'h00ffc;
      expv[50] = 17'h00ffc;
      expv[51] = 17'h00ffc;
      expv[52] = 17'h00ffc;
      expv[53] = 17'h00ffc;
      expv[54] = 17'h1e7f8;
      expv[55] = 17'h00ffc;
      expv[56] = 17'h1e7f8;
      expv[57] = 17'h023fc;
      expv[58] = 17'h01bf8;
      expv[59] = 17'h01bf8;
      expv[60] = 17'h01bf8;
      expv[61] = 17'h01bf8;
      expv[62] = 17'h01bf8;
      expv[63] = 17'h1e7f8;
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
