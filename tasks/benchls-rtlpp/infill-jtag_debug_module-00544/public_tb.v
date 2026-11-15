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

  rtlpp_00544 dut (
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
    stim[0] = 129'h0bc8c44caf918f06498bb563301270d06;
    stim[1] = 129'h110b963ff5fb1fe069db68752c51a934d;
    stim[2] = 129'h13e65ccc15510638bb2075bbd36d7842f;
    stim[3] = 129'h0bb8173399c22694ceb76dfd0ad266b0e;
    stim[4] = 129'h05b8ffc19191092fce079adf47090dc2e;
    stim[5] = 129'h083e8216df2af8e3e15740ca3357a9b20;
    stim[6] = 129'h1155e4d0ae3063010dec44de31fef7985;
    stim[7] = 129'h026d2aa8a0b1fe355e94a9c5b4c5ee5d6;
    stim[8] = 129'h1c0558848d59d9e673bedec8d2ce8ea58;
    stim[9] = 129'h18849b748ef4dc96560fe6558df5021a9;
    stim[10] = 129'h0ec005415f1d6d5fd415d0356ea579ffe;
    stim[11] = 129'h12691b197950216aca36aee0529e1dd7f;
    stim[12] = 129'h0ddf373b214d9a64d9ec6e655741c8668;
    stim[13] = 129'h12771b844425565f34e422816df1bce55;
    stim[14] = 129'h01be9ad5cbb15a39abd6848aa572cb055;
    stim[15] = 129'h1e64c330fa5da49ec676215dff9e7dd05;
    stim[16] = 129'h0b0c509cd82337d78cfeeac1a5c10b1aa;
    stim[17] = 129'h1ec54791bc6b416def0755cabe8c810ed;
    stim[18] = 129'h180acdef2ce4242b584d45644fd66a11c;
    stim[19] = 129'h131ad7e3a43ddd8482752b215b2b46cb2;
    stim[20] = 129'h09dbe955a6b2a9d0b9841ab26d56c5847;
    stim[21] = 129'h0d6e93b7dcb65f4db7e46ebbd3d4d7a70;
    stim[22] = 129'h05c5a2a7a3c6cb5cfc34398ea700f32a0;
    stim[23] = 129'h10b6af19ca890019d54d7b90bccec89fa;
    stim[24] = 129'h0051a5f31c6c29e9a09616d1f5b861b94;
    stim[25] = 129'h079a495db11f791bee3e42aa1ccfd7fca;
    stim[26] = 129'h12e1bb11db5b1ddeeaa7bc47c77549706;
    stim[27] = 129'h092edad929c8fc3ab2c542670b6d807e8;
    stim[28] = 129'h0f9ea0453fa4cc8c749c5021a4363a47e;
    stim[29] = 129'h104da75f0d6e382f94edec9e04d7ced3a;
    stim[30] = 129'h05e14aca5bef8d97a75896df77b3cf3b4;
    stim[31] = 129'h1e15bb597ed18df9e61e663dfef3aa596;
    stim[32] = 129'h11ee54b464bc363198478b230fb338a86;
    stim[33] = 129'h050a58d5efcceca61e8eea48a928a308c;
    stim[34] = 129'h134ad5d6bae4840b47bc6df0a7a4f6d3c;
    stim[35] = 129'h05d8fee3ba220ef9082f8e6a05e0038b5;
    stim[36] = 129'h1b57d2355ca0149a597c1fe87de122686;
    stim[37] = 129'h09941c6ff10cd092d387cc124f1bf7b4d;
    stim[38] = 129'h16c74eb16f49a7b46b753a0324d3425f9;
    stim[39] = 129'h0ed8ce31686ee495256d30944541c1867;
    stim[40] = 129'h0cc3974a2a83af716a5ee721d0eaccddd;
    stim[41] = 129'h0fe641a468df0e169805f8e8b5ed50bc3;
    stim[42] = 129'h00c2b3efd6f56720db8726f5cd98a8c4a;
    stim[43] = 129'h17102994334b837fe75daed7bc36052c5;
    stim[44] = 129'h0882cee296cfb10e4a33beccfc056b2a8;
    stim[45] = 129'h09b9969b76fef6a5b264b35147a4f630c;
    stim[46] = 129'h0169a58df9762b5ee705c63edadb8476c;
    stim[47] = 129'h17259c05bd545c711def25cb70ba20276;
    stim[48] = 129'h1d5705a719bd25a4a3ff6c4ed5a209a42;
    stim[49] = 129'h0ee7a69155c7e582068c1a1d6e7399283;
    stim[50] = 129'h1bdc0baa9aa4098b476ea5bc88e6fc056;
    stim[51] = 129'h02063af9ef76a2a7762476d90ec7fcd62;
    stim[52] = 129'h1bc1eaa1e10ded5696559a5c003f912dd;
    stim[53] = 129'h1f60e6a002426f6b741c2175db60d6d5c;
    stim[54] = 129'h09311fb785be25ec0557332b42a0fbbea;
    stim[55] = 129'h1c9f6f570c8fc10d19a4775f0c525d1a8;
    stim[56] = 129'h1473e6dbcb41cd3c5b0766fef1dc8d5b9;
    stim[57] = 129'h063356f505120ec9d4a6d75301bcc1d8d;
    stim[58] = 129'h0f26990f9c9904e2711f660f80f1eada1;
    stim[59] = 129'h0766cf968d18facfade7bb8fe1d6535b3;
    stim[60] = 129'h0941bbb5c4a829afb8c73866f46de412a;
    stim[61] = 129'h17fd22cba0dcd96165cee7cc20a4ac899;
    stim[62] = 129'h06bf55058ccef310ab57db4a4047c291a;
    stim[63] = 129'h04d85c9a2f2d2e200a8d6971fbc51919e;
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
      expv[2] = 43'h0xxxxxx0267;
      expv[3] = 43'h1xxxxxx0132;
      expv[4] = 43'h1xxxxxx0098;
      expv[5] = 43'h1fxxxxx004d;
      expv[6] = 43'h1fxxxxx004f;
      expv[7] = 43'h1fxxxxx0730;
      expv[8] = 43'h57xxxxx039a;
      expv[9] = 43'h77xxxxx0398;
      expv[10] = 43'h17xxxxx0398;
      expv[11] = 43'h7bxxxxx01cf;
      expv[12] = 43'h35xxxxx00e7;
      expv[13] = 43'h15xxxxx00e7;
      expv[14] = 43'h15xxxxx01c5;
      expv[15] = 43'h75xxxxx0607;
      expv[16] = 43'h190aeffcf3f;
      expv[17] = 43'h548577fe79d;
      expv[18] = 43'h14fb151e468;
      expv[19] = 43'h322b227eb37;
      expv[20] = 43'h5b15913f598;
      expv[21] = 43'h358ac89facf;
      expv[22] = 43'h158ac89facf;
      expv[23] = 43'h558ac89facd;
      expv[24] = 43'h5ac5644fd65;
      expv[25] = 43'h1071b0a7a6f;
      expv[26] = 43'h7038d853d37;
      expv[27] = 43'h181c6c29e98;
      expv[28] = 43'h381c6c29e98;
      expv[29] = 43'h140e3614f4f;
      expv[30] = 43'h0a071b0a7a5;
      expv[31] = 43'h1cb6fbbd9e5;
      expv[32] = 43'h165b7ddecf0;
      expv[33] = 43'h1b2dbeef678;
      expv[34] = 43'h3fbf33b2982;
      expv[35] = 43'h1e6b92102d7;
      expv[36] = 43'h3c9763fb8ef;
      expv[37] = 43'h744bb1fdc75;
      expv[38] = 43'h3cc433424b2;
      expv[39] = 43'h7cc433424b2;
      expv[40] = 43'h5e6219a1258;
      expv[41] = 43'h5f390e87565;
      expv[42] = 43'h7f9c8743ab0;
      expv[43] = 43'h3fce43a1d58;
      expv[44] = 43'h0d76bde1b02;
      expv[45] = 43'h1d76bde1b02;
      expv[46] = 43'h1d9a8a3d278;
      expv[47] = 43'h1c05a69637a;
      expv[48] = 43'h1e02d34b1bf;
      expv[49] = 43'h5f0169a58dd;
      expv[50] = 43'h7780b4d2c6f;
      expv[51] = 43'h73c05a69637;
      expv[52] = 43'h31e02d34b18;
      expv[53] = 43'h74d2e001fc8;
      expv[54] = 43'h157d839a800;
      expv[55] = 43'h1abec1cd402;
      expv[56] = 43'h3abec1cd400;
      expv[57] = 43'h5abec1cd402;
      expv[58] = 43'h5a94483b270;
      expv[59] = 43'h5a94483b272;
      expv[60] = 43'h1f4a241d938;
      expv[61] = 43'h7fa5122ec9d;
      expv[62] = 43'h5fa5122ec9d;
      expv[63] = 43'h1fd2893764d;
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
