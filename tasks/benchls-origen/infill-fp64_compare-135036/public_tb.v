// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135036 dut (
    .a(in_vec[128:65]),
    .b(in_vec[64:1]),
    .signaling(in_vec[0:0]),
    .lt(out_vec[8:8]),
    .eq(out_vec[7:7]),
    .gt(out_vec[6:6]),
    .unordered(out_vec[5:5]),
    .exceptionFlags(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1d1fe25b926c896388d0b5357646250e7;
    stim[1] = 129'h1b433909c77801080d63e2dad630fb264;
    stim[2] = 129'h0bba3a497cffce49c7d734b61f9948af7;
    stim[3] = 129'h079471d3050d3793afaee5508ee024e59;
    stim[4] = 129'h01f19c21b0a32b4681654c3f1936a0a6d;
    stim[5] = 129'h180049d6c25faf4672b7db67811844892;
    stim[6] = 129'h04d1f6f1a91fc882762552c63b2d8f94a;
    stim[7] = 129'h12edc9818d843345746bd0eb402ad335d;
    stim[8] = 129'h13ece25f5abe51ba86ac1070408f2ceaf;
    stim[9] = 129'h0d756c99e23c4fe240464ca4656a17204;
    stim[10] = 129'h0ea4950267d92d27928ab4a95d5a67bce;
    stim[11] = 129'h1189e2ddaeb3555910c06b23080ecac46;
    stim[12] = 129'h14c9644f746fbf4583cc96a86eeb859ff;
    stim[13] = 129'h13fdd37ae4368ab954721170bcfeaee0e;
    stim[14] = 129'h164dd6f97034e1a6f387719f3f82724cf;
    stim[15] = 129'h036ea35db2e079296d18f7ee921e46745;
    stim[16] = 129'h0d16287bd4911dcae26471da72efbb5a7;
    stim[17] = 129'h1310ef48aa036b143c856d92c5a108fc9;
    stim[18] = 129'h0e79c1266c35637b51c75c1ba069881d5;
    stim[19] = 129'h0e68fd08b64cd92ca77f3fe2872d070c1;
    stim[20] = 129'h05007126d59fe1a513f233fb9ff8014fb;
    stim[21] = 129'h110c61a8897057b8c1ec689a5bde8341c;
    stim[22] = 129'h0435d7ed6a3917c88464bbad7d1b318a4;
    stim[23] = 129'h0ace18f870be538f61631ad13426a9796;
    stim[24] = 129'h121b1ea31fb26a1d732a3f2f61955561a;
    stim[25] = 129'h0266fc04df5815d71101d8c21903824b4;
    stim[26] = 129'h1b153ab8dfd2d16eef2c037519f3836b0;
    stim[27] = 129'h1153af67e1cf1bc2d76f0799e538900b9;
    stim[28] = 129'h082280b2a888223458637906922e508c0;
    stim[29] = 129'h0314975a82db53e61c9c308fd569e4b54;
    stim[30] = 129'h00d3a19b20760b7c7df943a70c1182c0e;
    stim[31] = 129'h05e578e240ee81cbb4e345ba61d7a368d;
    stim[32] = 129'h189ac59c23c996e8b901bb6a7ad770954;
    stim[33] = 129'h0f79e62f35d9018dab7477a1ac3e7bf39;
    stim[34] = 129'h0d228c7d80859c57ff9f18bf9747d8667;
    stim[35] = 129'h0e870e8a340adc0664b9b7dfd76904574;
    stim[36] = 129'h18a3e91d0dbae333c943d3777d160ba61;
    stim[37] = 129'h0229f2c7acd1dffaca064d839169fcbb4;
    stim[38] = 129'h15fbecfcb0854eca876ffbc68d9559410;
    stim[39] = 129'h125f567cfd150582bbbfb8cec422c5b85;
    stim[40] = 129'h0445ded2796f4be09d0e3a5ef66281219;
    stim[41] = 129'h0319f1c8fd22ce3931034e6a65503e680;
    stim[42] = 129'h0389a22a6c60bb77d6e666fcb110dc8e9;
    stim[43] = 129'h1f02c71d4dc12c1b0f2ed0e7292bced18;
    stim[44] = 129'h1f4abeeef3a077f78b4adeb3aec7dfb49;
    stim[45] = 129'h0379bc54927ab4f3810927113d9e1ead6;
    stim[46] = 129'h03454b79c3c88a55597577cee70450086;
    stim[47] = 129'h13b7853cbeaa75d15e63624bfc24e66ac;
    stim[48] = 129'h0a4b3f79ff9ae377d9c9e5950270f8c90;
    stim[49] = 129'h002b0bd9731f1332a8754d664a0b57ec1;
    stim[50] = 129'h0a974c93f132ba912932dcc4c2e4dccde;
    stim[51] = 129'h19453b41747bf885cd42f4ddb337140d1;
    stim[52] = 129'h1ad0b1d7086b1e99d12ae2a8d55e098c9;
    stim[53] = 129'h111b0e9944b06e029b1f8fcff5d954efd;
    stim[54] = 129'h11d55e6fe34fb7fd0f94ce54d99c41ad0;
    stim[55] = 129'h1a865f378bb6c2c8e9b72641dd7b69695;
    stim[56] = 129'h1df4a48ee451e4aa40e6462ee9340dcc6;
    stim[57] = 129'h02d56ff85c8850f01e276733b6ed98e20;
    stim[58] = 129'h03b8265173124eb71d70d2fdcae0f7d46;
    stim[59] = 129'h1bea816e6b7d2d43e00ed7788ccfee023;
    stim[60] = 129'h0ba3eb2464c234282880719c1721e4ac3;
    stim[61] = 129'h17444edfc49e96d68ef8d2cd0d0610dcf;
    stim[62] = 129'h1497f59903b8e8603af92a4e4985a9c7e;
    stim[63] = 129'h0597213bf57d3f2d31b19a3a9a3f11a10;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'h110;
      expv[1] = 9'h110;
      expv[2] = 9'h050;
      expv[3] = 9'h110;
      expv[4] = 9'h050;
      expv[5] = 9'h110;
      expv[6] = 9'h050;
      expv[7] = 9'h050;
      expv[8] = 9'h110;
      expv[9] = 9'h050;
      expv[10] = 9'h050;
      expv[11] = 9'h110;
      expv[12] = 9'h110;
      expv[13] = 9'h050;
      expv[14] = 9'h110;
      expv[15] = 9'h110;
      expv[16] = 9'h050;
      expv[17] = 9'h050;
      expv[18] = 9'h050;
      expv[19] = 9'h050;
      expv[20] = 9'h050;
      expv[21] = 9'h110;
      expv[22] = 9'h110;
      expv[23] = 9'h050;
      expv[24] = 9'h050;
      expv[25] = 9'h050;
      expv[26] = 9'h110;
      expv[27] = 9'h050;
      expv[28] = 9'h050;
      expv[29] = 9'h050;
      expv[30] = 9'h050;
      expv[31] = 9'h050;
      expv[32] = 9'h050;
      expv[33] = 9'h050;
      expv[34] = 9'h050;
      expv[35] = 9'h050;
      expv[36] = 9'h110;
      expv[37] = 9'h110;
      expv[38] = 9'h110;
      expv[39] = 9'h050;
      expv[40] = 9'h050;
      expv[41] = 9'h050;
      expv[42] = 9'h050;
      expv[43] = 9'h110;
      expv[44] = 9'h110;
      expv[45] = 9'h050;
      expv[46] = 9'h050;
      expv[47] = 9'h050;
      expv[48] = 9'h050;
      expv[49] = 9'h110;
      expv[50] = 9'h050;
      expv[51] = 9'h110;
      expv[52] = 9'h110;
      expv[53] = 9'h050;
      expv[54] = 9'h110;
      expv[55] = 9'h110;
      expv[56] = 9'h110;
      expv[57] = 9'h050;
      expv[58] = 9'h050;
      expv[59] = 9'h110;
      expv[60] = 9'h050;
      expv[61] = 9'h110;
      expv[62] = 9'h050;
      expv[63] = 9'h050;
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
