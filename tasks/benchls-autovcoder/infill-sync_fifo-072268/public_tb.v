// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072268 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h931;
    stim[1] = 12'h922;
    stim[2] = 12'h565;
    stim[3] = 12'h368;
    stim[4] = 12'h27f;
    stim[5] = 12'h46f;
    stim[6] = 12'h301;
    stim[7] = 12'h17b;
    stim[8] = 12'h0c8;
    stim[9] = 12'h275;
    stim[10] = 12'h66b;
    stim[11] = 12'h520;
    stim[12] = 12'h44f;
    stim[13] = 12'h5a9;
    stim[14] = 12'h7ac;
    stim[15] = 12'h1ad;
    stim[16] = 12'h0dd;
    stim[17] = 12'h780;
    stim[18] = 12'h6d8;
    stim[19] = 12'h0e9;
    stim[20] = 12'h1c0;
    stim[21] = 12'h1bb;
    stim[22] = 12'h6ed;
    stim[23] = 12'h28a;
    stim[24] = 12'h497;
    stim[25] = 12'h0f8;
    stim[26] = 12'h356;
    stim[27] = 12'h5f2;
    stim[28] = 12'h7f2;
    stim[29] = 12'h15d;
    stim[30] = 12'h0b0;
    stim[31] = 12'h6d6;
    stim[32] = 12'h083;
    stim[33] = 12'h648;
    stim[34] = 12'h545;
    stim[35] = 12'h7a8;
    stim[36] = 12'h3f8;
    stim[37] = 12'h527;
    stim[38] = 12'h543;
    stim[39] = 12'h7c1;
    stim[40] = 12'h255;
    stim[41] = 12'h3b4;
    stim[42] = 12'h722;
    stim[43] = 12'h051;
    stim[44] = 12'h19e;
    stim[45] = 12'h173;
    stim[46] = 12'h358;
    stim[47] = 12'h015;
    stim[48] = 12'h6e7;
    stim[49] = 12'h25e;
    stim[50] = 12'h312;
    stim[51] = 12'h2db;
    stim[52] = 12'h5b3;
    stim[53] = 12'h4a0;
    stim[54] = 12'h01f;
    stim[55] = 12'h513;
    stim[56] = 12'h770;
    stim[57] = 12'h034;
    stim[58] = 12'h7d9;
    stim[59] = 12'h602;
    stim[60] = 12'h008;
    stim[61] = 12'h50a;
    stim[62] = 12'h773;
    stim[63] = 12'h230;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h365;
      expv[7] = 10'h365;
      expv[8] = 10'h365;
      expv[9] = 10'h365;
      expv[10] = 10'h365;
      expv[11] = 10'h165;
      expv[12] = 10'h165;
      expv[13] = 10'h320;
      expv[14] = 10'h320;
      expv[15] = 10'h3a9;
      expv[16] = 10'h3a9;
      expv[17] = 10'h3a9;
      expv[18] = 10'h3ac;
      expv[19] = 10'h380;
      expv[20] = 10'h380;
      expv[21] = 10'h380;
      expv[22] = 10'h380;
      expv[23] = 10'h180;
      expv[24] = 10'h180;
      expv[25] = 10'h180;
      expv[26] = 10'h180;
      expv[27] = 10'h180;
      expv[28] = 10'h180;
      expv[29] = 10'h3f2;
      expv[30] = 10'h3f2;
      expv[31] = 10'h3f2;
      expv[32] = 10'h3f2;
      expv[33] = 10'h3f2;
      expv[34] = 10'h1f2;
      expv[35] = 10'h1f2;
      expv[36] = 10'h345;
      expv[37] = 10'h345;
      expv[38] = 10'h345;
      expv[39] = 10'h345;
      expv[40] = 10'h3a8;
      expv[41] = 10'h3a8;
      expv[42] = 10'h3a8;
      expv[43] = 10'h327;
      expv[44] = 10'h327;
      expv[45] = 10'h327;
      expv[46] = 10'h327;
      expv[47] = 10'h327;
      expv[48] = 10'h327;
      expv[49] = 10'h343;
      expv[50] = 10'h343;
      expv[51] = 10'h343;
      expv[52] = 10'h343;
      expv[53] = 10'h343;
      expv[54] = 10'h343;
      expv[55] = 10'h343;
      expv[56] = 10'h343;
      expv[57] = 10'h3c1;
      expv[58] = 10'h3c1;
      expv[59] = 10'h322;
      expv[60] = 10'h3b3;
      expv[61] = 10'h3b3;
      expv[62] = 10'h3b3;
      expv[63] = 10'h313;
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
