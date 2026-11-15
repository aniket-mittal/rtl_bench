// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137507 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .a(in_vec[10:7]),
    .b(in_vec[6:3]),
    .op(in_vec[2:0]),
    .result(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'ha18;
    stim[1] = 12'hdf2;
    stim[2] = 12'h5f0;
    stim[3] = 12'h4ee;
    stim[4] = 12'h76d;
    stim[5] = 12'h628;
    stim[6] = 12'h7e7;
    stim[7] = 12'h2bf;
    stim[8] = 12'h39d;
    stim[9] = 12'h641;
    stim[10] = 12'h6a8;
    stim[11] = 12'h6e9;
    stim[12] = 12'h57a;
    stim[13] = 12'h233;
    stim[14] = 12'h308;
    stim[15] = 12'h1d4;
    stim[16] = 12'h124;
    stim[17] = 12'h75b;
    stim[18] = 12'h1b8;
    stim[19] = 12'h011;
    stim[20] = 12'h4ed;
    stim[21] = 12'h785;
    stim[22] = 12'h33d;
    stim[23] = 12'h36c;
    stim[24] = 12'h000;
    stim[25] = 12'h58c;
    stim[26] = 12'h3ff;
    stim[27] = 12'h3f6;
    stim[28] = 12'h650;
    stim[29] = 12'h3be;
    stim[30] = 12'h09d;
    stim[31] = 12'h05b;
    stim[32] = 12'h3ab;
    stim[33] = 12'h1c3;
    stim[34] = 12'h685;
    stim[35] = 12'h72e;
    stim[36] = 12'h1db;
    stim[37] = 12'h3ad;
    stim[38] = 12'h37a;
    stim[39] = 12'h7f7;
    stim[40] = 12'h091;
    stim[41] = 12'h6bf;
    stim[42] = 12'h66b;
    stim[43] = 12'h248;
    stim[44] = 12'h28c;
    stim[45] = 12'h08e;
    stim[46] = 12'h55f;
    stim[47] = 12'h5d2;
    stim[48] = 12'h420;
    stim[49] = 12'h7f0;
    stim[50] = 12'h0cb;
    stim[51] = 12'h28c;
    stim[52] = 12'h58b;
    stim[53] = 12'h2e7;
    stim[54] = 12'h269;
    stim[55] = 12'h740;
    stim[56] = 12'h678;
    stim[57] = 12'h0a9;
    stim[58] = 12'h3ca;
    stim[59] = 12'h42e;
    stim[60] = 12'h246;
    stim[61] = 12'h676;
    stim[62] = 12'h791;
    stim[63] = 12'h49c;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h9;
      expv[6] = 4'h0;
      expv[7] = 4'hc;
      expv[8] = 4'h1;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'he;
      expv[12] = 4'h4;
      expv[13] = 4'h2;
      expv[14] = 4'h0;
      expv[15] = 4'ha;
      expv[16] = 4'h6;
      expv[17] = 4'h7;
      expv[18] = 4'h9;
      expv[19] = 4'h6;
      expv[20] = 4'hf;
      expv[21] = 4'ha;
      expv[22] = 4'he;
      expv[23] = 4'h2;
      expv[24] = 4'he;
      expv[25] = 4'hc;
      expv[26] = 4'hb;
      expv[27] = 4'h0;
      expv[28] = 4'ha;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h6;
      expv[32] = 4'h0;
      expv[33] = 4'h2;
      expv[34] = 4'hb;
      expv[35] = 4'h7;
      expv[36] = 4'hb;
      expv[37] = 4'ha;
      expv[38] = 4'h0;
      expv[39] = 4'hb;
      expv[40] = 4'he;
      expv[41] = 4'h6;
      expv[42] = 4'h0;
      expv[43] = 4'hf;
      expv[44] = 4'h0;
      expv[45] = 4'hd;
      expv[46] = 4'hd;
      expv[47] = 4'h4;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'ha;
      expv[51] = 4'hc;
      expv[52] = 4'hd;
      expv[53] = 4'h9;
      expv[54] = 4'h4;
      expv[55] = 4'hb;
      expv[56] = 4'h0;
      expv[57] = 4'h7;
      expv[58] = 4'h6;
      expv[59] = 4'hb;
      expv[60] = 4'hc;
      expv[61] = 4'h1;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
