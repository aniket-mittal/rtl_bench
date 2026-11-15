// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02709 dut (
    .clk(clk),
    .Data_in(in_vec[66:35]),
    .inst_in(in_vec[34:3]),
    .INT(in_vec[2:2]),
    .MIO_ready(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .Addr_out(out_vec[97:66]),
    .CPU_MIO(out_vec[65:65]),
    .Data_out(out_vec[64:33]),
    .mem_w(out_vec[32:32]),
    .PC_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h3ef18767d5815e86f;
    stim[1] = 67'h133699f52306a6981;
    stim[2] = 67'h413c795f61390b446;
    stim[3] = 67'h7abafe386009013e4;
    stim[4] = 67'h3ba066d4811392342;
    stim[5] = 67'h01297e7e26b740106;
    stim[6] = 67'h2cde41258eb65330a;
    stim[7] = 67'h666b9fe717eb27b58;
    stim[8] = 67'h7b672515a500540ac;
    stim[9] = 67'h2c53ab62062b41ce4;
    stim[10] = 67'h22491d281bd4a4abc;
    stim[11] = 67'h4133a71c8cd4bd3aa;
    stim[12] = 67'h22d7429efd2d26fd6;
    stim[13] = 67'h0b036ed9fb09a96e8;
    stim[14] = 67'h0c430bedba78949e8;
    stim[15] = 67'h420f1cf760f856bb8;
    stim[16] = 67'h67a83e6c9fa6bf9c4;
    stim[17] = 67'h3b28f2a48a3ed20be;
    stim[18] = 67'h52b9857cd7b21ac50;
    stim[19] = 67'h089058d6c0c204e50;
    stim[20] = 67'h54c88fd1b4897ef44;
    stim[21] = 67'h3926550ada6fee572;
    stim[22] = 67'h2c098c893c4fccabe;
    stim[23] = 67'h64fb117c012c7e8cc;
    stim[24] = 67'h0d16725f5eb6e2eac;
    stim[25] = 67'h66d9132fe4fde0538;
    stim[26] = 67'h2890f1590810e6998;
    stim[27] = 67'h540f6110fc1cb6560;
    stim[28] = 67'h11121de13f478beb0;
    stim[29] = 67'h2e4e821c4f8179b1a;
    stim[30] = 67'h61cac8419b8c7cc76;
    stim[31] = 67'h3ba0e610d1830fa78;
    stim[32] = 67'h3b7e82e651baeb2dd;
    stim[33] = 67'h4e8861a1e190988b8;
    stim[34] = 67'h1cb96a6b24f96073e;
    stim[35] = 67'h325118cdb91dbad90;
    stim[36] = 67'h276afd9c392483d7c;
    stim[37] = 67'h08138efa3c8762e8e;
    stim[38] = 67'h24cb5d8fb8622c428;
    stim[39] = 67'h4b838ba8da6a3dd80;
    stim[40] = 67'h5c53d5986c4ae0f9c;
    stim[41] = 67'h386817091910d6b8a;
    stim[42] = 67'h3bb396591e498a5fc;
    stim[43] = 67'h6f193f4ab3028e8cc;
    stim[44] = 67'h7ae7a49a87dc69e36;
    stim[45] = 67'h45f4702e633efbc42;
    stim[46] = 67'h2f6d1c5ed53534df8;
    stim[47] = 67'h0251f9fc1060f23b8;
    stim[48] = 67'h3235c466dfc7d03b0;
    stim[49] = 67'h2cdc0da7f687476b6;
    stim[50] = 67'h469a96a118573a572;
    stim[51] = 67'h695cf7fb5e336dcce;
    stim[52] = 67'h7c057fa12bbb21b70;
    stim[53] = 67'h2330a9da0a9241bec;
    stim[54] = 67'h34335422d53880506;
    stim[55] = 67'h353d8df36ab74d808;
    stim[56] = 67'h13586b4e3f5bcb932;
    stim[57] = 67'h348d8a8a3c718a9ac;
    stim[58] = 67'h4dd9f16c8917446a4;
    stim[59] = 67'h7147a7a036e274610;
    stim[60] = 67'h58c61b1440ebf77a4;
    stim[61] = 67'h7549d2360ddcef748;
    stim[62] = 67'h64d14359a3df0913a;
    stim[63] = 67'h232bd71b9fcd33662;
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
      expv[0] = 98'hxxxxxxxxxxxxxxxxx00000000;
      expv[1] = 98'hxxxxxxxxxxxxxxxxx00000000;
      expv[2] = 98'hxxxxxxxxxxxxxxxxx00000000;
      expv[3] = 98'h00000001xxxxxxxxx00000004;
      expv[4] = 98'h00000002xxxxxxxxx00000008;
      expv[5] = 98'h00000003xxxxxxxxx0000000c;
      expv[6] = 98'h00000004xxxxxxxxx00000010;
      expv[7] = 98'h00000005xxxxxxxxx00000014;
      expv[8] = 98'h00000006xxxxxxxxx00000018;
      expv[9] = 98'h00000007xxxxxxxxx0000001c;
      expv[10] = 98'h00000008xxxxxxxxx00000020;
      expv[11] = 98'h00000009xxxxxxxxx00000024;
      expv[12] = 98'h0000000axxxxxxxxx00000028;
      expv[13] = 98'h0000000bxxxxxxxxx0000002c;
      expv[14] = 98'h0000000cxxxxxxxxx00000030;
      expv[15] = 98'h0000000dxxxxxxxxx00000034;
      expv[16] = 98'h0000000exxxxxxxxx00000038;
      expv[17] = 98'h0000000fxxxxxxxxx0000003c;
      expv[18] = 98'h00000010xxxxxxxxx00000040;
      expv[19] = 98'h00000011xxxxxxxxx00000044;
      expv[20] = 98'h00000012xxxxxxxxx00000048;
      expv[21] = 98'h00000013xxxxxxxxx0000004c;
      expv[22] = 98'h00000014xxxxxxxxx00000050;
      expv[23] = 98'h0000001500000001000000054;
      expv[24] = 98'h00000016xxxxxxxxx00000058;
      expv[25] = 98'h00000017xxxxxxxxx0000005c;
      expv[26] = 98'h00000018xxxxxxxxx00000060;
      expv[27] = 98'h00000019xxxxxxxxxffff3530;
      expv[28] = 98'h3fffcd4dxxxxxxxxxffff3534;
      expv[29] = 98'h3fffcd4exxxxxxxxxffff3538;
      expv[30] = 98'h3fffcd4fxxxxxxxxxffff353c;
      expv[31] = 98'h3fffcd50xxxxxxxxxffff3540;
      expv[32] = 98'h3fffcd51xxxxxxxxx00000000;
      expv[33] = 98'h3fffcd51xxxxxxxxx00000000;
      expv[34] = 98'h00000001xxxxxxxxx00000004;
      expv[35] = 98'h00000002xxxxxxxxx00000008;
      expv[36] = 98'h00000003xxxxxxxxx0000000c;
      expv[37] = 98'h00000004xxxxxxxxx00000010;
      expv[38] = 98'h00000005xxxxxxxxx00000014;
      expv[39] = 98'h00000006xxxxxxxxx00000018;
      expv[40] = 98'h00000007xxxxxxxxx0000001c;
      expv[41] = 98'h0000000800000001000000020;
      expv[42] = 98'h00000009xxxxxxxxx00000024;
      expv[43] = 98'h0000000a00000001000000028;
      expv[44] = 98'h0000000bxxxxxxxxx0000002c;
      expv[45] = 98'h0000000cxxxxxxxxx00000030;
      expv[46] = 98'h0000000dxxxxxxxxx00000034;
      expv[47] = 98'h0000000exxxxxxxxx00000038;
      expv[48] = 98'h0000000fxxxxxxxxx0000003c;
      expv[49] = 98'h00000010xxxxxxxxx00000040;
      expv[50] = 98'h00000011xxxxxxxxx00000044;
      expv[51] = 98'h00000012xxxxxxxxx00000048;
      expv[52] = 98'h00000013xxxxxxxxx0000004c;
      expv[53] = 98'h00000014xxxxxxxxx00000050;
      expv[54] = 98'h00000015xxxxxxxxx00000054;
      expv[55] = 98'h00000016xxxxxxxxx00000058;
      expv[56] = 98'h00000017xxxxxxxxx0000005c;
      expv[57] = 98'h00000018xxxxxxxxx00000060;
      expv[58] = 98'h00000019xxxxxxxxx00000064;
      expv[59] = 98'h0000001axxxxxxxxxfffe23b8;
      expv[60] = 98'h3fff88efxxxxxxxxxfffe23bc;
      expv[61] = 98'h3fff88f0xxxxxxxxxfffe23c0;
      expv[62] = 98'h3fff88f1xxxxxxxxxfffe23c4;
      expv[63] = 98'h3fff88f2xxxxxxxxxfffe23c8;
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
