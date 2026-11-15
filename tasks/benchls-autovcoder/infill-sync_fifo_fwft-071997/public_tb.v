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

  autovcoder_071997 dut (
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
    stim[0] = 12'ha3c;
    stim[1] = 12'hfa9;
    stim[2] = 12'h713;
    stim[3] = 12'h3a4;
    stim[4] = 12'h2ab;
    stim[5] = 12'h379;
    stim[6] = 12'h00c;
    stim[7] = 12'h226;
    stim[8] = 12'h736;
    stim[9] = 12'h655;
    stim[10] = 12'h6ae;
    stim[11] = 12'h631;
    stim[12] = 12'h2e5;
    stim[13] = 12'h66f;
    stim[14] = 12'h02f;
    stim[15] = 12'h0a4;
    stim[16] = 12'h15b;
    stim[17] = 12'h41d;
    stim[18] = 12'h3f4;
    stim[19] = 12'h1a6;
    stim[20] = 12'h472;
    stim[21] = 12'h722;
    stim[22] = 12'h60a;
    stim[23] = 12'h4b8;
    stim[24] = 12'h173;
    stim[25] = 12'h1d4;
    stim[26] = 12'h554;
    stim[27] = 12'h499;
    stim[28] = 12'h3d0;
    stim[29] = 12'h376;
    stim[30] = 12'h4d4;
    stim[31] = 12'h521;
    stim[32] = 12'h78c;
    stim[33] = 12'h35c;
    stim[34] = 12'h357;
    stim[35] = 12'h46f;
    stim[36] = 12'h5b4;
    stim[37] = 12'h545;
    stim[38] = 12'hdba;
    stim[39] = 12'h72d;
    stim[40] = 12'h609;
    stim[41] = 12'h78d;
    stim[42] = 12'h58d;
    stim[43] = 12'h1c1;
    stim[44] = 12'h49e;
    stim[45] = 12'h0b3;
    stim[46] = 12'h32e;
    stim[47] = 12'h38c;
    stim[48] = 12'h249;
    stim[49] = 12'h2fe;
    stim[50] = 12'h365;
    stim[51] = 12'h784;
    stim[52] = 12'h306;
    stim[53] = 12'h3da;
    stim[54] = 12'h68e;
    stim[55] = 12'h2b2;
    stim[56] = 12'h7ab;
    stim[57] = 12'h4a4;
    stim[58] = 12'h038;
    stim[59] = 12'h0f7;
    stim[60] = 12'h2ba;
    stim[61] = 12'h53e;
    stim[62] = 12'h30c;
    stim[63] = 12'h2ed;
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
      expv[3] = 10'h1a9;
      expv[4] = 10'h1a9;
      expv[5] = 10'h1a9;
      expv[6] = 10'h1a9;
      expv[7] = 10'h1a9;
      expv[8] = 10'h1a9;
      expv[9] = 10'h313;
      expv[10] = 10'h336;
      expv[11] = 10'h136;
      expv[12] = 10'h136;
      expv[13] = 10'h136;
      expv[14] = 10'h136;
      expv[15] = 10'h136;
      expv[16] = 10'h136;
      expv[17] = 10'h136;
      expv[18] = 10'h136;
      expv[19] = 10'h136;
      expv[20] = 10'h136;
      expv[21] = 10'h136;
      expv[22] = 10'h136;
      expv[23] = 10'h322;
      expv[24] = 10'h322;
      expv[25] = 10'h322;
      expv[26] = 10'h322;
      expv[27] = 10'h322;
      expv[28] = 10'h322;
      expv[29] = 10'h322;
      expv[30] = 10'h322;
      expv[31] = 10'h322;
      expv[32] = 10'h322;
      expv[33] = 10'h354;
      expv[34] = 10'h354;
      expv[35] = 10'h354;
      expv[36] = 10'h354;
      expv[37] = 10'h354;
      expv[38] = 10'h354;
      expv[39] = 10'h100;
      expv[40] = 10'h1ba;
      expv[41] = 10'h32d;
      expv[42] = 10'h12d;
      expv[43] = 10'h38d;
      expv[44] = 10'h38d;
      expv[45] = 10'h38d;
      expv[46] = 10'h38d;
      expv[47] = 10'h38d;
      expv[48] = 10'h38d;
      expv[49] = 10'h38d;
      expv[50] = 10'h38d;
      expv[51] = 10'h38d;
      expv[52] = 10'h38d;
      expv[53] = 10'h38d;
      expv[54] = 10'h38d;
      expv[55] = 10'h384;
      expv[56] = 10'h384;
      expv[57] = 10'h184;
      expv[58] = 10'h3ab;
      expv[59] = 10'h3ab;
      expv[60] = 10'h3ab;
      expv[61] = 10'h3ab;
      expv[62] = 10'h3ab;
      expv[63] = 10'h3ab;
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
