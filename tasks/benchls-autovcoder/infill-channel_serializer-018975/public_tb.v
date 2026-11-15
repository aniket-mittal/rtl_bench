// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 126;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018975 dut (
    .clock(clk),
    .reset(in_vec[125:125]),
    .io_in_valid(in_vec[124:124]),
    .io_in_bits_chanId(in_vec[123:121]),
    .io_in_bits_opcode(in_vec[120:118]),
    .io_in_bits_param(in_vec[117:115]),
    .io_in_bits_size(in_vec[114:111]),
    .io_in_bits_source(in_vec[110:107]),
    .io_in_bits_address(in_vec[106:75]),
    .io_in_bits_data(in_vec[74:11]),
    .io_in_bits_corrupt(in_vec[10:10]),
    .io_in_bits_union(in_vec[9:2]),
    .io_in_bits_last(in_vec[1:1]),
    .io_out_ready(in_vec[0:0]),
    .io_in_ready(out_vec[33:33]),
    .io_out_valid(out_vec[32:32]),
    .io_out_bits(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 126'h23826a44330e42fd557b97dc40924d2b;
    stim[1] = 126'h378faae72c240a46feff29987114fc68;
    stim[2] = 126'h10ef7a2abef5cc1690ec2cca21878b71;
    stim[3] = 126'h055767c0234c454957b48ddbbfd724ff;
    stim[4] = 126'h0dbf357d1e7556d854324dddbec4b3fa;
    stim[5] = 126'h1a775ec3b48fe80da74a603ff9b4bdf1;
    stim[6] = 126'h03569ccc8d9b6f8ad2f925dd85ece711;
    stim[7] = 126'h16754f693cde14a8786be72c51c46521;
    stim[8] = 126'h0fa8cdc80e2ce257109213a0b6d954d3;
    stim[9] = 126'h1e04e18bbe4f047cffe954f63941d2f1;
    stim[10] = 126'h1356eda77f9413fab6ce3c5e16b44f1c;
    stim[11] = 126'h066b723b33aa46cb170cff1577512972;
    stim[12] = 126'h182483d6c75f86a26634e366f2b6f07c;
    stim[13] = 126'h1d7150a4f98afac77fb1d768c9f146bf;
    stim[14] = 126'h0aefbafbc10827c40249e1825dec7d00;
    stim[15] = 126'h09e66e6d75bbd51f4985c5d371143ddd;
    stim[16] = 126'h1a7baa4340017918f1604079d68ae7c6;
    stim[17] = 126'h160593d1563dd3e803fe37e285116754;
    stim[18] = 126'h162243b58d334c4038e810009fb1fa4d;
    stim[19] = 126'h06ca6ad2015b5798ac2f019fa0c026f2;
    stim[20] = 126'h0db7c72646687ab0488d0e62cb82906f;
    stim[21] = 126'h1de237618d35c84fa51410cfe831d269;
    stim[22] = 126'h14d99c295951ecce48d1e4eeac6e4a63;
    stim[23] = 126'h0aa221ffed27b9c92594ac2c4f5de706;
    stim[24] = 126'h18790c3fe16c03d0a289ce7cfcb0c9bf;
    stim[25] = 126'h0d48da9167212a706e5e71f88e37d93c;
    stim[26] = 126'h038c3ed3cd5db019bbe7b65161cef71c;
    stim[27] = 126'h0276e79606025dca28030d6dad675503;
    stim[28] = 126'h12538bc905fd147a6e760b35dca3f6ba;
    stim[29] = 126'h0e3528617cc5223559ef8e5492b3704f;
    stim[30] = 126'h140e6e5f44cc58ecfb40f22f4da2ff4e;
    stim[31] = 126'h11182a7eff1af4f3f66422e58e3379f7;
    stim[32] = 126'h0b3131c065a24b6d92b40e7797f8ab7b;
    stim[33] = 126'h1c4f8520eb41708fcfd4b8adcc3dd0b8;
    stim[34] = 126'h1bd8210453fa1a99b1863e1635f6b61f;
    stim[35] = 126'h0240e5ce59ca3aef538fa24b3a2c5efa;
    stim[36] = 126'h01c02fba5b3d0f6a2470cd848ed57b7f;
    stim[37] = 126'h0c05e9b5f4f4563fad58d6d26d853391;
    stim[38] = 126'h14aaa9476aa1096fca9a4f841e065d0f;
    stim[39] = 126'h0bcd3408f9aa3fe88e64c6cba73a0173;
    stim[40] = 126'h0763b191588c36f9f14bc2f96d9fe041;
    stim[41] = 126'h1e112c9d4a61b7ba91132b83e49e25e3;
    stim[42] = 126'h03421e6dda992b61764f1ae5b638ef5a;
    stim[43] = 126'h168a8df3df55d8302b0135c8eb92f8f2;
    stim[44] = 126'h17f73853fbd51339cc1acd016d455cde;
    stim[45] = 126'h0658b48fade0b2f59beaef5f47c08f36;
    stim[46] = 126'h04cfe4de97b7807a8ce414259662a583;
    stim[47] = 126'h0c93a99728f3be3602a05f3d47120210;
    stim[48] = 126'h0c7d0b5cf46aba92bec2f0165efc83d4;
    stim[49] = 126'h1631f981ed32c795ad52a04113213fb0;
    stim[50] = 126'h178af3a2c2f4f8699c3b7082662befb4;
    stim[51] = 126'h00dc2f8d32db3b875b6c59900c052d4d;
    stim[52] = 126'h371ad434376c1f965acfd3e38216fa1f;
    stim[53] = 126'h03e038a7435afe2af6ea6ec30da34a31;
    stim[54] = 126'h057a34447ee80a49846dbe94fd938fee;
    stim[55] = 126'h1cab4f6dcdc732e81ceb2973e22cfbf7;
    stim[56] = 126'h08444879bfb973668bc84b05a6623558;
    stim[57] = 126'h19d000b54ae7696719b7568209fb3f43;
    stim[58] = 126'h19370c32eca30f34a857d3343a1e9504;
    stim[59] = 126'h04d32283ffd9e5aec28cf1f8abe09a79;
    stim[60] = 126'h0613e0c388dfd62072681818f5b518e0;
    stim[61] = 126'h0e26afd02946e7f62e90ef41bb9979d4;
    stim[62] = 126'h04c5fae2e1bd00b915b5f4cc64d42c46;
    stim[63] = 126'h1be75a2f8708a80e555b4efb9cca1085;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h2xxxxxxxx;
      expv[2] = 34'h2388a7e34;
      expv[3] = 34'h110c3c5b8;
      expv[4] = 34'h148761665;
      expv[5] = 34'h148761665;
      expv[6] = 34'h15f7ae60b;
      expv[7] = 34'h10077bd15;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h11ca0e978;
      expv[11] = 34'h11ca0e978;
      expv[12] = 34'h11ca0e978;
      expv[13] = 34'h11ca0e978;
      expv[14] = 34'h17ff4aa7b;
      expv[15] = 34'h17ff4aa7b;
      expv[16] = 34'h1df27823e;
      expv[17] = 34'h1df27823e;
      expv[18] = 34'h1df27823e;
      expv[19] = 34'h1070270c5;
      expv[20] = 34'h1070270c5;
      expv[21] = 34'h200000000;
      expv[22] = 34'h1f418e934;
      expv[23] = 34'h1d28a0867;
      expv[24] = 34'h1d28a0867;
      expv[25] = 34'h1c69ae427;
      expv[26] = 34'h1c69ae427;
      expv[27] = 34'h1c69ae427;
      expv[28] = 34'h106f11bb0;
      expv[29] = 34'h106f11bb0;
      expv[30] = 34'h200000000;
      expv[31] = 34'h1a6d17fa7;
      expv[32] = 34'h17da07917;
      expv[33] = 34'h1a2662c76;
      expv[34] = 34'h1a2662c76;
      expv[35] = 34'h10207372f;
      expv[36] = 34'h10207372f;
      expv[37] = 34'h200000000;
      expv[38] = 34'h200000000;
      expv[39] = 34'h10f032e87;
      expv[40] = 34'h1e54d27c2;
      expv[41] = 34'h1b55084b7;
      expv[42] = 34'h1025554a3;
      expv[43] = 34'h1025554a3;
      expv[44] = 34'h1025554a3;
      expv[45] = 34'h1025554a3;
      expv[46] = 34'h1025554a3;
      expv[47] = 34'h200000000;
      expv[48] = 34'h200000000;
      expv[49] = 34'h200000000;
      expv[50] = 34'h189909fd8;
      expv[51] = 34'h189909fd8;
      expv[52] = 34'h1d6a95020;
      expv[53] = 34'h2f69963ca;
      expv[54] = 34'h2f69963ca;
      expv[55] = 34'h2f69963ca;
      expv[56] = 34'h1f1167dfb;
      expv[57] = 34'h1f1167dfb;
      expv[58] = 34'h10e7594b9;
      expv[59] = 34'h10e7594b9;
      expv[60] = 34'h1e6e39974;
      expv[61] = 34'h1e6e39974;
      expv[62] = 34'h1e6e39974;
      expv[63] = 34'h1e6e39974;
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
