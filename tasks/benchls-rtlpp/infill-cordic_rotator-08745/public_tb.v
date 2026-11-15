// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08745 dut (
    .clock(clk),
    .angle(in_vec[63:32]),
    .Xin(in_vec[31:16]),
    .Yin(in_vec[15:0]),
    .Xout(out_vec[33:17]),
    .Yout(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hfdbc0ef0387d2452;
    stim[1] = 64'hd47b79f4d1193f3f;
    stim[2] = 64'h525a0c5ab928395c;
    stim[3] = 64'h5c339515537af406;
    stim[4] = 64'hc3321dec67a19861;
    stim[5] = 64'hf2443d365bed9ba8;
    stim[6] = 64'h939b79b4a3d64b6f;
    stim[7] = 64'h777e4bb7973a6505;
    stim[8] = 64'h6d3fce6e49818056;
    stim[9] = 64'h426794457be8dc4d;
    stim[10] = 64'h8a1f2f1c7bd0d786;
    stim[11] = 64'h1818d45d1fe630c6;
    stim[12] = 64'h54ceda9c74d7e217;
    stim[13] = 64'h6c75d9aa078dda7d;
    stim[14] = 64'h05eefefc62d0bf0e;
    stim[15] = 64'h97a4c25b56f31e7c;
    stim[16] = 64'h46c8ae0a3147e9e3;
    stim[17] = 64'h6fbc26719820f5e8;
    stim[18] = 64'h2aa76188dc5c6af4;
    stim[19] = 64'hbd99e2b55f77c912;
    stim[20] = 64'ha3f8156bae38d391;
    stim[21] = 64'he7a10f59ce7dee26;
    stim[22] = 64'h02842fe2d51e2f9f;
    stim[23] = 64'h78359521784ed149;
    stim[24] = 64'hd365ae51910135e3;
    stim[25] = 64'h5680ef5af9ccdd76;
    stim[26] = 64'h86444652cb8a1005;
    stim[27] = 64'h755a1f80769a33e8;
    stim[28] = 64'ha5363454e716cad9;
    stim[29] = 64'h3cbb70f63f5e40e0;
    stim[30] = 64'h150203085babfca3;
    stim[31] = 64'hd86dba69c785f63f;
    stim[32] = 64'hef62e72c2cef8480;
    stim[33] = 64'ha52491c33603b7c6;
    stim[34] = 64'ha5607312d4ec43bf;
    stim[35] = 64'h09b56225a79ff51c;
    stim[36] = 64'h077e7312b7a2a066;
    stim[37] = 64'hfb54738a91e4b723;
    stim[38] = 64'h1e83667f5f88761e;
    stim[39] = 64'h48719fefd0e931b9;
    stim[40] = 64'h577283f516a70ba6;
    stim[41] = 64'h4138b37d6e25c137;
    stim[42] = 64'hd1c6e663939f48f4;
    stim[43] = 64'h8c871e7aa4b957a5;
    stim[44] = 64'h387cad7b9789ba44;
    stim[45] = 64'h51470c5281f4a4b9;
    stim[46] = 64'h14250203f305af64;
    stim[47] = 64'he32b1e830bfdbd0e;
    stim[48] = 64'h7d8d7e8e421f11bd;
    stim[49] = 64'h28cdc800555c0804;
    stim[50] = 64'h0974940170e5888d;
    stim[51] = 64'h8fdbb106c45623f5;
    stim[52] = 64'hf06f21e81024ab77;
    stim[53] = 64'hfe68206c4cdc2c54;
    stim[54] = 64'hf1cc3adb2413e74c;
    stim[55] = 64'hd21240d811832b41;
    stim[56] = 64'h7978f59527d35745;
    stim[57] = 64'hb599cb8dbd49c499;
    stim[58] = 64'haf92a12b89c8c394;
    stim[59] = 64'h9681e99a875582ba;
    stim[60] = 64'hfe36f8677135084a;
    stim[61] = 64'h918f12682372ecd4;
    stim[62] = 64'ha7b589ba9e51d108;
    stim[63] = 64'hc4ed9341f10ba53d;
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
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'hxxxxxxxxx;
      expv[9] = 34'hxxxxxxxxx;
      expv[10] = 34'hxxxxxxxxx;
      expv[11] = 34'hxxxxxxxxx;
      expv[12] = 34'hxxxxxxxxx;
      expv[13] = 34'hxxxxxxxxx;
      expv[14] = 34'hxxxxxxxxx;
      expv[15] = 34'hxxxxxxxxx;
      expv[16] = 34'h0c068368b;
      expv[17] = 34'h06c2475d9;
      expv[18] = 34'h3bb7b6ddc;
      expv[19] = 34'h36ee4766c;
      expv[20] = 34'h2c6834883;
      expv[21] = 34'h0b07531fa;
      expv[22] = 34'h18017d81f;
      expv[23] = 34'h10c9b397f;
      expv[24] = 34'h3e1d4f21c;
      expv[25] = 34'h05d46cf28;
      expv[26] = 34'h253f00e79;
      expv[27] = 34'h3fdaa5ff4;
      expv[28] = 34'h399d2bfef;
      expv[29] = 34'h022f23c8b;
      expv[30] = 34'h16103adcd;
      expv[31] = 34'h3478b8784;
      expv[32] = 34'h02cf0560f;
      expv[33] = 34'h14823ccd5;
      expv[34] = 34'h29446254b;
      expv[35] = 34'h338ed6861;
      expv[36] = 34'h039f89683;
      expv[37] = 34'h35828159d;
      expv[38] = 34'h3695649ec;
      expv[39] = 34'h298407131;
      expv[40] = 34'h3f636cb22;
      expv[41] = 34'h06b8e1526;
      expv[42] = 34'h0b2d9f32b;
      expv[43] = 34'h25a77dfe4;
      expv[44] = 34'h3a79255f9;
      expv[45] = 34'h33bc4708d;
      expv[46] = 34'h10c20459a;
      expv[47] = 34'h37c7e43bc;
      expv[48] = 34'h3e69527f6;
      expv[49] = 34'h2d6fe028a;
      expv[50] = 34'h10769f483;
      expv[51] = 34'h2ed95cc3e;
      expv[52] = 34'h34f474f6d;
      expv[53] = 34'h27c4d9d88;
      expv[54] = 34'h3dd94f991;
      expv[55] = 34'h37fa5a346;
      expv[56] = 34'h3b73414de;
      expv[57] = 34'h0c3cab868;
      expv[58] = 34'h042eed484;
      expv[59] = 34'h175e5a3e8;
      expv[60] = 34'h0a2b141d6;
      expv[61] = 34'h1bcd180ac;
      expv[62] = 34'h058578104;
      expv[63] = 34'h38eb19f64;
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
