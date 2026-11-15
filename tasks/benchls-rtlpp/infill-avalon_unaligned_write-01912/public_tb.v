// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01912 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h202d17a031f0a0db12;
    stim[1] = 70'h3397c615b06d7ba364;
    stim[2] = 70'h1aa04942a70eb7fa94;
    stim[3] = 70'h048ee5ceba6793cdea;
    stim[4] = 70'h106a2e96d0f0c6f685;
    stim[5] = 70'h13cac345781c54eb7f;
    stim[6] = 70'h02d41601eca7ce07fc;
    stim[7] = 70'h0bd59f76ab1a548abf;
    stim[8] = 70'h111ab64b08252dd2a7;
    stim[9] = 70'h192bac8ebae66cbc91;
    stim[10] = 70'h15f3735d276f0724bd;
    stim[11] = 70'h12ba3804229d41bb61;
    stim[12] = 70'h1a902aad84a02f0cdd;
    stim[13] = 70'h1d3225df11474578c0;
    stim[14] = 70'h1acd585416a25e59b7;
    stim[15] = 70'h01c2b832e87a503d4d;
    stim[16] = 70'h0135581a5855553b88;
    stim[17] = 70'h0fe32bce7ae9e2859b;
    stim[18] = 70'h02e81f5d0b6bc0dbde;
    stim[19] = 70'h00e7e7f7a2404a6f79;
    stim[20] = 70'h18a219233af81c90f9;
    stim[21] = 70'h1d16580bd002a4f999;
    stim[22] = 70'h15320c124f63cff7b6;
    stim[23] = 70'h0d8912e61b8e90c363;
    stim[24] = 70'h1d2d73c32093570674;
    stim[25] = 70'h1caf177a57e947fc5a;
    stim[26] = 70'h0218bed196f7e88fc4;
    stim[27] = 70'h0a9b9fecd79a38b6ca;
    stim[28] = 70'h1e2f393d37d144b033;
    stim[29] = 70'h1841ef7df89070be6c;
    stim[30] = 70'h183bf9ea7d0a62ce77;
    stim[31] = 70'h183da94de9bdb453a4;
    stim[32] = 70'h05aef891246d0e2169;
    stim[33] = 70'h1c1295e3d26f93d2b3;
    stim[34] = 70'h171569e02fda808496;
    stim[35] = 70'h18e57c5c776f52ea0c;
    stim[36] = 70'h0fde27136b45c94c36;
    stim[37] = 70'h1ddd70985693869fb3;
    stim[38] = 70'h0ebd6c288abb0eb822;
    stim[39] = 70'h109cf93d05a9c5be7e;
    stim[40] = 70'h12552cb720b728a10a;
    stim[41] = 70'h171c4048fc3ff3e926;
    stim[42] = 70'h18aacd58861ad93131;
    stim[43] = 70'h1d05f1cb00de124b51;
    stim[44] = 70'h03a63e8f66377af3f6;
    stim[45] = 70'h18a3cf75de15b34ca9;
    stim[46] = 70'h0e3ff83f3780b85930;
    stim[47] = 70'h1f447bfbea4c63cf36;
    stim[48] = 70'h082c1719c82e01b494;
    stim[49] = 70'h19a6e04792c08bf648;
    stim[50] = 70'h14cf25f49dcd2b9388;
    stim[51] = 70'h0eba4b032065ab0665;
    stim[52] = 70'h12a509fe5cc081bc6b;
    stim[53] = 70'h19927f6bb2c236f03f;
    stim[54] = 70'h153f878b1e5ca21b44;
    stim[55] = 70'h1ff3b94df9716656e5;
    stim[56] = 70'h2924a7205de37edd8a;
    stim[57] = 70'h0a5cff63f769d4257c;
    stim[58] = 70'h0c4b1668f2fc41ef5e;
    stim[59] = 70'h0f124ff1681485ff30;
    stim[60] = 70'h03d91ae5f03045c030;
    stim[61] = 70'h1f0c5b5e081eb4dfd2;
    stim[62] = 70'h0cc52f7d2eeab5b632;
    stim[63] = 70'h080f024aa0b9b5d72f;
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
      expv[0] = 33'h1f0a0db12;
      expv[1] = 33'h06d7ba365;
      expv[2] = 33'h10eb7fa94;
      expv[3] = 33'h06793cdea;
      expv[4] = 33'h0f0c6f684;
      expv[5] = 33'h01c54eb7e;
      expv[6] = 33'h0a7ce07fc;
      expv[7] = 33'h11a548abe;
      expv[8] = 33'h0252dd2a6;
      expv[9] = 33'h0e66cbc90;
      expv[10] = 33'h16f0724bc;
      expv[11] = 33'h09d41bb60;
      expv[12] = 33'h0a02f0cdc;
      expv[13] = 33'h1474578c1;
      expv[14] = 33'h0a25e59b6;
      expv[15] = 33'h07a503d4c;
      expv[16] = 33'h055553b88;
      expv[17] = 33'h0e9e2859a;
      expv[18] = 33'h16bc0dbde;
      expv[19] = 33'h0404a6f78;
      expv[20] = 33'h0f81c90f8;
      expv[21] = 33'h002a4f998;
      expv[22] = 33'h163cff7b6;
      expv[23] = 33'h18e90c362;
      expv[24] = 33'h093570675;
      expv[25] = 33'h1e947fc5a;
      expv[26] = 33'h0f7e88fc4;
      expv[27] = 33'h19a38b6ca;
      expv[28] = 33'h1d144b032;
      expv[29] = 33'h09070be6d;
      expv[30] = 33'h10a62ce76;
      expv[31] = 33'h1bdb453a5;
      expv[32] = 33'h06d0e2168;
      expv[33] = 33'h06f93d2b2;
      expv[34] = 33'h1da808496;
      expv[35] = 33'h16f52ea0c;
      expv[36] = 33'h145c94c36;
      expv[37] = 33'h093869fb2;
      expv[38] = 33'h0bb0eb822;
      expv[39] = 33'h1a9c5be7e;
      expv[40] = 33'h0b728a10b;
      expv[41] = 33'h03ff3e926;
      expv[42] = 33'h01ad93130;
      expv[43] = 33'h0de124b50;
      expv[44] = 33'h0377af3f6;
      expv[45] = 33'h015b34ca8;
      expv[46] = 33'h180b85930;
      expv[47] = 33'h04c63cf36;
      expv[48] = 33'h02e01b494;
      expv[49] = 33'h0c08bf648;
      expv[50] = 33'h1cd2b9388;
      expv[51] = 33'h065ab0664;
      expv[52] = 33'h0c081bc6a;
      expv[53] = 33'h0c236f03e;
      expv[54] = 33'h05ca21b44;
      expv[55] = 33'h1716656e4;
      expv[56] = 33'h1e37edd8a;
      expv[57] = 33'h169d4257c;
      expv[58] = 33'h0fc41ef5e;
      expv[59] = 33'h01485ff30;
      expv[60] = 33'h03045c030;
      expv[61] = 33'h01eb4dfd3;
      expv[62] = 33'h0eab5b632;
      expv[63] = 33'h0b9b5d72e;
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
