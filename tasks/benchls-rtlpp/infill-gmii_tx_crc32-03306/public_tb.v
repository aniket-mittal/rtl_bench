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

  rtlpp_03306 dut (
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
    stim[0] = 11'h2f7;
    stim[1] = 11'h1d9;
    stim[2] = 11'h475;
    stim[3] = 11'h718;
    stim[4] = 11'h705;
    stim[5] = 11'h7ea;
    stim[6] = 11'h505;
    stim[7] = 11'h65b;
    stim[8] = 11'h799;
    stim[9] = 11'h415;
    stim[10] = 11'h5d1;
    stim[11] = 11'h529;
    stim[12] = 11'h79b;
    stim[13] = 11'h615;
    stim[14] = 11'h52a;
    stim[15] = 11'h542;
    stim[16] = 11'h7c6;
    stim[17] = 11'h6a6;
    stim[18] = 11'h5d1;
    stim[19] = 11'h53d;
    stim[20] = 11'h754;
    stim[21] = 11'h76e;
    stim[22] = 11'h550;
    stim[23] = 11'h6cb;
    stim[24] = 11'h58f;
    stim[25] = 11'h7d5;
    stim[26] = 11'h7ef;
    stim[27] = 11'h48d;
    stim[28] = 11'h418;
    stim[29] = 11'h42a;
    stim[30] = 11'h7a2;
    stim[31] = 11'h45a;
    stim[32] = 11'h7ec;
    stim[33] = 11'h433;
    stim[34] = 11'h48a;
    stim[35] = 11'h561;
    stim[36] = 11'h47e;
    stim[37] = 11'h49b;
    stim[38] = 11'h525;
    stim[39] = 11'h756;
    stim[40] = 11'h704;
    stim[41] = 11'h6a3;
    stim[42] = 11'h6f3;
    stim[43] = 11'h723;
    stim[44] = 11'h3e6;
    stim[45] = 11'h555;
    stim[46] = 11'h6b5;
    stim[47] = 11'h694;
    stim[48] = 11'h409;
    stim[49] = 11'h590;
    stim[50] = 11'h5ba;
    stim[51] = 11'h545;
    stim[52] = 11'h56c;
    stim[53] = 11'h6fe;
    stim[54] = 11'h62b;
    stim[55] = 11'h5a7;
    stim[56] = 11'h586;
    stim[57] = 11'h5d3;
    stim[58] = 11'h5ed;
    stim[59] = 11'h448;
    stim[60] = 11'h57e;
    stim[61] = 11'h76a;
    stim[62] = 11'h7ad;
    stim[63] = 11'h640;
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
      expv[4] = 10'h318;
      expv[5] = 10'h305;
      expv[6] = 10'h3ea;
      expv[7] = 10'h105;
      expv[8] = 10'h25b;
      expv[9] = 10'h399;
      expv[10] = 10'h015;
      expv[11] = 10'h1d1;
      expv[12] = 10'h129;
      expv[13] = 10'h39b;
      expv[14] = 10'h215;
      expv[15] = 10'h12a;
      expv[16] = 10'h142;
      expv[17] = 10'h3c6;
      expv[18] = 10'h2a6;
      expv[19] = 10'h1d1;
      expv[20] = 10'h13d;
      expv[21] = 10'h354;
      expv[22] = 10'h36e;
      expv[23] = 10'h150;
      expv[24] = 10'h2cb;
      expv[25] = 10'h18f;
      expv[26] = 10'h3d5;
      expv[27] = 10'h3ef;
      expv[28] = 10'h38f;
      expv[29] = 10'h3db;
      expv[30] = 10'h311;
      expv[31] = 10'h34c;
      expv[32] = 10'h000;
      expv[33] = 10'h3ec;
      expv[34] = 10'h033;
      expv[35] = 10'h08a;
      expv[36] = 10'h161;
      expv[37] = 10'h07e;
      expv[38] = 10'h09b;
      expv[39] = 10'h125;
      expv[40] = 10'h356;
      expv[41] = 10'h304;
      expv[42] = 10'h2a3;
      expv[43] = 10'h2f3;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h2b5;
      expv[48] = 10'h294;
      expv[49] = 10'h009;
      expv[50] = 10'h190;
      expv[51] = 10'h1ba;
      expv[52] = 10'h145;
      expv[53] = 10'h16c;
      expv[54] = 10'h2fe;
      expv[55] = 10'h22b;
      expv[56] = 10'h1a7;
      expv[57] = 10'h186;
      expv[58] = 10'h1d3;
      expv[59] = 10'h1ed;
      expv[60] = 10'h048;
      expv[61] = 10'h17e;
      expv[62] = 10'h36a;
      expv[63] = 10'h3ad;
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
