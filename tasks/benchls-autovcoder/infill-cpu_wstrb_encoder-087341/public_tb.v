// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087341 dut (
    .nub_clkn(clk),
    .nub_resetn(in_vec[70:70]),
    .mst_adrcyn(in_vec[69:69]),
    .cpu_valid(in_vec[68:68]),
    .cpu_write(in_vec[67:64]),
    .cpu_addr(in_vec[63:32]),
    .cpu_wdata(in_vec[31:0]),
    .cpu_ad_o(out_vec[35:4]),
    .cpu_tm1n_o(out_vec[3:3]),
    .cpu_tm0n_o(out_vec[2:2]),
    .cpu_error_o(out_vec[1:1]),
    .cpu_masterd_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h175b277c00e61bfd45;
    stim[1] = 71'h3958d0e2054f1179cf;
    stim[2] = 71'h4627f913f48dec6682;
    stim[3] = 71'h456b966d26b2a8ba4e;
    stim[4] = 71'h4c1aa3b5786b0b3b2a;
    stim[5] = 71'h7283b8644f1b2ff946;
    stim[6] = 71'h65caa98c9f2f0759c5;
    stim[7] = 71'h54c1e1a66f7eab1fd5;
    stim[8] = 71'h4e295c5c0b1cff7b22;
    stim[9] = 71'h5f9065ae53c1e3c5f4;
    stim[10] = 71'h7dbfb272e61616b830;
    stim[11] = 71'h592f106d8d0862a05b;
    stim[12] = 71'h73380710d10c6b80ad;
    stim[13] = 71'h550a08ba9ac91c9eef;
    stim[14] = 71'h4d813dc7e935e28309;
    stim[15] = 71'h6d251ccd148e8e5597;
    stim[16] = 71'h6a3eb1e2c49a5e28c9;
    stim[17] = 71'h509834ddf37332f2d5;
    stim[18] = 71'h66f955bf436ffc3840;
    stim[19] = 71'h70323409ec80b03ed6;
    stim[20] = 71'h4e39b6a54dcda28773;
    stim[21] = 71'h5cffd29c13e6164699;
    stim[22] = 71'h78cf72b5a341cb0b8b;
    stim[23] = 71'h4b893823ad94df0358;
    stim[24] = 71'h756b72ebbd8e42c5a9;
    stim[25] = 71'h667ae1f5c4bcd410bc;
    stim[26] = 71'h5a8a7de370af703bdb;
    stim[27] = 71'h4c8b3a8cc19843223e;
    stim[28] = 71'h5bfaef9eaaaf8b5f85;
    stim[29] = 71'h78b7f7f76ec7d1c069;
    stim[30] = 71'h6af46b888398314308;
    stim[31] = 71'h45364b190d997d160f;
    stim[32] = 71'h6c45de2450c6a392d8;
    stim[33] = 71'h4c44b6a8efd14aad2f;
    stim[34] = 71'h62e494b6eae835f30f;
    stim[35] = 71'h4321614f1add172222;
    stim[36] = 71'h69fdbd9f48b14a0ce1;
    stim[37] = 71'h71cc393df3d8597857;
    stim[38] = 71'h67704a388e78895c30;
    stim[39] = 71'h667d4717f5a8ef0eb3;
    stim[40] = 71'h630e3bc1ad6e5888ad;
    stim[41] = 71'h69280396cb49c49cbf;
    stim[42] = 71'h6ca38f600cb0f0f940;
    stim[43] = 71'h542d607110025f6429;
    stim[44] = 71'h7d6ba99ddc34b9bf66;
    stim[45] = 71'h5205302cbd180a2089;
    stim[46] = 71'h50bd3c7c5935ecfd4b;
    stim[47] = 71'h5ef5fbe059e93e816f;
    stim[48] = 71'h7cded94946ee359b06;
    stim[49] = 71'h77b88215ee6499c449;
    stim[50] = 71'h5206d93894b684adf4;
    stim[51] = 71'h42e132fe269cdd913d;
    stim[52] = 71'h7acdc8f87c4829915b;
    stim[53] = 71'h7a3f1dee34d07320f4;
    stim[54] = 71'h484bf03e934b4563f6;
    stim[55] = 71'h609d58b4125b01d50f;
    stim[56] = 71'h660a8b096a8efefa51;
    stim[57] = 71'h6e941acd9b5f86bf9f;
    stim[58] = 71'h6fec1c94edc9f1eb23;
    stim[59] = 71'h4cc575c351e2ea3fd8;
    stim[60] = 71'h5e0684b4e0a2252c8f;
    stim[61] = 71'h41fe237b6ed542e041;
    stim[62] = 71'h695a7dddd8494d3374;
    stim[63] = 71'h492c340707ad5e91fa;
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
      expv[0] = 36'h5b277c03x;
      expv[1] = 36'h4f1179cfx;
      expv[2] = 36'h27f913f7x;
      expv[3] = 36'h6b966d27x;
      expv[4] = 36'h1aa3b57bx;
      expv[5] = 36'h1b2ff946x;
      expv[6] = 36'h2f0759c5x;
      expv[7] = 36'hc1e1a66ex;
      expv[8] = 36'h295c5c0bx;
      expv[9] = 36'h9065ae50x;
      expv[10] = 36'h1616b830x;
      expv[11] = 36'h2f106d8fx;
      expv[12] = 36'h0c6b80adx;
      expv[13] = 36'h0a08ba9bx;
      expv[14] = 36'h813dc7ebx;
      expv[15] = 36'h8e8e5597x;
      expv[16] = 36'h9a5e28c9x;
      expv[17] = 36'h9834ddf0x;
      expv[18] = 36'h6ffc3840x;
      expv[19] = 36'h80b03ed6x;
      expv[20] = 36'h39b6a54fx;
      expv[21] = 36'hffd29c13x;
      expv[22] = 36'h41cb0b8bx;
      expv[23] = 36'h893823afx;
      expv[24] = 36'h8e42c5a9x;
      expv[25] = 36'hbcd410bcx;
      expv[26] = 36'h8a7de373x;
      expv[27] = 36'h8b3a8cc3x;
      expv[28] = 36'hfaef9eabx;
      expv[29] = 36'hc7d1c069x;
      expv[30] = 36'h98314308x;
      expv[31] = 36'h364b190fx;
      expv[32] = 36'hc6a392d8x;
      expv[33] = 36'h44b6a8efx;
      expv[34] = 36'he835f30fx;
      expv[35] = 36'h21614f19x;
      expv[36] = 36'hb14a0ce1x;
      expv[37] = 36'hd8597857x;
      expv[38] = 36'h78895c30x;
      expv[39] = 36'ha8ef0eb3x;
      expv[40] = 36'h6e5888adx;
      expv[41] = 36'h49c49cbfx;
      expv[42] = 36'hb0f0f940x;
      expv[43] = 36'h2d607112x;
      expv[44] = 36'h34b9bf66x;
      expv[45] = 36'h05302cbdx;
      expv[46] = 36'hbd3c7c58x;
      expv[47] = 36'hf5fbe05bx;
      expv[48] = 36'hee359b06x;
      expv[49] = 36'h6499c449x;
      expv[50] = 36'h06d93895x;
      expv[51] = 36'he132fe25x;
      expv[52] = 36'h4829915bx;
      expv[53] = 36'hd07320f4x;
      expv[54] = 36'h4bf03e93x;
      expv[55] = 36'h5b01d50fx;
      expv[56] = 36'h8efefa51x;
      expv[57] = 36'h5f86bf9fx;
      expv[58] = 36'hc9f1eb23x;
      expv[59] = 36'hc575c353x;
      expv[60] = 36'h0684b4e3x;
      expv[61] = 36'hfe237b6cx;
      expv[62] = 36'h494d3374x;
      expv[63] = 36'h2c340707x;
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
