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

  autovcoder_071893 dut (
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
    stim[0] = 12'hf39;
    stim[1] = 12'hffc;
    stim[2] = 12'h3ce;
    stim[3] = 12'h020;
    stim[4] = 12'h6e5;
    stim[5] = 12'h3d7;
    stim[6] = 12'h71e;
    stim[7] = 12'h3fd;
    stim[8] = 12'h8d5;
    stim[9] = 12'h452;
    stim[10] = 12'h3a8;
    stim[11] = 12'h7a1;
    stim[12] = 12'h6e3;
    stim[13] = 12'h2dc;
    stim[14] = 12'h679;
    stim[15] = 12'h478;
    stim[16] = 12'h2fb;
    stim[17] = 12'h5c7;
    stim[18] = 12'h175;
    stim[19] = 12'h7bc;
    stim[20] = 12'h0a9;
    stim[21] = 12'h6db;
    stim[22] = 12'h6f2;
    stim[23] = 12'h191;
    stim[24] = 12'h252;
    stim[25] = 12'h758;
    stim[26] = 12'h6fc;
    stim[27] = 12'h11d;
    stim[28] = 12'h07c;
    stim[29] = 12'h0cb;
    stim[30] = 12'h00a;
    stim[31] = 12'h084;
    stim[32] = 12'h2a2;
    stim[33] = 12'h6f5;
    stim[34] = 12'h3f0;
    stim[35] = 12'h546;
    stim[36] = 12'h455;
    stim[37] = 12'h736;
    stim[38] = 12'h7b9;
    stim[39] = 12'h7ce;
    stim[40] = 12'h3e6;
    stim[41] = 12'h06d;
    stim[42] = 12'h12e;
    stim[43] = 12'h09c;
    stim[44] = 12'h5dc;
    stim[45] = 12'h290;
    stim[46] = 12'h25d;
    stim[47] = 12'h56c;
    stim[48] = 12'h4db;
    stim[49] = 12'h469;
    stim[50] = 12'h79a;
    stim[51] = 12'h100;
    stim[52] = 12'h2a0;
    stim[53] = 12'h59f;
    stim[54] = 12'h0df;
    stim[55] = 12'h771;
    stim[56] = 12'h216;
    stim[57] = 12'h54b;
    stim[58] = 12'h6d2;
    stim[59] = 12'h74e;
    stim[60] = 12'h4b5;
    stim[61] = 12'h1c4;
    stim[62] = 12'h1ba;
    stim[63] = 12'h171;
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
      expv[5] = 10'h1fc;
      expv[6] = 10'h1fc;
      expv[7] = 10'h1fc;
      expv[8] = 10'h1fc;
      expv[9] = 10'h100;
      expv[10] = 10'h11e;
      expv[11] = 10'h11e;
      expv[12] = 10'h11e;
      expv[13] = 10'h3a1;
      expv[14] = 10'h3a1;
      expv[15] = 10'h1a1;
      expv[16] = 10'h1a1;
      expv[17] = 10'h1a1;
      expv[18] = 10'h1a1;
      expv[19] = 10'h1a1;
      expv[20] = 10'h3c7;
      expv[21] = 10'h3c7;
      expv[22] = 10'h3bc;
      expv[23] = 10'h1bc;
      expv[24] = 10'h1bc;
      expv[25] = 10'h1bc;
      expv[26] = 10'h1bc;
      expv[27] = 10'h358;
      expv[28] = 10'h358;
      expv[29] = 10'h358;
      expv[30] = 10'h358;
      expv[31] = 10'h358;
      expv[32] = 10'h358;
      expv[33] = 10'h358;
      expv[34] = 10'h158;
      expv[35] = 10'h158;
      expv[36] = 10'h158;
      expv[37] = 10'h346;
      expv[38] = 10'h146;
      expv[39] = 10'h336;
      expv[40] = 10'h3b9;
      expv[41] = 10'h3b9;
      expv[42] = 10'h3b9;
      expv[43] = 10'h3b9;
      expv[44] = 10'h3b9;
      expv[45] = 10'h3b9;
      expv[46] = 10'h3b9;
      expv[47] = 10'h3b9;
      expv[48] = 10'h3b9;
      expv[49] = 10'h3b9;
      expv[50] = 10'h3b9;
      expv[51] = 10'h3ce;
      expv[52] = 10'h3ce;
      expv[53] = 10'h3ce;
      expv[54] = 10'h3ce;
      expv[55] = 10'h3ce;
      expv[56] = 10'h3dc;
      expv[57] = 10'h3dc;
      expv[58] = 10'h3dc;
      expv[59] = 10'h36c;
      expv[60] = 10'h39a;
      expv[61] = 10'h39a;
      expv[62] = 10'h39a;
      expv[63] = 10'h39a;
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
