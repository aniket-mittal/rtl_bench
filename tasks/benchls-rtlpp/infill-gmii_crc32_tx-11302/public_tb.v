// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11302 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .ppt2gtc_gmii_dv(in_vec[9:9]),
    .ppt2gtc_gmii_er(in_vec[8:8]),
    .ppt2gtc_gmii_data(in_vec[7:0]),
    .gmii_tx_en(out_vec[9:9]),
    .gmii_tx_er(out_vec[8:8]),
    .gmii_txd(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h155;
    stim[1] = 11'h0f1;
    stim[2] = 11'h72a;
    stim[3] = 11'h589;
    stim[4] = 11'h718;
    stim[5] = 11'h471;
    stim[6] = 11'h5cf;
    stim[7] = 11'h359;
    stim[8] = 11'h627;
    stim[9] = 11'h6ea;
    stim[10] = 11'h561;
    stim[11] = 11'h6a0;
    stim[12] = 11'h431;
    stim[13] = 11'h542;
    stim[14] = 11'h6bd;
    stim[15] = 11'h5db;
    stim[16] = 11'h718;
    stim[17] = 11'h447;
    stim[18] = 11'h533;
    stim[19] = 11'h7b2;
    stim[20] = 11'h5ef;
    stim[21] = 11'h4cb;
    stim[22] = 11'h7ff;
    stim[23] = 11'h50f;
    stim[24] = 11'h568;
    stim[25] = 11'h7cf;
    stim[26] = 11'h69b;
    stim[27] = 11'h6b8;
    stim[28] = 11'h4c4;
    stim[29] = 11'h686;
    stim[30] = 11'h58f;
    stim[31] = 11'h464;
    stim[32] = 11'h5bc;
    stim[33] = 11'h68d;
    stim[34] = 11'h7b3;
    stim[35] = 11'h56f;
    stim[36] = 11'h4fe;
    stim[37] = 11'h760;
    stim[38] = 11'h6a0;
    stim[39] = 11'h550;
    stim[40] = 11'h5dd;
    stim[41] = 11'h60a;
    stim[42] = 11'h7ac;
    stim[43] = 11'h7dd;
    stim[44] = 11'h799;
    stim[45] = 11'h463;
    stim[46] = 11'h704;
    stim[47] = 11'h71d;
    stim[48] = 11'h57f;
    stim[49] = 11'h7e7;
    stim[50] = 11'h4b6;
    stim[51] = 11'h6c0;
    stim[52] = 11'h167;
    stim[53] = 11'h278;
    stim[54] = 11'h618;
    stim[55] = 11'h55d;
    stim[56] = 11'h615;
    stim[57] = 11'h718;
    stim[58] = 11'h7a5;
    stim[59] = 11'h455;
    stim[60] = 11'h4ab;
    stim[61] = 11'h67a;
    stim[62] = 11'h595;
    stim[63] = 11'h4bd;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h32a;
      expv[4] = 10'h189;
      expv[5] = 10'h318;
      expv[6] = 10'h071;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h227;
      expv[10] = 10'h2ea;
      expv[11] = 10'h161;
      expv[12] = 10'h2a0;
      expv[13] = 10'h031;
      expv[14] = 10'h142;
      expv[15] = 10'h2bd;
      expv[16] = 10'h1db;
      expv[17] = 10'h318;
      expv[18] = 10'h047;
      expv[19] = 10'h133;
      expv[20] = 10'h3b2;
      expv[21] = 10'h1ef;
      expv[22] = 10'h0cb;
      expv[23] = 10'h3ff;
      expv[24] = 10'h10f;
      expv[25] = 10'h168;
      expv[26] = 10'h3cf;
      expv[27] = 10'h29b;
      expv[28] = 10'h2b8;
      expv[29] = 10'h0c4;
      expv[30] = 10'h286;
      expv[31] = 10'h18f;
      expv[32] = 10'h064;
      expv[33] = 10'h1bc;
      expv[34] = 10'h28d;
      expv[35] = 10'h3b3;
      expv[36] = 10'h16f;
      expv[37] = 10'h0fe;
      expv[38] = 10'h360;
      expv[39] = 10'h2a0;
      expv[40] = 10'h150;
      expv[41] = 10'h1dd;
      expv[42] = 10'h20a;
      expv[43] = 10'h3ac;
      expv[44] = 10'h3dd;
      expv[45] = 10'h399;
      expv[46] = 10'h063;
      expv[47] = 10'h304;
      expv[48] = 10'h31d;
      expv[49] = 10'h17f;
      expv[50] = 10'h3e7;
      expv[51] = 10'h0b6;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h218;
      expv[56] = 10'h15d;
      expv[57] = 10'h215;
      expv[58] = 10'h318;
      expv[59] = 10'h3a5;
      expv[60] = 10'h055;
      expv[61] = 10'h0ab;
      expv[62] = 10'h27a;
      expv[63] = 10'h195;
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
