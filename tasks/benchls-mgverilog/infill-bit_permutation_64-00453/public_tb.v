// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00453 dut (
    .Din(in_vec[63:0]),
    .Dout(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hc23bb2eb9fdf21a0;
    stim[1] = 64'hd99826d95f7720c1;
    stim[2] = 64'h2576eb960fb4a079;
    stim[3] = 64'h2ab377605b881f5d;
    stim[4] = 64'h1a21b4502f62be4e;
    stim[5] = 64'h9b65a64b29e88e1f;
    stim[6] = 64'hc498ed48462cf505;
    stim[7] = 64'h5245584e1f068708;
    stim[8] = 64'hd0f6f49bad22c017;
    stim[9] = 64'hc4bdfa344698a609;
    stim[10] = 64'hd354986234cdb91a;
    stim[11] = 64'h3bca5f56bc765b82;
    stim[12] = 64'ha67f0dc010f530a0;
    stim[13] = 64'ha0a40c83048dd72e;
    stim[14] = 64'h48f8db167752eab7;
    stim[15] = 64'h2be46c0022cac0b2;
    stim[16] = 64'hd145c094b86eb0e3;
    stim[17] = 64'h4dbbde7bf099edb7;
    stim[18] = 64'had2971925ecbec83;
    stim[19] = 64'hf72d13b5e139595d;
    stim[20] = 64'hbf70a4d1e85b69d5;
    stim[21] = 64'h88189b60023db364;
    stim[22] = 64'h834753514cd9661e;
    stim[23] = 64'h83a898ac8237e60d;
    stim[24] = 64'h22b19a222b42290c;
    stim[25] = 64'h51cc4fdcef10481a;
    stim[26] = 64'h832d8f70bfe0abe1;
    stim[27] = 64'h359f668c125adb53;
    stim[28] = 64'he69ba8902c64353d;
    stim[29] = 64'h77c2e11307b5a923;
    stim[30] = 64'h89e4e5f34d651dfc;
    stim[31] = 64'h532afe115774f4fe;
    stim[32] = 64'hf5cb5c607a21eb0b;
    stim[33] = 64'hd2a1b9274123cf99;
    stim[34] = 64'hc3103179bc8a4f6c;
    stim[35] = 64'hc32e774eea6ed0db;
    stim[36] = 64'hd3ca4a9b64e2f04d;
    stim[37] = 64'ha73d5f2cccfeaa9d;
    stim[38] = 64'h46f54d7ac9c57a79;
    stim[39] = 64'ha1cf915a72900c18;
    stim[40] = 64'h7e9ea518e2843945;
    stim[41] = 64'hc0e4ce6e38df0bfe;
    stim[42] = 64'h602a7c902364c41a;
    stim[43] = 64'h8e74efff37ef489c;
    stim[44] = 64'hcc260e746bd6aa8f;
    stim[45] = 64'h6a653fd505a65344;
    stim[46] = 64'h1c5e99b4d8fe17df;
    stim[47] = 64'h7a29c3022564975a;
    stim[48] = 64'h074bb70a3e6fc1d2;
    stim[49] = 64'ha5530d24cc3af404;
    stim[50] = 64'hc94f76b7705d28e2;
    stim[51] = 64'h2bc9454e3ae31f55;
    stim[52] = 64'h3b5eb01e378c45c0;
    stim[53] = 64'h07f21b5116b6f7ed;
    stim[54] = 64'h1511a670a08aaadf;
    stim[55] = 64'hd5d5dbdb4d76e23d;
    stim[56] = 64'ha2305dac991166d1;
    stim[57] = 64'h8ab026a84998b422;
    stim[58] = 64'h2201fc24c230b5ff;
    stim[59] = 64'hcaa5e637b48cdad6;
    stim[60] = 64'h0b19dacb7269d1f0;
    stim[61] = 64'h899eb7d698d4f411;
    stim[62] = 64'h432e049aaf2f25ba;
    stim[63] = 64'h377b92a13eb533db;
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
      expv[0] = 64'h2936307abdce3a3f;
      expv[1] = 64'hb93b34b98b641b34;
      expv[2] = 64'h86aa3b956ce7941e;
      expv[3] = 64'h9cd6c4d6220ff157;
      expv[4] = 64'ha84dd4124476d1f1;
      expv[5] = 64'h2a81c69b6536f9cd;
      expv[6] = 64'h5d42f5c447642e10;
      expv[7] = 64'h0f157a5240009c79;
      expv[8] = 64'h478f96985f3618aa;
      expv[9] = 64'h152e5b82674ea654;
      expv[10] = 64'h2bd732616558e489;
      expv[11] = 64'h6e7d3c45923157ef;
      expv[12] = 64'h2a722726a9e30603;
      expv[13] = 64'h4040f6686b83a4c8;
      expv[14] = 64'h77be9894c6d247fc;
      expv[15] = 64'h66800601e29725b1;
      expv[16] = 64'ha7592a83ddf030a0;
      expv[17] = 64'h5dbec5ebf6da6f8e;
      expv[18] = 64'h741c51a7e94773b8;
      expv[19] = 64'hd1ed8bff193be205;
      expv[20] = 64'hfaab85e99d577121;
      expv[21] = 64'h8866a06445e82754;
      expv[22] = 64'h7eacd22f2140b0c7;
      expv[23] = 64'h4024e8a15f6a8e71;
      expv[24] = 64'h20068052065bd43d;
      expv[25] = 64'h5fa91e151a10de94;
      expv[26] = 64'ha81816d7f5fa5655;
      expv[27] = 64'he4f30fc34a056af6;
      expv[28] = 64'h21caf1c20ff59603;
      expv[29] = 64'h072931fd66e5409b;
      expv[30] = 64'hbec8f67d8faed108;
      expv[31] = 64'hf5fdf419c4e68697;
      expv[32] = 64'h5f1505e34379d6d2;
      expv[33] = 64'h518548fec72ec469;
      expv[34] = 64'hc91ed04d319cf861;
      expv[35] = 64'hfdc42e85d136babf;
      expv[36] = 64'hf74990896b708e2f;
      expv[37] = 64'h34a6bf87f16bfe65;
      expv[38] = 64'hffca27b632cadc49;
      expv[39] = 64'h1abc42072711ca1a;
      expv[40] = 64'h914ba7c436554b13;
      expv[41] = 64'hafb0ae60a79afcec;
      expv[42] = 64'h658c641048378692;
      expv[43] = 64'h6e9abf3cad3eed3d;
      expv[44] = 64'h3928af90e15ad5f6;
      expv[45] = 64'hcb4cbe5e28270565;
      expv[46] = 64'hb2ffebc4bc28b7e2;
      expv[47] = 64'ha5c17056443383cd;
      expv[48] = 64'he2943567c4343abf;
      expv[49] = 64'h5262dd0751693422;
      expv[50] = 64'hb73c2e2b89dc638e;
      expv[51] = 64'haed0cce722315b79;
      expv[52] = 64'hc21f7a51a4152b1b;
      expv[53] = 64'hca7ef1cde2e28477;
      expv[54] = 64'h888b8583f45ce0e4;
      expv[55] = 64'h7fafb39f4fe09c6c;
      expv[56] = 64'hc4b64cb4994b1c41;
      expv[57] = 64'h106244106bce3985;
      expv[58] = 64'h94e4ccc2d4ed8491;
      expv[59] = 64'hc5d8be0af71e61cd;
      expv[60] = 64'hfcd6006bccb02f1d;
      expv[61] = 64'h68fe6e857f44130e;
      expv[62] = 64'h0188767198f2babb;
      expv[63] = 64'h82f731ebac7b92d7;
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
