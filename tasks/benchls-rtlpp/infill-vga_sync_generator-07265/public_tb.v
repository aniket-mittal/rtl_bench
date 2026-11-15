// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07265 dut (
    .clk(clk),
    .rst_n(in_vec[26:26]),
    .ena(in_vec[25:25]),
    .trig(in_vec[24:24]),
    .Thsync(in_vec[23:16]),
    .Thlen(in_vec[15:0]),
    .hsync(out_vec[2:2]),
    .vsync(out_vec[1:1]),
    .daten(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h0abfd6c;
    stim[1] = 27'h02e5d1c;
    stim[2] = 27'h4053833;
    stim[3] = 27'h4fbf944;
    stim[4] = 27'h4c65714;
    stim[5] = 27'h592ecce;
    stim[6] = 27'h5d3c1ab;
    stim[7] = 27'h7424ad4;
    stim[8] = 27'h58079c8;
    stim[9] = 27'h7b958e1;
    stim[10] = 27'h7595acf;
    stim[11] = 27'h41cbc29;
    stim[12] = 27'h4b39c55;
    stim[13] = 27'h63ac30d;
    stim[14] = 27'h491adfb;
    stim[15] = 27'h608bbc9;
    stim[16] = 27'h4b59b7b;
    stim[17] = 27'h6cd84a5;
    stim[18] = 27'h6f23262;
    stim[19] = 27'h76ff8ba;
    stim[20] = 27'h7c05b09;
    stim[21] = 27'h5129c79;
    stim[22] = 27'h688909c;
    stim[23] = 27'h5dbcb4f;
    stim[24] = 27'h61a8c5b;
    stim[25] = 27'h4bb168d;
    stim[26] = 27'h58d08d2;
    stim[27] = 27'h5109fc1;
    stim[28] = 27'h5717c33;
    stim[29] = 27'h5b0f189;
    stim[30] = 27'h6ef26fa;
    stim[31] = 27'h5f21c39;
    stim[32] = 27'h4602764;
    stim[33] = 27'h44df6dd;
    stim[34] = 27'h4b56467;
    stim[35] = 27'h7b579d0;
    stim[36] = 27'h6c9d208;
    stim[37] = 27'h4f52ee9;
    stim[38] = 27'h71ae5a8;
    stim[39] = 27'h43b55fe;
    stim[40] = 27'h6c92e90;
    stim[41] = 27'h572b059;
    stim[42] = 27'h53a5ee0;
    stim[43] = 27'h47743d1;
    stim[44] = 27'h72c0f50;
    stim[45] = 27'h4c45baa;
    stim[46] = 27'h726f996;
    stim[47] = 27'h6017f24;
    stim[48] = 27'h421e7df;
    stim[49] = 27'h61d6f40;
    stim[50] = 27'h6407915;
    stim[51] = 27'h48a1c2a;
    stim[52] = 27'h48ba94c;
    stim[53] = 27'h590f379;
    stim[54] = 27'h5c9d8be;
    stim[55] = 27'h5707dfa;
    stim[56] = 27'h4d80b5a;
    stim[57] = 27'h47eade6;
    stim[58] = 27'h782501a;
    stim[59] = 27'h6c965b1;
    stim[60] = 27'h4e731af;
    stim[61] = 27'h5344c9e;
    stim[62] = 27'h67da5f8;
    stim[63] = 27'h7dd8eb5;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
