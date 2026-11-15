// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09017 dut (
    .clk_i(clk),
    .rstn_i(in_vec[70:70]),
    .sys_addr(in_vec[69:38]),
    .sys_wdata(in_vec[37:6]),
    .sys_sel(in_vec[5:2]),
    .sys_wen(in_vec[1:1]),
    .sys_ren(in_vec[0:0]),
    .dac_a_o(out_vec[129:106]),
    .dac_b_o(out_vec[105:82]),
    .dac_c_o(out_vec[81:58]),
    .dac_d_o(out_vec[57:34]),
    .sys_rdata(out_vec[33:2]),
    .sys_err(out_vec[1:1]),
    .sys_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h58a131c2773acdfe5f;
    stim[1] = 71'h54f1f5bf32b8cbad7a;
    stim[2] = 71'h1e31e4733b31e36322;
    stim[3] = 71'h5cbad6c0da54352b2b;
    stim[4] = 71'h294ed664efe0a86b44;
    stim[5] = 71'h29972e79e55bb01e7e;
    stim[6] = 71'h1490cbd74e08741482;
    stim[7] = 71'h20751cf2fceba09bff;
    stim[8] = 71'h2d497d6b540e2d0e52;
    stim[9] = 71'h2d68b5a56a3ff51666;
    stim[10] = 71'h0f84c5c5674bc1f13e;
    stim[11] = 71'h0c7b612b0409708cbd;
    stim[12] = 71'h3ad76a25d6001d2a95;
    stim[13] = 71'h222d146fbba4ee6c06;
    stim[14] = 71'h2520189815f4ee9fe6;
    stim[15] = 71'h6ef9fe87fab02a6432;
    stim[16] = 71'h25596e1e95ed50280c;
    stim[17] = 71'h2300b72b7e348ed744;
    stim[18] = 71'h2e9c2ee78ecb95a104;
    stim[19] = 71'h2ccb86ea15a7f36afe;
    stim[20] = 71'h21c171bab9f1d84d9f;
    stim[21] = 71'h097731d655f3c9ede6;
    stim[22] = 71'h2a2257cf2ea3f8ef2d;
    stim[23] = 71'h0829f038534c7d62a5;
    stim[24] = 71'h1504f5d56ce7d3f530;
    stim[25] = 71'h1476e3882c6be147f3;
    stim[26] = 71'h1cf40cb7b49b7ab00d;
    stim[27] = 71'h0962cabce2c597dde0;
    stim[28] = 71'h234a24b1e60d99c17d;
    stim[29] = 71'h0d9aa29d4cb4e60905;
    stim[30] = 71'h161346b2fe766cb821;
    stim[31] = 71'h3353b6dfca38c28449;
    stim[32] = 71'h07ac56a37de66378eb;
    stim[33] = 71'h3db75989bf8dd80705;
    stim[34] = 71'h3ad2d435cb39382111;
    stim[35] = 71'h0c7ffdb1a4e3ba79d0;
    stim[36] = 71'h10901b848a34649138;
    stim[37] = 71'h1d1d433549cd70a942;
    stim[38] = 71'h051729acf15eda5881;
    stim[39] = 71'h26f0588344cf522629;
    stim[40] = 71'h378618de1ff14794de;
    stim[41] = 71'h662214bf77fe521f08;
    stim[42] = 71'h27326ef8d583509b22;
    stim[43] = 71'h07f9c06e9e378f47af;
    stim[44] = 71'h3bbe852c9f0a81b5af;
    stim[45] = 71'h170e36ad540582bbdf;
    stim[46] = 71'h36c89567ecd9eab8de;
    stim[47] = 71'h22f3b77cc81f3013c2;
    stim[48] = 71'h02a99ffc6dcc6a5848;
    stim[49] = 71'h2ee792358c9a999556;
    stim[50] = 71'h2e934cf419a745ffd1;
    stim[51] = 71'h0dfd468f3f2ba8662d;
    stim[52] = 71'h39e9346b832dbf2d9e;
    stim[53] = 71'h0fc68f9c2902645b5d;
    stim[54] = 71'h334ea9299982d33faa;
    stim[55] = 71'h391956c30a6866e539;
    stim[56] = 71'h10d798a94b91162f48;
    stim[57] = 71'h1edd1bebc820b3839f;
    stim[58] = 71'h350d8218312db7797b;
    stim[59] = 71'h2ed4859a0ec04c5793;
    stim[60] = 71'h249a2bc23df1c2b645;
    stim[61] = 71'h215a2cb63620d39899;
    stim[62] = 71'h0dc3c2e43b3bc66f8a;
    stim[63] = 71'h3a23a61596626f2428;
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
      expv[0] = 130'h03c0001380001d4000270000xxxxxxxxx;
      expv[1] = 130'h03c0001380001d4000270000000000001;
      expv[2] = 130'h03c0001380001d4000270000000000000;
      expv[3] = 130'h03c0001380001d4000270000000000000;
      expv[4] = 130'h03c0001380001d4000270000000000000;
      expv[5] = 130'h03c0001380001d4000270000000000000;
      expv[6] = 130'h03c0001380001d4000270000000000000;
      expv[7] = 130'h03c0001380001d4000270000000000000;
      expv[8] = 130'h03c0001380001d4000270000000000000;
      expv[9] = 130'h03c0001380001d4000270000000000000;
      expv[10] = 130'h03c0001380001d4000270000000000000;
      expv[11] = 130'h03c0001380001d4000270000000000000;
      expv[12] = 130'h03c0001380001d4000270000000000000;
      expv[13] = 130'h03c0001380001d4000270000000000000;
      expv[14] = 130'h03c0001380001d4000270000000000000;
      expv[15] = 130'h03c0001380001d4000270000000000000;
      expv[16] = 130'h03c0001380001d4000270000000000000;
      expv[17] = 130'h03c0001380001d4000270000000000000;
      expv[18] = 130'h03c0001380001d4000270000000000000;
      expv[19] = 130'h03c0001380001d4000270000000000000;
      expv[20] = 130'h03c0001380001d4000270000000000000;
      expv[21] = 130'h03c0001380001d4000270000000000000;
      expv[22] = 130'h03c0001380001d4000270000000000000;
      expv[23] = 130'h03c0001380001d4000270000000000000;
      expv[24] = 130'h03c0001380001d4000270000000000000;
      expv[25] = 130'h03c0001380001d4000270000000000000;
      expv[26] = 130'h03c0001380001d4000270000000000000;
      expv[27] = 130'h03c0001380001d4000270000000000000;
      expv[28] = 130'h03c0001380001d4000270000000000000;
      expv[29] = 130'h03c0001380001d4000270000000000000;
      expv[30] = 130'h03c0001380001d4000270000000000000;
      expv[31] = 130'h03c0001380001d4000270000000000000;
      expv[32] = 130'h03c0001380001d4000270000000000000;
      expv[33] = 130'h03c0001380001d4000270000000000000;
      expv[34] = 130'h03c0001380001d4000270000000000000;
      expv[35] = 130'h03c0001380001d4000270000000000000;
      expv[36] = 130'h03c0001380001d4000270000000000000;
      expv[37] = 130'h03c0001380001d4000270000000000000;
      expv[38] = 130'h03c0001380001d4000270000000000000;
      expv[39] = 130'h03c0001380001d4000270000000000000;
      expv[40] = 130'h03c0001380001d4000270000000000000;
      expv[41] = 130'h03c0001380001d4000270000000000000;
      expv[42] = 130'h03c0001380001d4000270000000000000;
      expv[43] = 130'h03c0001380001d4000270000000000000;
      expv[44] = 130'h03c0001380001d4000270000000000000;
      expv[45] = 130'h03c0001380001d4000270000000000000;
      expv[46] = 130'h03c0001380001d4000270000000000000;
      expv[47] = 130'h03c0001380001d4000270000000000000;
      expv[48] = 130'h03c0001380001d4000270000000000000;
      expv[49] = 130'h03c0001380001d4000270000000000000;
      expv[50] = 130'h03c0001380001d4000270000000000000;
      expv[51] = 130'h03c0001380001d4000270000000000000;
      expv[52] = 130'h03c0001380001d4000270000000000000;
      expv[53] = 130'h03c0001380001d4000270000000000000;
      expv[54] = 130'h03c0001380001d4000270000000000000;
      expv[55] = 130'h03c0001380001d4000270000000000000;
      expv[56] = 130'h03c0001380001d4000270000000000000;
      expv[57] = 130'h03c0001380001d4000270000000000000;
      expv[58] = 130'h03c0001380001d4000270000000000000;
      expv[59] = 130'h03c0001380001d4000270000000000000;
      expv[60] = 130'h03c0001380001d4000270000000000000;
      expv[61] = 130'h03c0001380001d4000270000000000000;
      expv[62] = 130'h03c0001380001d4000270000000000000;
      expv[63] = 130'h03c0001380001d4000270000000000000;
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
