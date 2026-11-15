// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_097700 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .crc_en_in(in_vec[32:32]),
    .crc_in(in_vec[31:0]),
    .crc_en_out(out_vec[32:32]),
    .crc_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h271456365;
    stim[1] = 34'h398559a6f;
    stim[2] = 34'h1d534f51e;
    stim[3] = 34'h166dfe32b;
    stim[4] = 34'h04dc9a7e5;
    stim[5] = 34'h00b66a8d6;
    stim[6] = 34'h1fb268aaf;
    stim[7] = 34'h053c0ef7e;
    stim[8] = 34'h122aaa063;
    stim[9] = 34'h12db79242;
    stim[10] = 34'h0ec84de95;
    stim[11] = 34'h1bd10fb8e;
    stim[12] = 34'h1acd3a64c;
    stim[13] = 34'h059e9cf9d;
    stim[14] = 34'h01b82884b;
    stim[15] = 34'h0fba1fb89;
    stim[16] = 34'h03e253ae0;
    stim[17] = 34'h08cee6a16;
    stim[18] = 34'h0b7ac0f36;
    stim[19] = 34'h1aa849bd6;
    stim[20] = 34'h18f1a3112;
    stim[21] = 34'h02456e465;
    stim[22] = 34'h1a9003f3f;
    stim[23] = 34'h1d8bbfe33;
    stim[24] = 34'h125a48630;
    stim[25] = 34'h051755200;
    stim[26] = 34'h0bd7b038d;
    stim[27] = 34'h1539de783;
    stim[28] = 34'h1b86a6855;
    stim[29] = 34'h10e99832b;
    stim[30] = 34'h0a051f24c;
    stim[31] = 34'h04ec1257c;
    stim[32] = 34'h06c0a30ed;
    stim[33] = 34'h0f03e9411;
    stim[34] = 34'h07d296a92;
    stim[35] = 34'h17c78ecbd;
    stim[36] = 34'h06607cb61;
    stim[37] = 34'h0556ee22c;
    stim[38] = 34'h0ffe87a50;
    stim[39] = 34'h1efcf3695;
    stim[40] = 34'h13a0ac1e1;
    stim[41] = 34'h25b320a74;
    stim[42] = 34'h155cbdf76;
    stim[43] = 34'h0d3d07962;
    stim[44] = 34'h13868b55a;
    stim[45] = 34'h0b3a2e5fa;
    stim[46] = 34'h1c3ae808f;
    stim[47] = 34'h1e4befa9a;
    stim[48] = 34'h1b936b7b5;
    stim[49] = 34'h1e698dfa9;
    stim[50] = 34'h04377e1aa;
    stim[51] = 34'h19e4a1e63;
    stim[52] = 34'h1c2037665;
    stim[53] = 34'h1b4ac7099;
    stim[54] = 34'h0ee9baf22;
    stim[55] = 34'h1c227aa0c;
    stim[56] = 34'h123706420;
    stim[57] = 34'h1050fba3b;
    stim[58] = 34'h15d80c8fd;
    stim[59] = 34'h07bc43974;
    stim[60] = 34'h1f3f7bdd4;
    stim[61] = 34'h0f2e456e9;
    stim[62] = 34'h199029c79;
    stim[63] = 34'h0843c078b;
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
      expv[3] = 33'h154d35087;
      expv[4] = 33'h19904382b;
      expv[5] = 33'h04d6c1a58;
      expv[6] = 33'h02f99ea94;
      expv[7] = 33'h1209bae0a;
      expv[8] = 33'h035fc0881;
      expv[9] = 33'h1bbaafa39;
      expv[10] = 33'h14b12b6bd;
      expv[11] = 33'h0c8de8456;
      expv[12] = 33'h142f7208e;
      expv[13] = 33'h1ca349acd;
      expv[14] = 33'h065680c46;
      expv[15] = 33'h027beee2d;
      expv[16] = 33'h0207a206e;
      expv[17] = 33'h0835ba3f8;
      expv[18] = 33'h0ce88a997;
      expv[19] = 33'h012ca0f93;
      expv[20] = 33'h1aade2694;
      expv[21] = 33'h10ea773b7;
      expv[22] = 33'h0db95d859;
      expv[23] = 33'h16aff0303;
      expv[24] = 33'h1e4228033;
      expv[25] = 33'h15bda9ef3;
      expv[26] = 33'h07551b5ff;
      expv[27] = 33'h042213f4e;
      expv[28] = 33'h13546183e;
      expv[29] = 33'h1e2a9e955;
      expv[30] = 33'h18f663e2b;
      expv[31] = 33'h0fa75b0cd;
      expv[32] = 33'h08d7c5bc1;
      expv[33] = 33'h0c9aff348;
      expv[34] = 33'h0f083d677;
      expv[35] = 33'h0416ba9b6;
      expv[36] = 33'h1c1e1c842;
      expv[37] = 33'h0991f2c79;
      expv[38] = 33'h05589b8cb;
      expv[39] = 33'h000e8a1f5;
      expv[40] = 33'h1080c9356;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h1552c0491;
      expv[44] = 33'h034f461b9;
      expv[45] = 33'h1e3e952a5;
      expv[46] = 33'h032ba58a0;
      expv[47] = 33'h13c8afe0e;
      expv[48] = 33'h1d882a0a6;
      expv[49] = 33'h162931252;
      expv[50] = 33'h198e6046a;
      expv[51] = 33'h03d1178aa;
      expv[52] = 33'h186ad8739;
      expv[53] = 33'h1bc3f9159;
      expv[54] = 33'h1d2caf166;
      expv[55] = 33'h088260abb;
      expv[56] = 33'h1bc1baacf;
      expv[57] = 33'h13bf1d9fb;
      expv[58] = 33'h15f0fa223;
      expv[59] = 33'h145feec40;
      expv[60] = 33'h021dc63d1;
      expv[61] = 33'h1301042d4;
      expv[62] = 33'h0b0d89568;
      expv[63] = 33'h166bfc661;
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
