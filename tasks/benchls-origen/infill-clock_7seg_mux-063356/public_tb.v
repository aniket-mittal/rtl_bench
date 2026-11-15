// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_063356 dut (
    .AN_count(in_vec[26:25]),
    .CNT0_1s(in_vec[24:21]),
    .CNT1s(in_vec[20:17]),
    .CNT1m(in_vec[16:13]),
    .CNT1h(in_vec[12:9]),
    .CNT10s(in_vec[8:6]),
    .CNT10m(in_vec[5:3]),
    .CNT10h(in_vec[2:1]),
    .sw(in_vec[0:0]),
    .AN(out_vec[10:7]),
    .LED(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h1f4b763;
    stim[1] = 27'h5524107;
    stim[2] = 27'h06d3f8b;
    stim[3] = 27'h4923432;
    stim[4] = 27'h7f2ca0b;
    stim[5] = 27'h368c760;
    stim[6] = 27'h7b8c5a1;
    stim[7] = 27'h58674ad;
    stim[8] = 27'h524d0f2;
    stim[9] = 27'h650c282;
    stim[10] = 27'h07e743c;
    stim[11] = 27'h0c4e561;
    stim[12] = 27'h5b0e2d0;
    stim[13] = 27'h28db979;
    stim[14] = 27'h0323c37;
    stim[15] = 27'h4834266;
    stim[16] = 27'h34f9600;
    stim[17] = 27'h75e6049;
    stim[18] = 27'h625889e;
    stim[19] = 27'h7aaa7b2;
    stim[20] = 27'h1fbee46;
    stim[21] = 27'h3fdab6f;
    stim[22] = 27'h38ebb65;
    stim[23] = 27'h15a7298;
    stim[24] = 27'h035bde2;
    stim[25] = 27'h7ec2d3e;
    stim[26] = 27'h0445d33;
    stim[27] = 27'h7123527;
    stim[28] = 27'h5851a1e;
    stim[29] = 27'h73816a9;
    stim[30] = 27'h06a0a98;
    stim[31] = 27'h18e9d5c;
    stim[32] = 27'h29e79f5;
    stim[33] = 27'h03b1f80;
    stim[34] = 27'h331aee1;
    stim[35] = 27'h0a43c85;
    stim[36] = 27'h69bddcd;
    stim[37] = 27'h21ababa;
    stim[38] = 27'h629f225;
    stim[39] = 27'h38f2a4a;
    stim[40] = 27'h092d365;
    stim[41] = 27'h06a58a5;
    stim[42] = 27'h16a2535;
    stim[43] = 27'h54ab4c5;
    stim[44] = 27'h1eab7c0;
    stim[45] = 27'h2b0d2da;
    stim[46] = 27'h5d360de;
    stim[47] = 27'h295fd53;
    stim[48] = 27'h19e4c77;
    stim[49] = 27'h65d15cb;
    stim[50] = 27'h75636f8;
    stim[51] = 27'h691bce9;
    stim[52] = 27'h28e62fc;
    stim[53] = 27'h18e1abd;
    stim[54] = 27'h7f8f11f;
    stim[55] = 27'h0a3f94a;
    stim[56] = 27'h3572138;
    stim[57] = 27'h3189a0e;
    stim[58] = 27'h670da84;
    stim[59] = 27'h44c1aca;
    stim[60] = 27'h3850af9;
    stim[61] = 27'h37450da;
    stim[62] = 27'h0858d7e;
    stim[63] = 27'h647a8e4;
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
      expv[0] = 11'h77f;
      expv[1] = 11'h5cc;
      expv[2] = 11'h706;
      expv[3] = 11'h5ff;
      expv[4] = 11'h3a0;
      expv[5] = 11'h6cc;
      expv[6] = 11'h3a0;
      expv[7] = 11'h592;
      expv[8] = 11'h580;
      expv[9] = 11'h3cf;
      expv[10] = 11'h706;
      expv[11] = 11'h720;
      expv[12] = 11'h5cf;
      expv[13] = 11'h6a0;
      expv[14] = 11'h74f;
      expv[15] = 11'h5cf;
      expv[16] = 11'h681;
      expv[17] = 11'h386;
      expv[18] = 11'h386;
      expv[19] = 11'h3cf;
      expv[20] = 11'h77f;
      expv[21] = 11'h6ff;
      expv[22] = 11'h68f;
      expv[23] = 11'h706;
      expv[24] = 11'h77f;
      expv[25] = 11'h386;
      expv[26] = 11'h712;
      expv[27] = 11'h3cf;
      expv[28] = 11'h5ff;
      expv[29] = 11'h381;
      expv[30] = 11'h701;
      expv[31] = 11'h74c;
      expv[32] = 11'h6ff;
      expv[33] = 11'h700;
      expv[34] = 11'h680;
      expv[35] = 11'h724;
      expv[36] = 11'h3ff;
      expv[37] = 11'h68f;
      expv[38] = 11'h3ff;
      expv[39] = 11'h6cf;
      expv[40] = 11'h74c;
      expv[41] = 11'h706;
      expv[42] = 11'h77f;
      expv[43] = 11'h586;
      expv[44] = 11'h724;
      expv[45] = 11'h686;
      expv[46] = 11'h581;
      expv[47] = 11'h6ff;
      expv[48] = 11'h77f;
      expv[49] = 11'h380;
      expv[50] = 11'h381;
      expv[51] = 11'h3ff;
      expv[52] = 11'h68f;
      expv[53] = 11'h77f;
      expv[54] = 11'h38f;
      expv[55] = 11'h77f;
      expv[56] = 11'h68f;
      expv[57] = 11'h6cf;
      expv[58] = 11'h392;
      expv[59] = 11'h5ff;
      expv[60] = 11'h692;
      expv[61] = 11'h686;
      expv[62] = 11'h77f;
      expv[63] = 11'h392;
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
