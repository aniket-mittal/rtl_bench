// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167418 dut (
    .s1val(in_vec[106:75]),
    .s2val(in_vec[74:43]),
    .sa(in_vec[42:38]),
    .ALUop(in_vec[37:32]),
    .insn(in_vec[31:0]),
    .result(out_vec[32:1]),
    .branch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h5bd5db5856cec9594ecb419790f;
    stim[1] = 107'h3130ed884dba155ab2a8889318b;
    stim[2] = 107'h5ba9f49510dfb6bfd3e937aaa3c;
    stim[3] = 107'h0d1b7e69d7f064a5c9f6f5c30cb;
    stim[4] = 107'h3276364cb40ed64cbe5f7db6113;
    stim[5] = 107'h3af1a95277a60e54947c83bd51f;
    stim[6] = 107'h34bca4cf816b3fc749f30093579;
    stim[7] = 107'h7889944cdf9c220e47a608b6d5b;
    stim[8] = 107'h5f38a850eea0b248bb2f6b75d37;
    stim[9] = 107'h105bb9fa32ec7d35a597ea3c0c7;
    stim[10] = 107'h4f08768477648636969d0269d5d;
    stim[11] = 107'h1a6c5fe456d6c42c26b36039aa0;
    stim[12] = 107'h6ec1cc03b9c04a8c5e621a3fd40;
    stim[13] = 107'h3901f8bf1c7b1e75d000fe1235f;
    stim[14] = 107'h0d35d1c13aefe4d82ebc365ecf8;
    stim[15] = 107'h27ac67c5628331d8997d018bd08;
    stim[16] = 107'h188ba822299f379770f8fea51b6;
    stim[17] = 107'h38efd01e97c90676582b6e575d0;
    stim[18] = 107'h3710a87347f9c1f5b453571b1cb;
    stim[19] = 107'h4c6f13094c712c24aa6b80a2a8f;
    stim[20] = 107'h620d38a3e52fb0c87f7e69cbcd1;
    stim[21] = 107'h6746f71dc0a4efa4b5f3090d144;
    stim[22] = 107'h1e7b076332879592e372414cb4c;
    stim[23] = 107'h70f5d6da75db2385daae25e3c92;
    stim[24] = 107'h42620eccbfa170277daa7d320ca;
    stim[25] = 107'h307f1be0fec8f4765667351102a;
    stim[26] = 107'h39b615346d7c58019a8caab86eb;
    stim[27] = 107'h52f911aee5ef1f45ac73799540f;
    stim[28] = 107'h3b5d0114bd55b201db6c70d187d;
    stim[29] = 107'h6d2411630709ae29ca2f80b87a8;
    stim[30] = 107'h440d10ea73d21646a889c9e4729;
    stim[31] = 107'h4354ab3845f3f41a1b24b81a0ae;
    stim[32] = 107'h63b931f4d315fb3153ad09b4ddd;
    stim[33] = 107'h2ae8914397c1c51fe5dbf4f6e71;
    stim[34] = 107'h5bae58eee84fa794f487a9b2077;
    stim[35] = 107'h22610a54906d734cdfc2a5ee423;
    stim[36] = 107'h21040fafb97d65ba3719edd50ee;
    stim[37] = 107'h7830632391a5df3e77e7d6990e9;
    stim[38] = 107'h5f32ccbd90d0afdd630414130f1;
    stim[39] = 107'h4d889f0fda6d0c564935030e4ac;
    stim[40] = 107'h1f12f4ad3c1b8b7ef547a0bf0d0;
    stim[41] = 107'h1a7d69e2505c451c198a722ade8;
    stim[42] = 107'h655b85b92087464b8e8ec0b8501;
    stim[43] = 107'h50f02be7b7c355f6766180d6620;
    stim[44] = 107'h4d09aaae37379e2311ebed88a21;
    stim[45] = 107'h188284ab9eaacbf68a9810ca86e;
    stim[46] = 107'h21d32cbc4318867f0e35b3f835a;
    stim[47] = 107'h2668b2b263ba387b2960ddb6c93;
    stim[48] = 107'h500ac1ad1a3bbff3b52669ba91b;
    stim[49] = 107'h77f4bb6dd8d2d86f5be27b8460c;
    stim[50] = 107'h6fded90d8fcdf60d4b16e1356d7;
    stim[51] = 107'h65af034b233da49d91af703de1b;
    stim[52] = 107'h50595e5f8c6b671befc591de138;
    stim[53] = 107'h017bdeb11d8fe61adc9ddae0d19;
    stim[54] = 107'h5348de605017b1f6a2192abf83e;
    stim[55] = 107'h099e0b04768a391e3d33b8bfc6d;
    stim[56] = 107'h582f1e97796ddaf2f370ae05dda;
    stim[57] = 107'h1aff7f7ebb44bbf6d1cdf580f85;
    stim[58] = 107'h49cb6c86f8f045535a204d6b36c;
    stim[59] = 107'h633bbc756a72e0f9899b9ee0e57;
    stim[60] = 107'h68db391840b6b2e0cf7df7a557a;
    stim[61] = 107'h455bbf79ff82fd9e7b625e8f9bd;
    stim[62] = 107'h586583e022b17393546b8a12dc1;
    stim[63] = 107'h5739b63ea69be9348e5486767c4;
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
      expv[0] = 33'h08080929a;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'hxxxxxxxxx;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h0d40605de;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h1fff79b92;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h0c6d89daa;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h1d0b6fe32;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000001;
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
      expv[43] = 33'h064b357c6;
      expv[44] = 33'h000000002;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h14d7fffda;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h131fd5672;
      expv[58] = 33'h10aeec766;
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
