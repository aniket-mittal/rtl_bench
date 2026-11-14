// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204122 dut (
    .aclk(clk),
    .aresetn(in_vec[21:21]),
    .gmii_rxd(in_vec[20:13]),
    .gmii_rxdv(in_vec[12:12]),
    .gmii_rxer(in_vec[11:11]),
    .rx_tready(in_vec[10:10]),
    .tx_tdata(in_vec[9:2]),
    .tx_tvalid(in_vec[1:1]),
    .tx_tlast(in_vec[0:0]),
    .rx_tdata(out_vec[20:13]),
    .rx_tvalid(out_vec[12:12]),
    .rx_tlast(out_vec[11:11]),
    .tx_tready(out_vec[10:10]),
    .gmii_txd(out_vec[9:2]),
    .gmii_txen(out_vec[1:1]),
    .gmii_txer(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h11aec5;
    stim[1] = 22'h1de3c2;
    stim[2] = 22'h33100d;
    stim[3] = 22'h3c8216;
    stim[4] = 22'h2d9e6d;
    stim[5] = 22'h2cbb32;
    stim[6] = 22'h28f384;
    stim[7] = 22'h31bf9a;
    stim[8] = 22'h3cd5f1;
    stim[9] = 22'h34aea1;
    stim[10] = 22'h2f8882;
    stim[11] = 22'h33fd60;
    stim[12] = 22'h234aa7;
    stim[13] = 22'h33f6fe;
    stim[14] = 22'h35ddd6;
    stim[15] = 22'h2935e6;
    stim[16] = 22'h31421a;
    stim[17] = 22'h223382;
    stim[18] = 22'h2f607e;
    stim[19] = 22'h2d4516;
    stim[20] = 22'h3380ee;
    stim[21] = 22'h245717;
    stim[22] = 22'h3573bb;
    stim[23] = 22'h3b4e3e;
    stim[24] = 22'h33df5e;
    stim[25] = 22'h3e5016;
    stim[26] = 22'h2eb28d;
    stim[27] = 22'h3de3a0;
    stim[28] = 22'h2f573c;
    stim[29] = 22'h2d96c4;
    stim[30] = 22'h3ed29d;
    stim[31] = 22'h21406f;
    stim[32] = 22'h20f5e1;
    stim[33] = 22'h3639e1;
    stim[34] = 22'h262d0f;
    stim[35] = 22'h21fb86;
    stim[36] = 22'h28e815;
    stim[37] = 22'h07ff42;
    stim[38] = 22'h2374a2;
    stim[39] = 22'h323cc4;
    stim[40] = 22'h2bbbe5;
    stim[41] = 22'h3642b7;
    stim[42] = 22'h307219;
    stim[43] = 22'h2b70aa;
    stim[44] = 22'h2da98d;
    stim[45] = 22'h3fded2;
    stim[46] = 22'h3b055b;
    stim[47] = 22'h38663c;
    stim[48] = 22'h3a231a;
    stim[49] = 22'h29ca24;
    stim[50] = 22'h3eb7ae;
    stim[51] = 22'h2f8296;
    stim[52] = 22'h3fc25f;
    stim[53] = 22'h30e599;
    stim[54] = 22'h37c30a;
    stim[55] = 22'h23f286;
    stim[56] = 22'h38dd48;
    stim[57] = 22'h2f9738;
    stim[58] = 22'h39fc38;
    stim[59] = 22'h21a93b;
    stim[60] = 22'h33ed6b;
    stim[61] = 22'h39ee13;
    stim[62] = 22'h2bd4bc;
    stim[63] = 22'h2b4b68;
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
      expv[0] = 21'h0002c4;
      expv[1] = 21'h0003c2;
      expv[2] = 21'h00000c;
      expv[3] = 21'h000216;
      expv[4] = 21'h00066c;
      expv[5] = 21'h131332;
      expv[6] = 21'h130784;
      expv[7] = 21'h0d939a;
      expv[8] = 21'h0d9df0;
      expv[9] = 21'h0d82a0;
      expv[10] = 21'h11b082;
      expv[11] = 21'h1cd560;
      expv[12] = 21'h1cd2a6;
      expv[13] = 21'h1cd6fe;
      expv[14] = 21'h13f1d6;
      expv[15] = 21'h13e1e6;
      expv[16] = 21'h13f21a;
      expv[17] = 21'h15d382;
      expv[18] = 21'h15d07e;
      expv[19] = 21'h15d116;
      expv[20] = 21'h15d8ee;
      expv[21] = 21'h15c316;
      expv[22] = 21'h15c3ba;
      expv[23] = 21'h15c23e;
      expv[24] = 21'h04535e;
      expv[25] = 21'h157016;
      expv[26] = 21'h15668c;
      expv[27] = 21'h13d3a0;
      expv[28] = 21'h13d33c;
      expv[29] = 21'h13dac4;
      expv[30] = 21'h13c29c;
      expv[31] = 21'h0f506e;
      expv[32] = 21'h0f55e0;
      expv[33] = 21'h0f59e0;
      expv[34] = 21'h0f410e;
      expv[35] = 21'h00f386;
      expv[36] = 21'h163014;
      expv[37] = 21'h000342;
      expv[38] = 21'h0000a2;
      expv[39] = 21'h0004c4;
      expv[40] = 21'h0003e4;
      expv[41] = 21'h0372b6;
      expv[42] = 21'h037618;
      expv[43] = 21'h0370aa;
      expv[44] = 21'h03718c;
      expv[45] = 21'h0372d2;
      expv[46] = 21'h03795a;
      expv[47] = 21'h03623c;
      expv[48] = 21'h1fd31a;
      expv[49] = 21'h1fc224;
      expv[50] = 21'h1fc3ae;
      expv[51] = 21'h1fc296;
      expv[52] = 21'h1fc25e;
      expv[53] = 21'h1eb198;
      expv[54] = 21'h1eb30a;
      expv[55] = 21'h1eb686;
      expv[56] = 21'h1ea548;
      expv[57] = 21'h1ea338;
      expv[58] = 21'h03f038;
      expv[59] = 21'h18d13a;
      expv[60] = 21'h0f956a;
      expv[61] = 21'h0f9a12;
      expv[62] = 21'h0f80bc;
      expv[63] = 21'h0f8368;
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
