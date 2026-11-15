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

  autovcoder_002033 dut (
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
    stim[0] = 33'h10cb66ce1;
    stim[1] = 33'h1c6d0452c;
    stim[2] = 33'h0e37274fd;
    stim[3] = 33'h0c837a022;
    stim[4] = 33'h07c0ab853;
    stim[5] = 33'h0f7f0591b;
    stim[6] = 33'h080a4d179;
    stim[7] = 33'h0b881b896;
    stim[8] = 33'h18ad1e6e2;
    stim[9] = 33'h07db4b7ef;
    stim[10] = 33'h0cbf30cc4;
    stim[11] = 33'h0bcf1c7a6;
    stim[12] = 33'h0b447ac43;
    stim[13] = 33'h024573101;
    stim[14] = 33'h029eec59b;
    stim[15] = 33'h009e6006d;
    stim[16] = 33'h08cbec944;
    stim[17] = 33'h0122f4f22;
    stim[18] = 33'h0e56f1586;
    stim[19] = 33'h03b471703;
    stim[20] = 33'h0c9c43853;
    stim[21] = 33'h05a30b089;
    stim[22] = 33'h0a1e48579;
    stim[23] = 33'h05fa9349c;
    stim[24] = 33'h092f872cf;
    stim[25] = 33'h0be7e0521;
    stim[26] = 33'h0bec66aab;
    stim[27] = 33'h083ca9bce;
    stim[28] = 33'h0162228cb;
    stim[29] = 33'h024dcb8a0;
    stim[30] = 33'h08cfdfe8f;
    stim[31] = 33'h122c466bc;
    stim[32] = 33'h01625fed3;
    stim[33] = 33'h0e57353ae;
    stim[34] = 33'h0a2d3607c;
    stim[35] = 33'h0a74e3e09;
    stim[36] = 33'h0930271d2;
    stim[37] = 33'h0403b5978;
    stim[38] = 33'h0edf2d9fa;
    stim[39] = 33'h07e8e8d14;
    stim[40] = 33'h098425614;
    stim[41] = 33'h0ffb772f9;
    stim[42] = 33'h0b68735c3;
    stim[43] = 33'h084d89e22;
    stim[44] = 33'h0b90d9dbe;
    stim[45] = 33'h0c71f0644;
    stim[46] = 33'h0ceb51cb2;
    stim[47] = 33'h0e8b2fce8;
    stim[48] = 33'h087cc5c94;
    stim[49] = 33'h0b7fbbd98;
    stim[50] = 33'h0392f2263;
    stim[51] = 33'h01abddd3f;
    stim[52] = 33'h069162817;
    stim[53] = 33'h0f3479178;
    stim[54] = 33'h06d2ca503;
    stim[55] = 33'h0b81c77b3;
    stim[56] = 33'h01e08c2be;
    stim[57] = 33'h0e9957c16;
    stim[58] = 33'h03721e774;
    stim[59] = 33'h03c6387a3;
    stim[60] = 33'h01b4a92b0;
    stim[61] = 33'h0a1d2cb62;
    stim[62] = 33'h01df4fdbd;
    stim[63] = 33'h0fab4f1dc;
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
      expv[2] = 74'h00000000xxxxxxxxx2c;
      expv[3] = 74'h00000000xxxxxxxxxfd;
      expv[4] = 74'h00000000xxxxxxxxxfd;
      expv[5] = 74'h00000000000000000fd;
      expv[6] = 74'h00000000000000000fd;
      expv[7] = 74'h00000000400000001fd;
      expv[8] = 74'h0000000000000000096;
      expv[9] = 74'h0000000000000000196;
      expv[10] = 74'h00000000000000000ef;
      expv[11] = 74'h00000000000000000ef;
      expv[12] = 74'h00000000000000000ef;
      expv[13] = 74'h00000000000000000ef;
      expv[14] = 74'h00000000400000001ef;
      expv[15] = 74'h000000000000000009b;
      expv[16] = 74'h000000000000000009b;
      expv[17] = 74'h000000000000000009b;
      expv[18] = 74'h000000000000000009b;
      expv[19] = 74'h000000008000000019b;
      expv[20] = 74'h0000000000000000003;
      expv[21] = 74'h0000000000000000003;
      expv[22] = 74'h0000000000000000003;
      expv[23] = 74'h0000000000000000003;
      expv[24] = 74'h00000000c0000000103;
      expv[25] = 74'h00000000000000000cf;
      expv[26] = 74'h00000000000000000cf;
      expv[27] = 74'h00000000000000000cf;
      expv[28] = 74'h00000000000000000cf;
      expv[29] = 74'h00000001000000001cf;
      expv[30] = 74'h00000000000000000a0;
      expv[31] = 74'h00000000000000000a0;
      expv[32] = 74'h00000000000000001a0;
      expv[33] = 74'h00000000000000000d3;
      expv[34] = 74'h00000000000000000d3;
      expv[35] = 74'h00000000000000000d3;
      expv[36] = 74'h00000000000000000d3;
      expv[37] = 74'h00000000400000001d3;
      expv[38] = 74'h0000000000000000078;
      expv[39] = 74'h0000000000000000078;
      expv[40] = 74'h0000000000000000078;
      expv[41] = 74'h0000000000000000078;
      expv[42] = 74'h0000000080000000178;
      expv[43] = 74'h00000000000000000c3;
      expv[44] = 74'h00000000000000000c3;
      expv[45] = 74'h00000000000000000c3;
      expv[46] = 74'h00000000000000000c3;
      expv[47] = 74'h00000000c00000001c3;
      expv[48] = 74'h00000000000000000e8;
      expv[49] = 74'h00000000000000000e8;
      expv[50] = 74'h00000000000000000e8;
      expv[51] = 74'h00000000000000000e8;
      expv[52] = 74'h00000001000000001e8;
      expv[53] = 74'h0000000000000000017;
      expv[54] = 74'h0000000000000000017;
      expv[55] = 74'h0000000000000000017;
      expv[56] = 74'h0000000000000000017;
      expv[57] = 74'h0000000140000000117;
      expv[58] = 74'h0000000000000000016;
      expv[59] = 74'h0000000000000000016;
      expv[60] = 74'h0000000000000000016;
      expv[61] = 74'h0000000000000000016;
      expv[62] = 74'h0000000180000000116;
      expv[63] = 74'h00000000000000000bd;
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
