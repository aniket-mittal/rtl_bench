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

  rtlpp_05456 dut (
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
    stim[0] = 122'h2c51e91dcd11f1580c8a8bbc6107e26;
    stim[1] = 122'h058a21695da6e673f094860bd7240ab;
    stim[2] = 122'h3db32e06458acfb9c6f452d481c440a;
    stim[3] = 122'h0700c2134078e77aaa5e00d8bb70620;
    stim[4] = 122'h212880131de17f8a494b0272e0dd228;
    stim[5] = 122'h3ac56b4e5aa3dd5f9fe592bafed4115;
    stim[6] = 122'h0ca99e3d1c88bf8c874a9ee79555225;
    stim[7] = 122'h3409f565c95da53a177b96656c22965;
    stim[8] = 122'h04ca43cd7f3c80c62d4070ab948e2de;
    stim[9] = 122'h0a1744d40bcf0f007fd75bd0b19523b;
    stim[10] = 122'h100cb8fab33e1ebd1a44a4dabe7f639;
    stim[11] = 122'h033371ae888a0b3801fbead883e522e;
    stim[12] = 122'h0a3504a33197adf777ce9cfaa92020b;
    stim[13] = 122'h36b043c6af7b12ab5f48cd6d2e3a9a7;
    stim[14] = 122'h3ba29acf5c06ab7d7961943e6bb550b;
    stim[15] = 122'h2a309ecec6dc5fe8a3fa575204655a2;
    stim[16] = 122'h381e4615e06dc91c44e29a2838f44c1;
    stim[17] = 122'h36b3c8340d54df85d3e8cfe1993288d;
    stim[18] = 122'h0e0ba17d414b62ce3175a42314f5f3b;
    stim[19] = 122'h1e3608d1883283f651e3e0bbf33147b;
    stim[20] = 122'h122795b648c465645a600501d3c46ef;
    stim[21] = 122'h19446e7886a51c78955f4de3efc80aa;
    stim[22] = 122'h3751994260f97687df5153d0c761e98;
    stim[23] = 122'h273c33de6aaff1667273d3f895683a4;
    stim[24] = 122'h17f6eef58c4dc7afea5b0a53063322a;
    stim[25] = 122'h06b8338ab670c3e865feec2a0baa8b4;
    stim[26] = 122'h309dc30090590b9e28f254b0c673a6b;
    stim[27] = 122'h1908071c9fd8ffcc05fc9026d483e0f;
    stim[28] = 122'h23085e0d6e6a571e1e701ba2e1c5dd4;
    stim[29] = 122'h20a8439e1522fea32cd6e1db7fd3285;
    stim[30] = 122'h25ecb331a86dd0be99fd9c23fbf60a1;
    stim[31] = 122'h1bde956bd8e36d6699f36c35c176cf7;
    stim[32] = 122'h3418279ad67d8bceb04a66f6d787c5a;
    stim[33] = 122'h2fec81e735ed6534e958b710948faf4;
    stim[34] = 122'h24c2a214862c2b80b1e4f8858659906;
    stim[35] = 122'h3e2b8d8a2dcd8712bffed5d89a62e4a;
    stim[36] = 122'h052ae3e35c53acb574e307d990b069a;
    stim[37] = 122'h3fb8c866f807365f57d19df5670b85f;
    stim[38] = 122'h027c3acfa030f41f5bcc6e02bcb779e;
    stim[39] = 122'h2cd94ffbc22ca3b221c8dfc6ac5ddf8;
    stim[40] = 122'h0ee11f3a9ccf91d80dfc64eb0248c25;
    stim[41] = 122'h317547dc1502fd184fdd5d656c1f780;
    stim[42] = 122'h3e53b4c29792a12d90e377161264fc9;
    stim[43] = 122'h17b54986d60ff9fb75f396bd504cf59;
    stim[44] = 122'h2f9f9ba68013e0f394504aed5741d00;
    stim[45] = 122'h0f79f4be6b8302ca75604fdcf7c23b8;
    stim[46] = 122'h03f145e1c4223a015f785eeac42de1f;
    stim[47] = 122'h23c79e898b4f5cad89c3d54aae440dc;
    stim[48] = 122'h351aae1fe5732d048f405c3a40b4b42;
    stim[49] = 122'h0f676c145dd6c0941ac0ea712b3eb38;
    stim[50] = 122'h3c4304c591c1d3fdfd45d6e97aee820;
    stim[51] = 122'h33aaae920a71aec8f65852b4f7d44ae;
    stim[52] = 122'h36cd89f9d627bd64c057b6691bbb80d;
    stim[53] = 122'h102469fcd6933d60fff66e2d67f6251;
    stim[54] = 122'h02627b2ae863e4d81272a32d1cd4570;
    stim[55] = 122'h07216201939b3cf742f26ac00819392;
    stim[56] = 122'h13d98e458172668160e21f88b4dd666;
    stim[57] = 122'h0cae80a86dcce937136c42d405ef1e6;
    stim[58] = 122'h3ce86f3257e93a7e23709695d391a23;
    stim[59] = 122'h29710efb7259a5b363787067e8134fa;
    stim[60] = 122'h1777c1f2c892d4a1f3d233c87d61089;
    stim[61] = 122'h3d315aad332f4e93a274e7dd3167cc8;
    stim[62] = 122'h3036e2bb1289db5b7d40f1c8a2aae7d;
    stim[63] = 122'h2f2fe0a5f9191294f9e01b261d91172;
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
      expv[0] = 53'h0b147a47702658;
      expv[1] = 53'h0162885a5038a7;
      expv[2] = 53'h0f6ccb819063bd;
      expv[3] = 53'h01c03084d0558b;
      expv[4] = 53'h084a2004c0443b;
      expv[5] = 53'h0eb15ad3906f11;
      expv[6] = 53'h032a678f40431d;
      expv[7] = 53'h0d027d59704bd4;
      expv[8] = 53'h013290f3505629;
      expv[9] = 53'h0285d135007fa1;
      expv[10] = 53'h04032e3ea04d33;
      expv[11] = 53'h00ccdc6ba060bf;
      expv[12] = 53'h028d4128c07b25;
      expv[13] = 53'h0dac10f1a04f50;
      expv[14] = 53'h0ee8a6b3d05c23;
      expv[15] = 53'h0a8c27b3b0718f;
      expv[16] = 53'h0e07918570621d;
      expv[17] = 53'h0dacf20d006976;
      expv[18] = 53'h0382e85f5058e6;
      expv[19] = 53'h078d8234606837;
      expv[20] = 53'h0489e56d904d33;
      expv[21] = 53'h06511b9e204ab5;
      expv[22] = 53'h0dd46650904ff0;
      expv[23] = 53'h09cf0cf7905987;
      expv[24] = 53'h05fdbbbd6055ab;
      expv[25] = 53'h01ae0ce2a072cc;
      expv[26] = 53'h0c2770c02074ea;
      expv[27] = 53'h064201c72062fc;
      expv[28] = 53'h08c21783504fd0;
      expv[29] = 53'h082a10e7807689;
      expv[30] = 53'h097b2ccc606c93;
      expv[31] = 53'h06f7a55af06cd2;
      expv[32] = 53'h0d0609e6b05866;
      expv[33] = 53'h0bfb2079c054ca;
      expv[34] = 53'h0930a885207846;
      expv[35] = 53'h0f8ae362807fe0;
      expv[36] = 53'h014ab8f8d07a25;
      expv[37] = 53'h0fee3219b06bf4;
      expv[38] = 53'h009f0eb3e06d33;
      expv[39] = 53'h0b3653fef0706e;
      expv[40] = 53'h03b847cea066d8;
      expv[41] = 53'h0c5d51f7006799;
      expv[42] = 53'h0f94ed30a06876;
      expv[43] = 53'h05ed5261b07ae4;
      expv[44] = 53'h0be7e6e9a04ad4;
      expv[45] = 53'h03de7d2f905a25;
      expv[46] = 53'h00fc5178704ff0;
      expv[47] = 53'h08f1e7a260643b;
      expv[48] = 53'h0d46ab87f04758;
      expv[49] = 53'h03d9db05106d72;
      expv[50] = 53'h0f10c131605e40;
      expv[51] = 53'h0ceaaba4805ba5;
      expv[52] = 53'h0db3627e7040fe;
      expv[53] = 53'h04091a7f307f81;
      expv[54] = 53'h00989ecab04997;
      expv[55] = 53'h01c8588060619f;
      expv[56] = 53'h04f6639160700f;
      expv[57] = 53'h032ba02a104917;
      expv[58] = 53'h0f3a1bcc9051ce;
      expv[59] = 53'h0a5c43bed051af;
      expv[60] = 53'h05ddf07cb079a7;
      expv[61] = 53'h0f4c56ab4051ee;
      expv[62] = 53'h0c0db8aec05e60;
      expv[63] = 53'h0bcbf829707c03;
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
