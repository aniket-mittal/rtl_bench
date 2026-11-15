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

  rtlpp_08494 dut (
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
    stim[0] = 122'h36638cc32f254f41d1a0c3aef836375;
    stim[1] = 122'h2e331f906c05d8b7f289450da684e9a;
    stim[2] = 122'h129fb7a40990d6e8b7e69401bcc4204;
    stim[3] = 122'h0d36a3aba139e4646b4372e8aa4fb5b;
    stim[4] = 122'h0e79313a9c88dc26e2e3724123681af;
    stim[5] = 122'h3dc0e82e71988aa4e9d1821e4d6c16f;
    stim[6] = 122'h3d72279ce5b8277aec42877315f5add;
    stim[7] = 122'h2270617170391ad5686a560060d9e96;
    stim[8] = 122'h1ab652a5875218777166d911182f325;
    stim[9] = 122'h04651c56ecbbf48823e1146cd2dca0b;
    stim[10] = 122'h154767b3fffe44c759737b347e78b34;
    stim[11] = 122'h1f3754add21efae10be10b7195b584d;
    stim[12] = 122'h3cd102bb099077263fdf554351523e9;
    stim[13] = 122'h071befeadca86affb57c910d533f5e2;
    stim[14] = 122'h352063da72aa92ef4675938030d3425;
    stim[15] = 122'h3804911912c262ebe57cce1b6f50c3d;
    stim[16] = 122'h36da0f69bc449ff877640c80d4b5dc1;
    stim[17] = 122'h09144f0d88d6b56e7fc341541ea9334;
    stim[18] = 122'h0fc77768d63b1243b3cc4836eb79392;
    stim[19] = 122'h1d094f5e03ff17a8befcfc19374e27e;
    stim[20] = 122'h1ea1ee59f8a9149aefce0806897bfaf;
    stim[21] = 122'h1255057a386e343c1fd0f962b835108;
    stim[22] = 122'h386c53098a6e30bdbfc2b5c75781f29;
    stim[23] = 122'h2b29510dd10351e275fd1919bb5994f;
    stim[24] = 122'h0281307b4c687b8edfe36d0d8e31833;
    stim[25] = 122'h21d8cda9fbf530af75f86a8a44ae3df;
    stim[26] = 122'h192b453c01f3533dd9e945294627c20;
    stim[27] = 122'h2a740734063ec397b47462b371ca4f2;
    stim[28] = 122'h2c5829091687f2364e6bbc139d2386d;
    stim[29] = 122'h0770e8686be8ba31d16ca4eece46e35;
    stim[30] = 122'h26eff3c288a732f6fb58631c991a54f;
    stim[31] = 122'h017d610b3cea21c4ebe1191b82d68d2;
    stim[32] = 122'h08af4eb12a29c60181caa03a811d683;
    stim[33] = 122'h2c0548e162146a82bdfc0c95c4c8d28;
    stim[34] = 122'h14ae142838e58081d5e3da46b1573d2;
    stim[35] = 122'h27f8f3b1deeabd072afecaafac77f93;
    stim[36] = 122'h212dabebc9f3f98d6776ce1716a81a1;
    stim[37] = 122'h2ce28b87f5f0b5a0a3d9f745b236940;
    stim[38] = 122'h34ba8ea6b687ded02cd49d13115b8b1;
    stim[39] = 122'h0c5c3540ca2e1dddba407f591db7fd8;
    stim[40] = 122'h06e7fffbfa85fe64337df5f211c3e59;
    stim[41] = 122'h1d71e57c17ae3e8474f6f5c3582098c;
    stim[42] = 122'h36e6d8fe02710f4ae561e652c797beb;
    stim[43] = 122'h29e5d75e49aa0fd9ed49cd3c48bf6f9;
    stim[44] = 122'h194bd556d4a109ed5257565c5251526;
    stim[45] = 122'h2bd6afc97d79c5707a78b2da74f98c2;
    stim[46] = 122'h2360382ba59356364ad9866ee3a0ef6;
    stim[47] = 122'h12466561a2f94ad34ac6f23e3d5b635;
    stim[48] = 122'h0912123f9ede1502c1f1cb18da9162f;
    stim[49] = 122'h0d21b6d27f666cdfd65cdba94b25333;
    stim[50] = 122'h1e7dfdc06fed92907575b863d39edbf;
    stim[51] = 122'h33869f2fd77b6f46f942757bc33ba8e;
    stim[52] = 122'h3b784535fcbf5508d9dcaf63d4eff66;
    stim[53] = 122'h3f076aabf6d42dbaa464b1fec3125e9;
    stim[54] = 122'h32dec30a44d36ed2dbf65b708320f28;
    stim[55] = 122'h3303e38d7e1fa21faf7e42c23be5295;
    stim[56] = 122'h0b44a215cdc790470bc6afe2be8a8b9;
    stim[57] = 122'h17f541236d56a039abdd7a51bdc7ef6;
    stim[58] = 122'h2d649f37876776d4d6de7d8014373be;
    stim[59] = 122'h3b34168102a9cb50854c5cbd33fd789;
    stim[60] = 122'h12ca84a9eb025023c0dfb066b5f8353;
    stim[61] = 122'h2c982f5c7770ef2cd963f18f1616688;
    stim[62] = 122'h18e5f9f863e9fbe1aa43d585a33ad79;
    stim[63] = 122'h3cdc1662092f1642ea6943515d7deed;
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
      expv[0] = 53'h1d77c1b1baa000;
      expv[1] = 53'h086d34274d6000;
      expv[2] = 53'h000de621022000;
      expv[3] = 53'h1745527dada000;
      expv[4] = 53'h12091b40d7a000;
      expv[5] = 53'h10f26b60b7a000;
      expv[6] = 53'h1b98afad6ea000;
      expv[7] = 53'h100306cf4b2000;
      expv[8] = 53'h0888c17992a000;
      expv[9] = 53'h036696e505a000;
      expv[10] = 53'h19a3f3c59a2000;
      expv[11] = 53'h1b8cadac26a000;
      expv[12] = 53'h0a1a8a91f4a000;
      expv[13] = 53'h086a99faf12000;
      expv[14] = 53'h1c01869a12a000;
      expv[15] = 53'h10db7a861ea000;
      expv[16] = 53'h0406a5aee0a000;
      expv[17] = 53'h0aa0f5499a2000;
      expv[18] = 53'h01b75bc9c92000;
      expv[19] = 53'h00c9ba713f2000;
      expv[20] = 53'h00344bdfd7a000;
      expv[21] = 53'h0b15c1a8842000;
      expv[22] = 53'h0e3abc0f94a000;
      expv[23] = 53'h08cddacca7a000;
      expv[24] = 53'h086c718c19a000;
      expv[25] = 53'h14522571efa000;
      expv[26] = 53'h094a313e102000;
      expv[27] = 53'h159b8e52792000;
      expv[28] = 53'h009ce91c36a000;
      expv[29] = 53'h077672371aa000;
      expv[30] = 53'h18e4c8d2a7a000;
      expv[31] = 53'h08dc16b4692000;
      expv[32] = 53'h01d408eb41a000;
      expv[33] = 53'h04ae2646942000;
      expv[34] = 53'h12358ab9e92000;
      expv[35] = 53'h157d63bfc9a000;
      expv[36] = 53'h10b8b540d0a000;
      expv[37] = 53'h1a2d91b4a02000;
      expv[38] = 53'h08988adc58a000;
      expv[39] = 53'h1ac8edbfec2000;
      expv[40] = 53'h0f908e1f2ca000;
      expv[41] = 53'h0e1ac104c62000;
      expv[42] = 53'h12963cbdf5a000;
      expv[43] = 53'h09e245fb7ca000;
      expv[44] = 53'h12e2928a932000;
      expv[45] = 53'h16d3a7cc612000;
      expv[46] = 53'h13771d077b2000;
      expv[47] = 53'h11f1eadb1aa000;
      expv[48] = 53'h18c6d48b17a000;
      expv[49] = 53'h1d4a592999a000;
      expv[50] = 53'h031e9cf6dfa000;
      expv[51] = 53'h0bde19dd472000;
      expv[52] = 53'h1b1ea77fb32000;
      expv[53] = 53'h0ff61892f4a000;
      expv[54] = 53'h1b841907942000;
      expv[55] = 53'h1611df294aa000;
      expv[56] = 53'h1f15f4545ca000;
      expv[57] = 53'h128dee3f7b2000;
      expv[58] = 53'h0c00a1b9df2000;
      expv[59] = 53'h05e99febc4a000;
      expv[60] = 53'h0335afc1a9a000;
      expv[61] = 53'h0c78b0b3442000;
      expv[62] = 53'h0c2d19d6bca000;
      expv[63] = 53'h1a8aebef76a000;
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
