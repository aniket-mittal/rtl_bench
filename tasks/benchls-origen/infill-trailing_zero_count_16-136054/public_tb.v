// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136054 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .data_in(in_vec[15:0]),
    .count_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h11aa1;
    stim[1] = 17'h1dba2;
    stim[2] = 17'h0d02a;
    stim[3] = 17'h0667b;
    stim[4] = 17'h0afcd;
    stim[5] = 17'h0f3ba;
    stim[6] = 17'h0ee4f;
    stim[7] = 17'h01a10;
    stim[8] = 17'h09722;
    stim[9] = 17'h0864f;
    stim[10] = 17'h0ae30;
    stim[11] = 17'h080b8;
    stim[12] = 17'h01489;
    stim[13] = 17'h05ceb;
    stim[14] = 17'h0ac73;
    stim[15] = 17'h0ead3;
    stim[16] = 17'h0523e;
    stim[17] = 17'h0e035;
    stim[18] = 17'h0a476;
    stim[19] = 17'h08e57;
    stim[20] = 17'h0ac3b;
    stim[21] = 17'h0ce3f;
    stim[22] = 17'h0800c;
    stim[23] = 17'h005cd;
    stim[24] = 17'h06a43;
    stim[25] = 17'h0fca1;
    stim[26] = 17'h01fb7;
    stim[27] = 17'h0c3d1;
    stim[28] = 17'h06909;
    stim[29] = 17'h178b5;
    stim[30] = 17'h04fc3;
    stim[31] = 17'h04ca8;
    stim[32] = 17'h140e1;
    stim[33] = 17'h037a5;
    stim[34] = 17'h0075f;
    stim[35] = 17'h05f99;
    stim[36] = 17'h0e5ad;
    stim[37] = 17'h00a4f;
    stim[38] = 17'h0a4ab;
    stim[39] = 17'h0b4ff;
    stim[40] = 17'h0b250;
    stim[41] = 17'h05491;
    stim[42] = 17'h02160;
    stim[43] = 17'h07ddc;
    stim[44] = 17'h0702d;
    stim[45] = 17'h0e031;
    stim[46] = 17'h02255;
    stim[47] = 17'h02bf8;
    stim[48] = 17'h0734c;
    stim[49] = 17'h09ca6;
    stim[50] = 17'h042d7;
    stim[51] = 17'h035e5;
    stim[52] = 17'h04651;
    stim[53] = 17'h1b13a;
    stim[54] = 17'h0d5be;
    stim[55] = 17'h09306;
    stim[56] = 17'h01fae;
    stim[57] = 17'h00ee6;
    stim[58] = 17'h02a1c;
    stim[59] = 17'h0bfe2;
    stim[60] = 17'h02692;
    stim[61] = 17'h09198;
    stim[62] = 17'h1ac1e;
    stim[63] = 17'h08a82;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h01;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h01;
      expv[10] = 5'h00;
      expv[11] = 5'h04;
      expv[12] = 5'h01;
      expv[13] = 5'h00;
      expv[14] = 5'h04;
      expv[15] = 5'h03;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h01;
      expv[21] = 5'h00;
      expv[22] = 5'h01;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h02;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h04;
      expv[45] = 5'h00;
      expv[46] = 5'h05;
      expv[47] = 5'h02;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h03;
      expv[52] = 5'h02;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h01;
      expv[59] = 5'h01;
      expv[60] = 5'h01;
      expv[61] = 5'h01;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
