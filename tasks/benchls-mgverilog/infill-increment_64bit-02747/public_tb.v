// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02747 dut (
    .in(in_vec[63:0]),
    .out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h5b79e66051399626;
    stim[1] = 64'h7891d6a2e4f4affe;
    stim[2] = 64'h76e04250be0475ba;
    stim[3] = 64'h02dcaabd478fe0b0;
    stim[4] = 64'h1923de5c61dd3c3c;
    stim[5] = 64'h3236984b448e8cee;
    stim[6] = 64'hae0fdb423df2443d;
    stim[7] = 64'hc0cb1591cacfe627;
    stim[8] = 64'hffbc7dc1a0f73432;
    stim[9] = 64'h810723d13a3e95e4;
    stim[10] = 64'ha4ce8c1b2fefe55b;
    stim[11] = 64'hd52cf9b2226cb52f;
    stim[12] = 64'h52b5010f8746d89c;
    stim[13] = 64'hbb9d7b79b0dcf3db;
    stim[14] = 64'hd65ebacfd5632ec6;
    stim[15] = 64'h976f389a4c2402e4;
    stim[16] = 64'h308f280ea0cdfea1;
    stim[17] = 64'h61cee692c6c00211;
    stim[18] = 64'h7fdf72d20fbd15a9;
    stim[19] = 64'h6029985859721dcb;
    stim[20] = 64'h0dcc16ea82815473;
    stim[21] = 64'h2e3beb0fe2d65c9a;
    stim[22] = 64'h2c5a89f4bec0b094;
    stim[23] = 64'h7c3b4446ff55fbb1;
    stim[24] = 64'hbfc3ba804000b170;
    stim[25] = 64'h22fc74964ed90384;
    stim[26] = 64'ha6452001a70aef52;
    stim[27] = 64'h16c84d0f89063b24;
    stim[28] = 64'hcdb77f6f170734fc;
    stim[29] = 64'h9ba74de48cc70e87;
    stim[30] = 64'h28e2bba6e9a8466a;
    stim[31] = 64'h9138697458b41170;
    stim[32] = 64'h0b81621a17dfef55;
    stim[33] = 64'h47b980c796be2be7;
    stim[34] = 64'h0f0c9db355e70b74;
    stim[35] = 64'hf918b8f76bbcad89;
    stim[36] = 64'hfa2b3bbb3151b27e;
    stim[37] = 64'h3e4ec208f004adb5;
    stim[38] = 64'hb59182a8895bf52a;
    stim[39] = 64'ha9d9fc4aafcd1cf2;
    stim[40] = 64'h1301558fe0c4ea53;
    stim[41] = 64'hd514270c2eb46ee7;
    stim[42] = 64'h380046cc46a16ab3;
    stim[43] = 64'h74d62fb506da8b87;
    stim[44] = 64'h06286616603ca9d7;
    stim[45] = 64'h46b866a119bfc711;
    stim[46] = 64'h27ccb5ee63b860f2;
    stim[47] = 64'h9e27e3dd57684cee;
    stim[48] = 64'h8e5f179a228df512;
    stim[49] = 64'h6e6ee19cfebedbc2;
    stim[50] = 64'h03b6e3b9482114b0;
    stim[51] = 64'h781096bbcd04fa05;
    stim[52] = 64'h54c91ca50a22af55;
    stim[53] = 64'h4986a6b1412025b2;
    stim[54] = 64'hdfafc308971a7bc9;
    stim[55] = 64'hcd9087facc146bd6;
    stim[56] = 64'hd1a1c91ac91f0d0b;
    stim[57] = 64'h39ee35e0987feb98;
    stim[58] = 64'hc230cffd38eb5616;
    stim[59] = 64'haafd129c85706ce7;
    stim[60] = 64'hb8691cfc09f5c56f;
    stim[61] = 64'h52be8f6dc6915ea3;
    stim[62] = 64'h4395a134740b09f1;
    stim[63] = 64'h17c88a582a15f919;
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
      expv[0] = 64'h5b79e66051399627;
      expv[1] = 64'h7891d6a2e4f4afff;
      expv[2] = 64'h76e04250be0475bb;
      expv[3] = 64'h02dcaabd478fe0b1;
      expv[4] = 64'h1923de5c61dd3c3d;
      expv[5] = 64'h3236984b448e8cef;
      expv[6] = 64'hae0fdb423df2443e;
      expv[7] = 64'hc0cb1591cacfe628;
      expv[8] = 64'hffbc7dc1a0f73433;
      expv[9] = 64'h810723d13a3e95e5;
      expv[10] = 64'ha4ce8c1b2fefe55c;
      expv[11] = 64'hd52cf9b2226cb530;
      expv[12] = 64'h52b5010f8746d89d;
      expv[13] = 64'hbb9d7b79b0dcf3dc;
      expv[14] = 64'hd65ebacfd5632ec7;
      expv[15] = 64'h976f389a4c2402e5;
      expv[16] = 64'h308f280ea0cdfea2;
      expv[17] = 64'h61cee692c6c00212;
      expv[18] = 64'h7fdf72d20fbd15aa;
      expv[19] = 64'h6029985859721dcc;
      expv[20] = 64'h0dcc16ea82815474;
      expv[21] = 64'h2e3beb0fe2d65c9b;
      expv[22] = 64'h2c5a89f4bec0b095;
      expv[23] = 64'h7c3b4446ff55fbb2;
      expv[24] = 64'hbfc3ba804000b171;
      expv[25] = 64'h22fc74964ed90385;
      expv[26] = 64'ha6452001a70aef53;
      expv[27] = 64'h16c84d0f89063b25;
      expv[28] = 64'hcdb77f6f170734fd;
      expv[29] = 64'h9ba74de48cc70e88;
      expv[30] = 64'h28e2bba6e9a8466b;
      expv[31] = 64'h9138697458b41171;
      expv[32] = 64'h0b81621a17dfef56;
      expv[33] = 64'h47b980c796be2be8;
      expv[34] = 64'h0f0c9db355e70b75;
      expv[35] = 64'hf918b8f76bbcad8a;
      expv[36] = 64'hfa2b3bbb3151b27f;
      expv[37] = 64'h3e4ec208f004adb6;
      expv[38] = 64'hb59182a8895bf52b;
      expv[39] = 64'ha9d9fc4aafcd1cf3;
      expv[40] = 64'h1301558fe0c4ea54;
      expv[41] = 64'hd514270c2eb46ee8;
      expv[42] = 64'h380046cc46a16ab4;
      expv[43] = 64'h74d62fb506da8b88;
      expv[44] = 64'h06286616603ca9d8;
      expv[45] = 64'h46b866a119bfc712;
      expv[46] = 64'h27ccb5ee63b860f3;
      expv[47] = 64'h9e27e3dd57684cef;
      expv[48] = 64'h8e5f179a228df513;
      expv[49] = 64'h6e6ee19cfebedbc3;
      expv[50] = 64'h03b6e3b9482114b1;
      expv[51] = 64'h781096bbcd04fa06;
      expv[52] = 64'h54c91ca50a22af56;
      expv[53] = 64'h4986a6b1412025b3;
      expv[54] = 64'hdfafc308971a7bca;
      expv[55] = 64'hcd9087facc146bd7;
      expv[56] = 64'hd1a1c91ac91f0d0c;
      expv[57] = 64'h39ee35e0987feb99;
      expv[58] = 64'hc230cffd38eb5617;
      expv[59] = 64'haafd129c85706ce8;
      expv[60] = 64'hb8691cfc09f5c570;
      expv[61] = 64'h52be8f6dc6915ea4;
      expv[62] = 64'h4395a134740b09f2;
      expv[63] = 64'h17c88a582a15f91a;
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
