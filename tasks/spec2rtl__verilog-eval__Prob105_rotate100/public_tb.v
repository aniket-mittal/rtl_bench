// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .load(in_vec[102:102]),
    .ena(in_vec[101:100]),
    .data(in_vec[99:0]),
    .q(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h2ca14b97b6f2f842dc061a73b1;
    stim[1] = 103'h510cd39c9187a7b57780d99a20;
    stim[2] = 103'h40f620f3a2ed1c31ead691502f;
    stim[3] = 103'h52a0d6085933fd03b3efbfb255;
    stim[4] = 103'h1dc1c336494db7fbb841df907c;
    stim[5] = 103'h5ccded3280df086c22f0c0fab3;
    stim[6] = 103'h3c092703ba6ff2428eb5620c69;
    stim[7] = 103'h086f698fdd0465420b81cf204c;
    stim[8] = 103'h08447cd764faa23b067f17ddb1;
    stim[9] = 103'h15b595e3157820b8aeb2be4065;
    stim[10] = 103'h1b15810974b15c95658712c9ba;
    stim[11] = 103'h25fdfa57548e5200b9c2390c2c;
    stim[12] = 103'h73126260462dc0354c3a3f6213;
    stim[13] = 103'h453d756ab56cdc20bdc029957c;
    stim[14] = 103'h05fe67c0c9ab430727d9e70092;
    stim[15] = 103'h7298d671a486a6cb2c8f100f84;
    stim[16] = 103'h76cbc17c09ab8cad7a0f927327;
    stim[17] = 103'h55b3d4a1306607ac7d3f90bffa;
    stim[18] = 103'h5d5ecfe2dc37e5b50cc328265e;
    stim[19] = 103'h0a6f8bfb71ae0fe3c06e2ccef1;
    stim[20] = 103'h616df14721293644e2fab6c4f2;
    stim[21] = 103'h46aba4576b3a9a80053ed78b9a;
    stim[22] = 103'h5d7c29bba71383c899631290d1;
    stim[23] = 103'h50f0d649f3d7e39d066fcdb21f;
    stim[24] = 103'h5164dd34d0cf5f484579fdd97d;
    stim[25] = 103'h64a83b7409db88550d18782c3e;
    stim[26] = 103'h6a98dc500b00f92249e27d639c;
    stim[27] = 103'h33cd33dcd4a9173ad90dcebe98;
    stim[28] = 103'h44e31681f50de2fed62e26d67a;
    stim[29] = 103'h77f9326c08f8769999e20c9d59;
    stim[30] = 103'h3ee0a01fae479464e6d23d977a;
    stim[31] = 103'h29e566af6a699a06925a05ffe1;
    stim[32] = 103'h06a45a408e2afe1aff8e6a2bea;
    stim[33] = 103'h331af48f73a8536a63c072e1da;
    stim[34] = 103'h77997e09dffb190e82b16ba613;
    stim[35] = 103'h32040cb307b65c6649b7ebdc18;
    stim[36] = 103'h06b8498541de50b345bde3e581;
    stim[37] = 103'h28bf3c470dc2287de1decbf1f2;
    stim[38] = 103'h71fa86f1e5df9fe072428eff06;
    stim[39] = 103'h03681fb57f379ebe0723f4760e;
    stim[40] = 103'h3e2b17b5dcdef1d6786b50c187;
    stim[41] = 103'h1cc9e256b826acbd04917d4b9d;
    stim[42] = 103'h2acf0e7a8fcdc05bef18a643e6;
    stim[43] = 103'h6fd4b00c26de374e6c09dccd64;
    stim[44] = 103'h607554084aaca6fc94cb53e0de;
    stim[45] = 103'h5acf38d59da602f8f9bf706946;
    stim[46] = 103'h35ada8cabb555848911bfa7b6d;
    stim[47] = 103'h3a8b9cc668fb132305db0a521d;
    stim[48] = 103'h567fd5f48c428a06b4d888b12a;
    stim[49] = 103'h3689d4da0ab1e9906bf90c7f74;
    stim[50] = 103'h36f6a4071ca1522f5e9889d872;
    stim[51] = 103'h6920e5112a308a4c9f07b162f3;
    stim[52] = 103'h26c6f6ae1f7ea665adef1d0571;
    stim[53] = 103'h7a8e2b80f628b8581d3fe1d43c;
    stim[54] = 103'h086f11e798a50c5c4a91df5c13;
    stim[55] = 103'h46cab481430965b00d4c0bd26a;
    stim[56] = 103'h07d9db0f264f37b4254b7cb326;
    stim[57] = 103'h78efeb17e5616e99d32969e0c4;
    stim[58] = 103'h5280eba7e109122002c35d80a3;
    stim[59] = 103'h355690584ca32451d86bb735c8;
    stim[60] = 103'h23cadd878f8d35292643983906;
    stim[61] = 103'h5a43c14c7183bc9cfc96ae2943;
    stim[62] = 103'h287ad68ae19db292095aba284f;
    stim[63] = 103'h31806aab4134a77211eabf9220;
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
      expv[0] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 100'h10cd39c9187a7b57780d99a20;
      expv[3] = 100'h0f620f3a2ed1c31ead691502f;
      expv[4] = 100'h2a0d6085933fd03b3efbfb255;
      expv[5] = 100'h9506b042c99fe81d9f7dfd92a;
      expv[6] = 100'hccded3280df086c22f0c0fab3;
      expv[7] = 100'hccded3280df086c22f0c0fab3;
      expv[8] = 100'hccded3280df086c22f0c0fab3;
      expv[9] = 100'hccded3280df086c22f0c0fab3;
      expv[10] = 100'he66f699406f84361178607d59;
      expv[11] = 100'hf337b4ca037c21b08bc303eac;
      expv[12] = 100'he66f699406f84361178607d59;
      expv[13] = 100'h3126260462dc0354c3a3f6213;
      expv[14] = 100'h53d756ab56cdc20bdc029957c;
      expv[15] = 100'h53d756ab56cdc20bdc029957c;
      expv[16] = 100'h298d671a486a6cb2c8f100f84;
      expv[17] = 100'h6cbc17c09ab8cad7a0f927327;
      expv[18] = 100'h5b3d4a1306607ac7d3f90bffa;
      expv[19] = 100'hd5ecfe2dc37e5b50cc328265e;
      expv[20] = 100'hd5ecfe2dc37e5b50cc328265e;
      expv[21] = 100'h16df14721293644e2fab6c4f2;
      expv[22] = 100'h6aba4576b3a9a80053ed78b9a;
      expv[23] = 100'hd7c29bba71383c899631290d1;
      expv[24] = 100'h0f0d649f3d7e39d066fcdb21f;
      expv[25] = 100'h164dd34d0cf5f484579fdd97d;
      expv[26] = 100'h4a83b7409db88550d18782c3e;
      expv[27] = 100'ha98dc500b00f92249e27d639c;
      expv[28] = 100'ha98dc500b00f92249e27d639c;
      expv[29] = 100'h4e31681f50de2fed62e26d67a;
      expv[30] = 100'h7f9326c08f8769999e20c9d59;
      expv[31] = 100'h7f9326c08f8769999e20c9d59;
      expv[32] = 100'hff264d811f0ed3333c4193ab2;
      expv[33] = 100'hff264d811f0ed3333c4193ab2;
      expv[34] = 100'hff264d811f0ed3333c4193ab2;
      expv[35] = 100'h7997e09dffb190e82b16ba613;
      expv[36] = 100'h7997e09dffb190e82b16ba613;
      expv[37] = 100'h7997e09dffb190e82b16ba613;
      expv[38] = 100'hf32fc13bff6321d0562d74c26;
      expv[39] = 100'h1fa86f1e5df9fe072428eff06;
      expv[40] = 100'h1fa86f1e5df9fe072428eff06;
      expv[41] = 100'h1fa86f1e5df9fe072428eff06;
      expv[42] = 100'h0fd4378f2efcff03921477f83;
      expv[43] = 100'h1fa86f1e5df9fe072428eff06;
      expv[44] = 100'hfd4b00c26de374e6c09dccd64;
      expv[45] = 100'h07554084aaca6fc94cb53e0de;
      expv[46] = 100'hacf38d59da602f8f9bf706946;
      expv[47] = 100'hacf38d59da602f8f9bf706946;
      expv[48] = 100'hacf38d59da602f8f9bf706946;
      expv[49] = 100'h67fd5f48c428a06b4d888b12a;
      expv[50] = 100'h67fd5f48c428a06b4d888b12a;
      expv[51] = 100'h67fd5f48c428a06b4d888b12a;
      expv[52] = 100'h920e5112a308a4c9f07b162f3;
      expv[53] = 100'h241ca22546114993e0f62c5e7;
      expv[54] = 100'ha8e2b80f628b8581d3fe1d43c;
      expv[55] = 100'ha8e2b80f628b8581d3fe1d43c;
      expv[56] = 100'h6cab481430965b00d4c0bd26a;
      expv[57] = 100'h6cab481430965b00d4c0bd26a;
      expv[58] = 100'h8efeb17e5616e99d32969e0c4;
      expv[59] = 100'h280eba7e109122002c35d80a3;
      expv[60] = 100'h280eba7e109122002c35d80a3;
      expv[61] = 100'h501d74fc21224400586bb0146;
      expv[62] = 100'ha43c14c7183bc9cfc96ae2943;
      expv[63] = 100'h4878298e3077939f92d5c5287;
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
