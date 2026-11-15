// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02675 dut (
    .ucb_packet(in_vec[127:0]),
    .asi_ctrl(out_vec[63:32]),
    .asi_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'hf60499c77f6c7ce150ecbf0fd327cd6a;
    stim[1] = 128'h1a5c4b7a6de0fd2a34fe076c79486edd;
    stim[2] = 128'h724124b9ea717437d5424fee6a642f87;
    stim[3] = 128'hbfd1af6bdd2493a63c9a66a2dbc8a26f;
    stim[4] = 128'h30604045f3ea33452b0d8f34be78de25;
    stim[5] = 128'h5592b515d698e13f954cf4627a023cc6;
    stim[6] = 128'h3351b0d256cba4d1241588f7c046386d;
    stim[7] = 128'h0bde356887952aec2903cc8772cc48d6;
    stim[8] = 128'heb964a4126d7b95eff137a2d5a977cbd;
    stim[9] = 128'h0b1a5ff56c0d18cef47657d78416f854;
    stim[10] = 128'hdb0fe2a905f2a920340495c6f00da0f0;
    stim[11] = 128'hdcacb225181eb7cee69a9b7e7ea9fa39;
    stim[12] = 128'he631c453a961914aa70f4aec79bc5c0f;
    stim[13] = 128'h30abb8b5846e176d565de6b46db1c0b0;
    stim[14] = 128'he23d1e22183fe0bc001dea72bbd6b40a;
    stim[15] = 128'h28eb01f27987120d48b543468791f076;
    stim[16] = 128'h2857cadd268671501554ea441abacd97;
    stim[17] = 128'h5bb07a01b949785610a7b0d49648ba15;
    stim[18] = 128'h542df67d3a4e028c1db9000ceb010464;
    stim[19] = 128'h323101fc18b46720c7f8c2f183767d51;
    stim[20] = 128'hd9866111ecc9b552d454d0136c6b5ca0;
    stim[21] = 128'hcd2f6501d5384d050f530aedac806e00;
    stim[22] = 128'h7808850889e97b567ef4a16eaac337e3;
    stim[23] = 128'h940dccd498f8d53c12273b38e91dc812;
    stim[24] = 128'h1ad4e0a4bc202c264b222f599b6a6b67;
    stim[25] = 128'hbd9a258f9fb870befb61335e9e696749;
    stim[26] = 128'h3ca6b81eeb0409b22877edaa5bf51f6c;
    stim[27] = 128'haa9272b5f2a2ce18fd067a79d04d8e6f;
    stim[28] = 128'h35275e0aff67801412a11c6b3f62751d;
    stim[29] = 128'h28aa31a98152ccb3c6c8cb73b69ee2c2;
    stim[30] = 128'h4aaa683a1f2825d23007e5d1bba7cbad;
    stim[31] = 128'h1f592433d5a0c6e46236679c66ecbbac;
    stim[32] = 128'h53d2e44fa4605776c9e8287421b4b04b;
    stim[33] = 128'haa2596fa016909965e0478f26d1d21a7;
    stim[34] = 128'h5c08f9df9544af61ea6f940819a8f205;
    stim[35] = 128'h9a96d5439807ea31d884950b9c7b4c45;
    stim[36] = 128'hba479e5b1847f31d4c055b416a619632;
    stim[37] = 128'h9563741718ac9a36ebc2e26afa3a5b76;
    stim[38] = 128'h4d7155ee7d09a3965d246c654d80f8fe;
    stim[39] = 128'hcc2353c0d28a012a772eb9ad3199944d;
    stim[40] = 128'h0a197fdd151acae68ab38a8b1514ce78;
    stim[41] = 128'hc52dc9950b0c77d487558afc8cd54eb1;
    stim[42] = 128'hbae8171691bd540bcdaef77e187b3afb;
    stim[43] = 128'h15dd6742472165e0e0600f84895b9d32;
    stim[44] = 128'hdcf67c6f359a28c285aa3917b7bc49df;
    stim[45] = 128'h3b87d4c4101ce3d31811bee5f09a5b49;
    stim[46] = 128'h0db91e5b726b606e26cc674d4170966e;
    stim[47] = 128'h5f44c2b7b9ec186aabd0cdb68a3d36cc;
    stim[48] = 128'h16141c76264ec2ee51b1c16fbbac1e73;
    stim[49] = 128'h71d779f5138c46cc7611a4014eafbdd5;
    stim[50] = 128'h5970b66f6a416e16c2019a59153d7262;
    stim[51] = 128'h476e5be777e2a8b980e17b3d71094efd;
    stim[52] = 128'h4f0650ef26e359af6615c366b0b062f8;
    stim[53] = 128'hcf352e1d09aa0cbcee4c66f57bc2c8ab;
    stim[54] = 128'h57b23fb511aefdeeb154ccc539624c63;
    stim[55] = 128'hae447baa5e53e0696564c4213bdf97cc;
    stim[56] = 128'h7de1e640f5fac0e95a9c6acfbfde9b01;
    stim[57] = 128'h4bae5a1ea0272da5b5058fbb2f71a224;
    stim[58] = 128'hdfa246e9d3d8f97de4d9f7a2d7cec8d5;
    stim[59] = 128'ha980e3703cc23c307174f125ae468834;
    stim[60] = 128'h98aca905b89af89ff3f2d4cbb092d851;
    stim[61] = 128'hef0cd69814b919efea92999a52786744;
    stim[62] = 128'h7c2d6bf2fe9f68703e493ad255ebd296;
    stim[63] = 128'hd9352c17d23cd6e6d3e6d919896dfe4e;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 64'h00000000006c7ce1;
      expv[1] = 64'h000000000060fd2a;
      expv[2] = 64'h0000000000717437;
      expv[3] = 64'h00000000002493a6;
      expv[4] = 64'h00000000006a3345;
      expv[5] = 64'h000000000018e13f;
      expv[6] = 64'h00000000004ba4d1;
      expv[7] = 64'h0000000000152aec;
      expv[8] = 64'h000000000057b95e;
      expv[9] = 64'h00000000000d18ce;
      expv[10] = 64'h000000000072a920;
      expv[11] = 64'h00000000001eb7ce;
      expv[12] = 64'h000000000061914a;
      expv[13] = 64'h00000000006e176d;
      expv[14] = 64'h00000000003fe0bc;
      expv[15] = 64'h000000000007120d;
      expv[16] = 64'h0000000000067150;
      expv[17] = 64'h0000000000497856;
      expv[18] = 64'h00000000004e028c;
      expv[19] = 64'h0000000000346720;
      expv[20] = 64'h000000000049b552;
      expv[21] = 64'h0000000000384d05;
      expv[22] = 64'h0000000000697b56;
      expv[23] = 64'h000000000078d53c;
      expv[24] = 64'h0000000000202c26;
      expv[25] = 64'h00000000003870be;
      expv[26] = 64'h00000000000409b2;
      expv[27] = 64'h000000000022ce18;
      expv[28] = 64'h0000000000678014;
      expv[29] = 64'h000000000052ccb3;
      expv[30] = 64'h00000000002825d2;
      expv[31] = 64'h000000000020c6e4;
      expv[32] = 64'h0000000000605776;
      expv[33] = 64'h0000000000690996;
      expv[34] = 64'h000000000044af61;
      expv[35] = 64'h000000000007ea31;
      expv[36] = 64'h000000000047f31d;
      expv[37] = 64'h00000000002c9a36;
      expv[38] = 64'h000000000009a396;
      expv[39] = 64'h00000000000a012a;
      expv[40] = 64'h00000000001acae6;
      expv[41] = 64'h00000000000c77d4;
      expv[42] = 64'h00000000003d540b;
      expv[43] = 64'h00000000002165e0;
      expv[44] = 64'h00000000001a28c2;
      expv[45] = 64'h00000000001ce3d3;
      expv[46] = 64'h00000000006b606e;
      expv[47] = 64'h00000000006c186a;
      expv[48] = 64'h00000000004ec2ee;
      expv[49] = 64'h00000000000c46cc;
      expv[50] = 64'h0000000000416e16;
      expv[51] = 64'h000000000062a8b9;
      expv[52] = 64'h00000000006359af;
      expv[53] = 64'h00000000002a0cbc;
      expv[54] = 64'h00000000002efdee;
      expv[55] = 64'h000000000053e069;
      expv[56] = 64'h00000000007ac0e9;
      expv[57] = 64'h0000000000272da5;
      expv[58] = 64'h000000000058f97d;
      expv[59] = 64'h0000000000423c30;
      expv[60] = 64'h00000000001af89f;
      expv[61] = 64'h00000000003919ef;
      expv[62] = 64'h00000000001f6870;
      expv[63] = 64'h00000000003cd6e6;
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
