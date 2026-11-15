// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_112613 dut (
    .clk(clk),
    .jrst_n(in_vec[52:52]),
    .trc_ctrl(in_vec[51:36]),
    .tw(in_vec[35:0]),
    .tracemem_on(out_vec[46:46]),
    .tracemem_trcdata(out_vec[45:10]),
    .tracemem_tw(out_vec[9:9]),
    .trc_im_addr(out_vec[8:2]),
    .trc_wrap(out_vec[1:1]),
    .xbrk_wrap_traceoff(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h0e5795e1a052a7;
    stim[1] = 53'h0226278ce7887c;
    stim[2] = 53'h154f81cc093a98;
    stim[3] = 53'h1119230e49ac26;
    stim[4] = 53'h16f2430f5c030b;
    stim[5] = 53'h1e2b375e164855;
    stim[6] = 53'h1ce765efd821e1;
    stim[7] = 53'h1a30d7611c912c;
    stim[8] = 53'h1adc6987b070a7;
    stim[9] = 53'h1cfd0bdc251c1f;
    stim[10] = 53'h1a21995b295660;
    stim[11] = 53'h1a95fa832f3cc8;
    stim[12] = 53'h1c345f1acb77e5;
    stim[13] = 53'h147d59aa82701a;
    stim[14] = 53'h174201d2982893;
    stim[15] = 53'h10f25210ade54c;
    stim[16] = 53'h1d6bf9f1d93c09;
    stim[17] = 53'h1ff1bbd978eb71;
    stim[18] = 53'h1d6fbedee416dd;
    stim[19] = 53'h1db976c344723b;
    stim[20] = 53'h119c11bd783745;
    stim[21] = 53'h1f13d87ae868c6;
    stim[22] = 53'h1a0c811d78c799;
    stim[23] = 53'h1663548b2b9456;
    stim[24] = 53'h19909427caf315;
    stim[25] = 53'h1390208a87959a;
    stim[26] = 53'h15f870b5e97fba;
    stim[27] = 53'h1f6a2cf480ca77;
    stim[28] = 53'h149ddbcd976a29;
    stim[29] = 53'h19ac003a892a93;
    stim[30] = 53'h19b87b69bb0dcf;
    stim[31] = 53'h15356a7314970c;
    stim[32] = 53'h13883d149c906b;
    stim[33] = 53'h11add6b305951b;
    stim[34] = 53'h18295c3a760d53;
    stim[35] = 53'h140e647c427952;
    stim[36] = 53'h1b5747a2209195;
    stim[37] = 53'h1d2cb551552784;
    stim[38] = 53'h193f9f27e8b0f6;
    stim[39] = 53'h131504d37b1154;
    stim[40] = 53'h130358c8d1364a;
    stim[41] = 53'h12ec35e591b015;
    stim[42] = 53'h10e1016d14cf0f;
    stim[43] = 53'h1dda782dc4e6f2;
    stim[44] = 53'h1e57bd775ff09a;
    stim[45] = 53'h173e69bf4fd4b6;
    stim[46] = 53'h1b2a2b3ea0407b;
    stim[47] = 53'h16040c467c8dcf;
    stim[48] = 53'h148edce59f92bf;
    stim[49] = 53'h1e0187aea17e9f;
    stim[50] = 53'h112c3cc665c264;
    stim[51] = 53'h1f47f52e38f184;
    stim[52] = 53'h1deefa20f4b523;
    stim[53] = 53'h1d6df0762fe761;
    stim[54] = 53'h1407c9154a3846;
    stim[55] = 53'h12dd750e20bb5d;
    stim[56] = 53'h13ce3573c3d2b4;
    stim[57] = 53'h1f7d840ab6a367;
    stim[58] = 53'h166c833b650751;
    stim[59] = 53'h11b7b78594e528;
    stim[60] = 53'h1b46afb87a4227;
    stim[61] = 53'h1f9abab86d4313;
    stim[62] = 53'h18fb8055137b9e;
    stim[63] = 53'h1f6f9ed07fafe0;
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
      expv[0] = 47'hx00000000x00;
      expv[1] = 47'hx00000000x00;
      expv[2] = 47'hx00000000x00;
      expv[3] = 47'hx00000000x00;
      expv[4] = 47'hx00000000x00;
      expv[5] = 47'hx00000000x00;
      expv[6] = 47'hx00000000x00;
      expv[7] = 47'hx00000000x00;
      expv[8] = 47'hx00000000x00;
      expv[9] = 47'hx00000000x00;
      expv[10] = 47'hx00000000x00;
      expv[11] = 47'hx00000000x00;
      expv[12] = 47'hx00000000x00;
      expv[13] = 47'hx00000000x00;
      expv[14] = 47'hx00000000x00;
      expv[15] = 47'hx00000000x00;
      expv[16] = 47'hx00000000x00;
      expv[17] = 47'hx00000000x00;
      expv[18] = 47'hx00000000x00;
      expv[19] = 47'hx00000000x00;
      expv[20] = 47'hx00000000x00;
      expv[21] = 47'hx00000000x00;
      expv[22] = 47'hx00000000x00;
      expv[23] = 47'hx00000000x00;
      expv[24] = 47'hx00000000x00;
      expv[25] = 47'hx00000000x00;
      expv[26] = 47'hx00000000x00;
      expv[27] = 47'hx00000000x00;
      expv[28] = 47'hx00000000x00;
      expv[29] = 47'hx00000000x00;
      expv[30] = 47'hx00000000x00;
      expv[31] = 47'hx00000000x00;
      expv[32] = 47'hx00000000x00;
      expv[33] = 47'hx00000000x00;
      expv[34] = 47'hx00000000x00;
      expv[35] = 47'hx00000000x00;
      expv[36] = 47'hx00000000x00;
      expv[37] = 47'hx00000000x00;
      expv[38] = 47'hx00000000x00;
      expv[39] = 47'hx00000000x00;
      expv[40] = 47'hx00000000x00;
      expv[41] = 47'hx00000000x00;
      expv[42] = 47'hx00000000x00;
      expv[43] = 47'hx00000000x00;
      expv[44] = 47'hx00000000x00;
      expv[45] = 47'hx00000000x00;
      expv[46] = 47'hx00000000x00;
      expv[47] = 47'hx00000000x00;
      expv[48] = 47'hx00000000x00;
      expv[49] = 47'hx00000000x00;
      expv[50] = 47'hx00000000x00;
      expv[51] = 47'hx00000000x00;
      expv[52] = 47'hx00000000x00;
      expv[53] = 47'hx00000000x00;
      expv[54] = 47'hx00000000x00;
      expv[55] = 47'hx00000000x00;
      expv[56] = 47'hx00000000x00;
      expv[57] = 47'hx00000000x00;
      expv[58] = 47'hx00000000x00;
      expv[59] = 47'hx00000000x00;
      expv[60] = 47'hx00000000x00;
      expv[61] = 47'hx00000000x00;
      expv[62] = 47'hx00000000x00;
      expv[63] = 47'hx00000000x00;
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
