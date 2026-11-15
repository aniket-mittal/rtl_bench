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

  rtlpp_11299 dut (
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
    stim[0] = 122'h01780e04b244d8e6691c3cc097b9036;
    stim[1] = 122'h06666bc35680e8828807fe1ad98c932;
    stim[2] = 122'h322b9efd81b8ec1e536af7a7cbbb89a;
    stim[3] = 122'h1efeb4b6d62e1a2ba068a0e333fd8e7;
    stim[4] = 122'h390e581d4c42baafb8d8eda9d53ef16;
    stim[5] = 122'h37cbffa6f3693389e564512bc094b81;
    stim[6] = 122'h041a2f0c5c3960c43756895e34fce64;
    stim[7] = 122'h3bbfe3a043bed89d8bdcad3109ad991;
    stim[8] = 122'h197ed43b4d24aa96e1e5ab51dfed040;
    stim[9] = 122'h19c335b220d51fd73aea096961de40c;
    stim[10] = 122'h3eb9a9354b65b46173c9fe48e9c68ae;
    stim[11] = 122'h3af50197f2b8b858446d8855e1b2fa1;
    stim[12] = 122'h39b7dab3e5f6bfca7c76267f54c546c;
    stim[13] = 122'h21d214beae0fae8ecbf737912e8893c;
    stim[14] = 122'h31f90d04a9faa54d13e7934e79de9d2;
    stim[15] = 122'h238e929cdf85df76a6dc7d6cc7c9e5b;
    stim[16] = 122'h3e5979c571aa42baf06257bae3e4ba0;
    stim[17] = 122'h03f3281a8a92ca2228d19a8dd6dfb17;
    stim[18] = 122'h1c4ad8cf2d90eb2f526b5eaa3d2271e;
    stim[19] = 122'h04d859adafcc633c05e630ec02fac2c;
    stim[20] = 122'h2a33399a3b27057c6f543cf4662509f;
    stim[21] = 122'h3df6d1aee6496c2ca5faecaad2fc37c;
    stim[22] = 122'h3ffb373154fa2300626507858743758;
    stim[23] = 122'h03bda8b7b830bf8c845988d3ee2f886;
    stim[24] = 122'h3e97c519505e324ff5ce3018697f762;
    stim[25] = 122'h11fff6cc944b44144e73c8db95c19da;
    stim[26] = 122'h2b45d5cfcb37da71bdc32a43d08f2ee;
    stim[27] = 122'h05defea923850dd25cc9869a0203524;
    stim[28] = 122'h2599061fc3c5f59347777b28ccf4e22;
    stim[29] = 122'h24050aecf5f85b6eb069ee7b4cafef0;
    stim[30] = 122'h3268ae0b3c4f468a0057f9651b00113;
    stim[31] = 122'h04341e1ebd51e188797a09fa1ab8a6c;
    stim[32] = 122'h36b2e083bd2fc76986d3c3450403e25;
    stim[33] = 122'h1e5b9b7b90cb467086c63aedd276abd;
    stim[34] = 122'h0e097a9762653cce2df6df3fade6c14;
    stim[35] = 122'h0e7dbb266838716f49f62c56e474687;
    stim[36] = 122'h03ecaebe60da5371aafa82736e797b9;
    stim[37] = 122'h32c6d44dadd7784d48c1f7b339aed80;
    stim[38] = 122'h1a48b04cc706d98ca8d8f5dfe41fb7c;
    stim[39] = 122'h1cb8c9851cfaa1e848c0e80509a0e38;
    stim[40] = 122'h3ccbe6e9e3a46c0675653389b2274cb;
    stim[41] = 122'h1be7173e7d6f115d90fd89e0aa3f3fa;
    stim[42] = 122'h22c241887283c818cd40ea90cec5a02;
    stim[43] = 122'h0faf4d9eb0ca7edffbd031a3d2d0a80;
    stim[44] = 122'h21838a4b4740c0c1a15ddb9f645f7d2;
    stim[45] = 122'h1c05f0767fa6c4cd7259e92038287ca;
    stim[46] = 122'h2953f05f9fa86392c74e6c83fadce14;
    stim[47] = 122'h33474ef4710e49922cc0d2bac72566f;
    stim[48] = 122'h2ecfa40ece6dcd961ad2a3b4e0b1f78;
    stim[49] = 122'h292d64d10a29c16fc14f79b5e1b197b;
    stim[50] = 122'h3e36263fb8e7a4b6beea609a4432175;
    stim[51] = 122'h196439337ea4b169c3e660a513c39d5;
    stim[52] = 122'h1439b2258868215a80c86fe4b8f5a92;
    stim[53] = 122'h20a76a868a67a510eefefba4955ef97;
    stim[54] = 122'h357f136c42ae81a62d75f0c9bde5c02;
    stim[55] = 122'h39b34ffd482d3bc9d5443c7a78e776a;
    stim[56] = 122'h0afa3c9a145a350f875cb537fefd51f;
    stim[57] = 122'h2680f5034a0cca105f74feeb014f15d;
    stim[58] = 122'h3b4d9c89c58fd4ab6feb1f1fc822dd1;
    stim[59] = 122'h20bcd994827d1ed8606b5ac82903520;
    stim[60] = 122'h17976a502aa56aea1ee570282ab1e1e;
    stim[61] = 122'h0a97d2b8a1529f2d72e47922a2116dd;
    stim[62] = 122'h277b0bec660b19f03975aafca5d8aec;
    stim[63] = 122'h3a41e07bba98390704612ca9631a9a0;
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
      expv[0] = 50'h204bdc81b0f44;
      expv[1] = 50'h0d6cc64990edc;
      expv[2] = 50'h13e5ddc4d017b;
      expv[3] = 50'h3199fec738657;
      expv[4] = 50'h14ea9f78b07d0;
      expv[5] = 50'h15e04a5c08657;
      expv[6] = 50'h2f1a7e7320152;
      expv[7] = 50'h1884d6cc881dc;
      expv[8] = 50'h28eff68200647;
      expv[9] = 50'h34b0ef2060141;
      expv[10] = 50'h2474e34570172;
      expv[11] = 50'h2af0d97d0865f;
      expv[12] = 50'h3faa62a360741;
      expv[13] = 50'h08974449e01fd;
      expv[14] = 50'h273cef4e9015b;
      expv[15] = 50'h3663e4f2d8176;
      expv[16] = 50'h1d71f25d00753;
      expv[17] = 50'h06eb6fd8b87d4;
      expv[18] = 50'h151e9138f014b;
      expv[19] = 50'h36017d616067f;
      expv[20] = 50'h3a331284f8144;
      expv[21] = 50'h15697e1be0747;
      expv[22] = 50'h02c3a1bac0047;
      expv[23] = 50'h29f717c43075e;
      expv[24] = 50'h0c34bfbb10742;
      expv[25] = 50'h2dcae0ced01fd;
      expv[26] = 50'h21e8479770740;
      expv[27] = 50'h0d0101a920748;
      expv[28] = 50'h14667a711015f;
      expv[29] = 50'h3da657f780753;
      expv[30] = 50'h328d80089874e;
      expv[31] = 50'h3d0d5c53607f1;
      expv[32] = 50'h228201f12815e;
      expv[33] = 50'h36e93b55e807e;
      expv[34] = 50'h1fd6f360a07d5;
      expv[35] = 50'h2b723a343874d;
      expv[36] = 50'h39b73cbdc8145;
      expv[37] = 50'h199cd76c006dc;
      expv[38] = 50'h2ff20fdbe07f4;
      expv[39] = 50'h0284d071c06fc;
      expv[40] = 50'h04d913a658743;
      expv[41] = 50'h30551f9fd074b;
      expv[42] = 50'h086762d0106dc;
      expv[43] = 50'h11e96854001d0;
      expv[44] = 50'h0fb22fbe90746;
      expv[45] = 50'h101c143e50142;
      expv[46] = 50'h01fd6e70a005e;
      expv[47] = 50'h1d6392b378644;
      expv[48] = 50'h1a7058fbc01f8;
      expv[49] = 50'h1af0d8cbd867e;
      expv[50] = 50'h0d22190ba8141;
      expv[51] = 50'h1289e1cea805f;
      expv[52] = 50'h325c7ad49065e;
      expv[53] = 50'h124aaf7cb81d5;
      expv[54] = 50'h24def2e0107d5;
      expv[55] = 50'h3d3c73bb5074a;
      expv[56] = 50'h1bff7ea8f814e;
      expv[57] = 50'h3580a78ae8149;
      expv[58] = 50'h0fe4116e880d5;
      expv[59] = 50'h241481a900647;
      expv[60] = 50'h141558f0f01f9;
      expv[61] = 50'h115108b6e8143;
      expv[62] = 50'h3e52ec57607f1;
      expv[63] = 50'h14b18d4d0065f;
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
