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

  rtlpp_00567 dut (
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
    stim[0] = 122'h225b2f03385dd93b13baa5ca7af508b;
    stim[1] = 122'h228c025a07c58db724b2681d5e21a0b;
    stim[2] = 122'h2c9c6368bd1402186c47851d1932bac;
    stim[3] = 122'h1a4a89492b3f634e24d25c5ebcd4093;
    stim[4] = 122'h1c44af07ecc97a40fcfbfdb51102cb1;
    stim[5] = 122'h3729c3ea02d081724855d4f690e5d0a;
    stim[6] = 122'h01fb50cf65c8be56b540924e1b143d3;
    stim[7] = 122'h063142b3e36feac807534e6aa19d6ca;
    stim[8] = 122'h310f89bf6c92a90963e7b0c6226df8f;
    stim[9] = 122'h2a71ccb64c8414c8ab5d1e1fb250156;
    stim[10] = 122'h0d9352de8db9d8f79d53c84a7f77658;
    stim[11] = 122'h1cdbe70d8726fd4493ebb8903942bbf;
    stim[12] = 122'h135e40d53d0a41b932cfd9a7dbfd5f0;
    stim[13] = 122'h39be4344f7bc6483ddc42feeaf7dff5;
    stim[14] = 122'h2b6ed38d63834b7ebdd5bb664f90595;
    stim[15] = 122'h381e9c32ce67c6bfb6c04f77a0acd1c;
    stim[16] = 122'h204d028f68de11c44fce098f6463bc8;
    stim[17] = 122'h16a75155e29b63c1936289a79797113;
    stim[18] = 122'h284277ac02694f7fe4757b8c9a9edfd;
    stim[19] = 122'h088fec853f21ca9f2d2b3cd1e955049;
    stim[20] = 122'h2509aeefbbcf2b9f6b774d5caea5d21;
    stim[21] = 122'h2cc6d9724d763c1f175100a0b1827ec;
    stim[22] = 122'h08e09d4d702a2b01a4c0a2e04daa5b4;
    stim[23] = 122'h050ff9eb709cb58b8365d524c779109;
    stim[24] = 122'h0a3a8e359da7cd2d88fece66613d116;
    stim[25] = 122'h3d18770f30ea25b681cb071e5a8279b;
    stim[26] = 122'h33e2bc83f39bfa8829fbf8cbf732f85;
    stim[27] = 122'h13fc08ed8ee997ab58c0398a8e90899;
    stim[28] = 122'h168ae4ae7424b75fdad53499d5f864e;
    stim[29] = 122'h2ab9891aa69a1f5819db979e496759d;
    stim[30] = 122'h18c0ff61931f7f807e6c4cae5305723;
    stim[31] = 122'h0628ffa56153bd9367d006c77881209;
    stim[32] = 122'h33272d6d13fd8f5a1d5e3eb9c7ba38c;
    stim[33] = 122'h297ef889d07fa8c6924ac2c78c0e340;
    stim[34] = 122'h34ad205613c30d4b433c17ed979841f;
    stim[35] = 122'h30a81f4448c614decf6f57910fedab3;
    stim[36] = 122'h0f2331ea79f9630b9fc5a1feb1d187c;
    stim[37] = 122'h3bf5b88939597e82344c6578923a977;
    stim[38] = 122'h1bda379ea4ca4ea3744f7bb04481661;
    stim[39] = 122'h1911c75f871edd82ea684d1d91ac5cb;
    stim[40] = 122'h334e5820ea2dbf55faf608b46ec5c31;
    stim[41] = 122'h24cc7a1edd86abfb02e06f3a030b93f;
    stim[42] = 122'h02f5bb2db201cd332176e239a474c82;
    stim[43] = 122'h3f715829b2b8a59f13dc89a89f14512;
    stim[44] = 122'h1d799d08fd268bf5f20273ee68fd886;
    stim[45] = 122'h28fa089f76cf4aad64542e1869cda53;
    stim[46] = 122'h1e974548469f2eb5f26132b578887c2;
    stim[47] = 122'h1773d0df2784003eedd1f7bdd6ad272;
    stim[48] = 122'h1bb9dd3cbe39d3dac1d2929becb9a34;
    stim[49] = 122'h1da174ab74247fc87e58a49640927f3;
    stim[50] = 122'h3e3cf1aad3510912107d0cc78e4a169;
    stim[51] = 122'h1bf16b5a798718c0f5ed8bfe4d4e397;
    stim[52] = 122'h2508d33bb2b08950347c30fb3ed8de0;
    stim[53] = 122'h2fb65235e7f9954c74c32d658aaa0aa;
    stim[54] = 122'h14beb79c79e66094d1e3769287c2890;
    stim[55] = 122'h2ab74b73a30d4c98f9f18c7c3836cbb;
    stim[56] = 122'h2ed271cbf32010323a6234284472773;
    stim[57] = 122'h0eebabb170c44eb265592a0a38659cd;
    stim[58] = 122'h274087597e20e20f71553b591cf2df7;
    stim[59] = 122'h2c1a78f1d6642e65f6c3286ef409b0b;
    stim[60] = 122'h0b44e24b7157d6b3f140f938b89a223;
    stim[61] = 122'h23ae002614f88c5276676ab619e3285;
    stim[62] = 122'h3ee4e3bcd20158d962cbbfe78b9f493;
    stim[63] = 122'h3e88acd0faf3dbc6f5f93430224cd61;
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
      expv[0] = 53'h154b94f5eb11ce;
      expv[1] = 53'h04d03abc42a2dc;
      expv[2] = 53'h0f0a3a3264c03f;
      expv[3] = 53'h04b8bd79a8e11f;
      expv[4] = 53'h17fb6a2205a21d;
      expv[5] = 53'h0ba9ed21ca42dc;
      expv[6] = 53'h01249c3629c01f;
      expv[7] = 53'h069cd5433a49d6;
      expv[8] = 53'h0f618c44da902f;
      expv[9] = 53'h1a3c3f64a0c917;
      expv[10] = 53'h079094feef41de;
      expv[11] = 53'h1771207285102f;
      expv[12] = 53'h1fb34fb7fbe01f;
      expv[13] = 53'h085fdd5efb401f;
      expv[14] = 53'h0b76cc9f21c11f;
      expv[15] = 53'h009eef4159e03f;
      expv[16] = 53'h1c131ec8c6405e;
      expv[17] = 53'h05134f2f2f100f;
      expv[18] = 53'h0af719353c823d;
      expv[19] = 53'h1679a3d2aa805e;
      expv[20] = 53'h0e9ab95d4a8699;
      expv[21] = 53'h0201416305413f;
      expv[22] = 53'h0145c09b54e01f;
      expv[23] = 53'h0baa498ef2045a;
      expv[24] = 53'h1d9cccc27a219f;
      expv[25] = 53'h160e3cb504405e;
      expv[26] = 53'h17f197ee64821d;
      expv[27] = 53'h0073151d21605e;
      expv[28] = 53'h0a6933abf16937;
      expv[29] = 53'h172f3c92cf41bf;
      expv[30] = 53'h18995ca60b900f;
      expv[31] = 53'h000d8ef102c5da;
      expv[32] = 53'h1c7d738f75413f;
      expv[33] = 53'h15858f181d401f;
      expv[34] = 53'h182fdb2f30112f;
      expv[35] = 53'h1eaf221fda100f;
      expv[36] = 53'h0b43fd63a3403f;
      expv[37] = 53'h18caf12475c01f;
      expv[38] = 53'h1ef7608903c01f;
      expv[39] = 53'h109a3b2358904e;
      expv[40] = 53'h0c1168dd8ba699;
      expv[41] = 53'h00de740616302f;
      expv[42] = 53'h0dc47348e8821d;
      expv[43] = 53'h1913513e294917;
      expv[44] = 53'h04e7dcd1fb8817;
      expv[45] = 53'h085c30d39ac29d;
      expv[46] = 53'h02656af1118817;
      expv[47] = 53'h03ef7bad5ac19f;
      expv[48] = 53'h052537d972429d;
      expv[49] = 53'h11492c8125d10f;
      expv[50] = 53'h1a198f1c95015e;
      expv[51] = 53'h1b17fc9a9d801f;
      expv[52] = 53'h1861f67db1821d;
      expv[53] = 53'h065acb1555e05e;
      expv[54] = 53'h06ed250f85001f;
      expv[55] = 53'h0318f8706d825c;
      expv[56] = 53'h04685088e5900f;
      expv[57] = 53'h12541470cac2bd;
      expv[58] = 53'h0a76b239e5c21d;
      expv[59] = 53'h0650dde813f04e;
      expv[60] = 53'h01f2717135c01f;
      expv[61] = 53'h0ed56c33c7841b;
      expv[62] = 53'h177fcf173ef00f;
      expv[63] = 53'h1268604499821d;
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
