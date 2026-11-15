// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02127 dut (
    .x(in_vec[15:8]),
    .y(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h94c9;
    stim[1] = 16'h3e0d;
    stim[2] = 16'he420;
    stim[3] = 16'h03df;
    stim[4] = 16'h7a32;
    stim[5] = 16'h7c93;
    stim[6] = 16'ha53e;
    stim[7] = 16'hd74f;
    stim[8] = 16'h77f8;
    stim[9] = 16'h8977;
    stim[10] = 16'h0167;
    stim[11] = 16'h1d11;
    stim[12] = 16'hb1cb;
    stim[13] = 16'h766a;
    stim[14] = 16'hff03;
    stim[15] = 16'h0772;
    stim[16] = 16'h1ce9;
    stim[17] = 16'hb69b;
    stim[18] = 16'h3281;
    stim[19] = 16'he890;
    stim[20] = 16'h4366;
    stim[21] = 16'hf3aa;
    stim[22] = 16'h9ea7;
    stim[23] = 16'h75c8;
    stim[24] = 16'h6a27;
    stim[25] = 16'hf2f5;
    stim[26] = 16'h97e6;
    stim[27] = 16'h815b;
    stim[28] = 16'h683a;
    stim[29] = 16'hb732;
    stim[30] = 16'he505;
    stim[31] = 16'he831;
    stim[32] = 16'hcd12;
    stim[33] = 16'h5afd;
    stim[34] = 16'ha39e;
    stim[35] = 16'hf444;
    stim[36] = 16'haddd;
    stim[37] = 16'h08db;
    stim[38] = 16'h277c;
    stim[39] = 16'h277c;
    stim[40] = 16'ha3be;
    stim[41] = 16'h24ee;
    stim[42] = 16'h3b14;
    stim[43] = 16'h9500;
    stim[44] = 16'h01d3;
    stim[45] = 16'hc8eb;
    stim[46] = 16'h1f74;
    stim[47] = 16'hf824;
    stim[48] = 16'h29a1;
    stim[49] = 16'hd82e;
    stim[50] = 16'h037e;
    stim[51] = 16'hd073;
    stim[52] = 16'hc3f4;
    stim[53] = 16'ha0aa;
    stim[54] = 16'h4937;
    stim[55] = 16'h7d11;
    stim[56] = 16'he8ea;
    stim[57] = 16'h83e0;
    stim[58] = 16'h7fd7;
    stim[59] = 16'h85a4;
    stim[60] = 16'h2217;
    stim[61] = 16'ha4b7;
    stim[62] = 16'hfaf6;
    stim[63] = 16'hba3e;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
