// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_001574 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h123478bff;
    stim[1] = 33'h1c2ce7a2b;
    stim[2] = 33'h0c7a9f0b8;
    stim[3] = 33'h061baecea;
    stim[4] = 33'h08347459c;
    stim[5] = 33'h0435410bf;
    stim[6] = 33'h0fb31125f;
    stim[7] = 33'h09d3135b6;
    stim[8] = 33'h096aedda6;
    stim[9] = 33'h05131d6ed;
    stim[10] = 33'h013a3e06a;
    stim[11] = 33'h01aba6c1c;
    stim[12] = 33'h0fce2e1db;
    stim[13] = 33'h0d0bc69c5;
    stim[14] = 33'h05988bf88;
    stim[15] = 33'h0d0710d12;
    stim[16] = 33'h0e132cb5d;
    stim[17] = 33'h035e422a4;
    stim[18] = 33'h0c14f9dd8;
    stim[19] = 33'h0126be9fa;
    stim[20] = 33'h00b751c4a;
    stim[21] = 33'h0e331b076;
    stim[22] = 33'h0a77be1ab;
    stim[23] = 33'h0a70c9fbc;
    stim[24] = 33'h0cd77107e;
    stim[25] = 33'h043afefde;
    stim[26] = 33'h0c7bbcfb8;
    stim[27] = 33'h0ecc09c19;
    stim[28] = 33'h05531169e;
    stim[29] = 33'h04acf2ce3;
    stim[30] = 33'h0f440e4e9;
    stim[31] = 33'h0cf66f700;
    stim[32] = 33'h0987645ec;
    stim[33] = 33'h022aab6a8;
    stim[34] = 33'h01c46871f;
    stim[35] = 33'h0a68e11c0;
    stim[36] = 33'h04931ed3c;
    stim[37] = 33'h061158ecb;
    stim[38] = 33'h0174532a5;
    stim[39] = 33'h0bfa85ec6;
    stim[40] = 33'h0f956405d;
    stim[41] = 33'h1cb59c972;
    stim[42] = 33'h08fcd1b95;
    stim[43] = 33'h0feadf859;
    stim[44] = 33'h022f8863c;
    stim[45] = 33'h0b0785fa4;
    stim[46] = 33'h008d1c56f;
    stim[47] = 33'h0f49d88aa;
    stim[48] = 33'h0ce8ff51c;
    stim[49] = 33'h05c7e16c8;
    stim[50] = 33'h0cd12d60c;
    stim[51] = 33'h035bc1aaa;
    stim[52] = 33'h03d2ead94;
    stim[53] = 33'h09ddc1b85;
    stim[54] = 33'h0fcbbee20;
    stim[55] = 33'h0aabeb60a;
    stim[56] = 33'h010caa91d;
    stim[57] = 33'h03e663c0c;
    stim[58] = 33'h02b954907;
    stim[59] = 33'h0fbd5d534;
    stim[60] = 33'h0314da8c3;
    stim[61] = 33'h04118c939;
    stim[62] = 33'h1de3a2752;
    stim[63] = 33'h0990771d6;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxx2b;
      expv[3] = 74'h00000000xxxxxxxxxb8;
      expv[4] = 74'h00000000xxxxxxxxxb8;
      expv[5] = 74'h00000000000000000b8;
      expv[6] = 74'h00000000000000000b8;
      expv[7] = 74'h00000000400000001b8;
      expv[8] = 74'h00000000000000000b6;
      expv[9] = 74'h00000000000000000b6;
      expv[10] = 74'h00000000000000000b6;
      expv[11] = 74'h00000000000000000b6;
      expv[12] = 74'h00000000800000001b6;
      expv[13] = 74'h00000000000000000db;
      expv[14] = 74'h00000000000000000db;
      expv[15] = 74'h00000000000000000db;
      expv[16] = 74'h00000000000000000db;
      expv[17] = 74'h00000000c00000001db;
      expv[18] = 74'h00000000000000000a4;
      expv[19] = 74'h00000000000000000a4;
      expv[20] = 74'h00000000000000000a4;
      expv[21] = 74'h00000000000000000a4;
      expv[22] = 74'h00000001000000001a4;
      expv[23] = 74'h00000000000000000ab;
      expv[24] = 74'h00000000000000000ab;
      expv[25] = 74'h00000000000000000ab;
      expv[26] = 74'h00000000000000000ab;
      expv[27] = 74'h00000001400000001ab;
      expv[28] = 74'h0000000000000000019;
      expv[29] = 74'h0000000000000000019;
      expv[30] = 74'h0000000000000000019;
      expv[31] = 74'h0000000000000000019;
      expv[32] = 74'h0000000180000000119;
      expv[33] = 74'h00000000000000000ec;
      expv[34] = 74'h00000000000000000ec;
      expv[35] = 74'h00000000000000000ec;
      expv[36] = 74'h00000000000000000ec;
      expv[37] = 74'h00000001c00000001ec;
      expv[38] = 74'h00000000000000000cb;
      expv[39] = 74'h00000000000000000cb;
      expv[40] = 74'h00000000000000000cb;
      expv[41] = 74'h00000000000000000cb;
      expv[42] = 74'h00000000000000001cb;
      expv[43] = 74'h0000000000000000095;
      expv[44] = 74'h0000000000000000095;
      expv[45] = 74'h0000000000000000095;
      expv[46] = 74'h0000000000000000095;
      expv[47] = 74'h0000000040000000195;
      expv[48] = 74'h00000000000000000aa;
      expv[49] = 74'h00000000000000000aa;
      expv[50] = 74'h00000000000000000aa;
      expv[51] = 74'h00000000000000000aa;
      expv[52] = 74'h00000000800000001aa;
      expv[53] = 74'h0000000000000000094;
      expv[54] = 74'h0000000000000000094;
      expv[55] = 74'h0000000000000000094;
      expv[56] = 74'h0000000000000000094;
      expv[57] = 74'h00000000c0000000194;
      expv[58] = 74'h000000000000000000c;
      expv[59] = 74'h000000000000000000c;
      expv[60] = 74'h000000000000000000c;
      expv[61] = 74'h000000000000000000c;
      expv[62] = 74'h000000010000000010c;
      expv[63] = 74'h0000000000000000152;
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
