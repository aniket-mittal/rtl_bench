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

  rtlpp_09347 dut (
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
    stim[0] = 122'h0037b2bf378336af20a33fee831ce23;
    stim[1] = 122'h09cb1848e58f166bb389123db6374d8;
    stim[2] = 122'h07564f110c96453d1a6a024eb92d880;
    stim[3] = 122'h2791e35481cdd95f1a648781b00561d;
    stim[4] = 122'h29a9cc40bd0c0c86df774df731da656;
    stim[5] = 122'h38f88b358f038e39345efa1b9d58e1e;
    stim[6] = 122'h37f6f549630ea2b266649ca4f55d512;
    stim[7] = 122'h0504f682ef906f41c2c32a014b1ef5f;
    stim[8] = 122'h3af9be241c814ae8996725fed7e7ed9;
    stim[9] = 122'h31df95926a36e192deda83bfa361a84;
    stim[10] = 122'h37358495b0daba07e57eab2e771d228;
    stim[11] = 122'h146b6401c61f9611b7e356dd83a0a4f;
    stim[12] = 122'h07b8e4e9472581bde1cd5a08fa1f831;
    stim[13] = 122'h33d82bcf035f59c437f5222e1a5d71a;
    stim[14] = 122'h2a441a3a11c2be8f677775ef42097a0;
    stim[15] = 122'h335af67417c5a9dc554ab4833d0d73f;
    stim[16] = 122'h3247cbf7c28c1cd33e6d9c685ad4cf8;
    stim[17] = 122'h290bd89dfd0a84c2964ca17942bff19;
    stim[18] = 122'h1369776b0b37dc2169d1c9c705bef63;
    stim[19] = 122'h193efb23a4feb78fc472f8be2d67280;
    stim[20] = 122'h1047a27535cec344cf71b4e9ab89143;
    stim[21] = 122'h21bdd10c6c2ecaea7adff77d5ea03ad;
    stim[22] = 122'h314b41f8af1aa0b410fe81eebe8b8d1;
    stim[23] = 122'h3c1f627edcdc8bfca3f3a99ffd2c78d;
    stim[24] = 122'h05b01c50cc871a662d6a7371828431c;
    stim[25] = 122'h36c282f7dca12d32847ef9156dac114;
    stim[26] = 122'h3fad348549f2629f56eb1625133eada;
    stim[27] = 122'h3366c73324d1208db7f9271c85b5dcb;
    stim[28] = 122'h2ecc2be7fb1cc4d73955576911c2ccf;
    stim[29] = 122'h18c44b92f7147ce5c6e767cd0ef5f96;
    stim[30] = 122'h0b6a657be69201aee6feb64a2aa94f1;
    stim[31] = 122'h278d4b854e296a58f6fd1a3f178150d;
    stim[32] = 122'h0b8aecf58f1bd1cacc68f1dd2074d20;
    stim[33] = 122'h3633334a191f81b7b874d773d282188;
    stim[34] = 122'h2883bd72f43fd05b40c86f9db1e8a7c;
    stim[35] = 122'h299438cf376a5df225f64e98ab1fcb9;
    stim[36] = 122'h3ec10c06d8568272585088c3a937c5b;
    stim[37] = 122'h0dadc8116336e07bb5e19cce491f275;
    stim[38] = 122'h17c12f47002ef34c56f6f7b32e14c0e;
    stim[39] = 122'h39afe1047f4b8da654e77402ec01c43;
    stim[40] = 122'h10e0ba36b60c32a7b9e1e3cb0f7abd6;
    stim[41] = 122'h0c6add0f6d9a8fe7f3d4f95ca5e3c09;
    stim[42] = 122'h3d740cf20e1de1036acb48bc17f8e5b;
    stim[43] = 122'h0047d86e346f7708b1e52c293a8ca89;
    stim[44] = 122'h0e4aeb770b6ac7f307df891f1a0d9f6;
    stim[45] = 122'h195159fa7204921e50c338a8dd39b47;
    stim[46] = 122'h0240a1cba8a0fe48b2747462c7d0b16;
    stim[47] = 122'h35c33d49e113c38f84c98ef1da21971;
    stim[48] = 122'h1efc3501608327b7fadf8ea43a3e71a;
    stim[49] = 122'h1ebfc666abc0539117402bb6443c3f5;
    stim[50] = 122'h3352215e4c464ac569f5f8456c4ecdc;
    stim[51] = 122'h1c459580a320436eabc8dff521386a7;
    stim[52] = 122'h3030dfa9910aa02cc444a45885aafed;
    stim[53] = 122'h0fe5c7780265c700337564930ea2120;
    stim[54] = 122'h2afd6f678ed45bd4ecc62959e52d7be;
    stim[55] = 122'h17610611310f94eccac72e41f57d0b2;
    stim[56] = 122'h2cb91a5043c2a15136d4fa428517703;
    stim[57] = 122'h2166d7de2c9365e8cf7329924e93948;
    stim[58] = 122'h286bd156b9459fab33c9f2ef1a71300;
    stim[59] = 122'h03fd2bafd8692689ca7d0bada4e66b6;
    stim[60] = 122'h1e955644835ce8273d5e580ae03c322;
    stim[61] = 122'h03071034d1e900e9a0599d171841ab5;
    stim[62] = 122'h10866ae58844b1be5fc1ed48c7f4157;
    stim[63] = 122'h0d4ce3481aae4cd598f0dc65f69ed58;
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
      expv[1] = 50'hxxxxxxxxxx000;
      expv[2] = 50'hxxxxxxxxxx000;
      expv[3] = 50'hxxxxxxxxxx000;
      expv[4] = 50'hxxxxxxxxxx000;
      expv[5] = 50'hxxxxxxxxxx000;
      expv[6] = 50'hxxxxxxxxxx000;
      expv[7] = 50'hxxxxxxxxxx000;
      expv[8] = 50'hxxxxxxxxxx000;
      expv[9] = 50'hxxxxxxxxxx000;
      expv[10] = 50'hxxxxxxxxxx000;
      expv[11] = 50'hxxxxxxxxxx000;
      expv[12] = 50'hxxxxxxxxxx000;
      expv[13] = 50'hxxxxxxxxxx000;
      expv[14] = 50'hxxxxxxxxxx000;
      expv[15] = 50'hxxxxxxxxxx000;
      expv[16] = 50'hxxxxxxxxxx000;
      expv[17] = 50'hxxxxxxxxxx000;
      expv[18] = 50'hxxxxxxxxxx000;
      expv[19] = 50'hxxxxxxxxxx000;
      expv[20] = 50'hxxxxxxxxxx000;
      expv[21] = 50'hxxxxxxxxxx000;
      expv[22] = 50'hxxxxxxxxxx000;
      expv[23] = 50'hxxxxxxxxxx000;
      expv[24] = 50'hxxxxxxxxxx000;
      expv[25] = 50'hxxxxxxxxxx000;
      expv[26] = 50'hxxxxxxxxxx000;
      expv[27] = 50'hxxxxxxxxxx000;
      expv[28] = 50'hxxxxxxxxxx000;
      expv[29] = 50'hxxxxxxxxxx000;
      expv[30] = 50'hxxxxxxxxxx000;
      expv[31] = 50'hxxxxxxxxxx000;
      expv[32] = 50'hxxxxxxxxxx000;
      expv[33] = 50'hxxxxxxxxxx000;
      expv[34] = 50'hxxxxxxxxxx000;
      expv[35] = 50'hxxxxxxxxxx000;
      expv[36] = 50'hxxxxxxxxxx000;
      expv[37] = 50'hxxxxxxxxxx000;
      expv[38] = 50'hxxxxxxxxxx000;
      expv[39] = 50'hxxxxxxxxxx000;
      expv[40] = 50'hxxxxxxxxxx000;
      expv[41] = 50'hxxxxxxxxxx000;
      expv[42] = 50'hxxxxxxxxxx000;
      expv[43] = 50'hxxxxxxxxxx000;
      expv[44] = 50'hxxxxxxxxxx000;
      expv[45] = 50'hxxxxxxxxxx000;
      expv[46] = 50'hxxxxxxxxxx000;
      expv[47] = 50'hxxxxxxxxxx000;
      expv[48] = 50'hxxxxxxxxxx000;
      expv[49] = 50'hxxxxxxxxxx000;
      expv[50] = 50'hxxxxxxxxxx000;
      expv[51] = 50'hxxxxxxxxxx000;
      expv[52] = 50'hxxxxxxxxxx000;
      expv[53] = 50'hxxxxxxxxxx000;
      expv[54] = 50'hxxxxxxxxxx000;
      expv[55] = 50'hxxxxxxxxxx000;
      expv[56] = 50'hxxxxxxxxxx000;
      expv[57] = 50'hxxxxxxxxxx000;
      expv[58] = 50'hxxxxxxxxxx000;
      expv[59] = 50'hxxxxxxxxxx000;
      expv[60] = 50'hxxxxxxxxxx000;
      expv[61] = 50'hxxxxxxxxxx000;
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
