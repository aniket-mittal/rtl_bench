// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_187920 dut (
    .address(in_vec[9:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h011;
    stim[1] = 10'h206;
    stim[2] = 10'h2c5;
    stim[3] = 10'h363;
    stim[4] = 10'h15a;
    stim[5] = 10'h2cb;
    stim[6] = 10'h3a3;
    stim[7] = 10'h1c7;
    stim[8] = 10'h172;
    stim[9] = 10'h2f0;
    stim[10] = 10'h239;
    stim[11] = 10'h227;
    stim[12] = 10'h239;
    stim[13] = 10'h35e;
    stim[14] = 10'h186;
    stim[15] = 10'h19f;
    stim[16] = 10'h256;
    stim[17] = 10'h1ff;
    stim[18] = 10'h3a1;
    stim[19] = 10'h252;
    stim[20] = 10'h347;
    stim[21] = 10'h06c;
    stim[22] = 10'h292;
    stim[23] = 10'h101;
    stim[24] = 10'h10c;
    stim[25] = 10'h0dc;
    stim[26] = 10'h241;
    stim[27] = 10'h285;
    stim[28] = 10'h200;
    stim[29] = 10'h240;
    stim[30] = 10'h1f6;
    stim[31] = 10'h358;
    stim[32] = 10'h0bb;
    stim[33] = 10'h289;
    stim[34] = 10'h1eb;
    stim[35] = 10'h0cc;
    stim[36] = 10'h02b;
    stim[37] = 10'h155;
    stim[38] = 10'h151;
    stim[39] = 10'h323;
    stim[40] = 10'h2a1;
    stim[41] = 10'h2a0;
    stim[42] = 10'h26f;
    stim[43] = 10'h1bc;
    stim[44] = 10'h289;
    stim[45] = 10'h27c;
    stim[46] = 10'h1a0;
    stim[47] = 10'h1b2;
    stim[48] = 10'h1fd;
    stim[49] = 10'h1c4;
    stim[50] = 10'h1a9;
    stim[51] = 10'h2fc;
    stim[52] = 10'h256;
    stim[53] = 10'h330;
    stim[54] = 10'h39e;
    stim[55] = 10'h2d9;
    stim[56] = 10'h06d;
    stim[57] = 10'h28f;
    stim[58] = 10'h245;
    stim[59] = 10'h241;
    stim[60] = 10'h07d;
    stim[61] = 10'h347;
    stim[62] = 10'h176;
    stim[63] = 10'h0a2;
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
      expv[0] = 8'h12;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
