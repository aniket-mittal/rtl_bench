// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_029026 dut (
    .clk(clk),
    .itr(in_vec[66:66]),
    .ct(in_vec[65:64]),
    .x0(in_vec[63:32]),
    .x1(in_vec[31:0]),
    .y0(out_vec[63:32]),
    .y1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h25067bf473f8008a4;
    stim[1] = 67'h588f252028efd25d4;
    stim[2] = 67'h0d0de032a2b71373e;
    stim[3] = 67'h7a79e85c6209778af;
    stim[4] = 67'h64a53e25e9c867d02;
    stim[5] = 67'h00c921d8aac58375b;
    stim[6] = 67'h5214093ad6af6ada6;
    stim[7] = 67'h756c3b15a777507f6;
    stim[8] = 67'h73a781f8955f08dac;
    stim[9] = 67'h73943b927ad02ae3c;
    stim[10] = 67'h769abece6108f36c2;
    stim[11] = 67'h0be286496dd1073b9;
    stim[12] = 67'h17847b4d0f2e8dc35;
    stim[13] = 67'h6e223797e8a75cc46;
    stim[14] = 67'h2e7fe2f678bce2224;
    stim[15] = 67'h3d111eb8faa0fb5ba;
    stim[16] = 67'h455a8f14a2adc8430;
    stim[17] = 67'h3f084a4cad2ad90ea;
    stim[18] = 67'h72c972521793a66a1;
    stim[19] = 67'h477ee45c92376135e;
    stim[20] = 67'h289e7eb5a467b7659;
    stim[21] = 67'h7ea29529c2d1feb6f;
    stim[22] = 67'h6ce93b376ffdc1105;
    stim[23] = 67'h30cfcee2b3db262c3;
    stim[24] = 67'h0c0b826fb4482f1e5;
    stim[25] = 67'h187fb31a56d0585d0;
    stim[26] = 67'h1dfc9f397aae72d12;
    stim[27] = 67'h1e7ece3c14dc6a65e;
    stim[28] = 67'h200ea4f3e8035de04;
    stim[29] = 67'h4c9ab136bcc51254a;
    stim[30] = 67'h0d9fda488d797c105;
    stim[31] = 67'h6840ff072e75ff254;
    stim[32] = 67'h258a6c7fe55f2849f;
    stim[33] = 67'h299d97630650221a7;
    stim[34] = 67'h3a8a2c8e4faa6ccf0;
    stim[35] = 67'h564794931707c058b;
    stim[36] = 67'h09e08ee137ef12c49;
    stim[37] = 67'h1ab801fba5bc5f367;
    stim[38] = 67'h564f6461c4553c4ed;
    stim[39] = 67'h637a39f21ab40f737;
    stim[40] = 67'h16164ee276b4a2f16;
    stim[41] = 67'h39e9cffe391a3936f;
    stim[42] = 67'h0e50fac79d54a019a;
    stim[43] = 67'h460c93557a12ba877;
    stim[44] = 67'h40b46cf447eda4cc2;
    stim[45] = 67'h233cae377bc19035c;
    stim[46] = 67'h5731699003f383aa9;
    stim[47] = 67'h46fcd28395c1b50d6;
    stim[48] = 67'h153507035845ed2c1;
    stim[49] = 67'h304940de897f42ba2;
    stim[50] = 67'h72b54cab73f5d90e5;
    stim[51] = 67'h5ab813ba9efcc3318;
    stim[52] = 67'h533616cd99e96ff55;
    stim[53] = 67'h6dae5b0f220966fc9;
    stim[54] = 67'h4dc9e0b7520c329b6;
    stim[55] = 67'h4fe3bd94f587eb667;
    stim[56] = 67'h1d4864b131804c5aa;
    stim[57] = 67'h6f35abec8efa74a40;
    stim[58] = 67'h4eaf1d7caba541276;
    stim[59] = 67'h5e10d9a3a8fd8d749;
    stim[60] = 67'h3178baf000e0b0630;
    stim[61] = 67'h49f148f64bdc88d7d;
    stim[62] = 67'h7255d572236ad8104;
    stim[63] = 67'h43ae40d2c64401dd5;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'h8xfxxxxx8xfxxxxx;
      expv[4] = 64'hd0de032a2b71373e;
      expv[5] = 64'h209778afa79e85c6;
      expv[6] = 64'h9c867d024a53e25e;
      expv[7] = 64'h0c921d8aac58375b;
      expv[8] = 64'h214093ad6af6ada6;
      expv[9] = 64'h777507f656c3b15a;
      expv[10] = 64'h55f08dac3a781f89;
      expv[11] = 64'h3943b927ad02ae3c;
      expv[12] = 64'h69abece6108f36c2;
      expv[13] = 64'hbe286496dd1073b9;
      expv[14] = 64'h7847b4d0f2e8dc35;
      expv[15] = 64'h8a75cc46e223797e;
      expv[16] = 64'h8bce2224e7fe2f67;
      expv[17] = 64'hd111eb8faa0fb5ba;
      expv[18] = 64'h55a8f14a2adc8430;
      expv[19] = 64'hf084a4cad2ad90ea;
      expv[20] = 64'h793a66a12c972521;
      expv[21] = 64'h77ee45c92376135e;
      expv[22] = 64'h89e7eb5a467b7659;
      expv[23] = 64'h2d1feb6fea29529c;
      expv[24] = 64'hce93b376ffdc1105;
      expv[25] = 64'h0cfcee2b3db262c3;
      expv[26] = 64'hc0b826fb4482f1e5;
      expv[27] = 64'h87fb31a56d0585d0;
      expv[28] = 64'haae72d12dfc9f397;
      expv[29] = 64'h4dc6a65ee7ece3c1;
      expv[30] = 64'h8035de0400ea4f3e;
      expv[31] = 64'hcc51254ac9ab136b;
      expv[32] = 64'hd9fda488d797c105;
      expv[33] = 64'he75ff254840ff072;
      expv[34] = 64'h55f2849f58a6c7fe;
      expv[35] = 64'h99d97630650221a7;
      expv[36] = 64'ha8a2c8e4faa6ccf0;
      expv[37] = 64'h64794931707c058b;
      expv[38] = 64'h9e08ee137ef12c49;
      expv[39] = 64'h5bc5f367ab801fba;
      expv[40] = 64'h4553c4ed64f6461c;
      expv[41] = 64'hab40f73737a39f21;
      expv[42] = 64'h6b4a2f166164ee27;
      expv[43] = 64'h9e9cffe391a3936f;
      expv[44] = 64'hd54a019ae50fac79;
      expv[45] = 64'h60c93557a12ba877;
      expv[46] = 64'h7eda4cc20b46cf44;
      expv[47] = 64'hbc19035c33cae377;
      expv[48] = 64'h3f383aa973169900;
      expv[49] = 64'h6fcd28395c1b50d6;
      expv[50] = 64'h845ed2c153507035;
      expv[51] = 64'h97f42ba204940de8;
      expv[52] = 64'h3f5d90e52b54cab7;
      expv[53] = 64'hab813ba9efcc3318;
      expv[54] = 64'h33616cd99e96ff55;
      expv[55] = 64'h20966fc9dae5b0f2;
      expv[56] = 64'h20c329b6dc9e0b75;
      expv[57] = 64'hfe3bd94f587eb667;
      expv[58] = 64'h1804c5aad4864b13;
      expv[59] = 64'hefa74a40f35abec8;
      expv[60] = 64'hba541276eaf1d7ca;
      expv[61] = 64'he10d9a3a8fd8d749;
      expv[62] = 64'h0e0b0630178baf00;
      expv[63] = 64'hbdc88d7d9f148f64;
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
