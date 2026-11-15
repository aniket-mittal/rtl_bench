// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06501 dut (
    .activate_0r(in_vec[34:34]),
    .inp_0a(in_vec[33:33]),
    .inp_0d(in_vec[32:1]),
    .out_0a(in_vec[0:0]),
    .activate_0a(out_vec[34:34]),
    .inp_0r(out_vec[33:33]),
    .out_0r(out_vec[32:32]),
    .out_0d(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h79b8f2599;
    stim[1] = 35'h3a5debe33;
    stim[2] = 35'h505db7523;
    stim[3] = 35'h5b4ed7c48;
    stim[4] = 35'h2fcc49848;
    stim[5] = 35'h63d8d9405;
    stim[6] = 35'h281a7ced2;
    stim[7] = 35'h51db2eaf5;
    stim[8] = 35'h415703715;
    stim[9] = 35'h5ba5604fd;
    stim[10] = 35'h0727345fd;
    stim[11] = 35'h455c3ea39;
    stim[12] = 35'h04a070f1e;
    stim[13] = 35'h560c1ad85;
    stim[14] = 35'h7b03b83dd;
    stim[15] = 35'h1be12486c;
    stim[16] = 35'h6ee7e816f;
    stim[17] = 35'h273e2a5ce;
    stim[18] = 35'h65c0c9505;
    stim[19] = 35'h0436f537f;
    stim[20] = 35'h7b77d3bfb;
    stim[21] = 35'h56806a7f6;
    stim[22] = 35'h431a02266;
    stim[23] = 35'h47150af06;
    stim[24] = 35'h1ef0ba582;
    stim[25] = 35'h6ff9d31d9;
    stim[26] = 35'h7497be54d;
    stim[27] = 35'h79862a4b2;
    stim[28] = 35'h56533f9b6;
    stim[29] = 35'h3859539e0;
    stim[30] = 35'h57a99f085;
    stim[31] = 35'h5de8c8fb7;
    stim[32] = 35'h34535b05e;
    stim[33] = 35'h5dd65743c;
    stim[34] = 35'h6d4da08b9;
    stim[35] = 35'h11a1b6ad0;
    stim[36] = 35'h23791f6d8;
    stim[37] = 35'h157153abc;
    stim[38] = 35'h50370d6d5;
    stim[39] = 35'h6098781ff;
    stim[40] = 35'h01e7cb69c;
    stim[41] = 35'h143bc0f5d;
    stim[42] = 35'h7520e6ba4;
    stim[43] = 35'h645635417;
    stim[44] = 35'h03354c254;
    stim[45] = 35'h6587af9b1;
    stim[46] = 35'h28b2c50b8;
    stim[47] = 35'h64d5e5d7a;
    stim[48] = 35'h4a7251c6f;
    stim[49] = 35'h4d7179b19;
    stim[50] = 35'h437d65ff9;
    stim[51] = 35'h713f65470;
    stim[52] = 35'h3e8726303;
    stim[53] = 35'h578a6087a;
    stim[54] = 35'h3f37b6bd0;
    stim[55] = 35'h6cd3b459e;
    stim[56] = 35'h4edbc8be0;
    stim[57] = 35'h2ffcce421;
    stim[58] = 35'h639d6b6d1;
    stim[59] = 35'h4a73df2a5;
    stim[60] = 35'h5bb3a2842;
    stim[61] = 35'h0d9a79be6;
    stim[62] = 35'h23e4851fc;
    stim[63] = 35'h7fcd0b141;
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
      expv[0] = 35'h7cdc792cc;
      expv[1] = 35'h5d2ef5f19;
      expv[2] = 35'h682edba91;
      expv[3] = 35'h2da76be24;
      expv[4] = 35'h17e624c24;
      expv[5] = 35'h71ec6ca02;
      expv[6] = 35'h140d3e769;
      expv[7] = 35'h68ed9757a;
      expv[8] = 35'h60ab81b8a;
      expv[9] = 35'h6dd2b027e;
      expv[10] = 35'h43939a2fe;
      expv[11] = 35'h62ae1f51c;
      expv[12] = 35'h02503878f;
      expv[13] = 35'h6b060d6c2;
      expv[14] = 35'h7d81dc1ee;
      expv[15] = 35'h0df092436;
      expv[16] = 35'h7773f40b7;
      expv[17] = 35'h139f152e7;
      expv[18] = 35'h72e064a82;
      expv[19] = 35'h421b7a9bf;
      expv[20] = 35'h7dbbe9dfd;
      expv[21] = 35'h2b40353fb;
      expv[22] = 35'h218d01133;
      expv[23] = 35'h238a85783;
      expv[24] = 35'h0f785d2c1;
      expv[25] = 35'h77fce98ec;
      expv[26] = 35'h7a4bdf2a6;
      expv[27] = 35'h3cc315259;
      expv[28] = 35'h2b299fcdb;
      expv[29] = 35'h1c2ca9cf0;
      expv[30] = 35'h6bd4cf842;
      expv[31] = 35'h6ef4647db;
      expv[32] = 35'h1a29ad82f;
      expv[33] = 35'h2eeb2ba1e;
      expv[34] = 35'h76a6d045c;
      expv[35] = 35'h08d0db568;
      expv[36] = 35'h11bc8fb6c;
      expv[37] = 35'h0ab8a9d5e;
      expv[38] = 35'h681b86b6a;
      expv[39] = 35'h704c3c0ff;
      expv[40] = 35'h00f3e5b4e;
      expv[41] = 35'h4a1de07ae;
      expv[42] = 35'h3a90735d2;
      expv[43] = 35'h722b1aa0b;
      expv[44] = 35'h019aa612a;
      expv[45] = 35'h72c3d7cd8;
      expv[46] = 35'h14596285c;
      expv[47] = 35'h326af2ebd;
      expv[48] = 35'h653928e37;
      expv[49] = 35'h66b8bcd8c;
      expv[50] = 35'h61beb2ffc;
      expv[51] = 35'h389fb2a38;
      expv[52] = 35'h5f4393181;
      expv[53] = 35'h2bc53043d;
      expv[54] = 35'h1f9bdb5e8;
      expv[55] = 35'h3669da2cf;
      expv[56] = 35'h276de45f0;
      expv[57] = 35'h57fe67210;
      expv[58] = 35'h71ceb5b68;
      expv[59] = 35'h6539ef952;
      expv[60] = 35'h2dd9d1421;
      expv[61] = 35'h06cd3cdf3;
      expv[62] = 35'h11f2428fe;
      expv[63] = 35'h7fe6858a0;
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
