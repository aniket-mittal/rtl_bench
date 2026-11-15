// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 121;
  localparam OW = 120;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034226 dut (
    .clk(clk),
    .rst(in_vec[120:120]),
    .WB(in_vec[119:118]),
    .M(in_vec[117:116]),
    .EX(in_vec[115:111]),
    .readData1(in_vec[110:79]),
    .readData2(in_vec[78:47]),
    .S_EXTEND_out_b(in_vec[46:15]),
    .rs(in_vec[14:10]),
    .rt(in_vec[9:5]),
    .rd(in_vec[4:0]),
    .EX_WB(out_vec[119:118]),
    .EX_M(out_vec[117:116]),
    .EX_EX(out_vec[115:111]),
    .EX_SRC_A(out_vec[110:79]),
    .EX_SRC_B(out_vec[78:47]),
    .EX_SE(out_vec[46:15]),
    .EX_rs(out_vec[14:10]),
    .EX_rt(out_vec[9:5]),
    .EX_rd(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 121'h1ea1ce8a70139f7805ef07d82cb421e;
    stim[1] = 121'h1de68c37a8c2b558e67a473022fce7d;
    stim[2] = 121'h0cf385a08606e93e8d58552c2f28b4c;
    stim[3] = 121'h05a8edb0b353cba353b1dd8c9deed4c;
    stim[4] = 121'h0b65a416937c16aa84cd0f26906a02d;
    stim[5] = 121'h056eacae49a13e5ac0688b4ccf1f4c2;
    stim[6] = 121'h01e4568740ca721e13fa9113731ed73;
    stim[7] = 121'h0b212d8145cca511b6279f40b791777;
    stim[8] = 121'h01912594d799364af41da397914ebcb;
    stim[9] = 121'h01d18a9afcd007bd720c4bd365baf45;
    stim[10] = 121'h0e876c03c29a8c2efbf0d8ebd1ae429;
    stim[11] = 121'h039c4d20ef72d35bbc8896879dd290b;
    stim[12] = 121'h05745ab42d90977693dacce2e4df3f4;
    stim[13] = 121'h01af8f294e9cc64455c476c13972233;
    stim[14] = 121'h031e94382c6e5d8620c9d32116001a1;
    stim[15] = 121'h0c4447abf850db799b06b5a2afeaf21;
    stim[16] = 121'h051df697aa711c8fd760ff4540e62b3;
    stim[17] = 121'h00c771c0d09bcfd43f4b2f46e5276eb;
    stim[18] = 121'h0a20d654ad855e956e1c8b8ce10569d;
    stim[19] = 121'h09219b1b4bf52dae2ca0c37bb8d1ed7;
    stim[20] = 121'h0364564f7789873735b21ec395b7142;
    stim[21] = 121'h0898cb3c50268b77e77a7d8053a9aee;
    stim[22] = 121'h04fe3f17e6569346ded1351a181f3c0;
    stim[23] = 121'h176581fbcb286acd02221dc0e9c4b7c;
    stim[24] = 121'h01609321fefa50d2406da08b7510b77;
    stim[25] = 121'h0b0f2634764878d4d105d46a1818f38;
    stim[26] = 121'h0ac4331fa4e4774b44de4f40c0018b3;
    stim[27] = 121'h0ee985aee35c57e0f78aeb1e48ff77b;
    stim[28] = 121'h0bc95c0f29b29f08090e917fd6edf02;
    stim[29] = 121'h08e6b8e0ae8beaf22ccbebfb9ba2772;
    stim[30] = 121'h0096957749634fca381a9f5983bc6c8;
    stim[31] = 121'h079643f0ea4a12e3b2d347016fabb5c;
    stim[32] = 121'h00cfda294af4e605dd296709436dcba;
    stim[33] = 121'h02e0dd0f81e2f06f8bdc1ce4d4e5294;
    stim[34] = 121'h01bbe57e4f3a1279adedc69c2edd323;
    stim[35] = 121'h02983aa6cc32d1ed283ff6ad97d05b2;
    stim[36] = 121'h00c40cd318a7aecb50e5dad5ba190ee;
    stim[37] = 121'h089cfb7bd9abfa52b9f83f471c884cb;
    stim[38] = 121'h02b5f74f6b4b0b889fc9ee47cc3368b;
    stim[39] = 121'h0609bf320ab7c289dd5c0a5649be87b;
    stim[40] = 121'h09ea78b8699b8ef804b79ca367142d9;
    stim[41] = 121'h0a5371789d70e0b5fa5bd4160c986f6;
    stim[42] = 121'h0c04ba6f26f48ffd835efc099d2f09b;
    stim[43] = 121'h0352a535d576dd22b2b3abf2b6c3a45;
    stim[44] = 121'h00e3358049b82eda19bb04f2b295d62;
    stim[45] = 121'h0bd3e05f96657d806b53ac454fb01eb;
    stim[46] = 121'h0290571ccf93804b68b2af53554ecc5;
    stim[47] = 121'h0b607048b0a5c977b3987ee7fc8edd2;
    stim[48] = 121'h085b29cdb71bea0e7fd077d60d4f07e;
    stim[49] = 121'h01c756a7d10646743cbfec11e7e97ee;
    stim[50] = 121'h00eff1dfad1d185fc28ed61e98274ef;
    stim[51] = 121'h0c6221df9e97dad3bfe17b64c368e98;
    stim[52] = 121'h063005a018342d19ebb33f1c547fdd4;
    stim[53] = 121'h08761d2c303dec856cff4de8ac9dda9;
    stim[54] = 121'h06071916449e0f4fdb2faaa6fa61f61;
    stim[55] = 121'h040aa1b9ef4d3cd8fbf42547bf74554;
    stim[56] = 121'h034933b390d556f51f91e61304a36b8;
    stim[57] = 121'h0604f71ff5618c487168f60389859ed;
    stim[58] = 121'h0c6bec1eb185744c04388fcea8ce428;
    stim[59] = 121'h0a8bbd79671a220183bbcda2c0cc116;
    stim[60] = 121'h0223e16e92703e3e9c9a3268eac9781;
    stim[61] = 121'h0cd39db19bdb83687a2d22658f43f8e;
    stim[62] = 121'h06a707eafe4787f790acb4457e02b82;
    stim[63] = 121'h0d12966660ae59dabec247dd817204e;
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
      expv[0] = 120'h000000000000000000000000000000;
      expv[1] = 120'h000000000000000000000000000000;
      expv[2] = 120'h000000000000000000000000000000;
      expv[3] = 120'hcf385a08606e93e8d58552c2f28b4c;
      expv[4] = 120'h5a8edb0b353cba353b1dd8c9deed4c;
      expv[5] = 120'hb65a416937c16aa84cd0f26906a02d;
      expv[6] = 120'h56eacae49a13e5ac0688b4ccf1f4c2;
      expv[7] = 120'h1e4568740ca721e13fa9113731ed73;
      expv[8] = 120'hb212d8145cca511b6279f40b791777;
      expv[9] = 120'h1912594d799364af41da397914ebcb;
      expv[10] = 120'h1d18a9afcd007bd720c4bd365baf45;
      expv[11] = 120'he876c03c29a8c2efbf0d8ebd1ae429;
      expv[12] = 120'h39c4d20ef72d35bbc8896879dd290b;
      expv[13] = 120'h5745ab42d90977693dacce2e4df3f4;
      expv[14] = 120'h1af8f294e9cc64455c476c13972233;
      expv[15] = 120'h31e94382c6e5d8620c9d32116001a1;
      expv[16] = 120'hc4447abf850db799b06b5a2afeaf21;
      expv[17] = 120'h51df697aa711c8fd760ff4540e62b3;
      expv[18] = 120'h0c771c0d09bcfd43f4b2f46e5276eb;
      expv[19] = 120'ha20d654ad855e956e1c8b8ce10569d;
      expv[20] = 120'h9219b1b4bf52dae2ca0c37bb8d1ed7;
      expv[21] = 120'h364564f7789873735b21ec395b7142;
      expv[22] = 120'h898cb3c50268b77e77a7d8053a9aee;
      expv[23] = 120'h000000000000000000000000000000;
      expv[24] = 120'h000000000000000000000000000000;
      expv[25] = 120'h1609321fefa50d2406da08b7510b77;
      expv[26] = 120'hb0f2634764878d4d105d46a1818f38;
      expv[27] = 120'hac4331fa4e4774b44de4f40c0018b3;
      expv[28] = 120'hee985aee35c57e0f78aeb1e48ff77b;
      expv[29] = 120'hbc95c0f29b29f08090e917fd6edf02;
      expv[30] = 120'h8e6b8e0ae8beaf22ccbebfb9ba2772;
      expv[31] = 120'h096957749634fca381a9f5983bc6c8;
      expv[32] = 120'h79643f0ea4a12e3b2d347016fabb5c;
      expv[33] = 120'h0cfda294af4e605dd296709436dcba;
      expv[34] = 120'h2e0dd0f81e2f06f8bdc1ce4d4e5294;
      expv[35] = 120'h1bbe57e4f3a1279adedc69c2edd323;
      expv[36] = 120'h2983aa6cc32d1ed283ff6ad97d05b2;
      expv[37] = 120'h0c40cd318a7aecb50e5dad5ba190ee;
      expv[38] = 120'h89cfb7bd9abfa52b9f83f471c884cb;
      expv[39] = 120'h2b5f74f6b4b0b889fc9ee47cc3368b;
      expv[40] = 120'h609bf320ab7c289dd5c0a5649be87b;
      expv[41] = 120'h9ea78b8699b8ef804b79ca367142d9;
      expv[42] = 120'ha5371789d70e0b5fa5bd4160c986f6;
      expv[43] = 120'hc04ba6f26f48ffd835efc099d2f09b;
      expv[44] = 120'h352a535d576dd22b2b3abf2b6c3a45;
      expv[45] = 120'h0e3358049b82eda19bb04f2b295d62;
      expv[46] = 120'hbd3e05f96657d806b53ac454fb01eb;
      expv[47] = 120'h290571ccf93804b68b2af53554ecc5;
      expv[48] = 120'hb607048b0a5c977b3987ee7fc8edd2;
      expv[49] = 120'h85b29cdb71bea0e7fd077d60d4f07e;
      expv[50] = 120'h1c756a7d10646743cbfec11e7e97ee;
      expv[51] = 120'h0eff1dfad1d185fc28ed61e98274ef;
      expv[52] = 120'hc6221df9e97dad3bfe17b64c368e98;
      expv[53] = 120'h63005a018342d19ebb33f1c547fdd4;
      expv[54] = 120'h8761d2c303dec856cff4de8ac9dda9;
      expv[55] = 120'h6071916449e0f4fdb2faaa6fa61f61;
      expv[56] = 120'h40aa1b9ef4d3cd8fbf42547bf74554;
      expv[57] = 120'h34933b390d556f51f91e61304a36b8;
      expv[58] = 120'h604f71ff5618c487168f60389859ed;
      expv[59] = 120'hc6bec1eb185744c04388fcea8ce428;
      expv[60] = 120'ha8bbd79671a220183bbcda2c0cc116;
      expv[61] = 120'h223e16e92703e3e9c9a3268eac9781;
      expv[62] = 120'hcd39db19bdb83687a2d22658f43f8e;
      expv[63] = 120'h6a707eafe4787f790acb4457e02b82;
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
