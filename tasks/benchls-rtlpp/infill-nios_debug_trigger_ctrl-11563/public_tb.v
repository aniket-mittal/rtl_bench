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

  rtlpp_11563 dut (
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
    stim[0] = 122'h1b5c989f3ef367884e073d45f62bc5c;
    stim[1] = 122'h341ecc5d3d3fbc10cd3ef98bf9ac6bd;
    stim[2] = 122'h01c994117993019d14e3e3c0a118f5f;
    stim[3] = 122'h369c8e9004b8dff73ecf0c146e86c2d;
    stim[4] = 122'h26bbd5a96a92709199e10f3e85f3310;
    stim[5] = 122'h1006c0cc2328839581ed5c94286f3ad;
    stim[6] = 122'h097f15e15aed2dd4f2581241724e846;
    stim[7] = 122'h3ac9d8b014f92265a1d87b4324dc9e1;
    stim[8] = 122'h05efcc5a881063d58266de1c82884d7;
    stim[9] = 122'h0bb8a0e4b1dc3aa4f9596cce5082843;
    stim[10] = 122'h097a0ef7eea034b5bfe8a3780861518;
    stim[11] = 122'h1b2feedc03e448f166e63e4821dae84;
    stim[12] = 122'h26ac2458d9a8814b2af62662dd46545;
    stim[13] = 122'h17184cd6f3582e70effbb3254bfabf8;
    stim[14] = 122'h2a93e7ff3ec1ce4d706b508fef09a7e;
    stim[15] = 122'h0b65ae3c61490acd4fc9df9d1bd80e5;
    stim[16] = 122'h39475a50c76b5275f6f8ef7d7351504;
    stim[17] = 122'h1a1a06fa2ed52016dfdea295b76a504;
    stim[18] = 122'h3ae8dd69c590dbe680f09c3ef9391de;
    stim[19] = 122'h2f867d04d39517d14c61edfbf0126a0;
    stim[20] = 122'h1470635c51c932f1ccfee6d01c5e5f9;
    stim[21] = 122'h0d7deea2e268cb3c12cf90b556c678f;
    stim[22] = 122'h2d300755069bbef0b3781c3845d0a42;
    stim[23] = 122'h169553e140f6bafe2de9fbcdff802b2;
    stim[24] = 122'h20128d3f400dadf03f6b44ed4b3d599;
    stim[25] = 122'h20028d7a59db9902e157d56a0586a37;
    stim[26] = 122'h3da96a59e71f197139766c98c06d025;
    stim[27] = 122'h10a801f91784ca6b7feccbe3e2ae96a;
    stim[28] = 122'h1b7f88a086ea083dfcd224299286003;
    stim[29] = 122'h0bbaadf37bbdd64bc3e18be4acaf885;
    stim[30] = 122'h052ea0ce452a515448ebe672f875ff1;
    stim[31] = 122'h1c52f65d304795edb8cf7ab300087b7;
    stim[32] = 122'h127fd8e2d0c1e339bbf26be532748e5;
    stim[33] = 122'h3fc90c3d64da6d1873d949c4d3d43b6;
    stim[34] = 122'h3172e213e5654a493b6298d8099800c;
    stim[35] = 122'h31521f76a9649e09c7f18b04edef50e;
    stim[36] = 122'h09da12bd348739a5c8602aa629cb483;
    stim[37] = 122'h2cee2c07c543a7f3ab7c3a7df02257a;
    stim[38] = 122'h1eba3a40e5052558087ef6de3f8bb7b;
    stim[39] = 122'h07147a92b4d94e0c47f3994ce563e80;
    stim[40] = 122'h1bd236b59e1bd78c654a78e5b009a19;
    stim[41] = 122'h2313a5b5a60de8d37e625e538351987;
    stim[42] = 122'h044e355eb392aa972f6df466ceaa83d;
    stim[43] = 122'h17df17ead648642115c09c635262ff0;
    stim[44] = 122'h2dca2b93de84bdce5efd0bd413807b0;
    stim[45] = 122'h2357a1bfad1cd0f14bf79dda76b3d4f;
    stim[46] = 122'h129329fcd233b83cb1686346e6db8b1;
    stim[47] = 122'h2631e71e27a89c1b865e03d0c05ac51;
    stim[48] = 122'h13c17038fdba265332cd702d3f86d2b;
    stim[49] = 122'h30e118b2dec14050464e9ff528321fd;
    stim[50] = 122'h37b263bb1e06fb290f5e1a7c03e56cc;
    stim[51] = 122'h308e11e7b0ed500453d048ae6624767;
    stim[52] = 122'h215c29694c46aa6d25437e918c2e893;
    stim[53] = 122'h09aae13d5649e6ed18667a77f98fecd;
    stim[54] = 122'h268de8176f5e79e8d1c7ef15fc0a3fb;
    stim[55] = 122'h2f9581ba9af1d2651b7792254da02eb;
    stim[56] = 122'h3f1cd3b558b6eb477d54008e2b0db41;
    stim[57] = 122'h23e9092ee6a0b5f5264dae0998635bf;
    stim[58] = 122'h02b03c30e716217eb96b937df6f3b47;
    stim[59] = 122'h122f0ff04797dab634ed744d8f765e1;
    stim[60] = 122'h216dec512ead37c28f715e9e2c03dee;
    stim[61] = 122'h0e1ac0d028bea81a8686f83e9e153aa;
    stim[62] = 122'h20053a6c5069bfb2ba532902465071d;
    stim[63] = 122'h10ca0f677112a2c79357a0df58aaaa1;
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
      expv[0] = 53'h0e7a8bec57001f;
      expv[1] = 53'h1df317f3588917;
      expv[2] = 53'h07c78142314817;
      expv[3] = 53'h1e1828dd0d6817;
      expv[4] = 53'h021e7d0be6401f;
      expv[5] = 53'h1ab92850de4917;
      expv[6] = 53'h102482e49dd609;
      expv[7] = 53'h10f68649b9c917;
      expv[8] = 53'h0dbc3905104917;
      expv[9] = 53'h12d99ca105d20d;
      expv[10] = 53'h1146f010c2401f;
      expv[11] = 53'h0c7c9043b5601f;
      expv[12] = 53'h0c4cc5ba8ce817;
      expv[13] = 53'h17664a97f5c01f;
      expv[14] = 53'h16a11fde13401f;
      expv[15] = 53'h13bf3a37b04817;
      expv[16] = 53'h11defae6a2e01f;
      expv[17] = 53'h1d452b6ed4c01f;
      expv[18] = 53'h01387df272c01f;
      expv[19] = 53'h03dbf7e024401f;
      expv[20] = 53'h1dcda038bcc917;
      expv[21] = 53'h1f216aad8c700f;
      expv[22] = 53'h1038708ba1c01f;
      expv[23] = 53'h13f79bff00401f;
      expv[24] = 53'h1689da967a4817;
      expv[25] = 53'h0faad40b0dd20d;
      expv[26] = 53'h0cd93180dac817;
      expv[27] = 53'h1997c7c55d401f;
      expv[28] = 53'h044853250cd20d;
      expv[29] = 53'h0317c9595f4917;
      expv[30] = 53'h17cce5f0eb4817;
      expv[31] = 53'h1ef5660010500f;
      expv[32] = 53'h04d7ca64e9c917;
      expv[33] = 53'h129389a7a8d609;
      expv[34] = 53'h0531b01330401f;
      expv[35] = 53'h031609dbdec01f;
      expv[36] = 53'h00554c53964917;
      expv[37] = 53'h1874fbe044c01f;
      expv[38] = 53'h1dedbc7f17c817;
      expv[39] = 53'h073299cac7c01f;
      expv[40] = 53'h14f1cb60134817;
      expv[41] = 53'h04bca706a34817;
      expv[42] = 53'h1be8cd9d554817;
      expv[43] = 53'h0138c6a4c5401f;
      expv[44] = 53'h1a17a82700e01f;
      expv[45] = 53'h0f3bb4ed67c817;
      expv[46] = 53'h10c68dcdb74917;
      expv[47] = 53'h1c07a180b5c917;
      expv[48] = 53'h1ae05a7f0d700f;
      expv[49] = 53'h1d3fea50644817;
      expv[50] = 53'h1c34f807cac01f;
      expv[51] = 53'h00915ccc48d20d;
      expv[52] = 53'h06fd23185d500f;
      expv[53] = 53'h0cf4eff31f4817;
      expv[54] = 53'h0fde2bf814520d;
      expv[55] = 53'h0f244a9b40c817;
      expv[56] = 53'h08011c561bc817;
      expv[57] = 53'h1b5c1330c6500f;
      expv[58] = 53'h1726fbede74917;
      expv[59] = 53'h1ae89b1eec4817;
      expv[60] = 53'h02bd3c5807c01f;
      expv[61] = 53'h0df07d3c2a340b;
      expv[62] = 53'h0652048ca0c917;
      expv[63] = 53'h0f41beb155c917;
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
