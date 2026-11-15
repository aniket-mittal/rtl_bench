// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05510 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h1ccd10;
    stim[1] = 22'h302313;
    stim[2] = 22'h2a3c60;
    stim[3] = 22'h2a86e7;
    stim[4] = 22'h361cbc;
    stim[5] = 22'h0b5cc8;
    stim[6] = 22'h220efe;
    stim[7] = 22'h138ed8;
    stim[8] = 22'h3e1b4d;
    stim[9] = 22'h1f0220;
    stim[10] = 22'h32c6d2;
    stim[11] = 22'h234d7b;
    stim[12] = 22'h3ebc3f;
    stim[13] = 22'h1fc0ce;
    stim[14] = 22'h03154a;
    stim[15] = 22'h227762;
    stim[16] = 22'h13577a;
    stim[17] = 22'h2f5263;
    stim[18] = 22'h3b6e87;
    stim[19] = 22'h2310e1;
    stim[20] = 22'h2e09f9;
    stim[21] = 22'h0ef91a;
    stim[22] = 22'h3ae29d;
    stim[23] = 22'h026169;
    stim[24] = 22'h17a1c0;
    stim[25] = 22'h151c8e;
    stim[26] = 22'h07c631;
    stim[27] = 22'h3249ad;
    stim[28] = 22'h0b75ee;
    stim[29] = 22'h1691d8;
    stim[30] = 22'h1e27f6;
    stim[31] = 22'h08e8ee;
    stim[32] = 22'h2241bd;
    stim[33] = 22'h3bf9c1;
    stim[34] = 22'h1bbe5c;
    stim[35] = 22'h02a037;
    stim[36] = 22'h27c78b;
    stim[37] = 22'h1bcb06;
    stim[38] = 22'h029fdd;
    stim[39] = 22'h0fe4fb;
    stim[40] = 22'h07f2ed;
    stim[41] = 22'h3fafc3;
    stim[42] = 22'h1fe1e2;
    stim[43] = 22'h0e911e;
    stim[44] = 22'h3fd8c2;
    stim[45] = 22'h028c90;
    stim[46] = 22'h039fd7;
    stim[47] = 22'h2ee1f3;
    stim[48] = 22'h36deba;
    stim[49] = 22'h2f9993;
    stim[50] = 22'h26cb9a;
    stim[51] = 22'h3624c1;
    stim[52] = 22'h0f0f32;
    stim[53] = 22'h1ba34f;
    stim[54] = 22'h333196;
    stim[55] = 22'h1e2308;
    stim[56] = 22'h36ada8;
    stim[57] = 22'h133ec9;
    stim[58] = 22'h2e7921;
    stim[59] = 22'h1e32fe;
    stim[60] = 22'h1e7f5e;
    stim[61] = 22'h362cd1;
    stim[62] = 22'h16a17d;
    stim[63] = 22'h339119;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h0c34f;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h0c34f;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00002;
      expv[47] = 17'h00002;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h0c34c;
      expv[52] = 17'h00000;
      expv[53] = 17'h0000e;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h0c34f;
      expv[59] = 17'h00000;
      expv[60] = 17'h02308;
      expv[61] = 17'h032fe;
      expv[62] = 17'h00000;
      expv[63] = 17'h0c34f;
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
