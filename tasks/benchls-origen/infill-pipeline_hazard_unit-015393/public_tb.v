// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015393 dut (
    .branch_d(in_vec[34:34]),
    .regwrite_e(in_vec[33:33]),
    .memtoreg_e(in_vec[32:32]),
    .memtoreg_m(in_vec[31:31]),
    .writereg_e(in_vec[30:26]),
    .rs_d(in_vec[25:21]),
    .rt_d(in_vec[20:16]),
    .rt_e(in_vec[15:11]),
    .writereg_m(in_vec[10:6]),
    .memread_m(in_vec[5:5]),
    .memwrite_m(in_vec[4:4]),
    .memready_m(in_vec[3:3]),
    .branchtaken_e(in_vec[2:2]),
    .branchfound_e(in_vec[1:1]),
    .jump_d(in_vec[0:0]),
    .stall_f(out_vec[9:9]),
    .stall_d(out_vec[8:8]),
    .stall_e(out_vec[7:7]),
    .stall_m(out_vec[6:6]),
    .stall_w(out_vec[5:5]),
    .flush_f(out_vec[4:4]),
    .flush_d(out_vec[3:3]),
    .flush_e(out_vec[2:2]),
    .flush_m(out_vec[1:1]),
    .flush_w(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6ae1298e6;
    stim[1] = 35'h38125f065;
    stim[2] = 35'h5d337e111;
    stim[3] = 35'h375739042;
    stim[4] = 35'h53a6d2ee3;
    stim[5] = 35'h15e0621f1;
    stim[6] = 35'h2df6fea41;
    stim[7] = 35'h34cccda3a;
    stim[8] = 35'h0d28b7faa;
    stim[9] = 35'h237bce211;
    stim[10] = 35'h3e7022692;
    stim[11] = 35'h5f3f218d8;
    stim[12] = 35'h5f23b4166;
    stim[13] = 35'h297efd07d;
    stim[14] = 35'h2e82ba2a9;
    stim[15] = 35'h736c2d823;
    stim[16] = 35'h1da990915;
    stim[17] = 35'h7d5fd4ae0;
    stim[18] = 35'h0cfa5e29e;
    stim[19] = 35'h4cec0b734;
    stim[20] = 35'h50265fe3a;
    stim[21] = 35'h3f0c69ad1;
    stim[22] = 35'h035f68227;
    stim[23] = 35'h296159b54;
    stim[24] = 35'h3b67f8527;
    stim[25] = 35'h34ed0dd0b;
    stim[26] = 35'h6726d1e26;
    stim[27] = 35'h286e55327;
    stim[28] = 35'h7c7ef5cc8;
    stim[29] = 35'h4420d1713;
    stim[30] = 35'h4809cd845;
    stim[31] = 35'h7dbc795a6;
    stim[32] = 35'h4778c1146;
    stim[33] = 35'h571caa2c6;
    stim[34] = 35'h02d7af5a5;
    stim[35] = 35'h513fedf05;
    stim[36] = 35'h1155de5aa;
    stim[37] = 35'h74b98d765;
    stim[38] = 35'h3e2da6a61;
    stim[39] = 35'h62855be04;
    stim[40] = 35'h25acbc7cd;
    stim[41] = 35'h59dc9dfd5;
    stim[42] = 35'h4c7072419;
    stim[43] = 35'h374c71f75;
    stim[44] = 35'h79cf61bb6;
    stim[45] = 35'h7a91ae8b8;
    stim[46] = 35'h3dc483863;
    stim[47] = 35'h2282eabbd;
    stim[48] = 35'h0e7a499cf;
    stim[49] = 35'h419274c99;
    stim[50] = 35'h13cf88a86;
    stim[51] = 35'h5f81247d4;
    stim[52] = 35'h5a523cc70;
    stim[53] = 35'h472a84a9f;
    stim[54] = 35'h6efff3b83;
    stim[55] = 35'h384316b46;
    stim[56] = 35'h56c6a7b52;
    stim[57] = 35'h3cae697dd;
    stim[58] = 35'h43da6db54;
    stim[59] = 35'h572590466;
    stim[60] = 35'h662833915;
    stim[61] = 35'h34441528d;
    stim[62] = 35'h55dcca7da;
    stim[63] = 35'h4d4606ec5;
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
      expv[0] = 10'h3fc;
      expv[1] = 10'h3f8;
      expv[2] = 10'h3f8;
      expv[3] = 10'h000;
      expv[4] = 10'h3f8;
      expv[5] = 10'h3f8;
      expv[6] = 10'h018;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h3f8;
      expv[10] = 10'h3e0;
      expv[11] = 10'h000;
      expv[12] = 10'h3fc;
      expv[13] = 10'h018;
      expv[14] = 10'h018;
      expv[15] = 10'h3f8;
      expv[16] = 10'h3f8;
      expv[17] = 10'h3e0;
      expv[18] = 10'h01c;
      expv[19] = 10'h3e0;
      expv[20] = 10'h000;
      expv[21] = 10'h3f8;
      expv[22] = 10'h3fc;
      expv[23] = 10'h3e0;
      expv[24] = 10'h3fc;
      expv[25] = 10'h018;
      expv[26] = 10'h3fc;
      expv[27] = 10'h3fc;
      expv[28] = 10'h000;
      expv[29] = 10'h3f8;
      expv[30] = 10'h018;
      expv[31] = 10'h3fc;
      expv[32] = 10'h01c;
      expv[33] = 10'h01c;
      expv[34] = 10'h3f8;
      expv[35] = 10'h018;
      expv[36] = 10'h000;
      expv[37] = 10'h3f8;
      expv[38] = 10'h3f8;
      expv[39] = 10'h000;
      expv[40] = 10'h018;
      expv[41] = 10'h3f8;
      expv[42] = 10'h018;
      expv[43] = 10'h3f8;
      expv[44] = 10'h3fc;
      expv[45] = 10'h000;
      expv[46] = 10'h3f8;
      expv[47] = 10'h018;
      expv[48] = 10'h01c;
      expv[49] = 10'h018;
      expv[50] = 10'h01c;
      expv[51] = 10'h3e0;
      expv[52] = 10'h3e0;
      expv[53] = 10'h01c;
      expv[54] = 10'h018;
      expv[55] = 10'h01c;
      expv[56] = 10'h3e0;
      expv[57] = 10'h018;
      expv[58] = 10'h3e0;
      expv[59] = 10'h3fc;
      expv[60] = 10'h3f8;
      expv[61] = 10'h018;
      expv[62] = 10'h000;
      expv[63] = 10'h018;
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
