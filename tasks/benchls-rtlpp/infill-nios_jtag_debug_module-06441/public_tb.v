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

  rtlpp_06441 dut (
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
    stim[0] = 122'h08838cd1660a50b38e85aed37229610;
    stim[1] = 122'h292c85d233fe67426baf6079e279afe;
    stim[2] = 122'h1ebbb3a9f07bcf0b8a407515207a402;
    stim[3] = 122'h2b2255e149d998d1e3f11e6e2dbfedc;
    stim[4] = 122'h194fe50a4f1e8e5b6b5af9470df1615;
    stim[5] = 122'h085c785190e3d3f751566021cc1e897;
    stim[6] = 122'h05e0d0726532ae3b8775bdfa571d4db;
    stim[7] = 122'h221a19c5470984008d4ecdbc1e93d06;
    stim[8] = 122'h0b9f16aa1e529e9df25a09a90b1c279;
    stim[9] = 122'h1a03e78c4c2019f683e36df46971c64;
    stim[10] = 122'h0118291be2c3889de9d4f6517a9b565;
    stim[11] = 122'h1b555d4a928dbb2d06e9a2ddfff20c0;
    stim[12] = 122'h10cafbc5be7c32ca1c56ef97a1066f6;
    stim[13] = 122'h290df57082c42ff39ff679af5ca1c3f;
    stim[14] = 122'h3a597d191e28437a29c1dd393bd6ab5;
    stim[15] = 122'h376d6c52b1035c9558683f30fcf2e08;
    stim[16] = 122'h23c52a07ac0bfaff35de301381568fc;
    stim[17] = 122'h057fcbfa09638c20444106f6d5f5c72;
    stim[18] = 122'h2dc37d61b2b147bdf3dcfa5c784eadc;
    stim[19] = 122'h28d42cf3a05af13745d10b3c667100b;
    stim[20] = 122'h2634e0c7ce7ede319958df50ae765b8;
    stim[21] = 122'h00940d7f0dda968768ebb0920bb45fa;
    stim[22] = 122'h33bd3d307dc39a8a78e90ad90c31725;
    stim[23] = 122'h0da95056bfdd2f1a65a50d637066271;
    stim[24] = 122'h28d70c3744e8d64c17986d081364706;
    stim[25] = 122'h19d589003b7cdd93f96b50c5ea814de;
    stim[26] = 122'h25f14e5988bdb1587c5d497464380ed;
    stim[27] = 122'h1ef73c44bf93f29c61f59d6cfa6e724;
    stim[28] = 122'h1df47a72855118adac6594464ca8fc9;
    stim[29] = 122'h251b57d2628ef346fbe9e957e704228;
    stim[30] = 122'h1bbdd511d43333e709e1243fd273c56;
    stim[31] = 122'h326002587cac8e855151a77e99fd920;
    stim[32] = 122'h37611a71922034cd0967484fad626e6;
    stim[33] = 122'h29e22d2d1ca88c924359a6e0a89a643;
    stim[34] = 122'h02d8a6debb5b005e66fa1a282101f2c;
    stim[35] = 122'h0881bcfd93bea947da42e2498e370ef;
    stim[36] = 122'h03d24bfcf10dc48534483562566cbf6;
    stim[37] = 122'h147b4cc79efc010693462d76f398cd9;
    stim[38] = 122'h02e2265823cbe801aafe9ba12a2baa1;
    stim[39] = 122'h0d39b82a533f9f07356c6b57e3bb4b0;
    stim[40] = 122'h214e04034acb220f874b3b0c51f8ee9;
    stim[41] = 122'h3e8256b2818acb12a3e80be4192d9bd;
    stim[42] = 122'h0f653bbc2ac19abd1e49e184b7c2826;
    stim[43] = 122'h2e7693d9ac30b0b566c137029f037ff;
    stim[44] = 122'h1ec471b213881181ade581bd585bac3;
    stim[45] = 122'h2fc62874bdf26c91f9f91d7d42fb376;
    stim[46] = 122'h3061e45ac0a321e0dbda6a4c2f4cd77;
    stim[47] = 122'h1f1d4e8c1c51ef29905b86c4e9b90a1;
    stim[48] = 122'h325aa06e78213cad1ac893e7f587acc;
    stim[49] = 122'h188f4479944576b9ee6026db501f4e1;
    stim[50] = 122'h156219d5be453b1763e8145f4fadc64;
    stim[51] = 122'h1c9ac7a5e5020e40ac7e7e6aec6e7d0;
    stim[52] = 122'h10c6fc2a315a0fa843ec22f1967a9d1;
    stim[53] = 122'h100b06ae5a42c4685e56b73cded06f0;
    stim[54] = 122'h3edd7b131221682b3fed1c38f3ade70;
    stim[55] = 122'h00b9bfa9337a9e714ad7c1994095337;
    stim[56] = 122'h3c910dd5c7a7b31a4e63f6e02832741;
    stim[57] = 122'h1512f595580794311653c3de706bc60;
    stim[58] = 122'h0584f288bf9f84fd5cd93054aa7a5cb;
    stim[59] = 122'h33b9445c95d4c948114dc0fca617a1c;
    stim[60] = 122'h04be4b0b24b5feffba70f380665cd2d;
    stim[61] = 122'h14a09900d7991b39d0cf4487a716572;
    stim[62] = 122'h0caa375a01a3a56cc94dbc61d0d62a1;
    stim[63] = 122'h3725ab52d4cfa2fb2c6db6b1b0623c1;
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
      expv[0] = 53'hxxxxxxxxxxx000;
      expv[1] = 53'hxxxxxxxxxxx000;
      expv[2] = 53'hxxxxxxxxxxx000;
      expv[3] = 53'h00ea2a40f4653a;
      expv[4] = 53'h023cdc5b7e71ce;
      expv[5] = 53'h15f28e1be2758a;
      expv[6] = 53'h0cc043983c68b7;
      expv[7] = 53'h0b7bf4ae3a63bc;
      expv[8] = 53'h1d9b783d2666b9;
      expv[9] = 53'h14135216387906;
      expv[10] = 53'h06dbe8d2e261de;
      expv[11] = 53'h09eca2f53674cb;
      expv[12] = 53'h1345bbffe4635c;
      expv[13] = 53'h0ddf2f420c6e31;
      expv[14] = 53'h0cf35eb9426ff0;
      expv[15] = 53'h03ba7277ac74cb;
      expv[16] = 53'h107e61f9e46c13;
      expv[17] = 53'h1c602702ac7ac5;
      expv[18] = 53'h020dedabea623d;
      expv[19] = 53'h19f4b8f09c79c6;
      expv[20] = 53'h021678cce262fd;
      expv[21] = 53'h11bea15cec6c93;
      expv[22] = 53'h1761241768746b;
      expv[23] = 53'h1215b218620000;
      expv[24] = 53'h1215b218620000;
      expv[25] = 53'h1215b218620000;
      expv[26] = 53'h16a18bd5027ca3;
      expv[27] = 53'h1a92e8c8707e01;
      expv[28] = 53'h0b3ad9f4dc70cf;
      expv[29] = 53'h0b288c99507609;
      expv[30] = 53'h13d2afce087dc2;
      expv[31] = 53'h02487fa4e664fb;
      expv[32] = 53'h034efd33fa6897;
      expv[33] = 53'h0e909f5ac464bb;
      expv[34] = 53'h134dc1513461be;
      expv[35] = 53'h1434504202734c;
      expv[36] = 53'h05c4931c6e6d32;
      expv[37] = 53'h106ac4acd87a25;
      expv[38] = 53'h0c5aede7306996;
      expv[39] = 53'h1d37425456754a;
      expv[40] = 53'h18d6afc7767a85;
      expv[41] = 53'h167618a3f0639c;
      expv[42] = 53'h1017c8325a71ce;
      expv[43] = 53'h13c3096f846f30;
      expv[44] = 53'h026e053e06736c;
      expv[45] = 53'h0b037ab0b676e9;
      expv[46] = 53'h123afa85f67ce3;
      expv[47] = 53'h14d4985e986df2;
      expv[48] = 53'h170d89d3726817;
      expv[49] = 53'h1127cfeb0e6d52;
      expv[50] = 53'h004db6a03e7708;
      expv[51] = 53'h1028be9f5a71ce;
      expv[52] = 53'h1cfcd5d8dc7609;
      expv[53] = 53'h1845e32cf461de;
      expv[54] = 53'h0d6e79bda06f10;
      expv[55] = 53'h1a3871e75a7fc0;
      expv[56] = 53'h0f8332812a657a;
      expv[57] = 53'h07edc050646718;
      expv[58] = 53'h0787bce0d66b14;
      expv[59] = 53'h1260a954f46e71;
      expv[60] = 53'h1b81f94c2e6897;
      expv[61] = 53'h01e700ccb87d02;
      expv[62] = 53'h1e890f4e2c6877;
      expv[63] = 53'h1b78c3a1ac649b;
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
