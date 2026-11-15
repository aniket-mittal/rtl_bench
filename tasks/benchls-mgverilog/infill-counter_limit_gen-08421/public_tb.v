// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08421 dut (
    .clock(clk),
    .enable(in_vec[98:98]),
    .resetn(in_vec[97:97]),
    .i_init(in_vec[96:65]),
    .i_limit(in_vec[64:33]),
    .i_increment(in_vec[32:1]),
    .i_counter_reset(in_vec[0:0]),
    .o_size(out_vec[66:35]),
    .o_resultvalid(out_vec[34:34]),
    .o_result(out_vec[33:2]),
    .o_full(out_vec[1:1]),
    .o_stall(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h46dc2146e667d7037c19e0307;
    stim[1] = 99'h5ae22ef85e987740c41122503;
    stim[2] = 99'h34da6bb8da08569614116254b;
    stim[3] = 99'h2b3f38f88cfaca1d176ef16bb;
    stim[4] = 99'h3d32bd7a0eb29565bda7bd493;
    stim[5] = 99'h780f15757b5b2fe66e9412b82;
    stim[6] = 99'h2b323df9312d54cc448b36536;
    stim[7] = 99'h2caf99e175a53ea3b18b720dd;
    stim[8] = 99'h7be48c08f26be44f5ae60a328;
    stim[9] = 99'h306c6389a9b25c38abb2001b5;
    stim[10] = 99'h2b40cb443c2fa5b6d369622ec;
    stim[11] = 99'h3fa1871a30dcdb70a1eee68ef;
    stim[12] = 99'h3773d000a9064840c97a44789;
    stim[13] = 99'h78da5289013d23b882d4874c6;
    stim[14] = 99'h7e33dd064d73e0d7b01f95ca0;
    stim[15] = 99'h357034423805184e5cc22fe10;
    stim[16] = 99'h3163a836e8d21faef6c1bffcf;
    stim[17] = 99'h1ac552ea7b14c361ca2253598;
    stim[18] = 99'h6d01caa678339f78c7323c957;
    stim[19] = 99'h232d8dcfcd14c1481bc3f6ea0;
    stim[20] = 99'h6be593340eb6a2b44f1ec3bbe;
    stim[21] = 99'h6c17648f32b1e0a864ae616a6;
    stim[22] = 99'h290fc31a98e23eb698379bede;
    stim[23] = 99'h16b1299e9fa2090d2aa4ebb29;
    stim[24] = 99'h23fa4b627e940572b65877dff;
    stim[25] = 99'h256486bade9431bc998d88f5c;
    stim[26] = 99'h68047eacc9c0fbd350f9dbca1;
    stim[27] = 99'h62bba324239f1c00f87362d08;
    stim[28] = 99'h65e10e8c71b3fb78b5a87152e;
    stim[29] = 99'h737eb7453fd3cc574bb7fc27f;
    stim[30] = 99'h23630443bda0f998f2ea5e4cf;
    stim[31] = 99'h780579189da4b585f92c2ce22;
    stim[32] = 99'h208672a5dd41bba09e0dfd170;
    stim[33] = 99'h7ada92825cfa8ed250eb39506;
    stim[34] = 99'h7f778554cbd7531579ef669cc;
    stim[35] = 99'h3821b6c1b404b00c37e3f40e9;
    stim[36] = 99'h66553e423a81e40f5c05bb1db;
    stim[37] = 99'h665ba9570a2926618099e67f0;
    stim[38] = 99'h2c2b5043230900c794559a49f;
    stim[39] = 99'h641a7bd9dd9bdc1f2a9b125f0;
    stim[40] = 99'h74e8baeb1c06218edf98603fb;
    stim[41] = 99'h2e5322d36794b4feaaa2e096c;
    stim[42] = 99'h3a53c4a0bb1ee765eff006144;
    stim[43] = 99'h70054c6ebdf1570c271d30b96;
    stim[44] = 99'h3a0788eae528b952e50207b27;
    stim[45] = 99'h76cc4dce9e67449d78271672b;
    stim[46] = 99'h34d1c068d71b1fcece1f0a378;
    stim[47] = 99'h614248dcb8e5d98cc1e0c722e;
    stim[48] = 99'h62b10d70cf399f2aaf798a689;
    stim[49] = 99'h2877e629dbb5d6adbb35c9313;
    stim[50] = 99'h7bd71cf1c34040c892cdf5b36;
    stim[51] = 99'h7fd7d9da23f5dee84d90b16ec;
    stim[52] = 99'h74f94d4d9ddec186c1573e977;
    stim[53] = 99'h644f7719d083712146bcd48eb;
    stim[54] = 99'h66ededc650dadc8f84ee4b655;
    stim[55] = 99'h6b9980d7af6b6f07e89eb3cad;
    stim[56] = 99'h7884664448ce94f20c7c0b33e;
    stim[57] = 99'h3b6c58964e17e3818d137771f;
    stim[58] = 99'h3ce7545861d08a21704875cab;
    stim[59] = 99'h672182e5250eb2e1d6b235279;
    stim[60] = 99'h294719152ca87d993a8029786;
    stim[61] = 99'h710fbf5ba9b280f7aa6c9d5bc;
    stim[62] = 99'h24ee2cc425321a84c593c574c;
    stim[63] = 99'h63a06f095c1c92151d22d6366;
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
      expv[0] = 67'h00000000000000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h50458952e9b4d7718;
      expv[4] = 67'h5dbbc5aed67e71f10;
      expv[5] = 67'h769ef524fa657af40;
      expv[6] = 67'h30ef40056b6da57d0;
      expv[7] = 67'h30ef40052b6da57d0;
      expv[8] = 67'h462dc837595f33c2c;
      expv[9] = 67'h31c5f1015adffc2d4;
      expv[10] = 67'h2ec8006d60d8c7134;
      expv[11] = 67'h2ec8006d20d8c7134;
      expv[12] = 67'h07bb9a3bff430e344;
      expv[13] = 67'h25e911e26ee7a0014;
      expv[14] = 67'h313b2f13c4a92e030;
      expv[15] = 67'h71b9863bd50551964;
      expv[16] = 67'h71b9863b950551964;
      expv[17] = 67'h00000000000000000;
      expv[18] = 67'h00000000000000000;
      expv[19] = 67'h1cc8f255da03954cc;
      expv[20] = 67'h1cc8f2559a03954cc;
      expv[21] = 67'h59440145662f9f92c;
      expv[22] = 67'h6bfd86eec4d0c9c0c;
      expv[23] = 67'h00000000000000000;
      expv[24] = 67'h00000000000000000;
      expv[25] = 67'h5961df7fc7f496c4c;
      expv[26] = 67'h5961df7f87f496c4c;
      expv[27] = 67'h43e76f285008fd598;
      expv[28] = 67'h25b4fa6a676afddc4;
      expv[29] = 67'h7c56bfb5de9c9a4dc;
      expv[30] = 67'h2edff09fe6fd6e8a4;
      expv[31] = 67'h4ba97933c6c608874;
      expv[32] = 67'h305a2cbc55dfaecac;
      expv[33] = 67'h305a2cbc15dfaecac;
      expv[34] = 67'h740711fdcde23b628;
      expv[35] = 67'h5bc4ac70f8f293a84;
      expv[36] = 67'h5f8fd03a70436d834;
      expv[37] = 67'h7016ec76ccaa7c844;
      expv[38] = 67'h727e8672c4c2c8e94;
      expv[39] = 67'h51566927d856a0864;
      expv[40] = 67'h7bc2b2a3f0e02c474;
      expv[41] = 67'h7e6180fee9d175d60;
      expv[42] = 67'h7e6180fea9d175d60;
      expv[43] = 67'h7e6180fea9d175d60;
      expv[44] = 67'h1ad643e45f3b595c8;
      expv[45] = 67'h14081ec9f40f11d5c;
      expv[46] = 67'h609c59caed989b9d0;
      expv[47] = 67'h609c59caad989b9d0;
      expv[48] = 67'h681f765672d2be9e8;
      expv[49] = 67'h3de629a245621ae18;
      expv[50] = 67'h6cd724c4d0efcc538;
      expv[51] = 67'h380efb926e19cc45c;
      expv[52] = 67'h6e51c14d5bb7317d4;
      expv[53] = 67'h055cfa5de9f29a9b0;
      expv[54] = 67'h1af3523ac89eee338;
      expv[55] = 67'h13b92d954ddbdb8c8;
      expv[56] = 67'h227acf2b573301af4;
      expv[57] = 67'h546afbfac246341e0;
      expv[58] = 67'h344dddc7f6d8b12c8;
      expv[59] = 67'h4121d72af9cea8b0c;
      expv[60] = 67'h5ac8d49e4e4305ca4;
      expv[61] = 67'h5ac8d49e0e4305ca4;
      expv[62] = 67'h047b4a0d4f83e9064;
      expv[63] = 67'h047b4a0d0f83e9064;
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
