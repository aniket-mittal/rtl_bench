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

  rtlpp_03305 dut (
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
    stim[0] = 11'h3bd;
    stim[1] = 11'h164;
    stim[2] = 11'h575;
    stim[3] = 11'h5c5;
    stim[4] = 11'h6a0;
    stim[5] = 11'h79e;
    stim[6] = 11'h6d1;
    stim[7] = 11'h56f;
    stim[8] = 11'h6e9;
    stim[9] = 11'h651;
    stim[10] = 11'h12e;
    stim[11] = 11'h567;
    stim[12] = 11'h62f;
    stim[13] = 11'h6a8;
    stim[14] = 11'h6ab;
    stim[15] = 11'h433;
    stim[16] = 11'h58c;
    stim[17] = 11'h7cf;
    stim[18] = 11'h706;
    stim[19] = 11'h611;
    stim[20] = 11'h733;
    stim[21] = 11'h5b8;
    stim[22] = 11'h758;
    stim[23] = 11'h75f;
    stim[24] = 11'h7f2;
    stim[25] = 11'h65c;
    stim[26] = 11'h4a6;
    stim[27] = 11'h4ad;
    stim[28] = 11'h6b3;
    stim[29] = 11'h5de;
    stim[30] = 11'h595;
    stim[31] = 11'h52e;
    stim[32] = 11'h56c;
    stim[33] = 11'h7f4;
    stim[34] = 11'h74b;
    stim[35] = 11'h724;
    stim[36] = 11'h4ec;
    stim[37] = 11'h6a6;
    stim[38] = 11'h73d;
    stim[39] = 11'h4a9;
    stim[40] = 11'h6fa;
    stim[41] = 11'h495;
    stim[42] = 11'h635;
    stim[43] = 11'h75e;
    stim[44] = 11'h713;
    stim[45] = 11'h74d;
    stim[46] = 11'h4c8;
    stim[47] = 11'h438;
    stim[48] = 11'h65f;
    stim[49] = 11'h731;
    stim[50] = 11'h48a;
    stim[51] = 11'h494;
    stim[52] = 11'h52b;
    stim[53] = 11'h41e;
    stim[54] = 11'h7de;
    stim[55] = 11'h78b;
    stim[56] = 11'h416;
    stim[57] = 11'h5c2;
    stim[58] = 11'h7ca;
    stim[59] = 11'h695;
    stim[60] = 11'h548;
    stim[61] = 11'h4c9;
    stim[62] = 11'h441;
    stim[63] = 11'h050;
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
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h2a0;
      expv[6] = 10'h39e;
      expv[7] = 10'h2d1;
      expv[8] = 10'h16f;
      expv[9] = 10'h2e9;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h22f;
      expv[14] = 10'h2a8;
      expv[15] = 10'h2ab;
      expv[16] = 10'h033;
      expv[17] = 10'h18c;
      expv[18] = 10'h3cf;
      expv[19] = 10'h306;
      expv[20] = 10'h211;
      expv[21] = 10'h333;
      expv[22] = 10'h1b8;
      expv[23] = 10'h358;
      expv[24] = 10'h35f;
      expv[25] = 10'h3f2;
      expv[26] = 10'h25c;
      expv[27] = 10'h0a6;
      expv[28] = 10'h0ad;
      expv[29] = 10'h2b3;
      expv[30] = 10'h1de;
      expv[31] = 10'h195;
      expv[32] = 10'h12e;
      expv[33] = 10'h16c;
      expv[34] = 10'h3f4;
      expv[35] = 10'h34b;
      expv[36] = 10'h324;
      expv[37] = 10'h0ec;
      expv[38] = 10'h2a6;
      expv[39] = 10'h33d;
      expv[40] = 10'h0a9;
      expv[41] = 10'h2fa;
      expv[42] = 10'h095;
      expv[43] = 10'h235;
      expv[44] = 10'h35e;
      expv[45] = 10'h313;
      expv[46] = 10'h34d;
      expv[47] = 10'h0c8;
      expv[48] = 10'h038;
      expv[49] = 10'h25f;
      expv[50] = 10'h331;
      expv[51] = 10'h08a;
      expv[52] = 10'h094;
      expv[53] = 10'h12b;
      expv[54] = 10'h01e;
      expv[55] = 10'h3de;
      expv[56] = 10'h38b;
      expv[57] = 10'h016;
      expv[58] = 10'h1c2;
      expv[59] = 10'h3ca;
      expv[60] = 10'h295;
      expv[61] = 10'h148;
      expv[62] = 10'h0c9;
      expv[63] = 10'h000;
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
