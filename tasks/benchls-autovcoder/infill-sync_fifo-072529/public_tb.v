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

  autovcoder_072529 dut (
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
    stim[0] = 12'hf83;
    stim[1] = 12'hc52;
    stim[2] = 12'h32f;
    stim[3] = 12'h30c;
    stim[4] = 12'h264;
    stim[5] = 12'h69c;
    stim[6] = 12'h29b;
    stim[7] = 12'h1c7;
    stim[8] = 12'h39f;
    stim[9] = 12'h1fd;
    stim[10] = 12'h547;
    stim[11] = 12'h5c2;
    stim[12] = 12'ha50;
    stim[13] = 12'h78b;
    stim[14] = 12'h05d;
    stim[15] = 12'h6e7;
    stim[16] = 12'h26a;
    stim[17] = 12'h0f6;
    stim[18] = 12'h61c;
    stim[19] = 12'h29e;
    stim[20] = 12'h032;
    stim[21] = 12'h0a1;
    stim[22] = 12'h02f;
    stim[23] = 12'h025;
    stim[24] = 12'h19e;
    stim[25] = 12'h5a5;
    stim[26] = 12'h780;
    stim[27] = 12'h1fb;
    stim[28] = 12'h3c1;
    stim[29] = 12'h0ba;
    stim[30] = 12'h2ed;
    stim[31] = 12'h3e8;
    stim[32] = 12'h75b;
    stim[33] = 12'h300;
    stim[34] = 12'h743;
    stim[35] = 12'h2bb;
    stim[36] = 12'h70e;
    stim[37] = 12'h296;
    stim[38] = 12'h507;
    stim[39] = 12'h0a6;
    stim[40] = 12'h6fd;
    stim[41] = 12'h346;
    stim[42] = 12'h048;
    stim[43] = 12'h6fe;
    stim[44] = 12'h19e;
    stim[45] = 12'h299;
    stim[46] = 12'h166;
    stim[47] = 12'h046;
    stim[48] = 12'h0e6;
    stim[49] = 12'h031;
    stim[50] = 12'h52e;
    stim[51] = 12'h325;
    stim[52] = 12'h7cb;
    stim[53] = 12'h209;
    stim[54] = 12'h15b;
    stim[55] = 12'h65b;
    stim[56] = 12'h7ea;
    stim[57] = 12'h3df;
    stim[58] = 12'h603;
    stim[59] = 12'h454;
    stim[60] = 12'h6bf;
    stim[61] = 12'h010;
    stim[62] = 12'h402;
    stim[63] = 12'h50b;
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
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h1xx;
      expv[9] = 10'h1xx;
      expv[10] = 10'h1xx;
      expv[11] = 10'h1xx;
      expv[12] = 10'h347;
      expv[13] = 10'h100;
      expv[14] = 10'h1c2;
      expv[15] = 10'h1c2;
      expv[16] = 10'h38b;
      expv[17] = 10'h38b;
      expv[18] = 10'h38b;
      expv[19] = 10'h18b;
      expv[20] = 10'h18b;
      expv[21] = 10'h18b;
      expv[22] = 10'h18b;
      expv[23] = 10'h18b;
      expv[24] = 10'h18b;
      expv[25] = 10'h18b;
      expv[26] = 10'h18b;
      expv[27] = 10'h3a5;
      expv[28] = 10'h3a5;
      expv[29] = 10'h3a5;
      expv[30] = 10'h3a5;
      expv[31] = 10'h3a5;
      expv[32] = 10'h3a5;
      expv[33] = 10'h380;
      expv[34] = 10'h380;
      expv[35] = 10'h35b;
      expv[36] = 10'h35b;
      expv[37] = 10'h343;
      expv[38] = 10'h343;
      expv[39] = 10'h343;
      expv[40] = 10'h343;
      expv[41] = 10'h30e;
      expv[42] = 10'h30e;
      expv[43] = 10'h30e;
      expv[44] = 10'h307;
      expv[45] = 10'h307;
      expv[46] = 10'h307;
      expv[47] = 10'h307;
      expv[48] = 10'h307;
      expv[49] = 10'h307;
      expv[50] = 10'h307;
      expv[51] = 10'h307;
      expv[52] = 10'h307;
      expv[53] = 10'h32e;
      expv[54] = 10'h32e;
      expv[55] = 10'h32e;
      expv[56] = 10'h3cb;
      expv[57] = 10'h1cb;
      expv[58] = 10'h1cb;
      expv[59] = 10'h3ea;
      expv[60] = 10'h3ea;
      expv[61] = 10'h1ea;
      expv[62] = 10'h1ea;
      expv[63] = 10'h1ea;
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
