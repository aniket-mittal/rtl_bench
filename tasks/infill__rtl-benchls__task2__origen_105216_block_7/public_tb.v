// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_105216 dut (
    .i_clk(clk),
    .i_rst(in_vec[70:70]),
    .adc_left_data(in_vec[69:54]),
    .adc_left_valid(in_vec[53:53]),
    .adc_right_data(in_vec[52:37]),
    .adc_right_valid(in_vec[36:36]),
    .dac_left_ready(in_vec[35:35]),
    .dac_right_ready(in_vec[34:34]),
    .record_audio_ready(in_vec[33:33]),
    .play_audio_data(in_vec[32:1]),
    .play_audio_valid(in_vec[0:0]),
    .adc_left_ready(out_vec[71:71]),
    .adc_right_ready(out_vec[70:70]),
    .dac_left_data(out_vec[69:54]),
    .dac_left_valid(out_vec[53:53]),
    .dac_right_data(out_vec[52:37]),
    .dac_right_valid(out_vec[36:36]),
    .record_audio_data(out_vec[35:4]),
    .record_audio_valid(out_vec[3:3]),
    .play_audio_ready(out_vec[2:2]),
    .debug_state(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h4b1ad53e5f5bb465c0;
    stim[1] = 71'h636ff215c79a1f34c7;
    stim[2] = 71'h0e0738e73181056db6;
    stim[3] = 71'h3ad4038cf0816f9fd6;
    stim[4] = 71'h05564a0e06ae09a3a1;
    stim[5] = 71'h1b7550135838257271;
    stim[6] = 71'h160e6d8a6b2543a6f0;
    stim[7] = 71'h05bf2937cdf781b135;
    stim[8] = 71'h22e5aa93ba01e9f4ea;
    stim[9] = 71'h1ca766c60f759537b1;
    stim[10] = 71'h25a1b9102c687834ea;
    stim[11] = 71'h33a6392ff7cc1efc4a;
    stim[12] = 71'h385fe15626ad3562af;
    stim[13] = 71'h082fffe775daddf36f;
    stim[14] = 71'h236382d64d8fe67945;
    stim[15] = 71'h1c113fdd19b0c4e4b1;
    stim[16] = 71'h05dac01bcd071932ff;
    stim[17] = 71'h386d424069a21017de;
    stim[18] = 71'h101304a2f8e961a36c;
    stim[19] = 71'h1ef49a0badc4bdfcc7;
    stim[20] = 71'h11315344d4c5f5198e;
    stim[21] = 71'h2e98a0aeaae41ac48b;
    stim[22] = 71'h36d976b98c5f1ef53a;
    stim[23] = 71'h2d6e511a4a42246566;
    stim[24] = 71'h57c834e88c32e64708;
    stim[25] = 71'h156c2c4b0b85e2c0ed;
    stim[26] = 71'h0989e2bf7708b9ef33;
    stim[27] = 71'h2fb3365fc87480dcde;
    stim[28] = 71'h10c9f4f9ff0a74b381;
    stim[29] = 71'h189d2c8f4fff475510;
    stim[30] = 71'h000bcfbe95d24d4d7e;
    stim[31] = 71'h3bbb19d87bf246c80e;
    stim[32] = 71'h36301cc1c40a0fb441;
    stim[33] = 71'h2439aff6df11e9fb3b;
    stim[34] = 71'h3d705d138ab855468e;
    stim[35] = 71'h3be635d98f7ab73c1d;
    stim[36] = 71'h37ab3998404513a94d;
    stim[37] = 71'h3d6a973cd69c78e21f;
    stim[38] = 71'h3dd249191b9f44cd97;
    stim[39] = 71'h32f39173bbbfd25f4d;
    stim[40] = 71'h16da7868e1481b191d;
    stim[41] = 71'h12b56be433f3f06ed0;
    stim[42] = 71'h3f4064407ff6e54197;
    stim[43] = 71'h33f037d6372bf92892;
    stim[44] = 71'h255fba6a0eebc40a2e;
    stim[45] = 71'h045c55e31593e57e3b;
    stim[46] = 71'h077729709d16cbf143;
    stim[47] = 71'h273168c6956df82c84;
    stim[48] = 71'h1452ff7ba7874b0c63;
    stim[49] = 71'h1be04b63f6a5801e22;
    stim[50] = 71'h2671be6abf9ba08655;
    stim[51] = 71'h28510608b0ada1a64d;
    stim[52] = 71'h082c575d5f5a941824;
    stim[53] = 71'h2dd21ef8146a890ba8;
    stim[54] = 71'h0e2617943f62656625;
    stim[55] = 71'h133b1dfd25cd606922;
    stim[56] = 71'h05f67741cb14967aa5;
    stim[57] = 71'h33e9678c368816f136;
    stim[58] = 71'h30c988d94ed7075b16;
    stim[59] = 71'h0d1253acf6b9455165;
    stim[60] = 71'h02b3302f8f5c8a54e8;
    stim[61] = 71'h13c4e4fa09e7e4f631;
    stim[62] = 71'h305a600ddc01d1142f;
    stim[63] = 71'h18418123aff0533b5a;
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
      expv[0] = 72'h000000000000000000;
      expv[1] = 72'h000000000000000000;
      expv[2] = 72'h000000000000000000;
      expv[3] = 72'h000000000000000004;
      expv[4] = 72'h000000000000000004;
      expv[5] = 72'h000000000000000004;
      expv[6] = 72'h0704b7271000000001;
      expv[7] = 72'h07049a6f1000000001;
      expv[8] = 72'h07049a6f0000000004;
      expv[9] = 72'h003d3f4eb000000001;
      expv[10] = 72'h003d1f4ea000000004;
      expv[11] = 72'h0d0f234eb000000001;
      expv[12] = 72'h0d0f034ea000000004;
      expv[13] = 72'hcd0f034eae17f00006;
      expv[14] = 72'h4d0f034eae17fff3b6;
      expv[15] = 72'h0d0f034eae17fff3b4;
      expv[16] = 72'h3618ae4b1e17fff3b1;
      expv[17] = 72'h3618932ffe17fff3b1;
      expv[18] = 72'h3618932fee17fff3b1;
      expv[19] = 72'h3618932fee17fff3b4;
      expv[20] = 72'h3618932fee17fff3b4;
      expv[21] = 72'h18beb198fe17fff3b1;
      expv[22] = 72'h18be9198ee17fff3b4;
      expv[23] = 72'h0be3ef53be17fff3b1;
      expv[24] = 72'h000000000000000000;
      expv[25] = 72'h000000000000000000;
      expv[26] = 72'h000000000000000004;
      expv[27] = 72'h21173ef33000000001;
      expv[28] = 72'h0e903ef32000000001;
      expv[29] = 72'h0e901ef32000000004;
      expv[30] = 72'h3fe8f5511000000001;
      expv[31] = 72'h3fe8d5510000000004;
      expv[32] = 72'h3fe8d5510000000004;
      expv[33] = 72'hffe8d5510000000006;
      expv[34] = 72'h3fe8d5510000000004;
      expv[35] = 72'h170ab468f000000001;
      expv[36] = 72'h170a9468e000000004;
      expv[37] = 72'h08a27a94d000000001;
      expv[38] = 72'h138f2e21f000000001;
      expv[39] = 72'h33e8ae21e000000001;
      expv[40] = 72'h33e88e21e000000001;
      expv[41] = 72'h33e88e21e000000004;
      expv[42] = 72'h3e7e26ed1000000001;
      expv[43] = 72'h3e7e06ed0000000004;
      expv[44] = 72'h257f32893000000001;
      expv[45] = 72'h257f12892000000004;
      expv[46] = 72'he57f128920000af186;
      expv[47] = 72'h257f128920000af184;
      expv[48] = 72'h2dbf22c850000af181;
      expv[49] = 72'h2dbf02c840000af184;
      expv[50] = 72'h14b021e230000af181;
      expv[51] = 72'h14b001e220000af184;
      expv[52] = 72'h15b43a64d0000af181;
      expv[53] = 72'h2b52a18250000af181;
      expv[54] = 72'h2b52818240000af184;
      expv[55] = 72'h2b52818240000af184;
      expv[56] = 72'h39ac269230000af181;
      expv[57] = 72'h39ac069220000af184;
      expv[58] = 72'h1102ef1370000af181;
      expv[59] = 72'h1102cf1360000af184;
      expv[60] = 72'hd102cf13600009d676;
      expv[61] = 72'h9102cf1360acc9d676;
      expv[62] = 72'h1102cf1360acc9d67e;
      expv[63] = 72'h1102cf1360acc9d674;
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
