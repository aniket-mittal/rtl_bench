// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_157579 dut (
    .clk(clk),
    .rst(in_vec[97:97]),
    .wr(in_vec[96:96]),
    .m(in_vec[95:64]),
    .x(in_vec[63:32]),
    .b(in_vec[31:0]),
    .y(out_vec[32:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h208fcc1c84b9a0152f9ae3a54;
    stim[1] = 98'h39f643e9f808bd50c89812234;
    stim[2] = 98'h115d7836076fb778030ad2d8f;
    stim[3] = 98'h17a2714e0ae68b4c8416d8d46;
    stim[4] = 98'h08562e8a268dfa213d605eefe;
    stim[5] = 98'h10aa18fc660d3d7f57f44d8bc;
    stim[6] = 98'h0814d27ba22b18828d226194f;
    stim[7] = 98'h1256b5e04c3d80154fa4170af;
    stim[8] = 98'h065c052c36c118e132f568ae7;
    stim[9] = 98'h0b8f07681bef8c28e3c64eef3;
    stim[10] = 98'h162c00f6447c3eb4282090a30;
    stim[11] = 98'h0b6e048a24370ceb0b07243a9;
    stim[12] = 98'h1d8627697ea04dc2efd833c47;
    stim[13] = 98'h057bc9c181ae650e6221445c4;
    stim[14] = 98'h0119a1fbdf1946d45739e237c;
    stim[15] = 98'h17b53a82e5b7a00c842b54d1f;
    stim[16] = 98'h11f14ed00fa160fc99d4ae0cf;
    stim[17] = 98'h055c187aeee75e8c5669fbae7;
    stim[18] = 98'h089f4d0107864f46fec32d3ce;
    stim[19] = 98'h0414e4b70a2e620ccce55911e;
    stim[20] = 98'h1ad3ccb11ee32607dd0eb1e0a;
    stim[21] = 98'h101e207661a9777651d8d61cc;
    stim[22] = 98'h03f37d6bfc872e8a24a626067;
    stim[23] = 98'h054f229a03fb6e4ac9774cda5;
    stim[24] = 98'h151a62dd263804e75e54f2fba;
    stim[25] = 98'h06a22a3b40a498e6e92903039;
    stim[26] = 98'h05a734e9691cec2d326c28f0d;
    stim[27] = 98'h1caa42fbdd780440c84d64fc8;
    stim[28] = 98'h0b6297b35f12b74539315d15d;
    stim[29] = 98'h0abe9c5ef616d1ab6c37ff417;
    stim[30] = 98'h12595e3a584f83a01f7e7509f;
    stim[31] = 98'h0935ff9cb80170fab3a6ff63c;
    stim[32] = 98'h1700eab1005784044cca92b05;
    stim[33] = 98'h12023f84cae809bd0190fc8c2;
    stim[34] = 98'h04a9bc84fa08e5fd4d2ba1968;
    stim[35] = 98'h140b5dccc60b9959f21409d47;
    stim[36] = 98'h106b88563b71f9d4ced024643;
    stim[37] = 98'h006bc86a9ae98bf3eec5053be;
    stim[38] = 98'h1a01bedc0f2875b0552ad4d9d;
    stim[39] = 98'h059d24da4b2227e15001bc04f;
    stim[40] = 98'h1507bdca3bb643e6ca53a9034;
    stim[41] = 98'h0b3c011a6f21d0e9d4b1fa15b;
    stim[42] = 98'h0fc828f72318e730e027f6df4;
    stim[43] = 98'h1b1759b22a9672f23e0be29dd;
    stim[44] = 98'h02fbd83e625e43a12afbdcee5;
    stim[45] = 98'h04f3be7b1e219748dc09dc0ed;
    stim[46] = 98'h1c1f24e820da94017cd7af7cb;
    stim[47] = 98'h143c3f1a01be780eafaa1ee87;
    stim[48] = 98'h1ad248541a0a4b0177931edab;
    stim[49] = 98'h0132eba9663a55e87d3871cc5;
    stim[50] = 98'h0ba66677654e87e73169f441d;
    stim[51] = 98'h1223d0581c9a4f8ca384bf418;
    stim[52] = 98'h18eb7dad36b2c3eee0a9eeb2d;
    stim[53] = 98'h0b89a6549abb6caafa1fe378a;
    stim[54] = 98'h1fcdde8da2ee37f09715683c2;
    stim[55] = 98'h13469304a6fc1d92a27696581;
    stim[56] = 98'h0faef5942e89f596a968291c7;
    stim[57] = 98'h11447d7ccf21d689d9ec3e430;
    stim[58] = 98'h01ec2dc3191e73b098bc90dde;
    stim[59] = 98'h20ac39dc4d441cf342e2f9bc2;
    stim[60] = 98'h1b5ed0df218024b85e9ad28fa;
    stim[61] = 98'h0586834e245e10f853acfd659;
    stim[62] = 98'h123ad69321196e024da0df65c;
    stim[63] = 98'h131086bdae8afc4fbd8522351;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
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
