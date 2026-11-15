// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 105;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031410 dut (
    .clk(clk),
    .clr(in_vec[104:104]),
    .en(in_vec[103:103]),
    .npcout(in_vec[102:71]),
    .iseret(in_vec[70:70]),
    .instr_i(in_vec[69:38]),
    .pc8_i(in_vec[37:6]),
    .bd_i(in_vec[5:5]),
    .exccode_i(in_vec[4:0]),
    .instr_d(out_vec[69:38]),
    .pc8_d(out_vec[37:6]),
    .bd_d(out_vec[5:5]),
    .exccode_d(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 105'h0bac180b6ec4541771cdca5bb49;
    stim[1] = 105'h029d2b20c571924bbb0f02e40d0;
    stim[2] = 105'h161d208c786f99b028cb0485732;
    stim[3] = 105'h17e761a7061edbe9275b5b31fa9;
    stim[4] = 105'h1727ee4ce9852f83d07b6687141;
    stim[5] = 105'h0f63584ceb5f5ec40427675c9c2;
    stim[6] = 105'h1547bd2c109894328817f4c3f58;
    stim[7] = 105'h163d59ad270245e11ec862eb37d;
    stim[8] = 105'h0131a12fdd16c3b6fc8089d5fae;
    stim[9] = 105'h0b98503685352bfa66bf75aa284;
    stim[10] = 105'h1eac0b58fcfedc4d15a906430f7;
    stim[11] = 105'h0004b38664fcf078c4b87785241;
    stim[12] = 105'h1b5e8fd22aaaf4f13505694becb;
    stim[13] = 105'h085d467c8e8785c06e74e5cf957;
    stim[14] = 105'h0999cf7da437e50e257be820092;
    stim[15] = 105'h0717ebed848d2a1c1bf6265258d;
    stim[16] = 105'h1ce4e311180e8a72f86f82a6b14;
    stim[17] = 105'h0800f7866e92726f9a12fa3feb7;
    stim[18] = 105'h1a0dd2f3d4288378bb23a95bb57;
    stim[19] = 105'h19a7bb699130db0dc1cd2f17dc5;
    stim[20] = 105'h0a59736fe23cb6c81f550298810;
    stim[21] = 105'h006b5d45bcc67333014407cc62f;
    stim[22] = 105'h15640b59120ba9ac2557cd4d4fb;
    stim[23] = 105'h1875b4a25c5aeeb9e0f81f1adde;
    stim[24] = 105'h0da60eb5ee1c4f1d7f3325893fd;
    stim[25] = 105'h1c62aa959b64589c244d69946ba;
    stim[26] = 105'h162b73c94da20615712ed44d046;
    stim[27] = 105'h072fbcb8277a932d79ec09836af;
    stim[28] = 105'h0ee188936d5af23da11b029e173;
    stim[29] = 105'h0aeb0b67a0afe09f6b8d0f89850;
    stim[30] = 105'h02cb5fec4f67e80b0f3eb6c033c;
    stim[31] = 105'h1fb0b21977a66395b54e0809d12;
    stim[32] = 105'h0e705a76aa690ae00cbc0d76d42;
    stim[33] = 105'h01f8858aff301cdea8432141955;
    stim[34] = 105'h0c036f6146e33a999888c4d0d6c;
    stim[35] = 105'h17def5cb945f3b6df637ff435b2;
    stim[36] = 105'h0e1c93f8cc310c2bf7f752fc74d;
    stim[37] = 105'h0af72edfce407a9aadc4d639448;
    stim[38] = 105'h08f64311c9d8b566647fa225188;
    stim[39] = 105'h106d109e46979a6c0bed6d2d336;
    stim[40] = 105'h0deaa6b7d255be0cfe3db45e249;
    stim[41] = 105'h16330c39cdf63aadae8523a7714;
    stim[42] = 105'h1f38b49578627173e0419f32a2c;
    stim[43] = 105'h03c660f25d1f8fdb741d5833496;
    stim[44] = 105'h0ee2c05ab043f783fe1c1a379c3;
    stim[45] = 105'h1fbde013f787f2cb73e6328e3bc;
    stim[46] = 105'h191830a3de91c22f4a3629708f6;
    stim[47] = 105'h0ade90aa5430251bfc9fe434e8c;
    stim[48] = 105'h18bc84c5c9e3f3b2b49bb363316;
    stim[49] = 105'h1a66e8edfa166ca163390b58fa5;
    stim[50] = 105'h14be172de0f7c4d0f88e92dc017;
    stim[51] = 105'h1caf012e015c0ca6f2afba149fe;
    stim[52] = 105'h01168893018ba852e54f69849d8;
    stim[53] = 105'h0bf468f766d02bb59568970629d;
    stim[54] = 105'h1ac387de889a1189537db917c65;
    stim[55] = 105'h199f4cee2aa9a13ca7724dd231d;
    stim[56] = 105'h054ea40d41362cde19677059ebf;
    stim[57] = 105'h00144f55bec972d199c74fc6d86;
    stim[58] = 105'h0e9b4765d10aeec67c14e3963b5;
    stim[59] = 105'h0f0f2f584b2ea3094aac1175207;
    stim[60] = 105'h1ec9db187f83e839a7c6491d84d;
    stim[61] = 105'h098106ada570d1b7446dcd883c4;
    stim[62] = 105'h1c4ccbd5aba300a11a5e7d6aa0c;
    stim[63] = 105'h001c0db4187688709cf84b4f954;
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
      expv[0] = 70'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 70'h000000001d60c05d40;
      expv[2] = 70'h0000000014e9590800;
      expv[3] = 70'h0000000000000c0200;
      expv[4] = 70'h0000000000000c0200;
      expv[5] = 70'h0000000000000c0200;
      expv[6] = 70'h0000000000000c0200;
      expv[7] = 70'h0000000000000c0200;
      expv[8] = 70'h0000000000000c0200;
      expv[9] = 70'h00000000098d0980c0;
      expv[10] = 70'h000000001cc281b600;
      expv[11] = 70'h0000000000000c0200;
      expv[12] = 70'h0000000000259c3500;
      expv[13] = 70'h0000000000000c0200;
      expv[14] = 70'h0000000002ea33e640;
      expv[15] = 70'h000000000cce7bef00;
      expv[16] = 70'h0000000038bf5f6e00;
      expv[17] = 70'h0000000000000c0200;
      expv[18] = 70'h000000000007bc3540;
      expv[19] = 70'h0000000000000c0200;
      expv[20] = 70'h0000000000000c0200;
      expv[21] = 70'h0000000000000c0200;
      expv[22] = 70'h00000000035aea2fc0;
      expv[23] = 70'h0000000000000c0200;
      expv[24] = 70'h0000000000000c0200;
      expv[25] = 70'h000000002d3075b140;
      expv[26] = 70'h0000000000000c0200;
      expv[27] = 70'h0000000000000c0200;
      expv[28] = 70'h00000000397de5c300;
      expv[29] = 70'h00000000370c449d40;
      expv[30] = 70'h00000000370c449d40;
      expv[31] = 70'h00000000165aff6440;
      expv[32] = 70'h0000000000000c0200;
      expv[33] = 70'h0000000000000c0200;
      expv[34] = 70'h000000000fc42c59c0;
      expv[35] = 70'h00000000201b7b0c00;
      expv[36] = 70'h0000000000000c0200;
      expv[37] = 70'h0000000030e49fc840;
      expv[38] = 70'h0000000017b9770040;
      expv[39] = 70'h0000000017b9770040;
      expv[40] = 70'h0000000000000c0200;
      expv[41] = 70'h0000000000000c0200;
      expv[42] = 70'h0000000000000c0200;
      expv[43] = 70'h0000000000000c0200;
      expv[44] = 70'h000000001e330794c0;
      expv[45] = 70'h000000001e330794c0;
      expv[46] = 70'h0000000000000c0200;
      expv[47] = 70'h0000000000000c0200;
      expv[48] = 70'h0000000016f4855480;
      expv[49] = 70'h0000000000000c0200;
      expv[50] = 70'h0000000000000c0200;
      expv[51] = 70'h0000000000000c0200;
      expv[52] = 70'h0000000000000c0200;
      expv[53] = 70'h18ba852e54f69849d8;
      expv[54] = 70'h000000001fa347bd00;
      expv[55] = 70'h0000000000000c0200;
      expv[56] = 70'h0000000000000c0200;
      expv[57] = 70'h1362cde19677059ebf;
      expv[58] = 70'h0000000000a27aafc0;
      expv[59] = 70'h0000000000a27aafc0;
      expv[60] = 70'h0000000000a27aafc0;
      expv[61] = 70'h0000000000000c0200;
      expv[62] = 70'h000000000c08356f00;
      expv[63] = 70'h0000000000000c0200;
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
