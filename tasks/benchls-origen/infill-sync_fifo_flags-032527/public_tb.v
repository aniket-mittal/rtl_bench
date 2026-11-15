// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_032527 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .Data_in(in_vec[65:2]),
    .write_to_WD_fifo(in_vec[1:1]),
    .read_from_WD_fifo(in_vec[0:0]),
    .Data_out(out_vec[68:5]),
    .Full(out_vec[4:4]),
    .Almost_Full(out_vec[3:3]),
    .Half_Full(out_vec[2:2]),
    .Almost_Empty(out_vec[1:1]),
    .Empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h48ed9ab0eecbf90c0;
    stim[1] = 67'h570e5d171dfcaaa3e;
    stim[2] = 67'h2f24eeda163ec6556;
    stim[3] = 67'h2c51af79dca780cad;
    stim[4] = 67'h3607c9d9fe8359cf9;
    stim[5] = 67'h00387c8ca6b5c64f9;
    stim[6] = 67'h074b1419f853f54cc;
    stim[7] = 67'h1049bdebac674eeab;
    stim[8] = 67'h317acc6260153c668;
    stim[9] = 67'h340ee8adcdf220cc5;
    stim[10] = 67'h254d0aae5ee09cfe2;
    stim[11] = 67'h17aa960a63838f746;
    stim[12] = 67'h3ff829b72c19481c4;
    stim[13] = 67'h10cffc458420ee454;
    stim[14] = 67'h37381c1514a92355e;
    stim[15] = 67'h2abf8f7770d65f99d;
    stim[16] = 67'h2467694eadf100c03;
    stim[17] = 67'h2c94686da175e054a;
    stim[18] = 67'h2a33b3c3d4e732650;
    stim[19] = 67'h3cdf98cc401198a6e;
    stim[20] = 67'h0bdff52d9ef2beb1a;
    stim[21] = 67'h03a67efbaeab79a8d;
    stim[22] = 67'h1eeb78768270d0081;
    stim[23] = 67'h18d67159e2171b54a;
    stim[24] = 67'h1e88632ca660d1d4b;
    stim[25] = 67'h0f44ef2d91b262018;
    stim[26] = 67'h341c1202e4ff0a19d;
    stim[27] = 67'h1db1fe583eec0fb06;
    stim[28] = 67'h3c11d54907ca25cc9;
    stim[29] = 67'h39039710fa4bf62e8;
    stim[30] = 67'h1bdba4e6e8ff4571e;
    stim[31] = 67'h15b1d12e988f8e428;
    stim[32] = 67'h0d6a8fb54ae7e07f4;
    stim[33] = 67'h3394841355442343c;
    stim[34] = 67'h214eae7940d45a61f;
    stim[35] = 67'h0630d9cc27b0ea770;
    stim[36] = 67'h24bac3339f242dbf6;
    stim[37] = 67'h380338aab88ef8e08;
    stim[38] = 67'h11dc67b7a57eaa92a;
    stim[39] = 67'h29d22395387ad0a19;
    stim[40] = 67'h2d40554180b3ef3dd;
    stim[41] = 67'h26c18698fdb13b466;
    stim[42] = 67'h1c3e3df1a1d3cf379;
    stim[43] = 67'h24de9dc4b8d8a144e;
    stim[44] = 67'h22ae79d442aae133d;
    stim[45] = 67'h2c638ce4c94d014d1;
    stim[46] = 67'h080ddc61cd75117ad;
    stim[47] = 67'h14cb25f698a0846f5;
    stim[48] = 67'h2d7600ef551810461;
    stim[49] = 67'h01f9e291d287baf7c;
    stim[50] = 67'h3558d6ab6ab8c4b8f;
    stim[51] = 67'h0d723691e9c6e4b5f;
    stim[52] = 67'h2ca0895b67b963299;
    stim[53] = 67'h339ccf46b0e676ae7;
    stim[54] = 67'h2db0cc511b570cc3f;
    stim[55] = 67'h1453e098facd4613a;
    stim[56] = 67'h316ad5208d06010a6;
    stim[57] = 67'h0df56d19f1258858a;
    stim[58] = 67'h3805e700e20c86fa7;
    stim[59] = 67'h3226e798590787520;
    stim[60] = 67'h1b4dc971bb61c9284;
    stim[61] = 67'h1a94a82c65b5050e0;
    stim[62] = 67'h07f31740aa14fa131;
    stim[63] = 67'h3ddf6fffefdcc3db0;
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
      expv[0] = 69'h000000000000000003;
      expv[1] = 69'h000000000000000003;
      expv[2] = 69'h000000000000000003;
      expv[3] = 69'h000000000000000002;
      expv[4] = 69'h1792776d0b1f632aa3;
      expv[5] = 69'h1792776d0b1f632aa3;
      expv[6] = 69'h1792776d0b1f632aa3;
      expv[7] = 69'h1792776d0b1f632aa3;
      expv[8] = 69'h1792776d0b1f632aa2;
      expv[9] = 69'h1792776d0b1f632aa2;
      expv[10] = 69'h0824def5d633a77543;
      expv[11] = 69'h0824def5d633a77542;
      expv[12] = 69'h0824def5d633a77540;
      expv[13] = 69'h0824def5d633a77540;
      expv[14] = 69'h0824def5d633a77540;
      expv[15] = 69'h0824def5d633a77540;
      expv[16] = 69'h12a685572f704e7f00;
      expv[17] = 69'h0bd54b0531c1c7ba20;
      expv[18] = 69'h0bd54b0531c1c7ba20;
      expv[19] = 69'h0bd54b0531c1c7ba20;
      expv[20] = 69'h0bd54b0531c1c7ba24;
      expv[21] = 69'h0bd54b0531c1c7ba24;
      expv[22] = 69'h1b9c0e0a8a5491aae4;
      expv[23] = 69'h1233b4a756f8806000;
      expv[24] = 69'h1233b4a756f8806004;
      expv[25] = 69'h164a3436d0baf02a44;
      expv[26] = 69'h164a3436d0baf02a44;
      expv[27] = 69'h1e6fcc662008cc5360;
      expv[28] = 69'h1e6fcc662008cc5364;
      expv[29] = 69'h05effa96cf795f58c0;
      expv[30] = 69'h05effa96cf795f58c0;
      expv[31] = 69'h05effa96cf795f58c4;
      expv[32] = 69'h05effa96cf795f58c4;
      expv[33] = 69'h05effa96cf795f58c4;
      expv[34] = 69'h05effa96cf795f58c4;
      expv[35] = 69'h0c6b38acf10b8daa44;
      expv[36] = 69'h0c6b38acf10b8daa44;
      expv[37] = 69'h0c6b38acf10b8daa44;
      expv[38] = 69'h0c6b38acf10b8daa44;
      expv[39] = 69'h0c6b38acf10b8daa4c;
      expv[40] = 69'h0f443196533068ea44;
      expv[41] = 69'h0ed8ff2c1f7607d824;
      expv[42] = 69'h0ed8ff2c1f7607d824;
      expv[43] = 69'h0dedd273747fa2b8e4;
      expv[44] = 69'h0dedd273747fa2b8e4;
      expv[45] = 69'h10a7573ca06a2d30e4;
      expv[46] = 69'h125d6199cf9216dfa0;
      expv[47] = 69'h08ee33dbd2bf554940;
      expv[48] = 69'h1360c34c7ed89da322;
      expv[49] = 69'h126f4ee25c6c50a263;
      expv[50] = 69'h126f4ee25c6c50a263;
      expv[51] = 69'h126f4ee25c6c50a262;
      expv[52] = 69'h1aac6b55b55c625c62;
      expv[53] = 69'h06b91b48f4e3725ae3;
      expv[54] = 69'h06b91b48f4e3725ae2;
      expv[55] = 69'h19ce67a358733b5722;
      expv[56] = 69'h19ce67a358733b5720;
      expv[57] = 69'h19ce67a358733b5720;
      expv[58] = 69'h19ce67a358733b5724;
      expv[59] = 69'h16d866288dab8661e4;
      expv[60] = 69'h16d866288dab8661e4;
      expv[61] = 69'h16d866288dab8661e4;
      expv[62] = 69'h16d866288dab8661e4;
      expv[63] = 69'h0a29f04c7d66a309c0;
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
