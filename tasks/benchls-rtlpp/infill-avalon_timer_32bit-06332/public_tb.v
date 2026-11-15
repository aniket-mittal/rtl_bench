// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06332 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h015773;
    stim[1] = 22'h086801;
    stim[2] = 22'h06bef7;
    stim[3] = 22'h365b51;
    stim[4] = 22'h1ea870;
    stim[5] = 22'h178196;
    stim[6] = 22'h03f23e;
    stim[7] = 22'h03a811;
    stim[8] = 22'h2ff5d2;
    stim[9] = 22'h1a9623;
    stim[10] = 22'h16f261;
    stim[11] = 22'h03c619;
    stim[12] = 22'h2f0ed8;
    stim[13] = 22'h2a8b06;
    stim[14] = 22'h12ad1f;
    stim[15] = 22'h3e687a;
    stim[16] = 22'h1e17f2;
    stim[17] = 22'h0bb622;
    stim[18] = 22'h16a8ef;
    stim[19] = 22'h1a821e;
    stim[20] = 22'h0e907a;
    stim[21] = 22'h07826d;
    stim[22] = 22'h16d3c5;
    stim[23] = 22'h370c27;
    stim[24] = 22'h1329df;
    stim[25] = 22'h36f634;
    stim[26] = 22'h0653b7;
    stim[27] = 22'h07e3c0;
    stim[28] = 22'h2f549e;
    stim[29] = 22'h0a4013;
    stim[30] = 22'h326915;
    stim[31] = 22'h0a8f9e;
    stim[32] = 22'h0ecdc5;
    stim[33] = 22'h2e0f85;
    stim[34] = 22'h16d7ee;
    stim[35] = 22'h23559c;
    stim[36] = 22'h2a6a26;
    stim[37] = 22'h33ec98;
    stim[38] = 22'h274daf;
    stim[39] = 22'h02f34e;
    stim[40] = 22'h232379;
    stim[41] = 22'h2b0c1e;
    stim[42] = 22'h27341c;
    stim[43] = 22'h1eab5d;
    stim[44] = 22'h0fafbe;
    stim[45] = 22'h0a8e17;
    stim[46] = 22'h163584;
    stim[47] = 22'h0a4bb0;
    stim[48] = 22'h2f5c71;
    stim[49] = 22'h1ef556;
    stim[50] = 22'h0689c4;
    stim[51] = 22'h379bd3;
    stim[52] = 22'h1cd281;
    stim[53] = 22'h2b7a6d;
    stim[54] = 22'h3b239b;
    stim[55] = 22'h1aca3d;
    stim[56] = 22'h02392f;
    stim[57] = 22'h06d1ae;
    stim[58] = 22'h1f2ec0;
    stim[59] = 22'h17fc05;
    stim[60] = 22'h26b665;
    stim[61] = 22'h3aef83;
    stim[62] = 22'h1a4f0c;
    stim[63] = 22'h1bb1f3;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h0c34f;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h0a870;
      expv[11] = 17'h0c34f;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h0f261;
      expv[16] = 17'h00000;
      expv[17] = 17'h0a870;
      expv[18] = 17'h00000;
      expv[19] = 17'h0f261;
      expv[20] = 17'h017f2;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h0a8ef;
      expv[24] = 17'h00000;
      expv[25] = 17'h0d3c5;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h0000a;
      expv[31] = 17'h00000;
      expv[32] = 17'h0000a;
      expv[33] = 17'h0000a;
      expv[34] = 17'h00000;
      expv[35] = 17'h0d3c5;
      expv[36] = 17'h0d3c5;
      expv[37] = 17'h017f2;
      expv[38] = 17'h00000;
      expv[39] = 17'h0d3c5;
      expv[40] = 17'h00000;
      expv[41] = 17'h0d3c5;
      expv[42] = 17'h017f2;
      expv[43] = 17'h0d3c5;
      expv[44] = 17'h017f2;
      expv[45] = 17'h00005;
      expv[46] = 17'h00005;
      expv[47] = 17'h0d7ee;
      expv[48] = 17'h00005;
      expv[49] = 17'h017f2;
      expv[50] = 17'h0ab5d;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h0c34f;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
