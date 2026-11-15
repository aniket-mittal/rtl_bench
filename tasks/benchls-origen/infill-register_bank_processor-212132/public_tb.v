// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 154;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_212132 dut (
    .slow_clock(clk),
    .enable(in_vec[153:153]),
    .reset(in_vec[152:152]),
    .fast_clock(in_vec[151:151]),
    .control(in_vec[150:148]),
    .register_source_A(in_vec[147:144]),
    .register_source_B(in_vec[143:140]),
    .register_Dest(in_vec[139:136]),
    .ALU_result(in_vec[135:104]),
    .data_from_memory(in_vec[103:72]),
    .new_SP(in_vec[71:40]),
    .new_PC(in_vec[39:8]),
    .special_register(in_vec[7:0]),
    .read_data_A(out_vec[159:128]),
    .read_data_B(out_vec[127:96]),
    .current_PC(out_vec[95:64]),
    .current_SP(out_vec[63:32]),
    .memory_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 154'h1dcf870186a2bca3743f4ced75957fcbf1e21ce;
    stim[1] = 154'h3274d0531c90e9475458d2506c526455de18cc4;
    stim[2] = 154'h2d2d9d79043aac83a16f74e19883c57319de42a;
    stim[3] = 154'h0579505f292dfc5836e2edf03963ef252a712cb;
    stim[4] = 154'h04148fc7bbeab147a5977b74e64b0061faba843;
    stim[5] = 154'h09b14e78d807f2b93eb1bac217751f561529e7f;
    stim[6] = 154'h28f1b7841ac08834df1ee010706e1698ab821bc;
    stim[7] = 154'h2ea6b3ee2178d6a4658f5e1f3fcdd9d57516f61;
    stim[8] = 154'h2dbf99442ebf3e1d88d6f99eb1335ed49e0f53e;
    stim[9] = 154'h2aaa0238774c63b7493322848d521eff5620190;
    stim[10] = 154'h21260c892f83f93d3c3e57396a200e87d5b7aed;
    stim[11] = 154'h276f3e422afbd31fca3ee85c655a20115e2f31a;
    stim[12] = 154'h2e9aaa7eab629b7aec71251e5e87bceecaa78c6;
    stim[13] = 154'h298a29ea064d016c472e53df9f86ca73c9d5da1;
    stim[14] = 154'h24c8434e5d6b40eee147c99d297735b25f9d661;
    stim[15] = 154'h21062c04708abaa5e7ce20941397b474f9a41ce;
    stim[16] = 154'h0e57461443f92599a9552f9d670bfaa8aa933ff;
    stim[17] = 154'h265136f5b8600042fc867a164f53398190b113b;
    stim[18] = 154'h0bab3ccaedb536541b05e71f896b5d8567ffab8;
    stim[19] = 154'h251c7e4cb5f9949fe0a9423f58d55fb410045ab;
    stim[20] = 154'h28e8084b37e2d7169e3bc47785d1ceb1b3f59bd;
    stim[21] = 154'h05b135b5db782e875a6071a87943f11c297c5f6;
    stim[22] = 154'h28171f5c5f82c3a05da1320abd7d9792e3fccaf;
    stim[23] = 154'h07f1f6bde4a8d6f431fdbe03f2b076dfe1010ce;
    stim[24] = 154'h28e8ba2e4db83d4af8ef163e9040170cd0d45c3;
    stim[25] = 154'h0b9f3a5e68f3239c6981088f9cd4058f2164678;
    stim[26] = 154'h0d613b1ca33a1dea1aae3389dc590e93d6a98ad;
    stim[27] = 154'h045e709b91ca7fa4d200b9591e8bf7571d09495;
    stim[28] = 154'h0e9ef0ae1f3d3cbceedd684d61fc137f161ca6b;
    stim[29] = 154'h099866bcda70aca64a4b9889700950254f44384;
    stim[30] = 154'h208d7e069f8ad4feacd57c1ebe57e5926428f57;
    stim[31] = 154'h0dcd85ec4785f4e3df33e8536ad1526d00b7269;
    stim[32] = 154'h2ee49edaee81532c885bac080653c5cf325a393;
    stim[33] = 154'h0d72389b2ac34582eb0080682ca982ad19e1252;
    stim[34] = 154'h00deea32059574ac00a3a99c5eb953f2df1a028;
    stim[35] = 154'h2f6df72b38ab77c91d796554a9e17d0ef17a022;
    stim[36] = 154'h2baec45c465a1b296c7451fe19ea4d1e7211ffb;
    stim[37] = 154'h01aa1504a9f563c975e3c178ed672245351c0a4;
    stim[38] = 154'h26010f4a40fd645ad014bdc960904aa94e612b6;
    stim[39] = 154'h00728cc4ad40a90c8009606ec24fc317cdbb525;
    stim[40] = 154'h099522aad30bcd2bb8428b642b8187ff9ebf583;
    stim[41] = 154'h2de79e2af1af427a29f0826449fd1e114b0ec78;
    stim[42] = 154'h07985fa359b688bbed5981eb805925a739564a8;
    stim[43] = 154'h2b15817b4588ad0c123e12df48bcd178e0fd888;
    stim[44] = 154'h0ed1b58f7fc73872c8aadd5045507a0e239516d;
    stim[45] = 154'h2d0c040f24ebd5c7b53722a24fd2f9747974a86;
    stim[46] = 154'h0e52594d807b43aa70273c77db234d3e6a622b5;
    stim[47] = 154'h3ea8a607d76638ac054e13e0da8511552edb18f;
    stim[48] = 154'h2cab3d0bc0b5a6f8c108d1a9090260299f19789;
    stim[49] = 154'h0a32b9b215f9f65bba6490d1aa7311dc695384d;
    stim[50] = 154'h0cb210500fccb6751a36da258031ac82e94da3c;
    stim[51] = 154'h0362754ce44a661ea41cf38d6647534ec47efa2;
    stim[52] = 154'h2851b456faa103fb87aa674998b0a74508f20de;
    stim[53] = 154'h21db94197dabe281dafdcc495fad871c58a0de5;
    stim[54] = 154'h203754f4055a1fe8508497004a3656063fabcb3;
    stim[55] = 154'h2e1fee56799679c5a348a6405252539cc67cb32;
    stim[56] = 154'h24675d8362574b35ffdaa80082f834cd561689a;
    stim[57] = 154'h02466927b124c848cf00cc59e371fcc7c38aac3;
    stim[58] = 154'h03ed3777d8b8f46d1386965d63cc5b8aa18c039;
    stim[59] = 154'h2b69fad92250cb192f5f28bffde9d22c20003fb;
    stim[60] = 154'h2888675957a0b39230bdcea43584dda178628b7;
    stim[61] = 154'h0f3db1741cfe8c558a8036f0ade33b8c199ada0;
    stim[62] = 154'h2564340bf9065ef6b81e47893a640b6a99d81f0;
    stim[63] = 154'h0c5031fa375ad1f1d29e32703c2a2fefeeadb69;
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
      expv[0] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 160'hxxxxxxxxxxxxxxxx0000000000001000xxxxxxxx;
      expv[3] = 160'hxxxxxxxxxxxxxxxx0000000000001000xxxxxxxx;
      expv[4] = 160'hxxxxxxxxxxxxxxxx0000000000001000xxxxxxxx;
      expv[5] = 160'hxxxxxxxx4e19883c57319de44e19883c4e19883c;
      expv[6] = 160'hxxxxxxxx4e19883c57319de44e19883c4e19883c;
      expv[7] = 160'hxxxxxxxx4e19883c57319de44e19883c4e19883c;
      expv[8] = 160'hxxxxxxxx4e19883c57319de44e19883c4e19883c;
      expv[9] = 160'hxxxxxxxx4e19883c57319de44e19883c4e19883c;
      expv[10] = 160'hxxxxxxxx4e19883c57319de44e19883c4e19883c;
      expv[11] = 160'hxxxxxxxx4e19883c57319de44e19883c4e19883c;
      expv[12] = 160'h0000003exxxxxxxx0115e2f385c655a2xxxxxxxx;
      expv[13] = 160'h0000003exxxxxxxx0115e2f385c655a2xxxxxxxx;
      expv[14] = 160'h0000003exxxxxxxx0115e2f385c655a2xxxxxxxx;
      expv[15] = 160'h0000003exxxxxxxx0115e2f385c655a2xxxxxxxx;
      expv[16] = 160'hxxxxxxxxxxxxxxxx474f9a410941397bxxxxxxxx;
      expv[17] = 160'hxxxxxxxxxxxxxxxx474f9a410941397bxxxxxxxx;
      expv[18] = 160'hxxxxxxxxxxxxxxxx98190b11a164f533xxxxxxxx;
      expv[19] = 160'hxxxxxxxxxxxxxxxx98190b11a164f533xxxxxxxx;
      expv[20] = 160'hxxxxxxxxxxxxxxxxfb41004523f58d55xxxxxxxx;
      expv[21] = 160'hxxxxxxxxxxxxxxxxfb41004523f58d55xxxxxxxx;
      expv[22] = 160'h47785d1c000000abeb1b3f5947785d1c000000ab;
      expv[23] = 160'h47785d1c000000abeb1b3f5947785d1c000000ab;
      expv[24] = 160'hxxxxxxxxxxxxxxxx792e3fcc20abd7d9xxxxxxxx;
      expv[25] = 160'hxxxxxxxxxxxxxxxx792e3fcc20abd7d9xxxxxxxx;
      expv[26] = 160'hxxxxxxxxxxxxxxxx792e3fcc20abd7d9xxxxxxxx;
      expv[27] = 160'hxxxxxxxxxxxxxxxx792e3fcc20abd7d9xxxxxxxx;
      expv[28] = 160'h0000003exxxxxxxx70cd0d4563e90401xxxxxxxx;
      expv[29] = 160'h0000003exxxxxxxx70cd0d4563e90401xxxxxxxx;
      expv[30] = 160'h0000003exxxxxxxx70cd0d4563e90401xxxxxxxx;
      expv[31] = 160'hxxxxxxxxxxxxxxxx5926428fc1ebe57exxxxxxxx;
      expv[32] = 160'hxxxxxxxxxxxxxxxx5926428fc1ebe57exxxxxxxx;
      expv[33] = 160'hxxxxxxxxxxxxxxxx5926428fc1ebe57exxxxxxxx;
      expv[34] = 160'hxxxxxxxxxxxxxxxx5926428fc1ebe57exxxxxxxx;
      expv[35] = 160'hxxxxxxxxxxxxxxxx5cf325a3c080653cxxxxxxxx;
      expv[36] = 160'hxxxxxxxxxxxxxxxx5cf325a3c080653cxxxxxxxx;
      expv[37] = 160'hxxxxxxxxxxxxxxxx5cf325a3c080653cxxxxxxxx;
      expv[38] = 160'hxxxxxxxxxxxxxxxx5cf325a3c080653cxxxxxxxx;
      expv[39] = 160'hxxxxxxxxxxxxxxxx5cf325a3c080653cxxxxxxxx;
      expv[40] = 160'h0000003exxxxxxxxaa94e612dc960904xxxxxxxx;
      expv[41] = 160'h0000003exxxxxxxxaa94e612dc960904xxxxxxxx;
      expv[42] = 160'h0000003exxxxxxxxaa94e612dc960904xxxxxxxx;
      expv[43] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[44] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[45] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[46] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[47] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[48] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[49] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[50] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[51] = 160'h26449fd1xxxxxxxxe114b0ec26449fd1xxxxxxxx;
      expv[52] = 160'hxxxxxxxx00001000000000000000100000001000;
      expv[53] = 160'hxxxxxxxx00001000000000000000100000001000;
      expv[54] = 160'hxxxxxxxx00001000000000000000100000001000;
      expv[55] = 160'h7004a365xxxxxxxx6063fabc7004a365xxxxxxxx;
      expv[56] = 160'h7004a365xxxxxxxx6063fabc7004a365xxxxxxxx;
      expv[57] = 160'h7004a365xxxxxxxx6063fabc7004a365xxxxxxxx;
      expv[58] = 160'h7004a365xxxxxxxx6063fabc7004a365xxxxxxxx;
      expv[59] = 160'hxxxxxxxx4197dabe00000000000010004197dabe;
      expv[60] = 160'hxxxxxxxx4197dabe00000000000010004197dabe;
      expv[61] = 160'hxxxxxxxx4197dabe00000000000010004197dabe;
      expv[62] = 160'hxxxxxxxx4197dabe00000000000010004197dabe;
      expv[63] = 160'hxxxxxxxxb6a99d81b6a99d817893a640b6a99d81;
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
