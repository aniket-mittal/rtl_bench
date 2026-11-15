// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_157672 dut (
    .clk(clk),
    .value(in_vec[15:0]),
    .segment(out_vec[11:4]),
    .digit(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h3833;
    stim[1] = 16'hd125;
    stim[2] = 16'h728c;
    stim[3] = 16'h488c;
    stim[4] = 16'h17a0;
    stim[5] = 16'h566b;
    stim[6] = 16'h8d37;
    stim[7] = 16'hd502;
    stim[8] = 16'haed1;
    stim[9] = 16'h9eed;
    stim[10] = 16'h97ae;
    stim[11] = 16'h5d23;
    stim[12] = 16'hfe37;
    stim[13] = 16'h934e;
    stim[14] = 16'h9c2a;
    stim[15] = 16'hbaac;
    stim[16] = 16'h2031;
    stim[17] = 16'hd959;
    stim[18] = 16'h09fe;
    stim[19] = 16'h6e4e;
    stim[20] = 16'hac49;
    stim[21] = 16'hae60;
    stim[22] = 16'h8ff5;
    stim[23] = 16'h8ce5;
    stim[24] = 16'hd8a4;
    stim[25] = 16'he953;
    stim[26] = 16'h1f4d;
    stim[27] = 16'h3a60;
    stim[28] = 16'hc4df;
    stim[29] = 16'hb476;
    stim[30] = 16'ha591;
    stim[31] = 16'hfeba;
    stim[32] = 16'h85b3;
    stim[33] = 16'hbe35;
    stim[34] = 16'he29a;
    stim[35] = 16'hc5b5;
    stim[36] = 16'hc2bb;
    stim[37] = 16'hfd86;
    stim[38] = 16'h9af1;
    stim[39] = 16'h6ba5;
    stim[40] = 16'h2a2d;
    stim[41] = 16'h1c9d;
    stim[42] = 16'h680b;
    stim[43] = 16'h44d7;
    stim[44] = 16'h5099;
    stim[45] = 16'hce3c;
    stim[46] = 16'h2bb1;
    stim[47] = 16'h05cf;
    stim[48] = 16'hdb2c;
    stim[49] = 16'h55d7;
    stim[50] = 16'h5da9;
    stim[51] = 16'h77e3;
    stim[52] = 16'hd2ff;
    stim[53] = 16'h6c9e;
    stim[54] = 16'hdaa9;
    stim[55] = 16'h49c0;
    stim[56] = 16'hb1c1;
    stim[57] = 16'h7820;
    stim[58] = 16'h2984;
    stim[59] = 16'hcace;
    stim[60] = 16'h64da;
    stim[61] = 16'h694c;
    stim[62] = 16'ha391;
    stim[63] = 16'hdf0d;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hffe;
      expv[2] = 12'h0de;
      expv[3] = 12'h49e;
      expv[4] = 12'hffe;
      expv[5] = 12'hffe;
      expv[6] = 12'h03e;
      expv[7] = 12'hffe;
      expv[8] = 12'h1fe;
      expv[9] = 12'h25e;
      expv[10] = 12'h9fe;
      expv[11] = 12'hffe;
      expv[12] = 12'hffe;
      expv[13] = 12'h0de;
      expv[14] = 12'h1fe;
      expv[15] = 12'hffe;
      expv[16] = 12'hffe;
      expv[17] = 12'hffd;
      expv[18] = 12'h0dd;
      expv[19] = 12'h49d;
      expv[20] = 12'hffd;
      expv[21] = 12'h99d;
      expv[22] = 12'h99d;
      expv[23] = 12'h41d;
      expv[24] = 12'hffd;
      expv[25] = 12'hffd;
      expv[26] = 12'hffd;
      expv[27] = 12'h49d;
      expv[28] = 12'h99d;
      expv[29] = 12'h41d;
      expv[30] = 12'hffd;
      expv[31] = 12'h1fd;
      expv[32] = 12'h09d;
      expv[33] = 12'hffb;
      expv[34] = 12'h49b;
      expv[35] = 12'hffb;
      expv[36] = 12'h25b;
      expv[37] = 12'h49b;
      expv[38] = 12'h25b;
      expv[39] = 12'hffb;
      expv[40] = 12'hffb;
      expv[41] = 12'hffb;
      expv[42] = 12'hffb;
      expv[43] = 12'hffb;
      expv[44] = 12'h01b;
      expv[45] = 12'h99b;
      expv[46] = 12'h03b;
      expv[47] = 12'hffb;
      expv[48] = 12'hffb;
      expv[49] = 12'h497;
      expv[50] = 12'hff7;
      expv[51] = 12'h497;
      expv[52] = 12'h497;
      expv[53] = 12'h1f7;
      expv[54] = 12'hff7;
      expv[55] = 12'h417;
      expv[56] = 12'hff7;
      expv[57] = 12'h997;
      expv[58] = 12'hff7;
      expv[59] = 12'h1f7;
      expv[60] = 12'h257;
      expv[61] = 12'hff7;
      expv[62] = 12'h417;
      expv[63] = 12'h417;
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
