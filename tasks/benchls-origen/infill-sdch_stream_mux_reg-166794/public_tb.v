// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 61;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_166794 dut (
    .clk(clk),
    .rst(in_vec[56:56]),
    .tb_startup(in_vec[55:55]),
    .emif_sdch_rd(in_vec[54:54]),
    .p_q_swi(in_vec[53:53]),
    .p_sdch_dout(in_vec[52:37]),
    .p_sdch_dout_vld(in_vec[36:36]),
    .q_sdch_dout(in_vec[35:20]),
    .q_sdch_dout_vld(in_vec[19:19]),
    .source_valid(in_vec[18:18]),
    .source_sop(in_vec[17:17]),
    .source_eop(in_vec[16:16]),
    .source_data_s(in_vec[15:0]),
    .p_enable(out_vec[60:60]),
    .q_enable(out_vec[59:59]),
    .p_tb_startup(out_vec[58:58]),
    .q_tb_startup(out_vec[57:57]),
    .p_emif_sdch_rd(out_vec[56:56]),
    .q_emif_sdch_rd(out_vec[55:55]),
    .p_source_valid(out_vec[54:54]),
    .p_source_sop(out_vec[53:53]),
    .p_source_eop(out_vec[52:52]),
    .p_source_data_s(out_vec[51:36]),
    .q_source_valid(out_vec[35:35]),
    .q_source_sop(out_vec[34:34]),
    .q_source_eop(out_vec[33:33]),
    .q_source_data_s(out_vec[32:17]),
    .sdch_dout(out_vec[16:1]),
    .sdch_dout_vld(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h1b808904da8027f;
    stim[1] = 57'h141dd13dd88f939;
    stim[2] = 57'h025e1c41c32f92e;
    stim[3] = 57'h0b64176dd040ee5;
    stim[4] = 57'h04ab208a1232572;
    stim[5] = 57'h084c40dfaedcc0e;
    stim[6] = 57'h0983ad30e6de0c7;
    stim[7] = 57'h01688e58ccfb51c;
    stim[8] = 57'h0dcb9ea209a04e6;
    stim[9] = 57'h0e671ff98627ff7;
    stim[10] = 57'h07604e5b503723d;
    stim[11] = 57'h0b960fe5f08326b;
    stim[12] = 57'h0c2dc15f1d1ade4;
    stim[13] = 57'h04ba22a92a6cbec;
    stim[14] = 57'h01cbba7a90ae117;
    stim[15] = 57'h073690c605147b5;
    stim[16] = 57'h04f945a1351e084;
    stim[17] = 57'h0ef59dc248a94cf;
    stim[18] = 57'h0f99e024e03bd46;
    stim[19] = 57'h095724774827ec9;
    stim[20] = 57'h0667999daf56e26;
    stim[21] = 57'h062e6b79b1dc9d9;
    stim[22] = 57'h087f93bd7efd176;
    stim[23] = 57'h0dd0a2a9ed4eaec;
    stim[24] = 57'h0d0ceb095d6c62f;
    stim[25] = 57'h0d348d71caf20c4;
    stim[26] = 57'h026b52cc33d9a58;
    stim[27] = 57'h02532418eec04cf;
    stim[28] = 57'h06e595e39941467;
    stim[29] = 57'h059480f17be5d17;
    stim[30] = 57'h03de567d73452ca;
    stim[31] = 57'h09de31acd03e626;
    stim[32] = 57'h04c1bd5b0c47e5b;
    stim[33] = 57'h00b2f2730c2b34b;
    stim[34] = 57'h0b6a80d7422ab48;
    stim[35] = 57'h0b3fff033b92e13;
    stim[36] = 57'h0e5ca4edbe933a7;
    stim[37] = 57'h0261ded4febd8ef;
    stim[38] = 57'h03156fc81c770ea;
    stim[39] = 57'h0685ff132da4302;
    stim[40] = 57'h029600fd11a22ae;
    stim[41] = 57'h0952c283b013f7e;
    stim[42] = 57'h08aa85b9736ab24;
    stim[43] = 57'h0fddea245f54caf;
    stim[44] = 57'h02f7912adc7a116;
    stim[45] = 57'h0d164f425704f51;
    stim[46] = 57'h09bbf6fbec7c29d;
    stim[47] = 57'h17f40a4f5d9252d;
    stim[48] = 57'h0f8ab6a15b1b2d5;
    stim[49] = 57'h01253adb918186a;
    stim[50] = 57'h0f2bdf8fbefdd39;
    stim[51] = 57'h017c33ffd282658;
    stim[52] = 57'h03e52ca543b9aca;
    stim[53] = 57'h0ce8bccc62922d8;
    stim[54] = 57'h1c176b3c4cc59d1;
    stim[55] = 57'h06340ef20619cd2;
    stim[56] = 57'h066e8b7bb0f99eb;
    stim[57] = 57'h0ffc370ee46b9a8;
    stim[58] = 57'h0d788c6b1eee6a9;
    stim[59] = 57'h02d3840e5d56469;
    stim[60] = 57'h007f40e4bf00151;
    stim[61] = 57'h0e4cd33a7728505;
    stim[62] = 57'h01ff97f61a88739;
    stim[63] = 57'h039db49a18a7010;
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
      expv[0] = 61'h0000000000000000;
      expv[1] = 61'h0000000000000000;
      expv[2] = 61'h0000000000000000;
      expv[3] = 61'h102f92e000005e1c;
      expv[4] = 61'h1440ee5000016417;
      expv[5] = 61'h088000064ae51424;
      expv[6] = 61'h0a00000b981dbf5d;
      expv[7] = 61'h0a00000bc18e61cd;
      expv[8] = 61'h0800000f6a38b199;
      expv[9] = 61'h0a80000409cd4413;
      expv[10] = 61'h1527ff700000671f;
      expv[11] = 61'h113723d00001604e;
      expv[12] = 61'h140326b00001960f;
      expv[13] = 61'h0a8000035bc8be3a;
      expv[14] = 61'h0880000d97d95254;
      expv[15] = 61'h08000005c22ef521;
      expv[16] = 61'h11147b5000013690;
      expv[17] = 61'h08800003c109426a;
      expv[18] = 61'h15294cf00000f59d;
      expv[19] = 61'h153bd460000199e0;
      expv[20] = 61'h0a000004fd92ee90;
      expv[21] = 61'h1156e26000006799;
      expv[22] = 61'h115c9d9000002e6b;
      expv[23] = 61'h0a00000fa2ed7afd;
      expv[24] = 61'h0a800009d5d953da;
      expv[25] = 61'h0a80000d8c5e12ba;
      expv[26] = 61'h0a80000e4188e395;
      expv[27] = 61'h1059a58000006b52;
      expv[28] = 61'h10404cf000005324;
      expv[29] = 61'h114146700000e595;
      expv[30] = 61'h0880000cba2fe2f7;
      expv[31] = 61'h10452ca00001de56;
      expv[32] = 61'h0a000007cc4d59a0;
      expv[33] = 61'h08800008fcb6b618;
      expv[34] = 61'h080000056696e618;
      expv[35] = 61'h142ab48000016a80;
      expv[36] = 61'h1412e13000013fff;
      expv[37] = 61'h15133a7000005ca4;
      expv[38] = 61'h103d8ef0000061de;
      expv[39] = 61'h10770ea00001156f;
      expv[40] = 61'h11243020000085ff;
      expv[41] = 61'h10222ae000009600;
      expv[42] = 61'h0a0000027efd0760;
      expv[43] = 61'h0a00000d564972e6;
      expv[44] = 61'h1554caf00001ddea;
      expv[45] = 61'h107a11600000f791;
      expv[46] = 61'h0a8000009ea284ae;
      expv[47] = 61'h0000000000000000;
      expv[48] = 61'h0000000000000000;
      expv[49] = 61'h151b2d5000018ab6;
      expv[50] = 61'h0800000030d5b723;
      expv[51] = 61'h157dd39000012bdf;
      expv[52] = 61'h080000004cb1ffa5;
      expv[53] = 61'h1039aca00001e52c;
      expv[54] = 61'h0000000000000000;
      expv[55] = 61'h0000000000000000;
      expv[56] = 61'h1119cd200000340e;
      expv[57] = 61'h11799eb000006e8b;
      expv[58] = 61'h156b9a800001fc37;
      expv[59] = 61'h0a80000dcd52d63d;
      expv[60] = 61'h105646900000d384;
      expv[61] = 61'h0800000002a3c97e;
      expv[62] = 61'h1528505000004cd3;
      expv[63] = 61'h080000010e73ec35;
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
