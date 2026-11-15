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

  autovcoder_072206 dut (
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
    stim[0] = 12'h930;
    stim[1] = 12'h9d1;
    stim[2] = 12'h598;
    stim[3] = 12'h5c5;
    stim[4] = 12'h0c6;
    stim[5] = 12'h4b7;
    stim[6] = 12'h337;
    stim[7] = 12'h6a0;
    stim[8] = 12'h137;
    stim[9] = 12'h0dc;
    stim[10] = 12'h0ec;
    stim[11] = 12'h439;
    stim[12] = 12'h1e2;
    stim[13] = 12'h5d7;
    stim[14] = 12'h7a9;
    stim[15] = 12'h6f1;
    stim[16] = 12'h5e5;
    stim[17] = 12'h7af;
    stim[18] = 12'h069;
    stim[19] = 12'h36a;
    stim[20] = 12'h09c;
    stim[21] = 12'h256;
    stim[22] = 12'h5e9;
    stim[23] = 12'h67a;
    stim[24] = 12'h5d4;
    stim[25] = 12'h78e;
    stim[26] = 12'h4b7;
    stim[27] = 12'h26b;
    stim[28] = 12'h425;
    stim[29] = 12'h102;
    stim[30] = 12'h7ed;
    stim[31] = 12'h4a2;
    stim[32] = 12'h75c;
    stim[33] = 12'h301;
    stim[34] = 12'h394;
    stim[35] = 12'h2ee;
    stim[36] = 12'h2b2;
    stim[37] = 12'h045;
    stim[38] = 12'h466;
    stim[39] = 12'h79c;
    stim[40] = 12'h103;
    stim[41] = 12'h2b9;
    stim[42] = 12'h52e;
    stim[43] = 12'h514;
    stim[44] = 12'h4db;
    stim[45] = 12'h38b;
    stim[46] = 12'h3ee;
    stim[47] = 12'h3b2;
    stim[48] = 12'h038;
    stim[49] = 12'h251;
    stim[50] = 12'h5ba;
    stim[51] = 12'h6e8;
    stim[52] = 12'h774;
    stim[53] = 12'h38b;
    stim[54] = 12'h8e4;
    stim[55] = 12'h054;
    stim[56] = 12'h600;
    stim[57] = 12'h339;
    stim[58] = 12'h0e4;
    stim[59] = 12'h011;
    stim[60] = 12'h06f;
    stim[61] = 12'h1ce;
    stim[62] = 12'h7f7;
    stim[63] = 12'h410;
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
      expv[4] = 10'h398;
      expv[5] = 10'h398;
      expv[6] = 10'h398;
      expv[7] = 10'h398;
      expv[8] = 10'h3c5;
      expv[9] = 10'h3c5;
      expv[10] = 10'h3c5;
      expv[11] = 10'h3c5;
      expv[12] = 10'h3c5;
      expv[13] = 10'h3c5;
      expv[14] = 10'h3c5;
      expv[15] = 10'h3d7;
      expv[16] = 10'h3a9;
      expv[17] = 10'h3a9;
      expv[18] = 10'h3e5;
      expv[19] = 10'h3e5;
      expv[20] = 10'h3e5;
      expv[21] = 10'h3e5;
      expv[22] = 10'h3e5;
      expv[23] = 10'h3e5;
      expv[24] = 10'h3af;
      expv[25] = 10'h3af;
      expv[26] = 10'h3e9;
      expv[27] = 10'h3e9;
      expv[28] = 10'h3e9;
      expv[29] = 10'h3e9;
      expv[30] = 10'h3e9;
      expv[31] = 10'h3d4;
      expv[32] = 10'h3d4;
      expv[33] = 10'h38e;
      expv[34] = 10'h38e;
      expv[35] = 10'h38e;
      expv[36] = 10'h38e;
      expv[37] = 10'h38e;
      expv[38] = 10'h38e;
      expv[39] = 10'h38e;
      expv[40] = 10'h3ed;
      expv[41] = 10'h3ed;
      expv[42] = 10'h3ed;
      expv[43] = 10'h3ed;
      expv[44] = 10'h3ed;
      expv[45] = 10'h3ed;
      expv[46] = 10'h3ed;
      expv[47] = 10'h3ed;
      expv[48] = 10'h3ed;
      expv[49] = 10'h3ed;
      expv[50] = 10'h3ed;
      expv[51] = 10'h3ed;
      expv[52] = 10'h35c;
      expv[53] = 10'h39c;
      expv[54] = 10'h39c;
      expv[55] = 10'h100;
      expv[56] = 10'h100;
      expv[57] = 10'h174;
      expv[58] = 10'h174;
      expv[59] = 10'h174;
      expv[60] = 10'h174;
      expv[61] = 10'h174;
      expv[62] = 10'h174;
      expv[63] = 10'h174;
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
