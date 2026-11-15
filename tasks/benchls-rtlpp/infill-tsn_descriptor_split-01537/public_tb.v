// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01537 dut (
    .i_clk(clk),
    .i_rst_n(in_vec[73:73]),
    .iv_descriptor(in_vec[72:1]),
    .i_descriptor_wr(in_vec[0:0]),
    .ov_tsn_descriptor(out_vec[118:73]),
    .o_tsn_descriptor_wr(out_vec[72:72]),
    .ov_standard_descriptor(out_vec[71:1]),
    .o_standard_descriptor_wr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h12e30426e5db3fba5f7;
    stim[1] = 74'h1e26fb8d98b0b4d0b58;
    stim[2] = 74'h2078bf104ac1f1844f9;
    stim[3] = 74'h2803d8145f85f53111f;
    stim[4] = 74'h26281f81f8d0f935398;
    stim[5] = 74'h221a3b21341c3baf001;
    stim[6] = 74'h34b308a0c7d80bbb3e1;
    stim[7] = 74'h3a24661f737a2855886;
    stim[8] = 74'h22477865a8344d00f23;
    stim[9] = 74'h33c2f455fe533849628;
    stim[10] = 74'h3f4e25d7c28d7ca9aa4;
    stim[11] = 74'h378e5ccd0725f985da5;
    stim[12] = 74'h39096cd4a82b782f27c;
    stim[13] = 74'h3a078c559cd5d7d2bb0;
    stim[14] = 74'h3e6b73f00b60f3ccf8c;
    stim[15] = 74'h25ad87a17c9bfefc6f7;
    stim[16] = 74'h2cc10889b4fb9981dd3;
    stim[17] = 74'h23108773a7a433a40fc;
    stim[18] = 74'h3e9c7b44d201f7657b6;
    stim[19] = 74'h20dbf8f88bba0baa52a;
    stim[20] = 74'h39ce9b5a4db28c2ee01;
    stim[21] = 74'h312fa4b08b57ea3a637;
    stim[22] = 74'h266710c70058dcafca0;
    stim[23] = 74'h2a37c1e3bbe54ef6359;
    stim[24] = 74'h3b14f081bbe3e5219f6;
    stim[25] = 74'h354883b7dee9ca5e8b7;
    stim[26] = 74'h3992867a0badbd8af48;
    stim[27] = 74'h35d3e2ee56b07358d38;
    stim[28] = 74'h272f227f4505b61c7f0;
    stim[29] = 74'h24c3ac79e23b43bddf7;
    stim[30] = 74'h3798ed2bdb36268683b;
    stim[31] = 74'h2b0f05136a9e250511d;
    stim[32] = 74'h3a3c7871d21aadabc43;
    stim[33] = 74'h36bcc65cd945c4009bc;
    stim[34] = 74'h17b4269da99b084df6b;
    stim[35] = 74'h2371c34d04aec950624;
    stim[36] = 74'h3233d43ffe5b686ec32;
    stim[37] = 74'h318ef77734a404970c6;
    stim[38] = 74'h2710e687d83a66fff60;
    stim[39] = 74'h33a6b2d7c3891136707;
    stim[40] = 74'h3a81c0bfbc5a80f73d4;
    stim[41] = 74'h33708f6afc2d03675a1;
    stim[42] = 74'h24f22d7a0bbd9abd20b;
    stim[43] = 74'h24e87329ca7cdfdbb70;
    stim[44] = 74'h2057775f9ac2a9a3810;
    stim[45] = 74'h3e85847117e46adeca1;
    stim[46] = 74'h285626d3616ddf594fe;
    stim[47] = 74'h299394d456ec571084a;
    stim[48] = 74'h216c3603f5759249b09;
    stim[49] = 74'h34fb84d09e80dd97d80;
    stim[50] = 74'h33f0c13f4169c42746f;
    stim[51] = 74'h37e21b253c75fe32ff7;
    stim[52] = 74'h384b7a4127e54151cf8;
    stim[53] = 74'h2f423e55e410ba72377;
    stim[54] = 74'h213ae482e2f39a8b6b2;
    stim[55] = 74'h21bd8314c319a388ec0;
    stim[56] = 74'h38997319f9bd79a6077;
    stim[57] = 74'h339ef3f40feca0843ed;
    stim[58] = 74'h29126dd468e6ea1e576;
    stim[59] = 74'h3865e53b651b4d314a9;
    stim[60] = 74'h2272cfd8f1e9442968b;
    stim[61] = 74'h28178faf333dd0b34cc;
    stim[62] = 74'h3fd47a26aadf03ac7ef;
    stim[63] = 74'h2346833a91426b507d5;
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
      expv[0] = 119'h000000000000000000000000000000;
      expv[1] = 119'h000000000000000000000000000000;
      expv[2] = 119'h000000000000000000000000000000;
      expv[3] = 119'h00000000000003c5f882560e1844f9;
      expv[4] = 119'h000000000000401ec0a2fc2e53111f;
      expv[5] = 119'h000000000000000000000000000000;
      expv[6] = 119'h00000000000010d1d909a0e0baf001;
      expv[7] = 119'h0174b30bb3e1000000000000000000;
      expv[8] = 119'h000000000000000000000000000000;
      expv[9] = 119'h01a247700f23000000000000000000;
      expv[10] = 119'h000000000000000000000000000000;
      expv[11] = 119'h000000000000000000000000000000;
      expv[12] = 119'h000000000000bc72e668392e985da5;
      expv[13] = 119'h000000000000000000000000000000;
      expv[14] = 119'h000000000000000000000000000000;
      expv[15] = 119'h000000000000000000000000000000;
      expv[16] = 119'h0000000000002d6c3d0be4deefc6f7;
      expv[17] = 119'h0000000000006608444da7dc981dd3;
      expv[18] = 119'h000000000000000000000000000000;
      expv[19] = 119'h000000000000000000000000000000;
      expv[20] = 119'h000000000000000000000000000000;
      expv[21] = 119'h0199ce92ee01000000000000000000;
      expv[22] = 119'h01512fa3a637000000000000000000;
      expv[23] = 119'h000000000000000000000000000000;
      expv[24] = 119'h01ca37cf6359000000000000000000;
      expv[25] = 119'h000000000000000000000000000000;
      expv[26] = 119'h01554885e8b7000000000000000000;
      expv[27] = 119'h000000000000000000000000000000;
      expv[28] = 119'h000000000000000000000000000000;
      expv[29] = 119'h000000000000000000000000000000;
      expv[30] = 119'h0064c3abddf7000000000000000000;
      expv[31] = 119'h00d798e8683b000000000000000000;
      expv[32] = 119'h00ab0f00511d000000000000000000;
      expv[33] = 119'h01ba3c7abc43000000000000000000;
      expv[34] = 119'h000000000000000000000000000000;
      expv[35] = 119'h000000000000000000000000000000;
      expv[36] = 119'h000000000000000000000000000000;
      expv[37] = 119'h000000000000000000000000000000;
      expv[38] = 119'h000000000000000000000000000000;
      expv[39] = 119'h000000000000000000000000000000;
      expv[40] = 119'h0000000000009d3596be1c48136707;
      expv[41] = 119'h000000000000000000000000000000;
      expv[42] = 119'h0073708675a1000000000000000000;
      expv[43] = 119'h00000000000027916bd05decabd20b;
      expv[44] = 119'h000000000000000000000000000000;
      expv[45] = 119'h000000000000000000000000000000;
      expv[46] = 119'h015e858deca1000000000000000000;
      expv[47] = 119'h000000000000000000000000000000;
      expv[48] = 119'h000000000000000000000000000000;
      expv[49] = 119'h0000000000000b61b01fabac249b09;
      expv[50] = 119'h000000000000000000000000000000;
      expv[51] = 119'h0093f0c2746f000000000000000000;
      expv[52] = 119'h000000000000bf10d929e3aee32ff7;
      expv[53] = 119'h000000000000000000000000000000;
      expv[54] = 119'h0000000000007a11f2af2084a72377;
      expv[55] = 119'h000000000000000000000000000000;
      expv[56] = 119'h000000000000000000000000000000;
      expv[57] = 119'h000000000000c4cb98cfcdea9a6077;
      expv[58] = 119'h00139ef843ed000000000000000000;
      expv[59] = 119'h000000000000000000000000000000;
      expv[60] = 119'h01b865e314a9000000000000000000;
      expv[61] = 119'h008272c2968b000000000000000000;
      expv[62] = 119'h000000000000000000000000000000;
      expv[63] = 119'h007fd47ac7ef000000000000000000;
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
