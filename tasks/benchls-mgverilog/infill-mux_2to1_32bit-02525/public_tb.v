// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02525 dut (
    .in1(in_vec[64:33]),
    .in2(in_vec[32:1]),
    .choose(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1ecc5443b1b49fe70;
    stim[1] = 65'h09a5bf27c932fbe8b;
    stim[2] = 65'h0a97b516d2069af41;
    stim[3] = 65'h1063d03d405ed2ca7;
    stim[4] = 65'h0c00e1d6f38bb8023;
    stim[5] = 65'h1a5c77da02c281abd;
    stim[6] = 65'h176919f842e63c1ad;
    stim[7] = 65'h167f5f010c0d7e06c;
    stim[8] = 65'h0a236b52c2bc52698;
    stim[9] = 65'h06947014044350f0f;
    stim[10] = 65'h1f8a803fc46626bc7;
    stim[11] = 65'h1bd4c9d649a7e70cd;
    stim[12] = 65'h0d2ccdac4b14405b1;
    stim[13] = 65'h13f9c76c9c95b1e1b;
    stim[14] = 65'h14607b61f59ff36ec;
    stim[15] = 65'h119f58762745df01b;
    stim[16] = 65'h1ef3d9e5ba8ba4f4e;
    stim[17] = 65'h10766d23e8131c30b;
    stim[18] = 65'h18e50240802803352;
    stim[19] = 65'h08ad90fd445713b07;
    stim[20] = 65'h0cbeb9ff47c0c5471;
    stim[21] = 65'h00ec900473b901b87;
    stim[22] = 65'h02496bf1a5c4a259f;
    stim[23] = 65'h0d127eedee22c33ef;
    stim[24] = 65'h10a7beeeb98f1793d;
    stim[25] = 65'h19d0b856118ae21e0;
    stim[26] = 65'h004638f5f3536fe0b;
    stim[27] = 65'h15efa91672095562c;
    stim[28] = 65'h1ec50d89d0231c2cf;
    stim[29] = 65'h19a4a4b323fdcf1c0;
    stim[30] = 65'h1dbb09b7d5b5b97db;
    stim[31] = 65'h10a85f1988dd3d7d0;
    stim[32] = 65'h0552b88f8ea58b7f4;
    stim[33] = 65'h1e3b652d0f6d47d0b;
    stim[34] = 65'h1aec5689a804f5bca;
    stim[35] = 65'h0b8d0e9092f16fc6d;
    stim[36] = 65'h040b871f6316f09c4;
    stim[37] = 65'h1e3a4bade8f43e54a;
    stim[38] = 65'h152345f71980e7285;
    stim[39] = 65'h17c6205c4ebb71526;
    stim[40] = 65'h1a19450937cf4cd42;
    stim[41] = 65'h08ccbb67080900d22;
    stim[42] = 65'h03581bf40f58030e3;
    stim[43] = 65'h1d4b873049d652baa;
    stim[44] = 65'h0f253f80477705f60;
    stim[45] = 65'h13584f024d4845909;
    stim[46] = 65'h17f0c098b35696f77;
    stim[47] = 65'h12456e7682ceb79bf;
    stim[48] = 65'h051e3171fc37b889a;
    stim[49] = 65'h19c6b8ed3122f935c;
    stim[50] = 65'h13da5ca1f6136930b;
    stim[51] = 65'h0354fb902496eaff9;
    stim[52] = 65'h12168d0103f34abe8;
    stim[53] = 65'h0ea107614d90ee34d;
    stim[54] = 65'h148a008b041cce6cf;
    stim[55] = 65'h1f35e4cbff5583156;
    stim[56] = 65'h19f39344b12e98619;
    stim[57] = 65'h085f09e7a3594e0d9;
    stim[58] = 65'h0cf8bbee9cc2a9a37;
    stim[59] = 65'h05d3c9fd90b8eb6f6;
    stim[60] = 65'h14934fbc5fdec63d4;
    stim[61] = 65'h158d2d4b490240c3a;
    stim[62] = 65'h1b3d8758f62e0de7e;
    stim[63] = 65'h11d82614c51cd0241;
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
      expv[0] = 32'hf662a21d;
      expv[1] = 32'h4997df45;
      expv[2] = 32'h9034d7a0;
      expv[3] = 32'h02f69653;
      expv[4] = 32'h9c5dc011;
      expv[5] = 32'h16140d5e;
      expv[6] = 32'h1731e0d6;
      expv[7] = 32'hb3faf808;
      expv[8] = 32'h511b5a96;
      expv[9] = 32'h221a8787;
      expv[10] = 32'h233135e3;
      expv[11] = 32'h4d3f3866;
      expv[12] = 32'h58a202d8;
      expv[13] = 32'he4ad8f0d;
      expv[14] = 32'ha303db0f;
      expv[15] = 32'h3a2ef80d;
      expv[16] = 32'hf79ecf2d;
      expv[17] = 32'h4098e185;
      expv[18] = 32'hc7281204;
      expv[19] = 32'h22b89d83;
      expv[20] = 32'h3e062a38;
      expv[21] = 32'h9dc80dc3;
      expv[22] = 32'h2e2512cf;
      expv[23] = 32'h711619f7;
      expv[24] = 32'hcc78bc9e;
      expv[25] = 32'hce85c2b0;
      expv[26] = 32'h9a9b7f05;
      expv[27] = 32'haf7d48b3;
      expv[28] = 32'h8118e167;
      expv[29] = 32'hcd252599;
      expv[30] = 32'hadadcbed;
      expv[31] = 32'h8542f8cc;
      expv[32] = 32'h2a95c47c;
      expv[33] = 32'h7b6a3e85;
      expv[34] = 32'hd762b44d;
      expv[35] = 32'h978b7e36;
      expv[36] = 32'h205c38fb;
      expv[37] = 32'hf1d25d6f;
      expv[38] = 32'hcc073942;
      expv[39] = 32'hbe3102e2;
      expv[40] = 32'hd0ca2849;
      expv[41] = 32'h4665db38;
      expv[42] = 32'h7ac01871;
      expv[43] = 32'hea5c3982;
      expv[44] = 32'h7929fc02;
      expv[45] = 32'h6a422c84;
      expv[46] = 32'h9ab4b7bb;
      expv[47] = 32'h1675bcdf;
      expv[48] = 32'h28f18b8f;
      expv[49] = 32'hce35c769;
      expv[50] = 32'hb09b4985;
      expv[51] = 32'h24b757fc;
      expv[52] = 32'h90b46808;
      expv[53] = 32'h6c8771a6;
      expv[54] = 32'h20e67367;
      expv[55] = 32'hf9af265f;
      expv[56] = 32'h8974c30c;
      expv[57] = 32'h1aca706c;
      expv[58] = 32'he6154d1b;
      expv[59] = 32'h2e9e4fec;
      expv[60] = 32'ha49a7de2;
      expv[61] = 32'hac696a5a;
      expv[62] = 32'hd9ec3ac7;
      expv[63] = 32'h28e68120;
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
