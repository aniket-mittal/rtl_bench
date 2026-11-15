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

  rtlpp_11591 dut (
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
    stim[0] = 122'h38fcbf207feeaa178d80707eab120ad;
    stim[1] = 122'h190a4fd7ac3676f2c292b50c662c0c5;
    stim[2] = 122'h08fdfeed3876cda54cf63e6f74ab09f;
    stim[3] = 122'h1c8fdc08e88ef2b18a68cb3cfffd13f;
    stim[4] = 122'h057b30b53fac8d8041e1b6481e23664;
    stim[5] = 122'h34751c158f1438298264dedaecbcc23;
    stim[6] = 122'h26bedc901572ec55d8e68d0ceaed675;
    stim[7] = 122'h158eeabcaf47caca6277db89fbbdee8;
    stim[8] = 122'h1b9d763a55a86119d8ed0a90e4b4cc3;
    stim[9] = 122'h012e08c3bcac04e74e7cbb757496d7b;
    stim[10] = 122'h08551ffdcc531e7c6b22bd972939e11;
    stim[11] = 122'h15a7aca8686048365dc054b978e925f;
    stim[12] = 122'h215776eb165ab7a6dff8f64fe84a57e;
    stim[13] = 122'h2344fe9c081e3ea8d9f6777023307b7;
    stim[14] = 122'h3e797cf0e8408a7d6de8d1115347d7d;
    stim[15] = 122'h30586db74b527af1a64e1919a7a85c4;
    stim[16] = 122'h06a87dbe9c3d4df163c5555b3ca6294;
    stim[17] = 122'h2a80c80cdd01f4cb2571b026c7e2cdd;
    stim[18] = 122'h129b5792af09045a79ee9ab55364795;
    stim[19] = 122'h0651480ef3ff30bb8174c58a5a2ba12;
    stim[20] = 122'h35335f79657d2ec566ee876e8b909b1;
    stim[21] = 122'h3cd3c59d98c4696275c7300b1cd38b4;
    stim[22] = 122'h033773a55148c63b08ff434e112d62d;
    stim[23] = 122'h297df53db1b79bb4bce9ef7b7983142;
    stim[24] = 122'h3702ce4fd42d126ee8f922180d4b7ee;
    stim[25] = 122'h2a021e7571adef0b1462779d3620b37;
    stim[26] = 122'h3e2f1babbcf0a28ad2ce229220e27c3;
    stim[27] = 122'h32576f5c2ab0ddeb11d802fce0c7bab;
    stim[28] = 122'h212b7077de1ca11dde7a06302c1fa5f;
    stim[29] = 122'h29fe53905c6a72fab27b643cebda264;
    stim[30] = 122'h1f5cc9db304b1afa75c9030d6d67bb7;
    stim[31] = 122'h2712e91d42048886c65191dfec0ec7a;
    stim[32] = 122'h1ce67005cb33ad975f744b673117b3a;
    stim[33] = 122'h1743f443cbd6e80d84c1685adf91ba7;
    stim[34] = 122'h3912d148dd7d9ecbf8eb2c33dd38d4c;
    stim[35] = 122'h06a1e8ba3951bdc1cee8f79056501e7;
    stim[36] = 122'h2e761ac74bc9bce6ae489bacf5e9a14;
    stim[37] = 122'h09aaa8f6bed99b563277369294d52cf;
    stim[38] = 122'h041133b1cc043c9cbee4b2039ad8d0e;
    stim[39] = 122'h1f91cdf185f32e3405dc3c05c804869;
    stim[40] = 122'h1838a2c231bcbb70c85022e63a2690d;
    stim[41] = 122'h34f6df004eb94f9cd46749be784ac05;
    stim[42] = 122'h24e08129659b4a2172f8af36cc77c71;
    stim[43] = 122'h0b1ed672b1bacd8c754e6a4ef2993a6;
    stim[44] = 122'h04dd9e60dfbf44b36d593584e9d436a;
    stim[45] = 122'h06e45d9568baf7b37bc7e6b8d9e46f9;
    stim[46] = 122'h03ba77483e88e6e108df06c8b741819;
    stim[47] = 122'h07c44c2e433237e7f0fe3fe86731bbb;
    stim[48] = 122'h32f4697509b141a9b2cb27366eef506;
    stim[49] = 122'h290659795a643e2185fffe70d00fbc9;
    stim[50] = 122'h3f229a7e847885e4266afbc21d2ea9a;
    stim[51] = 122'h0adc7da1e7258e5e7fecad05a2a8c21;
    stim[52] = 122'h3a2066ee4c07b0aebf4c56817d46d32;
    stim[53] = 122'h0fa01d62daa55e9815458a3e9abc1ab;
    stim[54] = 122'h275e916de010c7bc5c557019fff84de;
    stim[55] = 122'h1a15a08e00d4f59d6857131dcedb841;
    stim[56] = 122'h2f9475f926965b324ad7c98a4a45a78;
    stim[57] = 122'h2512dff27811bb3528dcffd42f7867a;
    stim[58] = 122'h3da5211015f6ecc0d25e89218ace40e;
    stim[59] = 122'h061e0c1fc1facb94c5fc63c10f5a79c;
    stim[60] = 122'h24564a649232d4e331dbc6778270619;
    stim[61] = 122'h1395acc07f78bf8315d5ed0280a6690;
    stim[62] = 122'h25c4d05bb69ae838d2d4cd2817f4aa3;
    stim[63] = 122'h1a903df340d848a565c0844e6552cc3;
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
      expv[0] = 53'hxxx1f97e408007;
      expv[1] = 53'hxxx2149faf2008;
      expv[2] = 53'hxxx1fbfdda2007;
      expv[3] = 53'hxxx91fb8118004;
      expv[4] = 53'hxxxaf6616a000b;
      expv[5] = 53'hxxx8ea382b0003;
      expv[6] = 53'hxxxd7db9202015;
      expv[7] = 53'hxxxb1dd579000c;
      expv[8] = 53'hxxx73aec74a01c;
      expv[9] = 53'hxxx25c11870009;
      expv[10] = 53'hxxx0aa3ffb8002;
      expv[11] = 53'hxxxb4f5950c00d;
      expv[12] = 53'hxxx2aeedd6000a;
      expv[13] = 53'hxxx689fd38001a;
      expv[14] = 53'hxxxcf2f9e18013;
      expv[15] = 53'hxxx0b0db6ec002;
      expv[16] = 53'hxxxd50fb7d4015;
      expv[17] = 53'hxxx50190198014;
      expv[18] = 53'hxxx536af250014;
      expv[19] = 53'hxxxca2901d8012;
      expv[20] = 53'hxxxa66bef2a009;
      expv[21] = 53'hxxx9a78b3b4006;
      expv[22] = 53'hxxx66ee74aa019;
      expv[23] = 53'hxxx2fbea7b200b;
      expv[24] = 53'hxxxe059c9fa018;
      expv[25] = 53'hxxx4043cea8010;
      expv[26] = 53'hxxxc5e37576011;
      expv[27] = 53'hxxx4aedeb84012;
      expv[28] = 53'hxxx256e0ef8009;
      expv[29] = 53'hxxx3fca720800f;
      expv[30] = 53'hxxxeb993b6401a;
      expv[31] = 53'hxxxe25d23ac018;
      expv[32] = 53'hxxx9cce00b8007;
      expv[33] = 53'hxxxe87e887e01a;
      expv[34] = 53'hxxx225a291a008;
      expv[35] = 53'hxxxd43d1742015;
      expv[36] = 53'hxxxcec358ec013;
      expv[37] = 53'hxxx35551ed000d;
      expv[38] = 53'hxxx8226763a000;
      expv[39] = 53'hxxxf239be3401c;
      expv[40] = 53'hxxx07145844001;
      expv[41] = 53'hxxx9edbe008007;
      expv[42] = 53'hxxx9c10252a007;
      expv[43] = 53'hxxx63dace54018;
      expv[44] = 53'hxxx9bb3cc1c006;
      expv[45] = 53'hxxxdc8bb2ac017;
      expv[46] = 53'hxxx774ee90601d;
      expv[47] = 53'hxxxf88985ca01e;
      expv[48] = 53'hxxx5e8d2ea6017;
      expv[49] = 53'hxxx20cb2f28008;
      expv[50] = 53'hxxxe4534fd0019;
      expv[51] = 53'hxxx5b8fb438016;
      expv[52] = 53'hxxx440cddcc011;
      expv[53] = 53'hxxxf403ac5c01d;
      expv[54] = 53'hxxxebd22dbc01a;
      expv[55] = 53'hxxx42b411c4010;
      expv[56] = 53'hxxxf28ebf2601c;
      expv[57] = 53'hxxxa25bfe4e008;
      expv[58] = 53'hxxxb4a4220400d;
      expv[59] = 53'hxxxc3c183f8010;
      expv[60] = 53'hxxx8ac94c94002;
      expv[61] = 53'hxxx72b5980c01c;
      expv[62] = 53'hxxxb89a0b7600e;
      expv[63] = 53'hxxx5207be6c014;
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
