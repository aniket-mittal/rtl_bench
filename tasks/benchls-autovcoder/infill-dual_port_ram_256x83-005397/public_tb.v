// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 184;
  localparam OW = 166;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005397 dut (
    .pclk(clk),
    .mem_addr_add(in_vec[183:176]),
    .mem_write_add(in_vec[175:175]),
    .mem_write_data_add(in_vec[174:92]),
    .mem_addr_age(in_vec[91:84]),
    .mem_write_age(in_vec[83:83]),
    .mem_write_data_age(in_vec[82:0]),
    .mem_read_data_add(out_vec[165:83]),
    .mem_read_data_age(out_vec[82:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 184'h56efd6a21b09f12c5e449297ddcc3415a15486308a0534;
    stim[1] = 184'h27ba9fda165566363331230c0a65526eb84052f1b1a14f;
    stim[2] = 184'h08b8064e23ccdcb22422692975a6e1ad8c4fa3ad9de0de;
    stim[3] = 184'h63aed2b5be176304f8574193d355ab185f0ea68561caaa;
    stim[4] = 184'h1b4f04fdf879c5ebeb3f53f5733f0fcd291888f287dee2;
    stim[5] = 184'hdac30105b7878a45fe76f759f7c2b43cb48e227a9c73e0;
    stim[6] = 184'h3c419fc2a6ed9821516d9854ea9ea5e94f2e5db319cd6e;
    stim[7] = 184'ha33c23f6071d14224fcf95728623f8ca7f621e53da38f5;
    stim[8] = 184'h6e25abe12c71439f1d288a0edb12f0be698156bd3cc0b7;
    stim[9] = 184'h8d01ad99eee1040c0967bacf2cc8cf9807f13f246c0751;
    stim[10] = 184'haf8e016f63d5c078befb13c2c236a48456832844cece22;
    stim[11] = 184'h31563141742de3adc524e69a9f3d83d0f03b379df1f40b;
    stim[12] = 184'hf6635fa8148af7a60592752dc793d4983aa175d9c32f7a;
    stim[13] = 184'h0e71aab76dfb1d61b9dac19ba73f3237ae2a204084296c;
    stim[14] = 184'hf95ae78ed1dd1f965de395ce5f26d10afeb15822a1a807;
    stim[15] = 184'h77133047b0c8fd8ccf02b87ac485b4baa6344377fc5f97;
    stim[16] = 184'hbcf96c97675d8921114924eba081477ff0dba91983eba2;
    stim[17] = 184'h93f54d031b6add932fa68d02f31c7bbad6a7917544a827;
    stim[18] = 184'ha3f1a1ffca7bf56b5a7fb5e1aa76f4253fe7bd935b86cb;
    stim[19] = 184'h1b6034f248aacbd3fff544bcea9fbeaaaf956b19a207c8;
    stim[20] = 184'h79ad815549e75603bba69ba739f244538a68ef2f4a3baf;
    stim[21] = 184'h3b50db7affad843b0d7cb42866e4e14602effdaab9b363;
    stim[22] = 184'hce2a3c8bbdf843ba6465f5a2393c99a364721f6c4c92a8;
    stim[23] = 184'h539d621ffaf83ce2748a9a66047e3a9adbb6c6c34e5b1c;
    stim[24] = 184'h8f7013268a8359a02ba393b0fc97a7601b347e54327939;
    stim[25] = 184'h3d357c167d362557104f29fd7e4421e8998f6a7bd0c238;
    stim[26] = 184'hcc70e1c2e86a6ae2f6b0bac6f59fc309ac850f16623027;
    stim[27] = 184'ha4b5f4b90ee62d4fc3e17c575ecdd8a31461ac04958a73;
    stim[28] = 184'h275f57a57f1efbf8952599e40601a0ec93050103c09814;
    stim[29] = 184'hd01384f18c25ff19e1bc259fbaa4501e6f7aa65af10489;
    stim[30] = 184'h5e2ac9bf7b2b8859ad220efb21656e3b33257086ae9aff;
    stim[31] = 184'h5409064bd4431cc52e0b8bff01f8d0fc271ddac752ae6c;
    stim[32] = 184'hf6a5488a25265327bad2c338625e94f198f28451666e21;
    stim[33] = 184'h6fc47f12ce5bf947b74fb57e2e7eee976eaaadbb680960;
    stim[34] = 184'h29c2516e2439a8e4da213996f9afcad322928027e33c90;
    stim[35] = 184'h70b2572d99b2496b02877aa7344f73b028d5b3367f8547;
    stim[36] = 184'h31bbc2ef5b50a47699d55ce5f4ea7c2be9c360a1f6f8d7;
    stim[37] = 184'he76db162b05077dfcf093ae4b4307d3669a9771abcb673;
    stim[38] = 184'h5b74b67b6da1acde2c4801d933afae7fa387d0e4c0f180;
    stim[39] = 184'h2120f54bada90125b10d0b4e0d71e7814ee3f557f3fdf1;
    stim[40] = 184'h951bc807fccef6ef04693ee0a1e9ae04b592e2bb3012d0;
    stim[41] = 184'hf7b12abd27bc2a7ba13256c170e017f17ef155f797c17d;
    stim[42] = 184'h3f3de5a093e62e4eb2029c845d853ba9e74e59e34a6729;
    stim[43] = 184'h1aa89a5d5f318efab752ae84d56c5c89c35af1530cfe28;
    stim[44] = 184'h961ba4a70df87770dbe51595d969c23f926dfd048a76f7;
    stim[45] = 184'h2f49cbd7c7c7ea9327bea32d73b14821634b79da567334;
    stim[46] = 184'hae2b6c425018f3a26da19859c667940cca1f91a1a813d8;
    stim[47] = 184'h6371f1c9e6a90bd41bed23885583504c20e52200d5f488;
    stim[48] = 184'h73afa24ab9b55205c7b3c8db11f858160d8fd5eae64541;
    stim[49] = 184'h1e1cca2b228ce5750fd4b600da1b863e8edf6050c869f1;
    stim[50] = 184'h17a08ebfceff07b25ff1cfd3d09b1ba93b2734a33e91e5;
    stim[51] = 184'hb6975e5e9f4a340c8767516142a08ff7c82c4cfe0c9308;
    stim[52] = 184'h19bc1c95a0f3329481ef1aa4d16d03512cc1db3747fb87;
    stim[53] = 184'h92eac748023a6b5c6120439ba1e0ef4d117b120f463b8e;
    stim[54] = 184'h8bd560a95485499fa98f2a26b43624e8bd2e136852684a;
    stim[55] = 184'habd1f5d85d71611ece65dfbeae6478db6a5e8954a0d494;
    stim[56] = 184'hadc226792df1e3afa502ccd63c82f64945373456a286ea;
    stim[57] = 184'haf9cffdeed8e7d8783f0810ef776aa75c606d0250c3c37;
    stim[58] = 184'h61753747a79498bd9dbead8fe3c41c6df80a6fe1bd8d46;
    stim[59] = 184'h23571378a7dbe368e9e209ce388acaa07e4b0586498d8a;
    stim[60] = 184'hb959b1b0444256fd24caf6c2a11077a9ddf0c785e3fc46;
    stim[61] = 184'hecb95719802f297db873408c26ccf3c9f7aecc11c12264;
    stim[62] = 184'h5a9bc4c078a9c046cf68291e7eabd843db5bf8cf1e8dbd;
    stim[63] = 184'hfc0a379c5670959632ce77fa9ed6fd165c73d89cd836a9;
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
      expv[0] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 166'h14fdf5557cab58cd103e4xxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 166'h14fdf5557cab58cd103e4xxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 166'h1d4fed0b2ab31b1998918xxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 166'hxxxxxxxxxxxxxxxxxxxxxxf244538a68ef2f4a3baf;
      expv[37] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 166'hxxxxxxxxxxxxxxxxxxxxxx54d031b6add932fa68d0;
      expv[40] = 166'hxxxxxxxxxxxxxxxxxxxxxx54d031b6add932fa68d0;
      expv[41] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 166'hxxxxxxxxxxxxxxxxxxxxxx4421e8998f6a7bd0c238;
      expv[47] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 166'h17695adf0bb1827c2ba0cxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 166'h17695adf0bb1827c2ba0cxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 166'h09e4cd1b2390fb6264954xxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 166'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
