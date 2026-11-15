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

  autovcoder_115287 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7bf3156f1;
    stim[1] = 35'h4a9d5ae7c;
    stim[2] = 35'h338e6b9d9;
    stim[3] = 35'h38cdb8897;
    stim[4] = 35'h1282ac0e4;
    stim[5] = 35'h3753215e2;
    stim[6] = 35'h0824351c5;
    stim[7] = 35'h0ca4c77db;
    stim[8] = 35'h2adf5d8b0;
    stim[9] = 35'h3fe35e97a;
    stim[10] = 35'h265e8fa96;
    stim[11] = 35'h0282f5c87;
    stim[12] = 35'h279836b07;
    stim[13] = 35'h1df7de5f3;
    stim[14] = 35'h3106dedcf;
    stim[15] = 35'h1678f9044;
    stim[16] = 35'h2ba7c9d08;
    stim[17] = 35'h3af74f387;
    stim[18] = 35'h336e6514e;
    stim[19] = 35'h269ad8def;
    stim[20] = 35'h0d2b830d9;
    stim[21] = 35'h2eca33c4e;
    stim[22] = 35'h1bb7d0ce8;
    stim[23] = 35'h168c7c1c9;
    stim[24] = 35'h3c811a92a;
    stim[25] = 35'h186722dfc;
    stim[26] = 35'h11e134f4a;
    stim[27] = 35'h1528cd62a;
    stim[28] = 35'h0388384eb;
    stim[29] = 35'h11039b0c6;
    stim[30] = 35'h0a551eff4;
    stim[31] = 35'h1ff19f918;
    stim[32] = 35'h72f353c1a;
    stim[33] = 35'h2b23138e1;
    stim[34] = 35'h273a6697a;
    stim[35] = 35'h277aa9561;
    stim[36] = 35'h01e009f30;
    stim[37] = 35'h08ed33340;
    stim[38] = 35'h2df3b4cf4;
    stim[39] = 35'h2746f020e;
    stim[40] = 35'h0e64f1b7a;
    stim[41] = 35'h323d179c7;
    stim[42] = 35'h28fec999b;
    stim[43] = 35'h1cff9047d;
    stim[44] = 35'h195ba6f14;
    stim[45] = 35'h3fcf04fcb;
    stim[46] = 35'h2c8958e39;
    stim[47] = 35'h24ba57617;
    stim[48] = 35'h3f12bfc5c;
    stim[49] = 35'h2cb0906d5;
    stim[50] = 35'h06466ec99;
    stim[51] = 35'h16c915c2a;
    stim[52] = 35'h3307d6972;
    stim[53] = 35'h32b592cdd;
    stim[54] = 35'h349e21e94;
    stim[55] = 35'h2f4476153;
    stim[56] = 35'h3c36bf382;
    stim[57] = 35'h336a0b218;
    stim[58] = 35'h0cebbc7a7;
    stim[59] = 35'h17b96e18c;
    stim[60] = 35'h1b886bcc4;
    stim[61] = 35'h357a3780d;
    stim[62] = 35'h2b7eef93c;
    stim[63] = 35'h0f41800b7;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h0a9d5ae7c;
      expv[3] = 35'h738e6b9d8;
      expv[4] = 35'h78cdb8897;
      expv[5] = 35'h78cdb8897;
      expv[6] = 35'h38cdb8897;
      expv[7] = 35'h7753215e2;
      expv[8] = 35'h4ca4c77db;
      expv[9] = 35'h4ca4c77db;
      expv[10] = 35'h0ca4c77db;
      expv[11] = 35'h0ca4c77db;
      expv[12] = 35'h7fe35e97a;
      expv[13] = 35'h679836b06;
      expv[14] = 35'h5df7de5f2;
      expv[15] = 35'h7106dedcf;
      expv[16] = 35'h7106dedcf;
      expv[17] = 35'h7106dedce;
      expv[18] = 35'h7af74f387;
      expv[19] = 35'h3af74f387;
      expv[20] = 35'h736e6514e;
      expv[21] = 35'h4d2b830d8;
      expv[22] = 35'h6eca33c4f;
      expv[23] = 35'h6eca33c4e;
      expv[24] = 35'h568c7c1c8;
      expv[25] = 35'h7c811a92b;
      expv[26] = 35'h7c811a92b;
      expv[27] = 35'h3c811a92b;
      expv[28] = 35'h3c811a92b;
      expv[29] = 35'h51e134f4b;
      expv[30] = 35'h11e134f4b;
      expv[31] = 35'h11e134f4b;
      expv[32] = 35'h11e134f4b;
      expv[33] = 35'h11039b0c4;
      expv[34] = 35'h6b23138e0;
      expv[35] = 35'h673a6697a;
      expv[36] = 35'h677aa9560;
      expv[37] = 35'h41e009f30;
      expv[38] = 35'h48ed33340;
      expv[39] = 35'h6df3b4cf4;
      expv[40] = 35'h6746f020f;
      expv[41] = 35'h2746f020f;
      expv[42] = 35'h4e64f1b7a;
      expv[43] = 35'h68fec999a;
      expv[44] = 35'h5cff9047c;
      expv[45] = 35'h595ba6f14;
      expv[46] = 35'h7fcf04fca;
      expv[47] = 35'h6c8958e38;
      expv[48] = 35'h64ba57617;
      expv[49] = 35'h64ba57616;
      expv[50] = 35'h6cb0906d4;
      expv[51] = 35'h46466ec98;
      expv[52] = 35'h56c915c2b;
      expv[53] = 35'h16c915c2b;
      expv[54] = 35'h7307d6973;
      expv[55] = 35'h7307d6972;
      expv[56] = 35'h6f4476153;
      expv[57] = 35'h2f4476153;
      expv[58] = 35'h2f4476153;
      expv[59] = 35'h7c36bf383;
      expv[60] = 35'h7c36bf383;
      expv[61] = 35'h7c36bf382;
      expv[62] = 35'h757a3780c;
      expv[63] = 35'h6b7eef93c;
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
