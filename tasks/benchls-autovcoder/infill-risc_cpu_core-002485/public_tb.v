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

  autovcoder_002485 dut (
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
    stim[0] = 33'h1dbf7e949;
    stim[1] = 33'h184b129ce;
    stim[2] = 33'h052badb07;
    stim[3] = 33'h0b154a3df;
    stim[4] = 33'h0afa9a782;
    stim[5] = 33'h03f6dc8a5;
    stim[6] = 33'h0a587a01e;
    stim[7] = 33'h0736b5bfc;
    stim[8] = 33'h0a63b18b9;
    stim[9] = 33'h0ea162b58;
    stim[10] = 33'h03fb69bd4;
    stim[11] = 33'h0319755af;
    stim[12] = 33'h047c3b959;
    stim[13] = 33'h0a68fc83d;
    stim[14] = 33'h121f6cf4c;
    stim[15] = 33'h0be5b9bbe;
    stim[16] = 33'h0a3932e8e;
    stim[17] = 33'h04846a832;
    stim[18] = 33'h054c87d99;
    stim[19] = 33'h067f4a552;
    stim[20] = 33'h0f09e4aea;
    stim[21] = 33'h087e057a1;
    stim[22] = 33'h012d96927;
    stim[23] = 33'h02b49693e;
    stim[24] = 33'h0e6aec999;
    stim[25] = 33'h0e4d0282b;
    stim[26] = 33'h0d0d91fe0;
    stim[27] = 33'h0272279d1;
    stim[28] = 33'h0c704d3d5;
    stim[29] = 33'h001ef2a3a;
    stim[30] = 33'h05dba41e8;
    stim[31] = 33'h0f39f2da1;
    stim[32] = 33'h073c781fd;
    stim[33] = 33'h0372ecbd0;
    stim[34] = 33'h02511ecac;
    stim[35] = 33'h0f5cb2777;
    stim[36] = 33'h0abd39473;
    stim[37] = 33'h062a071be;
    stim[38] = 33'h090e37814;
    stim[39] = 33'h0cb754788;
    stim[40] = 33'h0697a8972;
    stim[41] = 33'h0b8fb7744;
    stim[42] = 33'h00fd43d7a;
    stim[43] = 33'h06c8f93f4;
    stim[44] = 33'h08c74f9db;
    stim[45] = 33'h0b90fd283;
    stim[46] = 33'h0df413b00;
    stim[47] = 33'h04ef26410;
    stim[48] = 33'h0ec8a404e;
    stim[49] = 33'h0a0136ab6;
    stim[50] = 33'h09d49d9a2;
    stim[51] = 33'h0dd987570;
    stim[52] = 33'h09b1bf13c;
    stim[53] = 33'h06d06f6f3;
    stim[54] = 33'h089e4debc;
    stim[55] = 33'h041bafffc;
    stim[56] = 33'h02ebe374e;
    stim[57] = 33'h04ec4be5f;
    stim[58] = 33'h0684e24f9;
    stim[59] = 33'h18d26a688;
    stim[60] = 33'h01f72684c;
    stim[61] = 33'h0507c3f96;
    stim[62] = 33'h012f714bb;
    stim[63] = 33'h0fd29515e;
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
      expv[2] = 74'h00000000xxxxxxxxxce;
      expv[3] = 74'h00000000xxxxxxxxx07;
      expv[4] = 74'h00000000xxxxxxxxx07;
      expv[5] = 74'hxxxxxxxxxxxxxxxxx07;
      expv[6] = 74'h00000000xxxxxxxxx07;
      expv[7] = 74'h00000000xxxxxxxxx07;
      expv[8] = 74'h00000000xxxxxxxxxfc;
      expv[9] = 74'h00000000xxxxxxxxxfc;
      expv[10] = 74'hxxxxxxxxxxxxxxxxxfc;
      expv[11] = 74'h00000000xxxxxxxxxfc;
      expv[12] = 74'h00000000xxxxxxxxxfc;
      expv[13] = 74'h00000000xxxxxxxxx59;
      expv[14] = 74'h00000000xxxxxxxxx59;
      expv[15] = 74'h00000000xxxxxxxxx59;
      expv[16] = 74'h00000000xxxxxxxxxbe;
      expv[17] = 74'h00000000xxxxxxxxxbe;
      expv[18] = 74'hxxxxxxxxxxxxxxxxxbe;
      expv[19] = 74'h00000000xxxxxxxxxbe;
      expv[20] = 74'h00000000xxxxxxxxxbe;
      expv[21] = 74'h00000000xxxxxxxxxea;
      expv[22] = 74'h00000000xxxxxxxxxea;
      expv[23] = 74'hxxxxxxxxxxxxxxxxxea;
      expv[24] = 74'h00000000xxxxxxxxxea;
      expv[25] = 74'h00000000xxxxxxxxxea;
      expv[26] = 74'h00000000xxxxxxxxx2b;
      expv[27] = 74'h00000000xxxxxxxxx2b;
      expv[28] = 74'hxxxxxxxxxxxxxxxxx2b;
      expv[29] = 74'h00000000xxxxxxxxx2b;
      expv[30] = 74'h00000000xxxxxxxxx2b;
      expv[31] = 74'h00000000xxxxxxxxxe8;
      expv[32] = 74'h00000000xxxxxxxxxe8;
      expv[33] = 74'hxxxxxxxxxxxxxxxxxe8;
      expv[34] = 74'h00000000xxxxxxxxxe8;
      expv[35] = 74'h00000001xxxxxxxxxe8;
      expv[36] = 74'h00000000xxxxxxxxx77;
      expv[37] = 74'h00000000xxxxxxxxx77;
      expv[38] = 74'hxxxxxxxxxxxxxxxxx77;
      expv[39] = 74'h00000000xxxxxxxxx77;
      expv[40] = 74'h00000001xxxxxxxxx77;
      expv[41] = 74'h00000000xxxxxxxxx72;
      expv[42] = 74'h00000000xxxxxxxxx72;
      expv[43] = 74'hxxxxxxxxxxxxxxxxx72;
      expv[44] = 74'h00000000xxxxxxxxx72;
      expv[45] = 74'h00000001xxxxxxxxx72;
      expv[46] = 74'h00000000xxxxxxxxx83;
      expv[47] = 74'h00000000xxxxxxxxx83;
      expv[48] = 74'hxxxxxxxxxxxxxxxxx83;
      expv[49] = 74'h00000000xxxxxxxxx83;
      expv[50] = 74'h00000001xxxxxxxxx83;
      expv[51] = 74'h00000000xxxxxxxxxa2;
      expv[52] = 74'h00000000xxxxxxxxxa2;
      expv[53] = 74'hxxxxxxxxxxxxxxxxxa2;
      expv[54] = 74'h00000000xxxxxxxxxa2;
      expv[55] = 74'h00000002xxxxxxxxxa2;
      expv[56] = 74'h00000000xxxxxxxxxfc;
      expv[57] = 74'h00000000xxxxxxxxxfc;
      expv[58] = 74'hxxxxxxxxxxxxxxxxxfc;
      expv[59] = 74'h00000000xxxxxxxxxfc;
      expv[60] = 74'h00000000xxxxxxxxxfc;
      expv[61] = 74'h00000000xxxxxxxxx4c;
      expv[62] = 74'h00000000xxxxxxxxx4c;
      expv[63] = 74'hxxxxxxxxxxxxxxxxx4c;
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
