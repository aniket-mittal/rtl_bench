// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 135;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sirv_otp_top dut (
    .clk(clk),
    .rst_n(in_vec[134:134]),
    .i_icb_cmd_valid(in_vec[133:133]),
    .i_icb_cmd_addr(in_vec[132:101]),
    .i_icb_cmd_read(in_vec[100:100]),
    .i_icb_cmd_wdata(in_vec[99:68]),
    .i_icb_rsp_ready(in_vec[67:67]),
    .f_icb_cmd_valid(in_vec[66:66]),
    .f_icb_cmd_addr(in_vec[65:34]),
    .f_icb_cmd_read(in_vec[33:33]),
    .f_icb_cmd_wdata(in_vec[32:1]),
    .f_icb_rsp_ready(in_vec[0:0]),
    .i_icb_cmd_ready(out_vec[67:67]),
    .i_icb_rsp_valid(out_vec[66:66]),
    .i_icb_rsp_rdata(out_vec[65:34]),
    .f_icb_cmd_ready(out_vec[33:33]),
    .f_icb_rsp_valid(out_vec[32:32]),
    .f_icb_rsp_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 135'h0465920bd1cfef532f9b750ad4cea29c93;
    stim[1] = 135'h110dbb1ce323f8b9198e563900815fe0be;
    stim[2] = 135'h6b54cdda5c0ec5eaf07da2d7e836d4a37c;
    stim[3] = 135'h780661cd4e60debad6884d8fb0585ae070;
    stim[4] = 135'h720d8788cd847c2d5ac308452a2d695e2f;
    stim[5] = 135'h427e12d03cbd1136ab8d31796254e1515a;
    stim[6] = 135'h5178c349259397824f570170b0e6063bc3;
    stim[7] = 135'h4299d92013c7d07d58941b7b5431675524;
    stim[8] = 135'h49427a3db5b278e015a4300c0736f85299;
    stim[9] = 135'h466bcfe6c7f7c2fcd006ece11fe9092034;
    stim[10] = 135'h41e4b53123fd646d5a4189eca58d870cc9;
    stim[11] = 135'h6aeca6f5faa0b1ec8595ad5c82af4f02df;
    stim[12] = 135'h4d7a26dded7974531b8cde6768b570b10e;
    stim[13] = 135'h7fecc7e197ee149cf2fce1108ac884be65;
    stim[14] = 135'h5708180d3beb7ba47abac00c39ebbd7c4b;
    stim[15] = 135'h61cc9703c0f4f0f38f506ca9daf576a61a;
    stim[16] = 135'h622edc80c9f88eb9e34972ba8ffea8e85e;
    stim[17] = 135'h55149ddf0866b149fe73d58870deefcfe1;
    stim[18] = 135'h752e8f04cdefb4c4da3a3f1eea8074542f;
    stim[19] = 135'h596bac7546470fce4a5e68960cc8c37306;
    stim[20] = 135'h1c7ced12c4b409a68dec3f3babf3c73008;
    stim[21] = 135'h783241d95c9ce39a4ce8c5c81f1af7797e;
    stim[22] = 135'h628cf371e843c3d6e88c85c79e24f38001;
    stim[23] = 135'h503b7a8e5107cda23d1bf784c1c4a59b06;
    stim[24] = 135'h42ee843880b8e652e56b9fef01b509efad;
    stim[25] = 135'h422dc3d1427fed5cf1aa0251bedb4613e3;
    stim[26] = 135'h7de55c94c6bf52cb5b886fd462c26e8fed;
    stim[27] = 135'h6192339805b701361a43a045979d77765c;
    stim[28] = 135'h48afaab53ba89834b2ceb9b7c86825df61;
    stim[29] = 135'h4c0f7fd79130e28620c3f1cb1c7974f1a3;
    stim[30] = 135'h63a8bbf31d04308b738bb2cdfe96349b0e;
    stim[31] = 135'h783359230cc08ded8894dfff173ba3ee6b;
    stim[32] = 135'h5fd25c9491d239b1f1fb07642518a87f89;
    stim[33] = 135'h7bef5533c8d314f09e310bd0b5a7f92abf;
    stim[34] = 135'h526dbda3b1eec31972faf0371a8b04b16b;
    stim[35] = 135'h6fe269565485f70bc3d20b5a8317f0181e;
    stim[36] = 135'h4700e8cefea693ebf23214a9410050372c;
    stim[37] = 135'h607b8c9ea9f3b96dfb10568027114f9c42;
    stim[38] = 135'h4e88f245158fbf8d9ad96399e1e7fcdbdb;
    stim[39] = 135'h7a750d528e58e59f9c0d616332c9ad2ce4;
    stim[40] = 135'h5212833c5e0beafd8c4c59d1fe9fc3181f;
    stim[41] = 135'h4a3af4e81cc0f8ccf7422bf5d454792799;
    stim[42] = 135'h7faf304f10d4b176bb759f6e29ff1aae2f;
    stim[43] = 135'h74153a69ba54b5efe5b37d3ee52bab0cbd;
    stim[44] = 135'h6f0ac075375bf57319aa621792b59a52c3;
    stim[45] = 135'h53e46e0373097f276159e02eb54f6e5c32;
    stim[46] = 135'h716b5c6b48a7f45345f34610a8b56b4ac0;
    stim[47] = 135'h6795982f047a79fb598f15bed3ba193773;
    stim[48] = 135'h4ba910d52c87cdcd07210dd46f7e90baf3;
    stim[49] = 135'h6960c68622a586a7993bb2383ac70556ae;
    stim[50] = 135'h4d83ba90b3c32291f3e81ffcc7e01db6d6;
    stim[51] = 135'h49420aee23bce72b94a114fb4ddc905e8a;
    stim[52] = 135'h693875bca8a93ef309d58f8ca570fcfa4a;
    stim[53] = 135'h770029170651f350396f48ba256f5d8308;
    stim[54] = 135'h5c3f63d0faef9030fe1a32a3ec2f3054f1;
    stim[55] = 135'h10d00aca7fb660d1922884e7aba14153f0;
    stim[56] = 135'h55d9907841cb212fc7251da6b9a953dc78;
    stim[57] = 135'h5bafe1f0033c0bbf180efa426082bd1281;
    stim[58] = 135'h54c3c5bd1103ede30c089cbfea5629154c;
    stim[59] = 135'h5d898a780b96dbe4a917c68b3bfaccb6c9;
    stim[60] = 135'h728cae4e71d1c9ed81e5d9729916dfa37c;
    stim[61] = 135'h549a1595cdd396ec4b29a8d56888dc82ac;
    stim[62] = 135'h7bc8a7667b97b571ec39f715e2140a719f;
    stim[63] = 135'h7f9b4e1d1c40e56be917a481c6e3fa71b8;
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
      expv[0] = 68'h00000000000000000;
      expv[1] = 68'h00000000000000000;
      expv[2] = 68'h00000000000000000;
      expv[3] = 68'h00000000000000000;
      expv[4] = 68'h00000000000000000;
      expv[5] = 68'h00000000000000000;
      expv[6] = 68'h00000000000000000;
      expv[7] = 68'h00000000000000000;
      expv[8] = 68'h00000000000000000;
      expv[9] = 68'h00000000000000000;
      expv[10] = 68'h00000000000000000;
      expv[11] = 68'h00000000000000000;
      expv[12] = 68'h00000000000000000;
      expv[13] = 68'h00000000000000000;
      expv[14] = 68'h00000000000000000;
      expv[15] = 68'h00000000000000000;
      expv[16] = 68'h00000000000000000;
      expv[17] = 68'h00000000000000000;
      expv[18] = 68'h00000000000000000;
      expv[19] = 68'h00000000000000000;
      expv[20] = 68'h00000000000000000;
      expv[21] = 68'h00000000000000000;
      expv[22] = 68'h00000000000000000;
      expv[23] = 68'h00000000000000000;
      expv[24] = 68'h00000000000000000;
      expv[25] = 68'h00000000000000000;
      expv[26] = 68'h00000000000000000;
      expv[27] = 68'h00000000000000000;
      expv[28] = 68'h00000000000000000;
      expv[29] = 68'h00000000000000000;
      expv[30] = 68'h00000000000000000;
      expv[31] = 68'h00000000000000000;
      expv[32] = 68'h00000000000000000;
      expv[33] = 68'h00000000000000000;
      expv[34] = 68'h00000000000000000;
      expv[35] = 68'h00000000000000000;
      expv[36] = 68'h00000000000000000;
      expv[37] = 68'h00000000000000000;
      expv[38] = 68'h00000000000000000;
      expv[39] = 68'h00000000000000000;
      expv[40] = 68'h00000000000000000;
      expv[41] = 68'h00000000000000000;
      expv[42] = 68'h00000000000000000;
      expv[43] = 68'h00000000000000000;
      expv[44] = 68'h00000000000000000;
      expv[45] = 68'h00000000000000000;
      expv[46] = 68'h00000000000000000;
      expv[47] = 68'h00000000000000000;
      expv[48] = 68'h00000000000000000;
      expv[49] = 68'h00000000000000000;
      expv[50] = 68'h00000000000000000;
      expv[51] = 68'h00000000000000000;
      expv[52] = 68'h00000000000000000;
      expv[53] = 68'h00000000000000000;
      expv[54] = 68'h00000000000000000;
      expv[55] = 68'h00000000000000000;
      expv[56] = 68'h00000000000000000;
      expv[57] = 68'h00000000000000000;
      expv[58] = 68'h00000000000000000;
      expv[59] = 68'h00000000000000000;
      expv[60] = 68'h00000000000000000;
      expv[61] = 68'h00000000000000000;
      expv[62] = 68'h00000000000000000;
      expv[63] = 68'h00000000000000000;
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
