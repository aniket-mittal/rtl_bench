// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03317 dut (
    .gmii_rxclk(clk),
    .gmii_txclk(in_vec[22:22]),
    .rst_n(in_vec[21:21]),
    .port_type(in_vec[20:20]),
    .gmii_rx_dv(in_vec[19:19]),
    .gmii_rx_er(in_vec[18:18]),
    .gmii_rxd(in_vec[17:10]),
    .gmii_tx_en_tsnchip2adp(in_vec[9:9]),
    .gmii_tx_er_tsnchip2adp(in_vec[8:8]),
    .gmii_txd_tsnchip2adp(in_vec[7:0]),
    .gmii_rx_dv_adp2tsnchip(out_vec[19:19]),
    .gmii_rx_er_adp2tsnchip(out_vec[18:18]),
    .gmii_rxd_adp2tsnchip(out_vec[17:10]),
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
    stim[0] = 23'h48a341;
    stim[1] = 23'h0cf1d5;
    stim[2] = 23'h62b229;
    stim[3] = 23'h3c7468;
    stim[4] = 23'h3d5663;
    stim[5] = 23'h79658c;
    stim[6] = 23'h3c4eea;
    stim[7] = 23'h77e7e9;
    stim[8] = 23'h74af05;
    stim[9] = 23'h6c74da;
    stim[10] = 23'h77bade;
    stim[11] = 23'h365c2b;
    stim[12] = 23'h3082d2;
    stim[13] = 23'h7bf1d4;
    stim[14] = 23'h28fcff;
    stim[15] = 23'h689f3a;
    stim[16] = 23'h250243;
    stim[17] = 23'h2d288c;
    stim[18] = 23'h30a5e8;
    stim[19] = 23'h65ebb0;
    stim[20] = 23'h387e6e;
    stim[21] = 23'h620938;
    stim[22] = 23'h34f500;
    stim[23] = 23'h3cd72c;
    stim[24] = 23'h66c802;
    stim[25] = 23'h3100c2;
    stim[26] = 23'h74c936;
    stim[27] = 23'h37a123;
    stim[28] = 23'h20c12e;
    stim[29] = 23'h6a6dce;
    stim[30] = 23'h79501e;
    stim[31] = 23'h28393c;
    stim[32] = 23'h786f3e;
    stim[33] = 23'h6a4b95;
    stim[34] = 23'h7fbbcf;
    stim[35] = 23'h3092df;
    stim[36] = 23'h3a4652;
    stim[37] = 23'h6fb4a3;
    stim[38] = 23'h353fed;
    stim[39] = 23'h3ed4b1;
    stim[40] = 23'h37f5da;
    stim[41] = 23'h32b809;
    stim[42] = 23'h703df3;
    stim[43] = 23'h6d2454;
    stim[44] = 23'h319095;
    stim[45] = 23'h6cac83;
    stim[46] = 23'h363180;
    stim[47] = 23'h654608;
    stim[48] = 23'h21ab66;
    stim[49] = 23'h7711ce;
    stim[50] = 23'h6707a0;
    stim[51] = 23'h295344;
    stim[52] = 23'h369fc4;
    stim[53] = 23'h75203e;
    stim[54] = 23'h75f60f;
    stim[55] = 23'h32c6a3;
    stim[56] = 23'h3156f9;
    stim[57] = 23'h6be7ae;
    stim[58] = 23'h76a7f7;
    stim[59] = 23'h719591;
    stim[60] = 23'h7befe4;
    stim[61] = 23'h364437;
    stim[62] = 23'h700e62;
    stim[63] = 23'h2532da;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00229;
      expv[3] = 20'h00229;
      expv[4] = 20'hc7629;
      expv[5] = 20'hd558c;
      expv[6] = 20'h9658c;
      expv[7] = 20'hc4fe9;
      expv[8] = 20'h7e7e9;
      expv[9] = 20'h4afe9;
      expv[10] = 20'h003e9;
      expv[11] = 20'h7bbe9;
      expv[12] = 20'h65fe9;
      expv[13] = 20'h081d4;
      expv[14] = 20'hbf1d4;
      expv[15] = 20'h0033a;
      expv[16] = 20'h0033a;
      expv[17] = 20'h0033a;
      expv[18] = 20'h0033a;
      expv[19] = 20'h0a7b0;
      expv[20] = 20'h003b0;
      expv[21] = 20'h87d38;
      expv[22] = 20'h00138;
      expv[23] = 20'h4f538;
      expv[24] = 20'hcd402;
      expv[25] = 20'h00002;
      expv[26] = 20'h10136;
      expv[27] = 20'h4c936;
      expv[28] = 20'h7a136;
      expv[29] = 20'h001ce;
      expv[30] = 20'h001ce;
      expv[31] = 20'h951ce;
      expv[32] = 20'h0033e;
      expv[33] = 20'h86f3e;
      expv[34] = 20'h0033e;
      expv[35] = 20'hfbb3e;
      expv[36] = 20'h0933e;
      expv[37] = 20'ha44a3;
      expv[38] = 20'h000a3;
      expv[39] = 20'h53ca3;
      expv[40] = 20'hed4a3;
      expv[41] = 20'h7f4a3;
      expv[42] = 20'h2b9f3;
      expv[43] = 20'h03df3;
      expv[44] = 20'h001f3;
      expv[45] = 20'h19083;
      expv[46] = 20'h00083;
      expv[47] = 20'h63208;
      expv[48] = 20'h00208;
      expv[49] = 20'h001ce;
      expv[50] = 20'h711ce;
      expv[51] = 20'h001ce;
      expv[52] = 20'h001ce;
      expv[53] = 20'h69c3e;
      expv[54] = 20'h5203e;
      expv[55] = 20'h5f43e;
      expv[56] = 20'h2c43e;
      expv[57] = 20'h157ae;
      expv[58] = 20'h003ae;
      expv[59] = 20'h6a7ae;
      expv[60] = 20'h197ae;
      expv[61] = 20'hbefae;
      expv[62] = 20'h64662;
      expv[63] = 20'h00e62;
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
