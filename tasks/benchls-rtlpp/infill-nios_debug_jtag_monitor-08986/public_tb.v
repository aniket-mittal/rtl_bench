// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08986 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h13ec51d045184df6a32fbd55ee5a9fb;
    stim[1] = 122'h011be0605a846fb7bc2a65b1700df30;
    stim[2] = 122'h176fc98b47c5cfd47867ea52c6f3ae7;
    stim[3] = 122'h00e153659179c2138d7b82e33d7a29b;
    stim[4] = 122'h0e8595b327b997a609c82a127281e06;
    stim[5] = 122'h0e11868e6e386bccf6d249351682ab0;
    stim[6] = 122'h024d52833ca37206d65a73084937e1b;
    stim[7] = 122'h27c5730a8760463a526a55a9dac5768;
    stim[8] = 122'h38a34937f5a478a0a2e6b2b131b7f8e;
    stim[9] = 122'h1c158e60a78ff1495b4365abab4a336;
    stim[10] = 122'h3408f503e437bbbb45c39d2b2d863a0;
    stim[11] = 122'h1a998264933529f714ead67e3708ec6;
    stim[12] = 122'h08a1689603a89800e9e1a5057d709eb;
    stim[13] = 122'h2aa9138811b368fd72ff9cf51279503;
    stim[14] = 122'h1ffb001c6a4454055cc62032ed6ed26;
    stim[15] = 122'h18ba4c9715d79c02e1f3ea4085af4d6;
    stim[16] = 122'h36e6b557632b91519075b6e033d57c9;
    stim[17] = 122'h167fd89bdf603e55015563d9d67a9a1;
    stim[18] = 122'h18f2f1d6c974e8f354894a565168763;
    stim[19] = 122'h374d9e58e20abb91b5d3bfcee0d7367;
    stim[20] = 122'h05c35642bc5dc80c73c5d29690a249d;
    stim[21] = 122'h09df4d6665f479048841fc9027dbdf1;
    stim[22] = 122'h1f634f3eb667cdaf4a7600dbcdb5ca1;
    stim[23] = 122'h19f4f3970854b89311d120bd552d135;
    stim[24] = 122'h0def833af6ce98d2f14c897eea02cf2;
    stim[25] = 122'h12e9f6e583014666c5cb5bd23d4bbea;
    stim[26] = 122'h07b0fde0933c0c8e19eb9297186cd0c;
    stim[27] = 122'h16b3746dd60ebe89bed76f16f1145a2;
    stim[28] = 122'h0a9e7a8a7e13d83d41dd7ac55670e6d;
    stim[29] = 122'h290b3a3efcf19d7aab67b6a44987ace;
    stim[30] = 122'h18279d8efa0ed9e90562698d63dd170;
    stim[31] = 122'h2c5be826ee02448b9dd0b633f18db0d;
    stim[32] = 122'h09ec1b3101f988e578dfef203ea6a70;
    stim[33] = 122'h2f8e676b22f4b9c0524e3519a9904f9;
    stim[34] = 122'h10db562f6b9ca8a7466db8f8ac453f0;
    stim[35] = 122'h18877818f0b0d62de2ceb3fdbbef2f7;
    stim[36] = 122'h0c41d798ef9ce344d0785abec7f16f2;
    stim[37] = 122'h1cbb28f60d9ae5056152f5bd8b970b0;
    stim[38] = 122'h33c94470d7a8c51aea5f187a4ac712c;
    stim[39] = 122'h134d46d658d1bb16326a05f99235066;
    stim[40] = 122'h30b524755a1905b475da333cdc28ac7;
    stim[41] = 122'h2a4d38a949c1a476c27b8d3c6e56261;
    stim[42] = 122'h379528aa265e6a69cb6b5f5c082fce8;
    stim[43] = 122'h21472c337a68f3fd01f44b77d01478c;
    stim[44] = 122'h3321dc18228f81143149182131e2183;
    stim[45] = 122'h1cfd134d34165a2653d3ece5990e9bc;
    stim[46] = 122'h2e5a585666a5065cc97f96770ab8145;
    stim[47] = 122'h18495e0159a8a99f47000e1fd1d7d6a;
    stim[48] = 122'h1066647c3b483fa9f361e18c660ab90;
    stim[49] = 122'h3c8bf1781cd8491d65ef8341950ff82;
    stim[50] = 122'h3fb3c2160f572d80eeda2e252a52610;
    stim[51] = 122'h37eeb6b42093bffbba68498140e2dae;
    stim[52] = 122'h3a8af3472c703b3cb2730347c7b9b6d;
    stim[53] = 122'h0ec612e2a7106ac5047c148d6fe2550;
    stim[54] = 122'h29834a4c0b0b078386541bfa1da74c1;
    stim[55] = 122'h1cec99e585e8bea1df7ca2f958c51ea;
    stim[56] = 122'h10b01499a6e24638ac4f66568061933;
    stim[57] = 122'h1434b751548122c77ee889691f14a55;
    stim[58] = 122'h054194dbf7e7eedcfee3b9b46f5ec3e;
    stim[59] = 122'h0fc1f9260430b4096b6609a033e60e9;
    stim[60] = 122'h135e58a00c076efa24c01774bdf1d6d;
    stim[61] = 122'h24aa747123e6b178e4eda4cd30f118c;
    stim[62] = 122'h253aac4032f302abac408e847152c15;
    stim[63] = 122'h27015457eae79b26d85af0fbdae0f30;
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
      expv[0] = 53'h00xxxxxxxxx000;
      expv[1] = 53'h00xxxxxxxxx000;
      expv[2] = 53'h16xxxxxxxxx000;
      expv[3] = 53'h0bxxxxxxxxx000;
      expv[4] = 53'h06xxxxxxxxx000;
      expv[5] = 53'h1cxxxxxxxxx000;
      expv[6] = 53'h06xxxxxxxxx000;
      expv[7] = 53'h15xxxxxxxxx000;
      expv[8] = 53'h0fxxxxxxxxx000;
      expv[9] = 53'h01xxxxxxxxx000;
      expv[10] = 53'h07xxxxxxxxx000;
      expv[11] = 53'h09xxxxxxxxx000;
      expv[12] = 53'h0cxxxxxxxxx000;
      expv[13] = 53'h10xxxxxxxxx000;
      expv[14] = 53'h18xxxxxxxxx000;
      expv[15] = 53'h0exxxxxxxxx000;
      expv[16] = 53'h0exxxxxxxxx000;
      expv[17] = 53'h17xxxxxxxxx000;
      expv[18] = 53'h0dxxxxxxxxx000;
      expv[19] = 53'h11xxxxxxxxx000;
      expv[20] = 53'h05xxxxxxxxx000;
      expv[21] = 53'h0cxxxxxxxxx000;
      expv[22] = 53'h1dxxxxxxxxx000;
      expv[23] = 53'h0exxxxxxxxx000;
      expv[24] = 53'h15xxxxxxxxx000;
      expv[25] = 53'h0bxxxxxxxxx000;
      expv[26] = 53'h01xxxxxxxxx000;
      expv[27] = 53'h1bxxxxxxxxx000;
      expv[28] = 53'h14xxxxxxxxx000;
      expv[29] = 53'h1dxxxxxxxxx000;
      expv[30] = 53'h1dxxxxxxxxx000;
      expv[31] = 53'h0dxxxxxxxxx000;
      expv[32] = 53'h02xxxxxxxxx000;
      expv[33] = 53'h16xxxxxxxxx000;
      expv[34] = 53'h1exxxxxxxxx000;
      expv[35] = 53'h11xxxxxxxxx000;
      expv[36] = 53'h11xxxxxxxxx000;
      expv[37] = 53'h0cxxxxxxxxx000;
      expv[38] = 53'h01xxxxxxxxx000;
      expv[39] = 53'h0cxxxxxxxxx000;
      expv[40] = 53'h0axxxxxxxxx000;
      expv[41] = 53'h12xxxxxxxxx000;
      expv[42] = 53'h14xxxxxxxxx000;
      expv[43] = 53'h06xxxxxxxxx000;
      expv[44] = 53'h10xxxxxxxxx000;
      expv[45] = 53'h1axxxxxxxxx000;
      expv[46] = 53'h0cxxxxxxxxx000;
      expv[47] = 53'h02xxxxxxxxx000;
      expv[48] = 53'h18xxxxxxxxx000;
      expv[49] = 53'h10xxxxxxxxx000;
      expv[50] = 53'h0cxxxxxxxxx000;
      expv[51] = 53'h08xxxxxxxxx000;
      expv[52] = 53'h0exxxxxxxxx000;
      expv[53] = 53'h05xxxxxxxxx000;
      expv[54] = 53'h18xxxxxxxxx000;
      expv[55] = 53'h0bxxxxxxxxx000;
      expv[56] = 53'h13xxxxxxxxx000;
      expv[57] = 53'h02xxxxxxxxx000;
      expv[58] = 53'h17xxxxxxxxx000;
      expv[59] = 53'h0cxxxxxxxxx000;
      expv[60] = 53'h00xxxxxxxxx000;
      expv[61] = 53'h02xxxxxxxxx000;
      expv[62] = 53'h00xxxxxxxxx000;
      expv[63] = 53'h0fxxxxxxxxx000;
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
