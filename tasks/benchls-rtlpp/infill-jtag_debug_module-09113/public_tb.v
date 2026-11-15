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

  rtlpp_09113 dut (
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
    stim[0] = 122'h1d21bdbf87c71f5d3e84e9ca2615717;
    stim[1] = 122'h392cb29780372389e0801f0c1c11f35;
    stim[2] = 122'h1ad2895c878600d68577d6dac84e8fb;
    stim[3] = 122'h045b81e0a541a88699dc506f9b9eca0;
    stim[4] = 122'h2f3e12827206bc806c6b783d6b77e0e;
    stim[5] = 122'h032fc5bd4ad808f8c8f0894d03a6b70;
    stim[6] = 122'h2b6994193c68b5be905434a1fe4ff39;
    stim[7] = 122'h07fc0eaf11392cd0e65eb58a23da2d3;
    stim[8] = 122'h04d96d96a83ecff667fe8f093746546;
    stim[9] = 122'h0c569567bedc9251fd622136a7c9fe8;
    stim[10] = 122'h2b943e9db3f3599b48e2e29385f2795;
    stim[11] = 122'h303060be241be9ca7d653495fb72412;
    stim[12] = 122'h3117933c82afe17f8cde66a9cb218e8;
    stim[13] = 122'h0f8484ca758ace3eb4d8ee39c10510a;
    stim[14] = 122'h0a636f2e3745337943f06fc187b9f29;
    stim[15] = 122'h1794b862e4272aa2c85b2d1b324c665;
    stim[16] = 122'h09217b353dc57e2b63c5bbbfb90421e;
    stim[17] = 122'h0fa6a428bb2b6fffc4eb4e6a59969c2;
    stim[18] = 122'h3460e968e35cb9dac568e8e15b58604;
    stim[19] = 122'h3ec0790fc07b94013946a9ea3577596;
    stim[20] = 122'h084a10451cfbc306d8e43a990bd7bbe;
    stim[21] = 122'h01f827cd628027973dc4458f0a3502c;
    stim[22] = 122'h18861a230dc3ddece8ccc54ce63f491;
    stim[23] = 122'h3de031ff6dfaf3ca74587a89736c288;
    stim[24] = 122'h16740054840c711c6c6f4e0d723b207;
    stim[25] = 122'h3f770f2d9860bce1f765a5198fc72b7;
    stim[26] = 122'h31dbf4c36fd3f6a2e1e7dd0ae3ad013;
    stim[27] = 122'h310a397c98fd595f767173b654ad6fd;
    stim[28] = 122'h097ad1fba291fc5b2e754fdd043e23e;
    stim[29] = 122'h0570ecabb386ae47e35d51ff569d556;
    stim[30] = 122'h39cc878da1461c47c4d5ec706ac4767;
    stim[31] = 122'h03e5d60fde4aca1081febf4b980d218;
    stim[32] = 122'h24ed627e58da3fc99c777f0121cc95a;
    stim[33] = 122'h2d5ae3afe9c8a752b7cbdad417b07d5;
    stim[34] = 122'h37283622f515ee31adffc6c2fc25543;
    stim[35] = 122'h1389cac1ad1e0b1b65fc7357a582ecd;
    stim[36] = 122'h31a3b2d57ef80653f76f94faaf07449;
    stim[37] = 122'h0888ab2813c293758a55ec6b7ac041d;
    stim[38] = 122'h09b9974484869349f27b46adf4f3f15;
    stim[39] = 122'h3f584a8e32a21e573957dfae2ebf566;
    stim[40] = 122'h04f9315d41fa9b35cbf01fe039d6852;
    stim[41] = 122'h3c43c6e38c32d1888075878ea17e03f;
    stim[42] = 122'h281ac90ea610ffb6424d79cd3e1779c;
    stim[43] = 122'h23fe9b5b6f371bbaa6e0ef91ad07577;
    stim[44] = 122'h1407054b9f2add19b3fa82429568636;
    stim[45] = 122'h0bccc8022ae589daebc017774b97c33;
    stim[46] = 122'h04cb9d1f3b53cc7995f429518b93a17;
    stim[47] = 122'h18986226a64b920bbdcde4bbdf56a26;
    stim[48] = 122'h030df93c3fcf1546fe412057f4040f7;
    stim[49] = 122'h37bc547d730dac9364ed5d7dac546cd;
    stim[50] = 122'h07a5d355907d49e17ff01874ae3367b;
    stim[51] = 122'h280468ccaead8bbd67736b3a3fc86b5;
    stim[52] = 122'h1e229cf1b7e3522d09f3b45dc08fd7c;
    stim[53] = 122'h08410ba35a48da885bf804b29066411;
    stim[54] = 122'h3357c5fcde8405cdde6ca76258529c5;
    stim[55] = 122'h19982d392d42bcea647ff398d7eb741;
    stim[56] = 122'h03a8d86287ed29a2c0736e0c9094eff;
    stim[57] = 122'h1267de4d255d0263d1dcf000dd8446a;
    stim[58] = 122'h34471be80ecf7fa167f8a2d74ca37ce;
    stim[59] = 122'h199be195113086ff195721aada897e8;
    stim[60] = 122'h1f51233ac16746e6b85a8bc5384fed3;
    stim[61] = 122'h2c23219f668b500e02741f0470f86c1;
    stim[62] = 122'h01b1a6faf1089df036cf1855c1aa8f5;
    stim[63] = 122'h023f9e7866ed2a4ca8cd285705ad096;
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
      expv[0] = 53'h14e5130ab8bxx1;
      expv[1] = 53'h0f860e08f9axxd;
      expv[2] = 53'h0b6d6427479xxf;
      expv[3] = 53'h0837cdcf654xx3;
      expv[4] = 53'h1c1eb5bbf01xx4;
      expv[5] = 53'h04a681d35baxx6;
      expv[6] = 53'h1a50ff27f9cxxb;
      expv[7] = 53'h1ac511ed16dxxd;
      expv[8] = 53'h07849ba32a1xxd;
      expv[9] = 53'h109b53e4ff1xx1;
      expv[10] = 53'h1149c2f93caxx7;
      expv[11] = 53'h1a4afdb9209xx1;
      expv[12] = 53'h1354e590c77xx7;
      expv[13] = 53'h171ce082887xx8;
      expv[14] = 53'h17e0c3dcf90xxf;
      expv[15] = 53'h168d9926334xx6;
      expv[16] = 53'h1ddfdc8210cxxd;
      expv[17] = 53'h07352ccb4e3xxf;
      expv[18] = 53'h1470adac301xxe;
      expv[19] = 53'h14f51abbaccxx0;
      expv[20] = 53'h1d4c85ebddaxx3;
      expv[21] = 53'h02c7851a815xx0;
      expv[22] = 53'h02a6731fa4exx5;
      expv[23] = 53'h1d44b9b6145xx8;
      expv[24] = 53'h0706b91d901xx5;
      expv[25] = 53'h128cc7e3959xx9;
      expv[26] = 53'h0e8571d6808xxc;
      expv[27] = 53'h19db2a56b79xx9;
      expv[28] = 53'h07ee821f119xx5;
      expv[29] = 53'h08ffab4eaacxxd;
      expv[30] = 53'h163835623b7xxf;
      expv[31] = 53'h1fa5cc06908xxe;
      expv[32] = 53'h1f8090e64a9xx2;
      expv[33] = 53'h0d6a0bd83edxx8;
      expv[34] = 53'h03617e12aa1xx4;
      expv[35] = 53'h19abd2c1761xxd;
      expv[36] = 53'h0a7d5783a21xx8;
      expv[37] = 53'h1635bd6020cxx7;
      expv[38] = 53'h0356fa79f88xx9;
      expv[39] = 53'h0fd7175fab4xx1;
      expv[40] = 53'h0ff01ceb428xx6;
      expv[41] = 53'h03c750bf018xxf;
      expv[42] = 53'h1ce69f0bbccxxf;
      expv[43] = 53'h17c8d683abbxxc;
      expv[44] = 53'h01214ab4318xx9;
      expv[45] = 53'h0bbba5cbe1cxx5;
      expv[46] = 53'h14a8c5c9d09xxb;
      expv[47] = 53'h125defab515xx1;
      expv[48] = 53'h102bfa0207dxx1;
      expv[49] = 53'h0ebed62a363xxc;
      expv[50] = 53'h0c3a5719b39xx1;
      expv[51] = 53'h159d1fe4359xxd;
      expv[52] = 53'h1a2ee047eb8xx7;
      expv[53] = 53'h02594833208xx2;
      expv[54] = 53'h13b12c294e1xx2;
      expv[55] = 53'h19cc6bf5ba1xxd;
      expv[56] = 53'h1706484a778xxf;
      expv[57] = 53'h18006ec2234xxb;
      expv[58] = 53'h116ba651be1xxd;
      expv[59] = 53'h10d56d44bf4xx3;
      expv[60] = 53'h05e29c27f6cxx0;
      expv[61] = 53'h0f82387c360xxe;
      expv[62] = 53'h0c2ae0d547fxx8;
      expv[63] = 53'h142b82d684exx4;
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
