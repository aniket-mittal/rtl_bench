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

  rtlpp_11279 dut (
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
    stim[0] = 122'h182f5cbdc783a021f09e8539fea840a;
    stim[1] = 122'h1a4e3ddfd0d9581d219d2b57ad8dfee;
    stim[2] = 122'h24c79163350640eb7fdf058fa9f215b;
    stim[3] = 122'h2ab36d4389abba2c0057c91fba77445;
    stim[4] = 122'h26b1e4f0c35fceaf0ee631cbbf2c99d;
    stim[5] = 122'h13a9187f4acb3d7ad5514b2c24cb275;
    stim[6] = 122'h30f116cfaaa701c623593142850da48;
    stim[7] = 122'h3120024fd37ed367adddf96af287490;
    stim[8] = 122'h25f1543add315482becaf12f4dc719c;
    stim[9] = 122'h169f75f6b445d6fd824a2b7910447c5;
    stim[10] = 122'h133cff0d6686e03c01c2ca6ce10ae7a;
    stim[11] = 122'h36abaa58cb2debba40614228076a56f;
    stim[12] = 122'h26768689f11e2f7301f5e1eb34a5d8e;
    stim[13] = 122'h1b557f6a2b99de24bbe81689dc64086;
    stim[14] = 122'h3549127a7fec2ce852c3f66cb09bb61;
    stim[15] = 122'h1c63a26430ec50f861f96f2cf7fb78d;
    stim[16] = 122'h134953c890e91e3f994d67821ad762e;
    stim[17] = 122'h2b26fd64cde3dd53c7d12b26d323816;
    stim[18] = 122'h1c4f08351e9061ddb14ebbcf25993bb;
    stim[19] = 122'h3e71eb2da318da50c8e73a498ccd1ad;
    stim[20] = 122'h1dbe4b695a3cb74197cd9cb6da53f2c;
    stim[21] = 122'h1f35f5cdc849580b73f375456dd635a;
    stim[22] = 122'h20fffa921bca079db7cf08e786144ed;
    stim[23] = 122'h03e1b82564b36d28c763d34186203f2;
    stim[24] = 122'h018b1532e6f0eb6db368092fcf3c42a;
    stim[25] = 122'h237f08b56e7a8a115860b674c1cd6a2;
    stim[26] = 122'h233ac47698e9b435f478385a192088b;
    stim[27] = 122'h0056a7a09f754e52e55ce4b14387786;
    stim[28] = 122'h16c5151f5420991eb170d5fd9c94bf1;
    stim[29] = 122'h3da4a4aa5b52a95ed849611e63bd87e;
    stim[30] = 122'h14f3ca47f38f9503b1f9ab810a410e9;
    stim[31] = 122'h3cf6c0452243de581c46c0bb95c16d6;
    stim[32] = 122'h3562471dcc71ca1abd475fb024fcf48;
    stim[33] = 122'h2c667ea7a12f5f43dcd4f8d949dd7f0;
    stim[34] = 122'h313fff32b38f4e012ed636ce560e255;
    stim[35] = 122'h3eff44152697803f617cc2adb87220a;
    stim[36] = 122'h2eebda3f8a7e4eebd9efac2eb6d9e92;
    stim[37] = 122'h0dbc96f2311a44149bc79ff297e8332;
    stim[38] = 122'h1448ffbf4a30fc864bfa2059011e8c7;
    stim[39] = 122'h031c12d4f5fdd83c2271cc5a895e385;
    stim[40] = 122'h04ba77179e1db02522cb7fde77617c2;
    stim[41] = 122'h1e9d5bf49dee70e87044a6097eec07e;
    stim[42] = 122'h3a792b12f8c83b61bbc1e45404b87e4;
    stim[43] = 122'h1fae730555c979a9d36d3e9cd221460;
    stim[44] = 122'h39fd8c3e36af73e409535db837ccba6;
    stim[45] = 122'h29c8ce87694a12b6a566507605a3169;
    stim[46] = 122'h0a1aa16af1dd3381e4f7e3f2815d120;
    stim[47] = 122'h3a79b910224a9442ede295e830ae9a9;
    stim[48] = 122'h1750cc8d3ae710282872cc1cad93645;
    stim[49] = 122'h13966c9396d334aac8f11592629e906;
    stim[50] = 122'h0f8b3aaa306665e3b7d6b1b55d37063;
    stim[51] = 122'h157d1ea38e61580ead62b04133def0f;
    stim[52] = 122'h039198f34212a858497dbc03f0c07bf;
    stim[53] = 122'h377bcfe7c3c55822604034a104b013b;
    stim[54] = 122'h3f1a59b699f5ef44bee4c7a3048a992;
    stim[55] = 122'h3845304a90cf154482467ebf575a7ed;
    stim[56] = 122'h1592a9af92c656fbc1caeed1de9df4e;
    stim[57] = 122'h0837ad33b30f7ee344cd1113f0e997c;
    stim[58] = 122'h27e19039eb66e05138e749ee3311734;
    stim[59] = 122'h2722c614816137432c661eaa66162e5;
    stim[60] = 122'h1f38a3f0fd2e2d5dc2e011e66a7a915;
    stim[61] = 122'h0b12b40c6c43da2a43f6eb40157d03a;
    stim[62] = 122'h07d79a6cee053ce969fe4ec1bb19d98;
    stim[63] = 122'h0ee8cbfb584d6d0bc36766d04694a17;
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
      expv[0] = 50'h371e0e8087400;
      expv[1] = 50'h3f43656074400;
      expv[2] = 50'h0cd41903adff0;
      expv[3] = 50'h0e26aee8b0c00;
      expv[4] = 50'h030d7f3abc8cc;
      expv[5] = 50'h3d2b2cf5ebc00;
      expv[6] = 50'h3eaa9c0718e37;
      expv[7] = 50'h3f4dfb4d9ec00;
      expv[8] = 50'h2b74c5520afc0;
      expv[9] = 50'h1ad1175bf6c0f;
      expv[10] = 50'h359a1b80f0c00;
      expv[11] = 50'h232cb7aee9800;
      expv[12] = 50'h27c478bdcc800;
      expv[13] = 50'h28ae677892ba1;
      expv[14] = 50'h29ffb0b3a1d0b;
      expv[15] = 50'h10c3b143e1800;
      expv[16] = 50'h2243a478fec00;
      expv[17] = 50'h13378f754fc7e;
      expv[18] = 50'h147a418776c00;
      expv[19] = 50'h368c636943800;
      expv[20] = 50'h2568f2dd06d6a;
      expv[21] = 50'h372125602db33;
      expv[22] = 50'h086f281e76f62;
      expv[23] = 50'h1592cdb4a386e;
      expv[24] = 50'h0b9bc3adb6b23;
      expv[25] = 50'h15b9ea2845800;
      expv[26] = 50'h1a63a6d0d7800;
      expv[27] = 50'h027dd5394bc00;
      expv[28] = 50'h3d5082647a800;
      expv[29] = 50'h296d4aa57bc00;
      expv[30] = 50'h1fce3e540e800;
      expv[31] = 50'h14890f7960c00;
      expv[32] = 50'h3731c7286ac00;
      expv[33] = 50'h1e84bd7d0fc00;
      expv[34] = 50'h0ace3d3804ed4;
      expv[35] = 50'h149a5e00fd800;
      expv[36] = 50'h3e29f93baf800;
      expv[37] = 50'h08c4691052da9;
      expv[38] = 50'h3d28c3f2198bd;
      expv[39] = 50'h13d7f760f0a17;
      expv[40] = 50'h1e7876c094e07;
      expv[41] = 50'h1277b9c3a1c00;
      expv[42] = 50'h0be320ed86fa1;
      expv[43] = 50'h155725e6a792b;
      expv[44] = 50'h38dabdcf90c00;
      expv[45] = 50'h1da5284ada800;
      expv[46] = 50'h2bc774ce07800;
      expv[47] = 50'h00892a510b800;
      expv[48] = 50'h34eb9c40a0800;
      expv[49] = 50'h0e5b4cd2ab800;
      expv[50] = 50'h28c199978ef72;
      expv[51] = 50'h0e3985603a800;
      expv[52] = 50'h0d084aa161800;
      expv[53] = 50'h1f0f156089c00;
      expv[54] = 50'h1a67d7bd12bc0;
      expv[55] = 50'h2a433c5512c0f;
      expv[56] = 50'h3e4b195befc00;
      expv[57] = 50'h0ecc3dfb8dc00;
      expv[58] = 50'h27ad9b8144800;
      expv[59] = 50'h120584dd0c800;
      expv[60] = 50'h03f4b8b57780f;
      expv[61] = 50'h31b10f68a983f;
      expv[62] = 50'h33b814f3a5800;
      expv[63] = 50'h2d6135b42f82f;
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
