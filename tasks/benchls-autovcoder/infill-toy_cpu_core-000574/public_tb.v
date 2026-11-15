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

  autovcoder_000574 dut (
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
    stim[0] = 33'h1b6445972;
    stim[1] = 33'h1387becd4;
    stim[2] = 33'h06ef17a4b;
    stim[3] = 33'h07de6a359;
    stim[4] = 33'h0cd1d1c3a;
    stim[5] = 33'h061968e4c;
    stim[6] = 33'h09b5f87e7;
    stim[7] = 33'h0030cb9ce;
    stim[8] = 33'h039209398;
    stim[9] = 33'h0476103e6;
    stim[10] = 33'h0f07e8af4;
    stim[11] = 33'h011439f3c;
    stim[12] = 33'h01549a1ec;
    stim[13] = 33'h0226f1ee1;
    stim[14] = 33'h0ceec9bdb;
    stim[15] = 33'h0e169a8e8;
    stim[16] = 33'h0b714f9a7;
    stim[17] = 33'h1e0404d25;
    stim[18] = 33'h0d216ea35;
    stim[19] = 33'h00fd26cdf;
    stim[20] = 33'h02cce7d45;
    stim[21] = 33'h09f95bd12;
    stim[22] = 33'h095804c82;
    stim[23] = 33'h063d89002;
    stim[24] = 33'h03b5a379f;
    stim[25] = 33'h0da387c9b;
    stim[26] = 33'h02cee8d18;
    stim[27] = 33'h072c3a72d;
    stim[28] = 33'h0e39ad664;
    stim[29] = 33'h020c84b01;
    stim[30] = 33'h0cac9bbf5;
    stim[31] = 33'h016162ccf;
    stim[32] = 33'h0f59d68f6;
    stim[33] = 33'h0d6035051;
    stim[34] = 33'h013366e86;
    stim[35] = 33'h0d34c470a;
    stim[36] = 33'h0e7d73f0e;
    stim[37] = 33'h06ba9336f;
    stim[38] = 33'h0378d33a8;
    stim[39] = 33'h0b3425d12;
    stim[40] = 33'h0df4d10f0;
    stim[41] = 33'h00e955f45;
    stim[42] = 33'h0b428c805;
    stim[43] = 33'h01141caa5;
    stim[44] = 33'h0954665a4;
    stim[45] = 33'h0424858f0;
    stim[46] = 33'h07fb82a99;
    stim[47] = 33'h0347b52c8;
    stim[48] = 33'h02d7d3cd9;
    stim[49] = 33'h0b5ddbb46;
    stim[50] = 33'h05ac4ed9e;
    stim[51] = 33'h01956dea9;
    stim[52] = 33'h0cc9bf4d4;
    stim[53] = 33'h07dad71c7;
    stim[54] = 33'h00d20a3bf;
    stim[55] = 33'h0df89fbd7;
    stim[56] = 33'h0de8caad2;
    stim[57] = 33'h0fe852a6a;
    stim[58] = 33'h07064ede3;
    stim[59] = 33'h0311b4b4f;
    stim[60] = 33'h044773baf;
    stim[61] = 33'h05ef5bf61;
    stim[62] = 33'h089f48d73;
    stim[63] = 33'h0516b0f29;
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
      expv[2] = 74'h00000000xxxxxxxxxd4;
      expv[3] = 74'h00000000xxxxxxxxx4b;
      expv[4] = 74'h00000000xxxxxxxxx4b;
      expv[5] = 74'h000000000000000004b;
      expv[6] = 74'h000000000000000004b;
      expv[7] = 74'h000000004000000014b;
      expv[8] = 74'h00000000000000000ce;
      expv[9] = 74'h00000000000000000ce;
      expv[10] = 74'h00000000000000000ce;
      expv[11] = 74'h00000000000000000ce;
      expv[12] = 74'h00000000800000001ce;
      expv[13] = 74'h00000000000000000ec;
      expv[14] = 74'h00000000000000000ec;
      expv[15] = 74'h00000000000000000ec;
      expv[16] = 74'h00000000000000000ec;
      expv[17] = 74'h00000000c00000001ec;
      expv[18] = 74'h0000000000000000125;
      expv[19] = 74'h0000000000000000035;
      expv[20] = 74'h0000000000000000035;
      expv[21] = 74'h0000000000000000035;
      expv[22] = 74'h0000000000000000035;
      expv[23] = 74'h0000000040000000135;
      expv[24] = 74'h0000000000000000002;
      expv[25] = 74'h0000000000000000002;
      expv[26] = 74'h0000000000000000002;
      expv[27] = 74'h0000000000000000002;
      expv[28] = 74'h0000000080000000102;
      expv[29] = 74'h0000000000000000064;
      expv[30] = 74'h0000000000000000064;
      expv[31] = 74'h0000000000000000064;
      expv[32] = 74'h0000000000000000064;
      expv[33] = 74'h00000000c0000000164;
      expv[34] = 74'h0000000000000000051;
      expv[35] = 74'h0000000000000000051;
      expv[36] = 74'h0000000000000000051;
      expv[37] = 74'h0000000000000000051;
      expv[38] = 74'h0000000100000000151;
      expv[39] = 74'h00000000000000000a8;
      expv[40] = 74'h00000000000000000a8;
      expv[41] = 74'h00000000000000000a8;
      expv[42] = 74'h00000000000000000a8;
      expv[43] = 74'h00000001400000001a8;
      expv[44] = 74'h00000000000000000a5;
      expv[45] = 74'h00000000000000000a5;
      expv[46] = 74'h00000000000000000a5;
      expv[47] = 74'h00000000000000000a5;
      expv[48] = 74'h00000001800000001a5;
      expv[49] = 74'h00000000000000000d9;
      expv[50] = 74'h00000000000000000d9;
      expv[51] = 74'h00000000000000000d9;
      expv[52] = 74'h00000000000000000d9;
      expv[53] = 74'h00000001c00000001d9;
      expv[54] = 74'h00000000000000000c7;
      expv[55] = 74'h00000000000000000c7;
      expv[56] = 74'h00000000000000000c7;
      expv[57] = 74'h00000000000000000c7;
      expv[58] = 74'h00000002000000001c7;
      expv[59] = 74'h00000000000000000e3;
      expv[60] = 74'h00000000000000000e3;
      expv[61] = 74'h00000000000000000e3;
      expv[62] = 74'h00000000000000000e3;
      expv[63] = 74'h00000002400000001e3;
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
