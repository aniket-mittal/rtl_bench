// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 123;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_076973 dut (
    .clk(clk),
    .clk_en(in_vec[122:122]),
    .rst(in_vec[121:121]),
    .in_vld(in_vec[120:120]),
    .x_man(in_vec[119:66]),
    .y_man(in_vec[65:12]),
    .adr_i(in_vec[11:1]),
    .out_rdy(in_vec[0:0]),
    .in_rdy(out_vec[20:20]),
    .out_vld(out_vec[19:19]),
    .niter(out_vec[18:11]),
    .adr_o(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 123'h33484c7f3ab23f9fb98e2466248912a;
    stim[1] = 123'h3cb64708bbde240408315f532fec789;
    stim[2] = 123'h5952ce3002cd86c1548b2f5f37dadb3;
    stim[3] = 123'h0ab57b3a01dc30286819b7a6e66c6ac;
    stim[4] = 123'h4104dbe7e02156f1bb0644d4a93cab5;
    stim[5] = 123'h4a69053228b550e8948fcd3e2409cca;
    stim[6] = 123'h43e30f5453b0f84677353c04c2fec9c;
    stim[7] = 123'h0e35b8b70075ee724525d99e2507f88;
    stim[8] = 123'h0dd5794eab5f8f5b3c08947283ae874;
    stim[9] = 123'h1fc11572fcba17b51472c6dd7bb7c38;
    stim[10] = 123'h0eec039e40b5927c820a272934025d1;
    stim[11] = 123'h1476faba178ca37da50ad2c76b3fe4a;
    stim[12] = 123'h164a5be7591cd09c376c2c424571154;
    stim[13] = 123'h40991bdeb0e318adc37b8daa97a502e;
    stim[14] = 123'h1e8815e75c0567e8d5e2773b3408c7c;
    stim[15] = 123'h4d8b7172cef8a68c6e59aee926adb1e;
    stim[16] = 123'h19d7a8036567e5379445417d2c7647f;
    stim[17] = 123'h492473b3ddebfc1a9328bc87dea71a5;
    stim[18] = 123'h49b92d5d2bd63f54af848da86135726;
    stim[19] = 123'h4c575b42667797f019f48c0900dbaa8;
    stim[20] = 123'h0e3ee0014486b53eabe71ad2bf391dc;
    stim[21] = 123'h145f16fb5058b6dcb15cc573fb2de6a;
    stim[22] = 123'h41b3edd2290179d57b1a8003c3c0c57;
    stim[23] = 123'h447697fcaea7aa4658af29aeface7ac;
    stim[24] = 123'h5bde48e2b79cc1267a5302400075d92;
    stim[25] = 123'h0b42fe8c595a7aa33fee7bf61aeec9b;
    stim[26] = 123'h5ed4ca63b17b158a03a5ea02943f338;
    stim[27] = 123'h4b033177f0399400f896617a30e5e75;
    stim[28] = 123'h07354c6fae03f09deb3270e68e6b146;
    stim[29] = 123'h088b1c5ff249f6c37089608bbaaf9c1;
    stim[30] = 123'h17b45e2e179cdf8b44caee724d1f46b;
    stim[31] = 123'h12179ee34cdad286096208b497ed13c;
    stim[32] = 123'h54e16ae757fb012bf4fad861e3f2635;
    stim[33] = 123'h4929c1a19d3ab2fd35a842333dbf714;
    stim[34] = 123'h464280a0f910f401073dd4b277730d6;
    stim[35] = 123'h42d5658ceb8f76f72efc293a0d5ed64;
    stim[36] = 123'h008d0cc4ae865d0ce45ca3917577c79;
    stim[37] = 123'h696863cd7175dd23150ab3f3668b36b;
    stim[38] = 123'h44605fad547b3527f071996ae99eda2;
    stim[39] = 123'h5073e041b58b62a8dc52fd42cc0af11;
    stim[40] = 123'h0e40636e69286aa02f3b1456a2ebe6d;
    stim[41] = 123'h0e91824bb32b1dbe74388fbc1c61f56;
    stim[42] = 123'h050af059819ec9c880fdbf4d5c345cf;
    stim[43] = 123'h47396ccbc498cba4daa1802e6c6ffda;
    stim[44] = 123'h15eb887a5dd73d27d07c58e29d8970e;
    stim[45] = 123'h07aaadb760dae39df841f22d40fda42;
    stim[46] = 123'h5b82c458e561e4813748ef7113ccec7;
    stim[47] = 123'h47caee1e9432ba78f3c1077315e5997;
    stim[48] = 123'h1b9e3f3285a4776d8c5499e96fc4513;
    stim[49] = 123'h0d4d7e094b620b81a15d28548c5ac0a;
    stim[50] = 123'h146657819ce54e62a63b61f5428fc75;
    stim[51] = 123'h173407e1dc5574652cf38629ba3a4ce;
    stim[52] = 123'h1061bfef764423b628c945a96bc9630;
    stim[53] = 123'h1e4ef7baacd6f9a58a25b2745ea575c;
    stim[54] = 123'h0700d2cae890efde069c0b7805ee9dc;
    stim[55] = 123'h57543caef13ae651c1692daf79f2715;
    stim[56] = 123'h1c1e8589a66eb2d8728a47702d33771;
    stim[57] = 123'h09b716988ac6d0a484ea125309df786;
    stim[58] = 123'h1f71ab4707334b30b6d9c420e1f6bcb;
    stim[59] = 123'h53658df1485c6128661e93bb3a26bca;
    stim[60] = 123'h465a9aa61f0f689e001adba3478cb6c;
    stim[61] = 123'h5c688ca4f4b8b85159dbf9bbbeaa69e;
    stim[62] = 123'h04fb480eee945185a39fb1afdbf9e59;
    stim[63] = 123'h05b72710ad1830d2f1d0bbcbfecc0f8;
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
      expv[0] = 21'h1xxxxx;
      expv[1] = 21'h1xxxxx;
      expv[2] = 21'h1xxxxx;
      expv[3] = 21'h0006d9;
      expv[4] = 21'h0006d9;
      expv[5] = 21'h0006d9;
      expv[6] = 21'h000ed9;
      expv[7] = 21'h000ed9;
      expv[8] = 21'h000ed9;
      expv[9] = 21'h000ed9;
      expv[10] = 21'h000ed9;
      expv[11] = 21'h000ed9;
      expv[12] = 21'h000ed9;
      expv[13] = 21'h000ed9;
      expv[14] = 21'h0016d9;
      expv[15] = 21'h0016d9;
      expv[16] = 21'h0016d9;
      expv[17] = 21'h0016d9;
      expv[18] = 21'h001ed9;
      expv[19] = 21'h001ed9;
      expv[20] = 21'h0026d9;
      expv[21] = 21'h0026d9;
      expv[22] = 21'h0026d9;
      expv[23] = 21'h0026d9;
      expv[24] = 21'h002ed9;
      expv[25] = 21'h002ed9;
      expv[26] = 21'h002ed9;
      expv[27] = 21'h0036d9;
      expv[28] = 21'h0036d9;
      expv[29] = 21'h0036d9;
      expv[30] = 21'h0036d9;
      expv[31] = 21'h0036d9;
      expv[32] = 21'h0036d9;
      expv[33] = 21'h003ed9;
      expv[34] = 21'h083ed9;
      expv[35] = 21'h083ed9;
      expv[36] = 21'h083ed9;
      expv[37] = 21'h103ed9;
      expv[38] = 21'h103ed9;
      expv[39] = 21'h103ed9;
      expv[40] = 21'h000788;
      expv[41] = 21'h000788;
      expv[42] = 21'h000788;
      expv[43] = 21'h000788;
      expv[44] = 21'h000788;
      expv[45] = 21'h000788;
      expv[46] = 21'h000788;
      expv[47] = 21'h000f88;
      expv[48] = 21'h080f88;
      expv[49] = 21'h080f88;
      expv[50] = 21'h080f88;
      expv[51] = 21'h080f88;
      expv[52] = 21'h080f88;
      expv[53] = 21'h080f88;
      expv[54] = 21'h080f88;
      expv[55] = 21'h080f88;
      expv[56] = 21'h100f88;
      expv[57] = 21'h100f88;
      expv[58] = 21'h100f88;
      expv[59] = 21'h100f88;
      expv[60] = 21'h0005e5;
      expv[61] = 21'h0005e5;
      expv[62] = 21'h000de5;
      expv[63] = 21'h000de5;
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
