// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012027 dut (
    .clk(clk),
    .MEM(in_vec[65:64]),
    .Wdata(in_vec[63:32]),
    .Addr(in_vec[31:0]),
    .Rdata(out_vec[32:1]),
    .BUSY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h1199288305beb5e9a;
    stim[1] = 66'h1a9a83dc817a854d5;
    stim[2] = 66'h03b203e24488d2b8a;
    stim[3] = 66'h06f3fd25f13f7bb37;
    stim[4] = 66'h37e49de33e89964f8;
    stim[5] = 66'h37d3f3f1fffbf260c;
    stim[6] = 66'h0e076cedf45c1a68f;
    stim[7] = 66'h35fe1783975a95ec7;
    stim[8] = 66'h0523fa8eb1cc878c9;
    stim[9] = 66'h22d4d9ad01f5bcce8;
    stim[10] = 66'h326d8919e1e27a2c6;
    stim[11] = 66'h130175fdcde999064;
    stim[12] = 66'h0403ceef7a13cd00f;
    stim[13] = 66'h1a351af0f5befe263;
    stim[14] = 66'h3f73111fcf435a0dc;
    stim[15] = 66'h28d6182078519ac19;
    stim[16] = 66'h06fa23f718e439986;
    stim[17] = 66'h35c84a80944aef859;
    stim[18] = 66'h02dee4ae151f0b932;
    stim[19] = 66'h04093244bcc282160;
    stim[20] = 66'h2216b48ff2fd0fda2;
    stim[21] = 66'h0d340749035ab3150;
    stim[22] = 66'h0e44215ca23609116;
    stim[23] = 66'h2967676bc7cfaa282;
    stim[24] = 66'h28e3162479f7c08cf;
    stim[25] = 66'h25f2a630d70bc2790;
    stim[26] = 66'h3a23a62fed9290d7e;
    stim[27] = 66'h39fc11cc234430cd2;
    stim[28] = 66'h3d6814c6932a32b84;
    stim[29] = 66'h399f25e77fa8c14bf;
    stim[30] = 66'h02717309ea09bdf4b;
    stim[31] = 66'h2a96fc860f667a21c;
    stim[32] = 66'h1bd36bb09edd6c1a7;
    stim[33] = 66'h2425a08a94c47b995;
    stim[34] = 66'h0bfcec22e7aa7dbcb;
    stim[35] = 66'h05535010f36147a48;
    stim[36] = 66'h2b8a028e7eed2bfc2;
    stim[37] = 66'h0e5077b5a5a08f632;
    stim[38] = 66'h1317697025cffd1c9;
    stim[39] = 66'h37e779194c9e92b8f;
    stim[40] = 66'h25d69ee2089d26b9a;
    stim[41] = 66'h14c2ad191e2f32707;
    stim[42] = 66'h2da9ffbb580f7d30d;
    stim[43] = 66'h263a0ae0ef6157353;
    stim[44] = 66'h1ddda718f3e21a500;
    stim[45] = 66'h1ffb58496668cf8dd;
    stim[46] = 66'h04f38ffe0a3636a05;
    stim[47] = 66'h1833b2c349455c373;
    stim[48] = 66'h124d8aec89d9d0383;
    stim[49] = 66'h27c46cb3214ddf1c3;
    stim[50] = 66'h22b5dc53a1d264109;
    stim[51] = 66'h279aed8a8704f83f0;
    stim[52] = 66'h28efc4fb6444ee2bd;
    stim[53] = 66'h3c5a805fe5683650a;
    stim[54] = 66'h2ccaae75a9a00c579;
    stim[55] = 66'h1bbfe6f4f628bd114;
    stim[56] = 66'h1a8d3c7e5cdf49878;
    stim[57] = 66'h10889640c8fccffd2;
    stim[58] = 66'h33d13d1aa18c99e48;
    stim[59] = 66'h1b4f8025aa54e46fc;
    stim[60] = 66'h0d240200b3f20d7b3;
    stim[61] = 66'h0a916391ce5a8493f;
    stim[62] = 66'h17d738ab4a6f57467;
    stim[63] = 66'h27dcb67a9d48ce7e3;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'hxxxxxxxxx;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000001;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000001;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000001;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000001;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000000001;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000001;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000001;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
