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

  rtlpp_07351 dut (
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
    stim[0] = 122'h177ac8322713370f381c84caddfc1a0;
    stim[1] = 122'h238336662c4085d8979e953b730481a;
    stim[2] = 122'h0d5003efb4332d7e5949ca291ec23b8;
    stim[3] = 122'h0bcfb924255de934a1e498b0de85c7c;
    stim[4] = 122'h12c30d4bf7cfd0f87f43ce495411c3f;
    stim[5] = 122'h1c0705644c337392a05a48166aa1602;
    stim[6] = 122'h23b8dda2106fd565b2e95604c43469d;
    stim[7] = 122'h285482d1bbf5f25a46526c5ef6b7a8e;
    stim[8] = 122'h3ebf16c3d1f19998487c5db24f0866e;
    stim[9] = 122'h2b0f05c7633a73de52fdd433b9ec6d6;
    stim[10] = 122'h021d57c91c3d36e17aec1506c2fe16e;
    stim[11] = 122'h2b935f83c508a2621079ec763940ae8;
    stim[12] = 122'h1e87724bff97b3febbef9d5bfc124bf;
    stim[13] = 122'h173c6a718328429015cc7b2b2aebdee;
    stim[14] = 122'h37f32872732a64ec6b758cd4d19fb10;
    stim[15] = 122'h37446aa6d277a8e455232d1f902bcfb;
    stim[16] = 122'h38dd501d7fa7e934ed5702f0f5962b3;
    stim[17] = 122'h2ecf90c7b11e8ec845328743ee1eca6;
    stim[18] = 122'h2cdadbfa6e0219ea16f05359f9f0ebd;
    stim[19] = 122'h2ea09f3d9d78781c97f5370d39fc7bb;
    stim[20] = 122'h056d579fe0d5fb5029567cfe13beee8;
    stim[21] = 122'h3867ac433562447f0ac46172776fedc;
    stim[22] = 122'h00ccb0fd7369fd3534e24d53afea382;
    stim[23] = 122'h1fd5552502254ee31c72b75d2b4fd80;
    stim[24] = 122'h3d0fcb3d50873f57ccc78f6c124580b;
    stim[25] = 122'h1375e66e24c7603f72e38baacd4c00f;
    stim[26] = 122'h025f92cb85a22c9149cda10f90e0e7c;
    stim[27] = 122'h3df9559327f3a3a14b7b2991d6cfb16;
    stim[28] = 122'h26fc2e1fc5222a99d5fd08d72687286;
    stim[29] = 122'h0b7a5c8ce5d1a0282de6378212c982f;
    stim[30] = 122'h163b7caf246fffc86fe5f89c4824109;
    stim[31] = 122'h107e4b69be6c2208b145c3469677588;
    stim[32] = 122'h06895c95b55e7a35d5e0b7d5cc29b12;
    stim[33] = 122'h330bdaa84785754931cdaf57132234e;
    stim[34] = 122'h1f2b2bdc2e3e4aed9dfc6474e3fb498;
    stim[35] = 122'h0c4f0695d1921816694c32e6aed34ec;
    stim[36] = 122'h21ed5862239632bc9febd3c39c6c476;
    stim[37] = 122'h02ee75bf0ad5127df4d93e1ae4e690a;
    stim[38] = 122'h27cc00199d25c1a3fb6a9f3cd037a8f;
    stim[39] = 122'h178350675df287fa7bf496915e94922;
    stim[40] = 122'h2b8f2470246063ce50f0ffd819a907b;
    stim[41] = 122'h2f97f28ba34cb522b94f96b7d08c99e;
    stim[42] = 122'h319dc37881a59617d6fa1ed85c33876;
    stim[43] = 122'h3102d04a734d74cc0cc94cff1d945be;
    stim[44] = 122'h03ef7a2b7f93d7fd0c642ccf4a65e15;
    stim[45] = 122'h02c94ad966c12da58346dfc53b9d91c;
    stim[46] = 122'h0ddfaa51e01ce1066f7d700e982db88;
    stim[47] = 122'h33a3a92b80999aaa37f72489092f906;
    stim[48] = 122'h35ecd2b0b38192aec64e13f4a265d53;
    stim[49] = 122'h24c9030ca8fee369c2ec6299281b037;
    stim[50] = 122'h38a049db8990f04b7be02c90184f42b;
    stim[51] = 122'h16a413fae3257aed9359898b84a5a41;
    stim[52] = 122'h35d6c6682e15af0f00ee592a2f74ab5;
    stim[53] = 122'h086ca3eedf5839042af002c6b21e135;
    stim[54] = 122'h018deeecd5cd81c0286061394be612e;
    stim[55] = 122'h02450c8f60fcc1ee20f9e222cbac547;
    stim[56] = 122'h35e8a004d39bd861c3575e3f285e150;
    stim[57] = 122'h0ace63f8071d213bb1e348c9f78300a;
    stim[58] = 122'h082c444e1745640fffc20286c9b256d;
    stim[59] = 122'h063ba84e34f54c6a584951307c603be;
    stim[60] = 122'h2af42547e6580260bcc9b766ad5ed6a;
    stim[61] = 122'h081870efa95c49e62f630bf8320d0d0;
    stim[62] = 122'h121a4c6116726163c3d257bc8fc029a;
    stim[63] = 122'h234e07d95504a3d8017b346e4d5c34f;
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
      expv[0] = 53'h02ef5906411c83;
      expv[1] = 53'h047066ccc58bf4;
      expv[2] = 53'h01aa007df04c33;
      expv[3] = 53'h0179f72480d06e;
      expv[4] = 53'h025861a97edf60;
      expv[5] = 53'h0380e0ac8d508f;
      expv[6] = 53'h04771bb4427927;
      expv[7] = 53'h050a905a35c3fc;
      expv[8] = 53'h07d7e2d87d44bb;
      expv[9] = 53'h0561e0b8ed6997;
      expv[10] = 53'h0043aaf9247d23;
      expv[11] = 53'h05726bf079c8f6;
      expv[12] = 53'h03d0ee497e5d23;
      expv[13] = 53'h02e78d4e34ca74;
      expv[14] = 53'h06fe650e49d5ca;
      expv[15] = 53'h06e88d54de8a74;
      expv[16] = 53'h071baa03af5689;
      expv[17] = 53'h05d9f218f582dc;
      expv[18] = 53'h059b5b7f4bebf4;
      expv[19] = 53'h05d413e7b74bb5;
      expv[20] = 53'h00adaaf3f9d4ea;
      expv[21] = 53'h070cf58860e57a;
      expv[22] = 53'h0019961fac7a05;
      expv[23] = 53'h03faaaa4a1ced0;
      expv[24] = 53'h07a1f967aee678;
      expv[25] = 53'h026ebccdc67927;
      expv[26] = 53'h004bf25970c47a;
      expv[27] = 53'h07bf2ab265c5da;
      expv[28] = 53'h04df85c3fd4a95;
      expv[29] = 53'h016f4b919ed668;
      expv[30] = 53'h02c76f95e25729;
      expv[31] = 53'h020fc96d305827;
      expv[32] = 53'h00d12b92b4ca54;
      expv[33] = 53'h06617b550c5827;
      expv[34] = 53'h03e5657b814eb1;
      expv[35] = 53'h0189e0d2b8542b;
      expv[36] = 53'h043dab0c444f11;
      expv[37] = 53'h005dceb7e5fae4;
      expv[38] = 53'h04f9800336dd62;
      expv[39] = 53'h02f06a0cedddc2;
      expv[40] = 53'h0571e48e0768b7;
      expv[41] = 53'h05f2fe5174dc62;
      expv[42] = 53'h0633b86f15ebd4;
      expv[43] = 53'h06205a094c6639;
      expv[44] = 53'h007def456ac658;
      expv[45] = 53'h0059295b28c17e;
      expv[46] = 53'h01bbf54a39d7e8;
      expv[47] = 53'h0674752575dbc4;
      expv[48] = 53'h06bd9a5616c35c;
      expv[49] = 53'h0499206196611f;
      expv[50] = 53'h0714093b765d23;
      expv[51] = 53'h02d4827f5bc9d6;
      expv[52] = 53'h06bad8cd02e05e;
      expv[53] = 53'h010d947ddb758b;
      expv[54] = 53'h0031bddd9c542b;
      expv[55] = 53'h0048a191ef708f;
      expv[56] = 53'h06bd140099419f;
      expv[57] = 53'h0159cc7f045827;
      expv[58] = 53'h01058889c25f21;
      expv[59] = 53'h00c77509c44c33;
      expv[60] = 53'h055e84a8fcfe60;
      expv[61] = 53'h01030e1df05709;
      expv[62] = 53'h0243498c2541bf;
      expv[63] = 53'h0469c0fb2f40bf;
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
