// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00599 dut (
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
    .jdo(out_vec[49:12]),
    .jrst_n(out_vec[11:11]),
    .st_ready_test_idle(out_vec[10:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h2ca9fb9c4365453606343640e54cf1a;
    stim[1] = 122'h31506c813aead13a483041238ae39b0;
    stim[2] = 122'h3178c1dd60b273d152e4bfe695749da;
    stim[3] = 122'h16144983d5c4f41453e9b9a949e799c;
    stim[4] = 122'h049be388c6522dbd4855ca2b5272521;
    stim[5] = 122'h1e9dbc3cd97b75c2a4fdeb0bc35fc9e;
    stim[6] = 122'h2876d3b1cc65e3af56fa2102cb76f42;
    stim[7] = 122'h0bd2723ffdfa35e69cff62de181dc9e;
    stim[8] = 122'h2352143f99fdcaf193de6e97a62c592;
    stim[9] = 122'h0ac3429002eaa71fe55426fb75eb463;
    stim[10] = 122'h223a8dcedf5dcf340fe84be52d86b24;
    stim[11] = 122'h30aed21c829a9dbd116e0cef937c226;
    stim[12] = 122'h31aa65d3de041649d6d4ad4de1b1611;
    stim[13] = 122'h238a472863545d58ce782b5f28b9e77;
    stim[14] = 122'h38e0b293e6643b67a9fb955e842c3a5;
    stim[15] = 122'h2dfee5ff83e2d861fcd75825b78d90c;
    stim[16] = 122'h28e62498a3763dc51aec8b2c8217d92;
    stim[17] = 122'h30612bfb40c5a7c8d3df42d9979403f;
    stim[18] = 122'h0df0abeda09bef24be754532c66712e;
    stim[19] = 122'h198ebaa46ba78d0af7dd2af65736379;
    stim[20] = 122'h345a5ffcec85e824405217956cf735f;
    stim[21] = 122'h37e6da3702145dde5bfc1d44d383a16;
    stim[22] = 122'h154133458eeca134934a1883655af19;
    stim[23] = 122'h1a4aa63b2085b0d6345970233ba5928;
    stim[24] = 122'h344d259effa684493377815f477a567;
    stim[25] = 122'h35f2951c7b635228036f0b1fd7f359b;
    stim[26] = 122'h0fcdf386fcdfba5a48e572d4781b1ab;
    stim[27] = 122'h34fb2d85815c3490cd65a32b48b6566;
    stim[28] = 122'h14b5e5b1f3d87d3dae788de7d0dc79e;
    stim[29] = 122'h0637ed59833c5f0e87dadcefe654821;
    stim[30] = 122'h3fb9ecac1a9e80239476f7158f58cd4;
    stim[31] = 122'h05152bf2db28b88333fd2af92b138ae;
    stim[32] = 122'h2588c1282b1b5fe734d4c9a9144e1e0;
    stim[33] = 122'h3bb904d5786715b9d0dfd8b5686720e;
    stim[34] = 122'h1c662927662caa786dcedb4c51a296c;
    stim[35] = 122'h1da62f55e63f347134f06136726895b;
    stim[36] = 122'h255bfb484b55436f845418c1cf55668;
    stim[37] = 122'h292557d330904dc59848d0c0835009e;
    stim[38] = 122'h067feffd003ef73242e9b9ae1b0de19;
    stim[39] = 122'h155a3a65abc772111be1d677fd56a8c;
    stim[40] = 122'h02b2826f099036650b7891ea7ee0a08;
    stim[41] = 122'h2bf07043a3dcf727d6ce0d1c8a40e04;
    stim[42] = 122'h14420464e93bfc7c0364fa25ef53034;
    stim[43] = 122'h05a37fd1e59c109f8bdc6d985585c96;
    stim[44] = 122'h2ebb4b97ec7a3d99f2792da96aef01f;
    stim[45] = 122'h3b3d6f9155d71fab9f52feca0ca88b3;
    stim[46] = 122'h15775e6e6136c2911256b625151d555;
    stim[47] = 122'h1049f76467bc74cedd796d410658b0f;
    stim[48] = 122'h238e2392e817bde95f59b9affde1aff;
    stim[49] = 122'h3374135fc82fd08735f3350e9e5cf39;
    stim[50] = 122'h1b5cad3555322c159dde6ad70e88a10;
    stim[51] = 122'h0a1cd0031358b9c7ebfb207a0f35c0e;
    stim[52] = 122'h0f007a938a3a1175846b7a959b184b8;
    stim[53] = 122'h124041db43c43384cfecc496cb16cda;
    stim[54] = 122'h0a89801a5aa834fad4405be2ef21f9a;
    stim[55] = 122'h16cecf6e74304bf083d24c642978cbd;
    stim[56] = 122'h2bab3375ea131a2a5a4ab88ee3de1bd;
    stim[57] = 122'h263361195bcc4b899dd2d2c4b272a45;
    stim[58] = 122'h1510f47e967118a4bdc67e45ce9c1e7;
    stim[59] = 122'h0bbaeb9fe93280296450034377a5c41;
    stim[60] = 122'h267881d9ee7b6d748fe9e5ab4ebc77c;
    stim[61] = 122'h174aa87d5651e3f4e0afef2349ce140;
    stim[62] = 122'h263ac03622a7fa56db605899bd38f83;
    stim[63] = 122'h05de659e75c92c7723dffce6649fcb8;
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
      expv[0] = 50'hxxxxxxxxxx000;
      expv[1] = 50'hxxxxxxxxxx0bd;
      expv[2] = 50'hxxxxxxxxxx400;
      expv[3] = 50'hxxxxxxxxxx000;
      expv[4] = 50'hxxxxxxxxxx8ad;
      expv[5] = 50'hxxxxxxxxxxe76;
      expv[6] = 50'hxxxxxxxxxx400;
      expv[7] = 50'hxxxxxxxxxxdf8;
      expv[8] = 50'hxxxxxxxxxx000;
      expv[9] = 50'hxxxxxxxxxxa66;
      expv[10] = 50'hxxxxxxxxxx000;
      expv[11] = 50'hxxxxxxxxxx90b;
      expv[12] = 50'hxxxxxxxxxx400;
      expv[13] = 50'hxxxxxxxxxx000;
      expv[14] = 50'hxxxxxxxxxxaa5;
      expv[15] = 50'hxxxxxxxxxxff0;
      expv[16] = 50'hxxxxxxxxxx400;
      expv[17] = 50'hxxxxxxxxxx000;
      expv[18] = 50'hxxxxxxxxxx000;
      expv[19] = 50'hxxxxxxxxxx000;
      expv[20] = 50'hxxxxxxxxxx82f;
      expv[21] = 50'hxxxxxxxxxx000;
      expv[22] = 50'hxxxxxxxxxx000;
      expv[23] = 50'hxxxxxxxxxxb72;
      expv[24] = 50'hxxxxxxxxxx000;
      expv[25] = 50'hxxxxxxxxxx000;
      expv[26] = 50'hxxxxxxxxxxc8d;
      expv[27] = 50'hxxxxxxxxxx8cc;
      expv[28] = 50'hxxxxxxxxxx000;
      expv[29] = 50'hxxxxxxxxxx000;
      expv[30] = 50'hxxxxxxxxxx97a;
      expv[31] = 50'hxxxxxxxxxx000;
      expv[32] = 50'hxxxxxxxxxxf62;
      expv[33] = 50'hxxxxxxxxxxd2b;
      expv[34] = 50'hxxxxxxxxxxad4;
      expv[35] = 50'hxxxxxxxxxxf72;
      expv[36] = 50'hxxxxxxxxxx86e;
      expv[37] = 50'hxxxxxxxxxx989;
      expv[38] = 50'hxxxxxxxxxx400;
      expv[39] = 50'hxxxxxxxxxx000;
      expv[40] = 50'hxxxxxxxxxx000;
      expv[41] = 50'hxxxxxxxxxx400;
      expv[42] = 50'hxxxxxxxxxx000;
      expv[43] = 50'hxxxxxxxxxx000;
      expv[44] = 50'hxxxxxxxxxx000;
      expv[45] = 50'hxxxxxxxxxx000;
      expv[46] = 50'hxxxxxxxxxx000;
      expv[47] = 50'hxxxxxxxxxx9f8;
      expv[48] = 50'hxxxxxxxxxx000;
      expv[49] = 50'hxxxxxxxxxxb72;
      expv[50] = 50'hxxxxxxxxxx9f8;
      expv[51] = 50'hxxxxxxxxxx000;
      expv[52] = 50'hxxxxxxxxxx84e;
      expv[53] = 50'hxxxxxxxxxx000;
      expv[54] = 50'hxxxxxxxxxx95a;
      expv[55] = 50'hxxxxxxxxxx000;
      expv[56] = 50'hxxxxxxxxxx000;
      expv[57] = 50'hxxxxxxxxxx9f8;
      expv[58] = 50'hxxxxxxxxxxbc0;
      expv[59] = 50'hxxxxxxxxxxa76;
      expv[60] = 50'hxxxxxxxxxx000;
      expv[61] = 50'hxxxxxxxxxx607;
      expv[62] = 50'hxxxxxxxxxx000;
      expv[63] = 50'hxxxxxxxxxx000;
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
