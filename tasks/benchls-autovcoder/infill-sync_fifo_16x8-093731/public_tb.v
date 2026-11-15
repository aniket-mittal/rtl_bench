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

  autovcoder_093731 dut (
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
    stim[0] = 12'hc79;
    stim[1] = 12'hdcf;
    stim[2] = 12'h401;
    stim[3] = 12'h429;
    stim[4] = 12'h684;
    stim[5] = 12'h300;
    stim[6] = 12'h1a3;
    stim[7] = 12'h72f;
    stim[8] = 12'h3ad;
    stim[9] = 12'h7e1;
    stim[10] = 12'h039;
    stim[11] = 12'h373;
    stim[12] = 12'h5e2;
    stim[13] = 12'h196;
    stim[14] = 12'h302;
    stim[15] = 12'h333;
    stim[16] = 12'h6b4;
    stim[17] = 12'h101;
    stim[18] = 12'h059;
    stim[19] = 12'h40c;
    stim[20] = 12'h73a;
    stim[21] = 12'h624;
    stim[22] = 12'h4a1;
    stim[23] = 12'h6c5;
    stim[24] = 12'h73f;
    stim[25] = 12'h39e;
    stim[26] = 12'h6d4;
    stim[27] = 12'h7e8;
    stim[28] = 12'h0d9;
    stim[29] = 12'h798;
    stim[30] = 12'h1ca;
    stim[31] = 12'h500;
    stim[32] = 12'h322;
    stim[33] = 12'h3b5;
    stim[34] = 12'h325;
    stim[35] = 12'h4cd;
    stim[36] = 12'h03f;
    stim[37] = 12'h74e;
    stim[38] = 12'h3b6;
    stim[39] = 12'h424;
    stim[40] = 12'h0f5;
    stim[41] = 12'h35d;
    stim[42] = 12'h044;
    stim[43] = 12'h45c;
    stim[44] = 12'h076;
    stim[45] = 12'h685;
    stim[46] = 12'h633;
    stim[47] = 12'h7ae;
    stim[48] = 12'h0b2;
    stim[49] = 12'h268;
    stim[50] = 12'h23e;
    stim[51] = 12'h171;
    stim[52] = 12'h582;
    stim[53] = 12'h245;
    stim[54] = 12'h58c;
    stim[55] = 12'h54e;
    stim[56] = 12'h07d;
    stim[57] = 12'h2f9;
    stim[58] = 12'h0e1;
    stim[59] = 12'h165;
    stim[60] = 12'h4a3;
    stim[61] = 12'h230;
    stim[62] = 12'h3d2;
    stim[63] = 12'h4c1;
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
      expv[3] = 10'h1cf;
      expv[4] = 10'h1cf;
      expv[5] = 10'h1cf;
      expv[6] = 10'h1cf;
      expv[7] = 10'h1cf;
      expv[8] = 10'h1cf;
      expv[9] = 10'h1cf;
      expv[10] = 10'h32f;
      expv[11] = 10'h32f;
      expv[12] = 10'h32f;
      expv[13] = 10'h32f;
      expv[14] = 10'h32f;
      expv[15] = 10'h32f;
      expv[16] = 10'h32f;
      expv[17] = 10'h3e1;
      expv[18] = 10'h3e1;
      expv[19] = 10'h3e1;
      expv[20] = 10'h3e1;
      expv[21] = 10'h3e2;
      expv[22] = 10'h33a;
      expv[23] = 10'h33a;
      expv[24] = 10'h13a;
      expv[25] = 10'h13a;
      expv[26] = 10'h13a;
      expv[27] = 10'h33f;
      expv[28] = 10'h13f;
      expv[29] = 10'h13f;
      expv[30] = 10'h3e8;
      expv[31] = 10'h3e8;
      expv[32] = 10'h3e8;
      expv[33] = 10'h3e8;
      expv[34] = 10'h3e8;
      expv[35] = 10'h3e8;
      expv[36] = 10'h3e8;
      expv[37] = 10'h3e8;
      expv[38] = 10'h398;
      expv[39] = 10'h398;
      expv[40] = 10'h398;
      expv[41] = 10'h398;
      expv[42] = 10'h398;
      expv[43] = 10'h398;
      expv[44] = 10'h398;
      expv[45] = 10'h398;
      expv[46] = 10'h300;
      expv[47] = 10'h34e;
      expv[48] = 10'h14e;
      expv[49] = 10'h14e;
      expv[50] = 10'h14e;
      expv[51] = 10'h14e;
      expv[52] = 10'h14e;
      expv[53] = 10'h3ae;
      expv[54] = 10'h3ae;
      expv[55] = 10'h3ae;
      expv[56] = 10'h3ae;
      expv[57] = 10'h3ae;
      expv[58] = 10'h3ae;
      expv[59] = 10'h3ae;
      expv[60] = 10'h3ae;
      expv[61] = 10'h3ae;
      expv[62] = 10'h3ae;
      expv[63] = 10'h3ae;
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
