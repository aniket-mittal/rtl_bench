// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00546 dut (
    .tck(clk),
    .MonDReg(in_vec[128:97]),
    .break_readreg(in_vec[96:65]),
    .dbrk_hit0_latch(in_vec[64:64]),
    .dbrk_hit1_latch(in_vec[63:63]),
    .dbrk_hit2_latch(in_vec[62:62]),
    .dbrk_hit3_latch(in_vec[61:61]),
    .debugack(in_vec[60:60]),
    .ir_in(in_vec[59:58]),
    .jtag_state_rti(in_vec[57:57]),
    .monitor_error(in_vec[56:56]),
    .monitor_ready(in_vec[55:55]),
    .reset_n(in_vec[54:54]),
    .resetlatch(in_vec[53:53]),
    .tdi(in_vec[52:52]),
    .tracemem_on(in_vec[51:51]),
    .tracemem_trcdata(in_vec[50:15]),
    .tracemem_tw(in_vec[14:14]),
    .trc_im_addr(in_vec[13:7]),
    .trc_on(in_vec[6:6]),
    .trc_wrap(in_vec[5:5]),
    .trigbrktype(in_vec[4:4]),
    .trigger_state_1(in_vec[3:3]),
    .vs_cdr(in_vec[2:2]),
    .vs_sdr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .ir_out(out_vec[42:41]),
    .jrst_n(out_vec[40:40]),
    .sr(out_vec[39:2]),
    .st_ready_test_idle(out_vec[1:1]),
    .tdo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h0ef4aec66ea7a3bc6cd9db9b094e0b810;
    stim[1] = 129'h01d52110f4fb9c6d003221283c08c5bb2;
    stim[2] = 129'h163ce44c6f46498170759f980dd92752d;
    stim[3] = 129'h1455612dc02e0942fffedacefdcf1baf5;
    stim[4] = 129'h07b0900cd60d472c1f9e409cb6830162e;
    stim[5] = 129'h181573d64d01b688f667899633894f7fb;
    stim[6] = 129'h1a1901b8c5f0facc68972eed39e3ebff4;
    stim[7] = 129'h0a5cd5d152f3104a7af7128dde39d96a8;
    stim[8] = 129'h008eee4d5ccb09d70b7411a7d37c86a92;
    stim[9] = 129'h14c06950ad202c5109d4bf51d67db2565;
    stim[10] = 129'h0515d2b09c1422f6630f216d2ec1dad5d;
    stim[11] = 129'h1e7b08e835dcc432d42f25f493ed159d9;
    stim[12] = 129'h151f49c8c7b062c26b3dd0e965f87aff1;
    stim[13] = 129'h1dfdb894fb68107e5fd4112bce059cf05;
    stim[14] = 129'h0d9662347629bf8439be7ef8ae2796997;
    stim[15] = 129'h09790cd319dd29a06c426d126a5e8bda1;
    stim[16] = 129'h07934a7d697f21c68e645d3d317e15897;
    stim[17] = 129'h03c2e3ad91b813573d3c30f7857238962;
    stim[18] = 129'h18847de54a3a2c7ef405afb5ab6b70031;
    stim[19] = 129'h06e2998a278a4f764e0f7dd801cf646f6;
    stim[20] = 129'h15f184651ac8925977ef0b1eec052f4f1;
    stim[21] = 129'h123d56b25f25abf507c45fa9cff712179;
    stim[22] = 129'h16ea2d48b0f3c635d6dfccd64b50bf5db;
    stim[23] = 129'h05d92acb760e7b7e185c5bb327047b21c;
    stim[24] = 129'h0beabb3f946af40268a6c1829cd1fb59a;
    stim[25] = 129'h0bd20b6fdd57eaaacce40b8062608a5d0;
    stim[26] = 129'h11d31ebec411da75b46f330c7e98fb037;
    stim[27] = 129'h1b5a5a45dbdeba9c26154cc02e3d85de1;
    stim[28] = 129'h1942e0cfed3027dd938c6bba32ad5dea9;
    stim[29] = 129'h1398abe6f7527f13b3ec7e225302d0dac;
    stim[30] = 129'h0138dd8bbc39854fa0c727bb5e527bbb3;
    stim[31] = 129'h1354e0e8eb472c3253a41703f0db49337;
    stim[32] = 129'h1455cffeb61d7b6541f7e9a7292186872;
    stim[33] = 129'h094bf1eab13626d94256ff981db550102;
    stim[34] = 129'h19da41c5eb3cce1eb177ebfcc7d5d6077;
    stim[35] = 129'h15156e223c78e2cfd53e4f9a8b30a6147;
    stim[36] = 129'h09f110e3b4022a0f408df446208a73304;
    stim[37] = 129'h0f4a812f0c671af8b6556445292570543;
    stim[38] = 129'h05ef4e1b9d9826ef9d97e8f7724b83f19;
    stim[39] = 129'h12b4774e418cad8706fd5aa2cd54ac1cd;
    stim[40] = 129'h1a6f05e45eea995f3987e3c0b1859db3b;
    stim[41] = 129'h10448d2c807399946c95871092f5e3c3a;
    stim[42] = 129'h17d8934f533622abd917363cd9d6dc156;
    stim[43] = 129'h19d15377787a4e2ad7058555694eaf41f;
    stim[44] = 129'h08eb22e80b89ea0225ec7bbce81d79520;
    stim[45] = 129'h08df6423af2d4e1ffc9d8357d07632b7f;
    stim[46] = 129'h1380034674d53768b8474f7e8e73eecb3;
    stim[47] = 129'h1593061f333bbfaa54f72530bcdad419d;
    stim[48] = 129'h0b0cef85851d8d5152fe66e0bcbe8223e;
    stim[49] = 129'h103d081e7827e3db691cdd4322401fa74;
    stim[50] = 129'h08f5b7a3a67b6f92511fad5bc0b3a3e69;
    stim[51] = 129'h1319202b4ffe864098cd44282972265d3;
    stim[52] = 129'h1165043ef6b554c1b185aeb5325ef9f4f;
    stim[53] = 129'h101945bb6b2f8b255f2ca63ae7646cdef;
    stim[54] = 129'h11c87322614ad076d694f682d535f4e03;
    stim[55] = 129'h0d5dbbbee2f0a2b3662cc612d2ccee9d5;
    stim[56] = 129'h15fe59e0dd831e6eefbc5010d04809ee6;
    stim[57] = 129'h19f5f748923c9429d2ed5a1beea7f63bd;
    stim[58] = 129'h0171d5570daac800e86ddfb54467f0f3e;
    stim[59] = 129'h1239290a172230200d34b9f3fea5153f1;
    stim[60] = 129'h06223d2f42841f5cd3efbb00486ad805d;
    stim[61] = 129'h003b9cf24b4f0791539e95327edda3a89;
    stim[62] = 129'h06d248f1a888b42ecec60370a8eca0125;
    stim[63] = 129'h02e6ee4114eafce69515c3a25ad003a19;
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
      expv[0] = 43'h0xxxxxxxxxx;
      expv[1] = 43'h0xxxxxxxxxx;
      expv[2] = 43'h1xxxxxxxxxx;
      expv[3] = 43'h1cfcc06ec92;
      expv[4] = 43'h1cfcc04075d;
      expv[5] = 43'h167e60003af;
      expv[6] = 43'h1b3f30201d5;
      expv[7] = 43'h1117c3eb31f;
      expv[8] = 43'h1117c3eb31f;
      expv[9] = 43'h108be1f598d;
      expv[10] = 43'h108be1c04ad;
      expv[11] = 43'h1294574ac22;
      expv[12] = 43'h1294574ac22;
      expv[13] = 43'h1294574ac20;
      expv[14] = 43'h129457401e2;
      expv[15] = 43'h014a2b800f0;
      expv[16] = 43'h114a2b800f2;
      expv[17] = 43'h10a515c007a;
      expv[18] = 43'h10528ae003d;
      expv[19] = 43'h10528ae003d;
      expv[20] = 43'h1a29457001f;
      expv[21] = 43'h1a29457001d;
      expv[22] = 43'h1a29457001d;
      expv[23] = 43'h1d14a2b800d;
      expv[24] = 43'h12dd993823f;
      expv[25] = 43'h116ecc9c11f;
      expv[26] = 43'h116ecc9c11f;
      expv[27] = 43'h18b7666e08d;
      expv[28] = 43'h18b7666e08d;
      expv[29] = 43'h18b7666e08f;
      expv[30] = 43'h18b766401b8;
      expv[31] = 43'h1c5bb3200df;
      expv[32] = 43'h162dd99006f;
      expv[33] = 43'h1b16ecc8035;
      expv[34] = 43'h158b766401a;
      expv[35] = 43'h1ac5bb3200f;
      expv[36] = 43'h1562dd99005;
      expv[37] = 43'h105008a83d0;
      expv[38] = 43'h1a2804541e8;
      expv[39] = 43'h1a2804541ea;
      expv[40] = 43'h1a280440035;
      expv[41] = 43'h1d140220018;
      expv[42] = 43'h1e8a011000d;
      expv[43] = 43'h1f450088005;
      expv[44] = 43'h1fa28044002;
      expv[45] = 43'h1fa28044000;
      expv[46] = 43'h1fd14022000;
      expv[47] = 43'h1fe8a011002;
      expv[48] = 43'h1fe8a000032;
      expv[49] = 43'h17f45000018;
      expv[50] = 43'h1540f42079d;
      expv[51] = 43'h1540f42079d;
      expv[52] = 43'h1aa07a103cd;
      expv[53] = 43'h1d503d281e7;
      expv[54] = 43'h16a81e940f0;
      expv[55] = 43'h11540f4a07a;
      expv[56] = 43'h103576eefba;
      expv[57] = 43'h101abb777df;
      expv[58] = 43'h101abb4047a;
      expv[59] = 43'h180d5da023f;
      expv[60] = 43'h180d5da023f;
      expv[61] = 43'h180d5d80005;
      expv[62] = 43'h180d5d80005;
      expv[63] = 43'h180d5d80028;
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
