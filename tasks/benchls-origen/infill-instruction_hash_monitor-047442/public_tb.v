// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_047442 dut (
    .core_sp_clk(clk),
    .instruction_sec_mon(in_vec[45:14]),
    .read_address(in_vec[13:2]),
    .hash_int_ACK(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .hash_value(out_vec[4:1]),
    .new_inst_signal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h12f9f3cd0fef;
    stim[1] = 46'h28452b5af777;
    stim[2] = 46'h10aabcda61b2;
    stim[3] = 46'h2ee0c2550b98;
    stim[4] = 46'h0534e82ae8ae;
    stim[5] = 46'h3b4dc2818878;
    stim[6] = 46'h398d61eb2400;
    stim[7] = 46'h27b640678a14;
    stim[8] = 46'h122b58d9349e;
    stim[9] = 46'h326a7a8eacec;
    stim[10] = 46'h1dcf6712064c;
    stim[11] = 46'h3e02c79112e0;
    stim[12] = 46'h30aaf3587d6e;
    stim[13] = 46'h3a6b14d68f5a;
    stim[14] = 46'h1270251322b2;
    stim[15] = 46'h12a61b2fdb76;
    stim[16] = 46'h0c9d44adc9bc;
    stim[17] = 46'h02337b96dc32;
    stim[18] = 46'h25c75347c503;
    stim[19] = 46'h205044bde1ba;
    stim[20] = 46'h2c7d92e90c54;
    stim[21] = 46'h35482274847e;
    stim[22] = 46'h1a208248c562;
    stim[23] = 46'h1e169d45de20;
    stim[24] = 46'h25e32280f0da;
    stim[25] = 46'h0c96fdd5c03a;
    stim[26] = 46'h251b32cb773e;
    stim[27] = 46'h3e4f5f82a6cc;
    stim[28] = 46'h3f3469a4af36;
    stim[29] = 46'h02e59f51c124;
    stim[30] = 46'h107fe2398c40;
    stim[31] = 46'h22dda013de30;
    stim[32] = 46'h2979b619fdfe;
    stim[33] = 46'h342eca56b514;
    stim[34] = 46'h058c3d59c8fa;
    stim[35] = 46'h29d78a27e520;
    stim[36] = 46'h31dad399c1aa;
    stim[37] = 46'h32353f00f650;
    stim[38] = 46'h235a11a27224;
    stim[39] = 46'h0d7d593d384c;
    stim[40] = 46'h1617a539da88;
    stim[41] = 46'h1393faafb86c;
    stim[42] = 46'h2ee9dfd6431e;
    stim[43] = 46'h13b93d9176f8;
    stim[44] = 46'h3567f7d81778;
    stim[45] = 46'h18101c86da88;
    stim[46] = 46'h09ae7bf0e986;
    stim[47] = 46'h154e36594178;
    stim[48] = 46'h229cec2a5a1c;
    stim[49] = 46'h32e57e8ac314;
    stim[50] = 46'h2bdcd1eb3072;
    stim[51] = 46'h205e9685f0e2;
    stim[52] = 46'h27da7c05715c;
    stim[53] = 46'h345d02271634;
    stim[54] = 46'h388e44c18090;
    stim[55] = 46'h22724076c8a6;
    stim[56] = 46'h36b030c009dc;
    stim[57] = 46'h1a4318a09232;
    stim[58] = 46'h31dd3dee9b98;
    stim[59] = 46'h2d4c63788d36;
    stim[60] = 46'h2c9adba6cce4;
    stim[61] = 46'h147bd38ccd7c;
    stim[62] = 46'h05fbeee778fe;
    stim[63] = 46'h3bf14f80b02e;
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
      expv[0] = 5'h0x;
      expv[1] = 5'h0x;
      expv[2] = 5'h0x;
      expv[3] = 5'h01;
      expv[4] = 5'h00;
      expv[5] = 5'h07;
      expv[6] = 5'h06;
      expv[7] = 5'h06;
      expv[8] = 5'h06;
      expv[9] = 5'h1b;
      expv[10] = 5'h1a;
      expv[11] = 5'h1a;
      expv[12] = 5'h1a;
      expv[13] = 5'h1b;
      expv[14] = 5'h1f;
      expv[15] = 5'h01;
      expv[16] = 5'h0f;
      expv[17] = 5'h0e;
      expv[18] = 5'h01;
      expv[19] = 5'h01;
      expv[20] = 5'h01;
      expv[21] = 5'h00;
      expv[22] = 5'h15;
      expv[23] = 5'h11;
      expv[24] = 5'h10;
      expv[25] = 5'h1d;
      expv[26] = 5'h19;
      expv[27] = 5'h1f;
      expv[28] = 5'h1e;
      expv[29] = 5'h0b;
      expv[30] = 5'h0a;
      expv[31] = 5'h0a;
      expv[32] = 5'h0a;
      expv[33] = 5'h1d;
      expv[34] = 5'h1c;
      expv[35] = 5'h0d;
      expv[36] = 5'h0c;
      expv[37] = 5'h19;
      expv[38] = 5'h18;
      expv[39] = 5'h18;
      expv[40] = 5'h18;
      expv[41] = 5'h18;
      expv[42] = 5'h18;
      expv[43] = 5'h1d;
      expv[44] = 5'h1c;
      expv[45] = 5'h1c;
      expv[46] = 5'h1c;
      expv[47] = 5'h17;
      expv[48] = 5'h16;
      expv[49] = 5'h16;
      expv[50] = 5'h16;
      expv[51] = 5'h1b;
      expv[52] = 5'h03;
      expv[53] = 5'h02;
      expv[54] = 5'h02;
      expv[55] = 5'h02;
      expv[56] = 5'h05;
      expv[57] = 5'h04;
      expv[58] = 5'h19;
      expv[59] = 5'h18;
      expv[60] = 5'h1f;
      expv[61] = 5'h1e;
      expv[62] = 5'h1e;
      expv[63] = 5'h1b;
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
