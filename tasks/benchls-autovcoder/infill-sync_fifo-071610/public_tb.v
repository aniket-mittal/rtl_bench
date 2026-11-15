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

  autovcoder_071610 dut (
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
    stim[0] = 12'hfa7;
    stim[1] = 12'he09;
    stim[2] = 12'h721;
    stim[3] = 12'h6b6;
    stim[4] = 12'h212;
    stim[5] = 12'h51f;
    stim[6] = 12'h4fc;
    stim[7] = 12'h7dd;
    stim[8] = 12'h259;
    stim[9] = 12'h36f;
    stim[10] = 12'h0c4;
    stim[11] = 12'h4dd;
    stim[12] = 12'h1dc;
    stim[13] = 12'h621;
    stim[14] = 12'h311;
    stim[15] = 12'h044;
    stim[16] = 12'h34b;
    stim[17] = 12'h3bd;
    stim[18] = 12'h28e;
    stim[19] = 12'h77a;
    stim[20] = 12'h402;
    stim[21] = 12'h709;
    stim[22] = 12'h2fe;
    stim[23] = 12'h34c;
    stim[24] = 12'h32d;
    stim[25] = 12'h4a9;
    stim[26] = 12'h66d;
    stim[27] = 12'h6d5;
    stim[28] = 12'h41c;
    stim[29] = 12'h2e5;
    stim[30] = 12'h606;
    stim[31] = 12'h4d4;
    stim[32] = 12'h58c;
    stim[33] = 12'h741;
    stim[34] = 12'h000;
    stim[35] = 12'h04a;
    stim[36] = 12'h0bd;
    stim[37] = 12'h535;
    stim[38] = 12'h1a9;
    stim[39] = 12'h5d9;
    stim[40] = 12'h532;
    stim[41] = 12'h061;
    stim[42] = 12'h41b;
    stim[43] = 12'he24;
    stim[44] = 12'h2e9;
    stim[45] = 12'h701;
    stim[46] = 12'h43c;
    stim[47] = 12'ha5b;
    stim[48] = 12'h677;
    stim[49] = 12'h48f;
    stim[50] = 12'h144;
    stim[51] = 12'h060;
    stim[52] = 12'h1da;
    stim[53] = 12'h7cb;
    stim[54] = 12'h6e9;
    stim[55] = 12'h2ab;
    stim[56] = 12'h038;
    stim[57] = 12'h5f1;
    stim[58] = 12'h6e1;
    stim[59] = 12'h4cd;
    stim[60] = 12'h424;
    stim[61] = 12'h209;
    stim[62] = 12'h508;
    stim[63] = 12'h6b1;
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
      expv[4] = 10'h321;
      expv[5] = 10'h321;
      expv[6] = 10'h321;
      expv[7] = 10'h321;
      expv[8] = 10'h31f;
      expv[9] = 10'h31f;
      expv[10] = 10'h31f;
      expv[11] = 10'h31f;
      expv[12] = 10'h31f;
      expv[13] = 10'h31f;
      expv[14] = 10'h3dd;
      expv[15] = 10'h3dd;
      expv[16] = 10'h3dd;
      expv[17] = 10'h3dd;
      expv[18] = 10'h3dd;
      expv[19] = 10'h3dd;
      expv[20] = 10'h1dd;
      expv[21] = 10'h37a;
      expv[22] = 10'h17a;
      expv[23] = 10'h17a;
      expv[24] = 10'h17a;
      expv[25] = 10'h17a;
      expv[26] = 10'h309;
      expv[27] = 10'h109;
      expv[28] = 10'h109;
      expv[29] = 10'h109;
      expv[30] = 10'h109;
      expv[31] = 10'h109;
      expv[32] = 10'h109;
      expv[33] = 10'h109;
      expv[34] = 10'h38c;
      expv[35] = 10'h38c;
      expv[36] = 10'h38c;
      expv[37] = 10'h38c;
      expv[38] = 10'h38c;
      expv[39] = 10'h38c;
      expv[40] = 10'h38c;
      expv[41] = 10'h38c;
      expv[42] = 10'h38c;
      expv[43] = 10'h38c;
      expv[44] = 10'h100;
      expv[45] = 10'h100;
      expv[46] = 10'h132;
      expv[47] = 10'h301;
      expv[48] = 10'h100;
      expv[49] = 10'h101;
      expv[50] = 10'h101;
      expv[51] = 10'h101;
      expv[52] = 10'h101;
      expv[53] = 10'h101;
      expv[54] = 10'h101;
      expv[55] = 10'h3cb;
      expv[56] = 10'h3cb;
      expv[57] = 10'h3cb;
      expv[58] = 10'h3cb;
      expv[59] = 10'h3f1;
      expv[60] = 10'h3f1;
      expv[61] = 10'h3f1;
      expv[62] = 10'h3f1;
      expv[63] = 10'h3f1;
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
