// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[102:102]),
    .ena(in_vec[101:100]),
    .data(in_vec[99:0]),
    .q(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h3d8997f85ee705b7d17a62e7d1;
    stim[1] = 103'h620eebe80fedfd723f53869c99;
    stim[2] = 103'h3c5610ae1f775edeaeb3a05111;
    stim[3] = 103'h5b5a4b9c90b23fca664f60a474;
    stim[4] = 103'h3f886f12bc008673be6bb6f884;
    stim[5] = 103'h79769d6a1e9737f0dfb3078107;
    stim[6] = 103'h45ca255025713c22ae1551597d;
    stim[7] = 103'h0c44f634d81f34173dba5bcf0d;
    stim[8] = 103'h4e05870ceff2c23ebe75d5e2c3;
    stim[9] = 103'h720cb46aa9c94e2cb32401565e;
    stim[10] = 103'h57d6a6211d34faecf6d9b27d37;
    stim[11] = 103'h231ac360449bb30e8035f11dd9;
    stim[12] = 103'h7eca7c79ff6505dcdb32b4716b;
    stim[13] = 103'h0a2b477b6ec4b5b93ab08d4c8c;
    stim[14] = 103'h3e6a8058fb52af7086ce9ca188;
    stim[15] = 103'h4b7ae9ba1e0edf9541480e9ab3;
    stim[16] = 103'h0ea61f3df05a10499e3aee2064;
    stim[17] = 103'h785e5e3fb69182846bf59c89e8;
    stim[18] = 103'h3531294bea58700e5732dba719;
    stim[19] = 103'h6fe32c6677a61c712bff7fed0f;
    stim[20] = 103'h43ef253fb951a409f85a2355e6;
    stim[21] = 103'h4eb9e334286f31f35441c0ff9b;
    stim[22] = 103'h7221ba720b3161abd82b9cd908;
    stim[23] = 103'h558086873bd9c18a2a895f0a7c;
    stim[24] = 103'h7917dc217b1da3ece66c1a7f0c;
    stim[25] = 103'h02cd41e30c21541866df775efd;
    stim[26] = 103'h2ea6ca608ff085da2ee44064bf;
    stim[27] = 103'h000737d4bd12c8c748df5d9a3c;
    stim[28] = 103'h38b9f1bf76931bb4a3a58681c7;
    stim[29] = 103'h6d805f0d910f8b2df228a60ddf;
    stim[30] = 103'h47b30604bf745a41ca0a5d2eac;
    stim[31] = 103'h1244ccc49c6d5aae9be80ef78e;
    stim[32] = 103'h553e3de07fb04b41b75895e7bd;
    stim[33] = 103'h06864995b21f60281399820df5;
    stim[34] = 103'h34df00e97d17b78dc495097276;
    stim[35] = 103'h39af579b611d00d824b106d070;
    stim[36] = 103'h4e2cdaeeb29f8f2609851ff0f6;
    stim[37] = 103'h64cc797258b7af4e997bd99826;
    stim[38] = 103'h1de2df022fbdf4d67525b91962;
    stim[39] = 103'h04a1eb6359f61f49329f7c113d;
    stim[40] = 103'h64f696bcb954bed06f9061442e;
    stim[41] = 103'h7ac2f9f5d2b9fad3c7155604b6;
    stim[42] = 103'h3e5fc11b04f0ad9116eba1856a;
    stim[43] = 103'h62f31d98bf3d4a60b1e2ec138c;
    stim[44] = 103'h7d96e8a8748a3aa15f8aa19c89;
    stim[45] = 103'h4cef4e79b4b2c313f7f03cc242;
    stim[46] = 103'h0fb8e4b5042fb0eceeb1426bd4;
    stim[47] = 103'h70427a52bffdf9522763ab727d;
    stim[48] = 103'h44f5467e99d4bb85b842c094c8;
    stim[49] = 103'h4c2e7ff66982176b6dd34323c5;
    stim[50] = 103'h2ce2cf2536be69723834efd333;
    stim[51] = 103'h73d5575e6724d3a901874f072b;
    stim[52] = 103'h40d204f76e9ce09fd866427592;
    stim[53] = 103'h5e5d5ecf0747316ec71839b3a9;
    stim[54] = 103'h653a39f9491e6ead2da078bc44;
    stim[55] = 103'h59079d560ccb07cb9faa254d71;
    stim[56] = 103'h012bc8dcf1f6ad30557cf2d0a4;
    stim[57] = 103'h38d696c1c274c70d93aee98cdd;
    stim[58] = 103'h249e70ec73a217819b3c58f737;
    stim[59] = 103'h7cf8ce32ae5a3c4d75534ccfcb;
    stim[60] = 103'h740b5e10ac920ff85d83dd8ec2;
    stim[61] = 103'h6ec7a94e4c0ffd559cc6a461fd;
    stim[62] = 103'h60ddba074c79f678dc1285065d;
    stim[63] = 103'h5142274862cda790b967189259;
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
      expv[0] = 100'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 100'h0000000000000000000000000;
      expv[2] = 100'h20eebe80fedfd723f53869c99;
      expv[3] = 100'h0000000000000000000000000;
      expv[4] = 100'hb5a4b9c90b23fca664f60a474;
      expv[5] = 100'h0000000000000000000000000;
      expv[6] = 100'h9769d6a1e9737f0dfb3078107;
      expv[7] = 100'h5ca255025713c22ae1551597d;
      expv[8] = 100'h0000000000000000000000000;
      expv[9] = 100'he05870ceff2c23ebe75d5e2c3;
      expv[10] = 100'h20cb46aa9c94e2cb32401565e;
      expv[11] = 100'h7d6a6211d34faecf6d9b27d37;
      expv[12] = 100'hfad4c423a69f5d9edb364fa6e;
      expv[13] = 100'heca7c79ff6505dcdb32b4716b;
      expv[14] = 100'h0000000000000000000000000;
      expv[15] = 100'h0000000000000000000000000;
      expv[16] = 100'hb7ae9ba1e0edf9541480e9ab3;
      expv[17] = 100'h0000000000000000000000000;
      expv[18] = 100'h85e5e3fb69182846bf59c89e8;
      expv[19] = 100'h0000000000000000000000000;
      expv[20] = 100'hfe32c6677a61c712bff7fed0f;
      expv[21] = 100'h3ef253fb951a409f85a2355e6;
      expv[22] = 100'heb9e334286f31f35441c0ff9b;
      expv[23] = 100'h221ba720b3161abd82b9cd908;
      expv[24] = 100'h58086873bd9c18a2a895f0a7c;
      expv[25] = 100'h917dc217b1da3ece66c1a7f0c;
      expv[26] = 100'h0000000000000000000000000;
      expv[27] = 100'h0000000000000000000000000;
      expv[28] = 100'h0000000000000000000000000;
      expv[29] = 100'h0000000000000000000000000;
      expv[30] = 100'hd805f0d910f8b2df228a60ddf;
      expv[31] = 100'h7b30604bf745a41ca0a5d2eac;
      expv[32] = 100'h3d983025fba2d20e5052e9756;
      expv[33] = 100'h53e3de07fb04b41b75895e7bd;
      expv[34] = 100'h0000000000000000000000000;
      expv[35] = 100'h0000000000000000000000000;
      expv[36] = 100'h0000000000000000000000000;
      expv[37] = 100'he2cdaeeb29f8f2609851ff0f6;
      expv[38] = 100'h4cc797258b7af4e997bd99826;
      expv[39] = 100'h2663cb92c5bd7a74cbdeccc13;
      expv[40] = 100'h0000000000000000000000000;
      expv[41] = 100'h4f696bcb954bed06f9061442e;
      expv[42] = 100'hac2f9f5d2b9fad3c7155604b6;
      expv[43] = 100'h0000000000000000000000000;
      expv[44] = 100'h2f31d98bf3d4a60b1e2ec138c;
      expv[45] = 100'hd96e8a8748a3aa15f8aa19c89;
      expv[46] = 100'hcef4e79b4b2c313f7f03cc242;
      expv[47] = 100'h0000000000000000000000000;
      expv[48] = 100'h0427a52bffdf9522763ab727d;
      expv[49] = 100'h4f5467e99d4bb85b842c094c8;
      expv[50] = 100'hc2e7ff66982176b6dd34323c5;
      expv[51] = 100'h85cffecd3042ed6dba686478b;
      expv[52] = 100'h3d5575e6724d3a901874f072b;
      expv[53] = 100'h0d204f76e9ce09fd866427592;
      expv[54] = 100'he5d5ecf0747316ec71839b3a9;
      expv[55] = 100'h53a39f9491e6ead2da078bc44;
      expv[56] = 100'h9079d560ccb07cb9faa254d71;
      expv[57] = 100'h0000000000000000000000000;
      expv[58] = 100'h0000000000000000000000000;
      expv[59] = 100'h0000000000000000000000000;
      expv[60] = 100'hcf8ce32ae5a3c4d75534ccfcb;
      expv[61] = 100'h40b5e10ac920ff85d83dd8ec2;
      expv[62] = 100'hec7a94e4c0ffd559cc6a461fd;
      expv[63] = 100'h0ddba074c79f678dc1285065d;
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
