// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02101 dut (
    .clk(clk),
    .downstream_readdata(in_vec[52:37]),
    .downstream_readdatavalid(in_vec[36:36]),
    .downstream_waitrequest(in_vec[35:35]),
    .reset_n(in_vec[34:34]),
    .upstream_address(in_vec[33:29]),
    .upstream_burstcount(in_vec[28:25]),
    .upstream_byteenable(in_vec[24:23]),
    .upstream_debugaccess(in_vec[22:22]),
    .upstream_nativeaddress(in_vec[21:18]),
    .upstream_read(in_vec[17:17]),
    .upstream_write(in_vec[16:16]),
    .upstream_writedata(in_vec[15:0]),
    .reg_downstream_address(out_vec[52:49]),
    .reg_downstream_arbitrationshare(out_vec[48:44]),
    .reg_downstream_burstcount(out_vec[43:43]),
    .reg_downstream_byteenable(out_vec[42:41]),
    .reg_downstream_debugaccess(out_vec[40:40]),
    .reg_downstream_nativeaddress(out_vec[39:36]),
    .reg_downstream_read(out_vec[35:35]),
    .reg_downstream_write(out_vec[34:34]),
    .reg_downstream_writedata(out_vec[33:18]),
    .upstream_readdata(out_vec[17:2]),
    .upstream_readdatavalid(out_vec[1:1]),
    .upstream_waitrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h0ab41230ba8b08;
    stim[1] = 53'h013d305709ae32;
    stim[2] = 53'h00555fa011763d;
    stim[3] = 53'h0a7256b1ddcba1;
    stim[4] = 53'h009f8f014d8fa3;
    stim[5] = 53'h05e56c05760928;
    stim[6] = 53'h17b117035bf73f;
    stim[7] = 53'h098517ebf1c875;
    stim[8] = 53'h1c43676abd70d6;
    stim[9] = 53'h01e7663c3cc0cd;
    stim[10] = 53'h18094e5724d302;
    stim[11] = 53'h002c469c7bc782;
    stim[12] = 53'h04acfd8c84069e;
    stim[13] = 53'h1e8a953b0b4bdc;
    stim[14] = 53'h0483662c335637;
    stim[15] = 53'h107a1fbe3c4c05;
    stim[16] = 53'h12ff4448ff527a;
    stim[17] = 53'h09fa3df83a97e8;
    stim[18] = 53'h0fd96daf39346b;
    stim[19] = 53'h1e76548adc38dc;
    stim[20] = 53'h12e62646c13888;
    stim[21] = 53'h1cc20d6fb317ec;
    stim[22] = 53'h1366cc7a81695a;
    stim[23] = 53'h07861d68a01a31;
    stim[24] = 53'h1617dedb956f96;
    stim[25] = 53'h046a6ee9ff268c;
    stim[26] = 53'h1953cddbcf96c1;
    stim[27] = 53'h127b441a345a3e;
    stim[28] = 53'h19ac06c336e27b;
    stim[29] = 53'h19576ffcc23748;
    stim[30] = 53'h07892f0a3c6a36;
    stim[31] = 53'h1be13724ff358d;
    stim[32] = 53'h10109e0e82fcdd;
    stim[33] = 53'h173c8602c9f07f;
    stim[34] = 53'h091ac6877f3ffd;
    stim[35] = 53'h010a8c3427b528;
    stim[36] = 53'h06bc4c5b863996;
    stim[37] = 53'h02c88de457db86;
    stim[38] = 53'h05e30c212927ab;
    stim[39] = 53'h07368ce481ad35;
    stim[40] = 53'h08fcc4d4f94a87;
    stim[41] = 53'h1d5107c6925e54;
    stim[42] = 53'h1a46f5be83ac6e;
    stim[43] = 53'h0c4f3fea840f0c;
    stim[44] = 53'h0835ee66fbd5bf;
    stim[45] = 53'h179287d9ad177d;
    stim[46] = 53'h1707cfa5bd3d70;
    stim[47] = 53'h034e4591df295d;
    stim[48] = 53'h14c2545400d2e7;
    stim[49] = 53'h0e2e5441eb9e06;
    stim[50] = 53'h059edd06cf2f15;
    stim[51] = 53'h1502b9516648af;
    stim[52] = 53'h18bb87aceb7f8f;
    stim[53] = 53'h14f917a5cffbdd;
    stim[54] = 53'h04f4d66cfc1ade;
    stim[55] = 53'h08a95c859bce8f;
    stim[56] = 53'h0a37ef4130822d;
    stim[57] = 53'h06276da70a1a6d;
    stim[58] = 53'h0153f5ab6e8de3;
    stim[59] = 53'h0ca69c695c2111;
    stim[60] = 53'h1d7686a8a4b3a6;
    stim[61] = 53'h14b3b54866d362;
    stim[62] = 53'h04b1ed248cc9ba;
    stim[63] = 53'h17d1d785f16c58;
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
      expv[0] = 53'h00000000000000;
      expv[1] = 53'h00000000000000;
      expv[2] = 53'h00000000000001;
      expv[3] = 53'h00000000000aaa;
      expv[4] = 53'h0a8f772e854e4b;
      expv[5] = 53'h0a8f772e8413f1;
      expv[6] = 53'h0a8f772e84bcac;
      expv[7] = 53'h101d6bdcfef622;
      expv[8] = 53'h1e5fc721d530a2;
      expv[9] = 53'h165af5c35b886c;
      expv[10] = 53'h02e8f303343ced;
      expv[11] = 53'h02e8f303370128;
      expv[12] = 53'h08e9eb1e080589;
      expv[13] = 53'h08e9eb1e08959f;
      expv[14] = 53'h08dc292f73d153;
      expv[15] = 53'h0868c958dc906d;
      expv[16] = 53'h0868c958de0f43;
      expv[17] = 53'h084bf949ea5fe9;
      expv[18] = 53'h084bf949e93f47;
      expv[19] = 53'h084bf949e9fb2d;
      expv[20] = 53'h085b78e373cecb;
      expv[21] = 53'h083b08e2225cc5;
      expv[22] = 53'h083b08e2239841;
      expv[23] = 53'h083b08e2226cd9;
      expv[24] = 53'h083b08e220f0c3;
      expv[25] = 53'h083b08e222c2fb;
      expv[26] = 53'h083b08e2208d4d;
      expv[27] = 53'h083b08e2232a78;
      expv[28] = 53'h00d8d168fa4f68;
      expv[29] = 53'h0c1cdb89ef3581;
      expv[30] = 53'h0c1cdb89ef2aed;
      expv[31] = 53'h0c1cdb89ecf124;
      expv[32] = 53'h122bf8d6377c27;
      expv[33] = 53'h122bf8d6360213;
      expv[34] = 53'h121b2bc1fee790;
      expv[35] = 53'h083df8fff52359;
      expv[36] = 53'h083df8fff42151;
      expv[37] = 53'h083df8fff4d789;
      expv[38] = 53'h083df8fff45911;
      expv[39] = 53'h083df8fff4bc61;
      expv[40] = 53'h083df8fff4e6d1;
      expv[41] = 53'h08abe92a1d1f99;
      expv[42] = 53'h083a497953aa20;
      expv[43] = 53'h1afa0ab1bb48df;
      expv[44] = 53'h1afa0ab1b989e7;
      expv[45] = 53'h1afa0ab1b906bd;
      expv[46] = 53'h1aceb85df6f251;
      expv[47] = 53'h1aceb85df6e0f9;
      expv[48] = 53'h1a8f78a57469c9;
      expv[49] = 53'h1aa80b4b9e984b;
      expv[50] = 53'h1a0faa7819c5cb;
      expv[51] = 53'h00000000000001;
      expv[52] = 53'h00000000000000;
      expv[53] = 53'h1a6ba9fe3f1771;
      expv[54] = 53'h1a2f3bef769f23;
      expv[55] = 53'h1a6bf86b789e9b;
      expv[56] = 53'h1a6bf86b79152b;
      expv[57] = 53'h1a6bf86b7946fd;
      expv[58] = 53'h1a6bf86b78c4ed;
      expv[59] = 53'h1a5dba378c2a7f;
      expv[60] = 53'h1a5dba378d94d3;
      expv[61] = 53'h1a4a9ace9baed1;
      expv[62] = 53'h1a499b4d8a9677;
      expv[63] = 53'h1a499b4d88963c;
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
