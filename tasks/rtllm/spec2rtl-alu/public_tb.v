// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  alu dut (
    .a(in_vec[69:38]),
    .b(in_vec[37:6]),
    .aluc(in_vec[5:0]),
    .r(out_vec[36:5]),
    .zero(out_vec[4:4]),
    .carry(out_vec[3:3]),
    .negative(out_vec[2:2]),
    .overflow(out_vec[1:1]),
    .flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h214c52cf56508c378b;
    stim[1] = 70'h36aa35e488590d0548;
    stim[2] = 70'h1491ce317df3b39fa7;
    stim[3] = 70'h13b897a5bda739ae08;
    stim[4] = 70'h1444059ada18c55ab4;
    stim[5] = 70'h18a2adbe67bdacb312;
    stim[6] = 70'h384471a18cc9132cfa;
    stim[7] = 70'h0fd3eb28273e10c27d;
    stim[8] = 70'h25818aefda1358d652;
    stim[9] = 70'h19cd993bb6380e6d43;
    stim[10] = 70'h3df43316a771ed75ee;
    stim[11] = 70'h13308c14a3bb8fa858;
    stim[12] = 70'h1a8ac8a543dcb1c939;
    stim[13] = 70'h388ce9f18c8f09ba02;
    stim[14] = 70'h22f9533a0f792bd687;
    stim[15] = 70'h22ca111c2519ee9717;
    stim[16] = 70'h083577d5aacd627f8e;
    stim[17] = 70'h27d7d0c7152e761c52;
    stim[18] = 70'h1757c74d3488cccbf5;
    stim[19] = 70'h2e2b5f0dcf185f1ca7;
    stim[20] = 70'h0e25f3bd3b9fadecf5;
    stim[21] = 70'h0f9e22dd1163dc3777;
    stim[22] = 70'h2e04f8d42df6164d61;
    stim[23] = 70'h2f9ac86eac275d5d9b;
    stim[24] = 70'h0a4a7b08c77e8efe89;
    stim[25] = 70'h1952b929d6f2cd2724;
    stim[26] = 70'h2151f5b7b8bbcb9278;
    stim[27] = 70'h3c939701570143ad22;
    stim[28] = 70'h0104e9339fc3dd2950;
    stim[29] = 70'h3f36a27124dae07300;
    stim[30] = 70'h0d003fb9bed98b9a59;
    stim[31] = 70'h3e20c7896c0353db28;
    stim[32] = 70'h05ad1d07c5c0d12070;
    stim[33] = 70'h307f2d8386a59f06f7;
    stim[34] = 70'h1fe172e126273152bc;
    stim[35] = 70'h30d4349e5acd43243d;
    stim[36] = 70'h1e09fcd3024ab8df55;
    stim[37] = 70'h3843322061ac595663;
    stim[38] = 70'h2093e7a654588d3fe5;
    stim[39] = 70'h097cde86e0c64c91a9;
    stim[40] = 70'h377df5afcaac888940;
    stim[41] = 70'h25ef4662ace90fd603;
    stim[42] = 70'h0fc122ffdafc76c16b;
    stim[43] = 70'h0c2c065fdcd3616f16;
    stim[44] = 70'h125439142b6c2cb471;
    stim[45] = 70'h2c37515900bd866282;
    stim[46] = 70'h2c01545cd642c760a5;
    stim[47] = 70'h2f651ba83a84a211e5;
    stim[48] = 70'h3e28774ea1860d5f5b;
    stim[49] = 70'h0c5e624c58a1c8c0ee;
    stim[50] = 70'h2d6e7103b53bc2ae46;
    stim[51] = 70'h04d8a80768a0f74c6a;
    stim[52] = 70'h099cce4ca2083a9ea1;
    stim[53] = 70'h22e7c4e44dd560c6d0;
    stim[54] = 70'h14554dc1d390db1258;
    stim[55] = 70'h232381d2af7df14b9b;
    stim[56] = 70'h16b94c82d162e38380;
    stim[57] = 70'h2db371e14dbcd8365f;
    stim[58] = 70'h1fecb6c767dcda0b51;
    stim[59] = 70'h1e9e3dc4d13616e47d;
    stim[60] = 70'h0ceff392ba809a15ca;
    stim[61] = 70'h3ed3e066c0f8a515e7;
    stim[62] = 70'h3e04812096daeeda63;
    stim[63] = 70'h3434bb204a71e35ce7;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'hxxxxxxxxxx;
      expv[2] = 37'h010600200x;
      expv[3] = 37'hxxxxxxxxxx;
      expv[4] = 37'hxxxxxxxxxx;
      expv[5] = 37'hxxxxxxxxxx;
      expv[6] = 37'hxxxxxxxxxx;
      expv[7] = 37'hxxxxxxxxxx;
      expv[8] = 37'hxxxxxxxxxx;
      expv[9] = 37'h1fffffffex;
      expv[10] = 37'hxxxxxxxxxx;
      expv[11] = 37'hxxxxxxxxxx;
      expv[12] = 37'hxxxxxxxxxx;
      expv[13] = 37'h000000001x;
      expv[14] = 37'h0007bc95ex;
      expv[15] = 37'hxxxxxxxxxx;
      expv[16] = 37'hxxxxxxxxxx;
      expv[17] = 37'hxxxxxxxxxx;
      expv[18] = 37'hxxxxxxxxxx;
      expv[19] = 37'h086250710x;
      expv[20] = 37'hxxxxxxxxxx;
      expv[21] = 37'hxxxxxxxxxx;
      expv[22] = 37'h0dfd8790ax;
      expv[23] = 37'hxxxxxxxxxx;
      expv[24] = 37'hxxxxxxxxxx;
      expv[25] = 37'h082944908x;
      expv[26] = 37'hxxxxxxxxxx;
      expv[27] = 37'h12c929aa2x;
      expv[28] = 37'hxxxxxxxxxx;
      expv[29] = 37'h000000001x;
      expv[30] = 37'hxxxxxxxxxx;
      expv[31] = 37'hxxxxxxxxxx;
      expv[32] = 37'hxxxxxxxxxx;
      expv[33] = 37'hxxxxxxxxxx;
      expv[34] = 37'hxxxxxxxxxx;
      expv[35] = 37'hxxxxxxxxxx;
      expv[36] = 37'hxxxxxxxxxx;
      expv[37] = 37'h0b4b6c650x;
      expv[38] = 37'h1a6df7dfex;
      expv[39] = 37'hxxxxxxxxxx;
      expv[40] = 37'h000000001x;
      expv[41] = 37'h1fffffffex;
      expv[42] = 37'h000000002x;
      expv[43] = 37'hxxxxxxxxxx;
      expv[44] = 37'hxxxxxxxxxx;
      expv[45] = 37'h000000001x;
      expv[46] = 37'h1f21ebbe6x;
      expv[47] = 37'h1ff2dddcex;
      expv[48] = 37'hxxxxxxxxxx;
      expv[49] = 37'hxxxxxxxxxx;
      expv[50] = 37'h00006a778x;
      expv[51] = 37'h000000001x;
      expv[52] = 37'h15d284758x;
      expv[53] = 37'hxxxxxxxxxx;
      expv[54] = 37'hxxxxxxxxxx;
      expv[55] = 37'hxxxxxxxxxx;
      expv[56] = 37'h000000001x;
      expv[57] = 37'hxxxxxxxxxx;
      expv[58] = 37'hxxxxxxxxxx;
      expv[59] = 37'hxxxxxxxxxx;
      expv[60] = 37'hxxxxxxxxxx;
      expv[61] = 37'h00820d440x;
      expv[62] = 37'h1394c9232x;
      expv[63] = 37'h00c502418x;
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
