// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 166;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000945 dut (
    .dir(in_vec[165:134]),
    .data_input(in_vec[133:102]),
    .mem_rd(in_vec[101:101]),
    .mem_wd(in_vec[100:100]),
    .mem_rd_Result(in_vec[99:99]),
    .numberOne(in_vec[98:67]),
    .numberTwo(in_vec[66:35]),
    .operation(in_vec[34:3]),
    .wd_numberOne(in_vec[2:2]),
    .wd_numberTwo(in_vec[1:1]),
    .wd_operation(in_vec[0:0]),
    .data_output(out_vec[63:32]),
    .result_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 166'h062827691d9dcef5d6a7303f5255d2f7e702820a29;
    stim[1] = 166'h0325b0473081f83572775ffdc38c4562579d5d70bd;
    stim[2] = 166'h2be54885d4c6e46e032da0fc183033c5a0fcc3a303;
    stim[3] = 166'h0a651b32def8c99432055e1c2c748ea4626d22d3e2;
    stim[4] = 166'h0aca8f9fdb93d7a24ee3818f6fe94c3f2aadc1dd73;
    stim[5] = 166'h028df1e2dda12b33e10541c39481aeb36ddd8be0b2;
    stim[6] = 166'h17d6a104b221ab1c69678da1618656e0f8047dd149;
    stim[7] = 166'h0b8b65932db6e3762cd003bc29f7d922283a15e943;
    stim[8] = 166'h2ff2459163180804cfa951b76dee37cdcc0debc916;
    stim[9] = 166'h24caafab9ae8bfeaa6f06aeb7c95a22fd6c7c55301;
    stim[10] = 166'h03cbc81e01adfcd509b13076ed1cc9d5d5c8ceac0e;
    stim[11] = 166'h0f2cf4cc9d925ca08bdad1920f814be065739fe563;
    stim[12] = 166'h3c4fc78d76c66bbbc15a1697812e9f0b00709a7151;
    stim[13] = 166'h39d2a18eb798cd76ec844b5657bc79c4c6d384eb30;
    stim[14] = 166'h32e219488253a8f8efd306b1caff4b1fcce41b4685;
    stim[15] = 166'h071137625a7403a87378844a498dd1f14e5da42748;
    stim[16] = 166'h25bd257dae2ea1c0c6fb1141f77fa71bf042354b5b;
    stim[17] = 166'h38a74fe71500ee668269a349d45b06617e8fbe8b78;
    stim[18] = 166'h2578a81d19e02722247f7d48ec73e764f51795d799;
    stim[19] = 166'h2acc28f06c06286a88556cef5bf6993e7d4ef8966d;
    stim[20] = 166'h36a8e8dd32c71fd0b5b63b776638a84895f53a3ae7;
    stim[21] = 166'h06d805f01b3f6bca85813852648e62c9442de3f3a4;
    stim[22] = 166'h21b842c47bb1dcf2d74cb9cb688aad1e7aeb3734b7;
    stim[23] = 166'h29e87fbda055b39d61ef3701b76131e47f15aa0775;
    stim[24] = 166'h1aa8533b4769086fd4d1523497db0566f6d8cf646f;
    stim[25] = 166'h1276c884902506a7445813854e061431d7cc90e265;
    stim[26] = 166'h35e2c207a6b0a2e45dd74586cf76142d329b86eaab;
    stim[27] = 166'h25d50dff372069527087a6917120aedb785a8a47e6;
    stim[28] = 166'h07fac6b0b85f0f1b5169c5530a5cce0db09a1a6bc4;
    stim[29] = 166'h0d6a39d87616cf5576c309981e07956ae146ad9c7d;
    stim[30] = 166'h109434da1e7222fe30bf9092030216edef614b85cc;
    stim[31] = 166'h09620116468f11db379014cb5f9c399cbaf872e835;
    stim[32] = 166'h05d9eafc305417770f51e192b610e801448b26c785;
    stim[33] = 166'h176372dd9bf8474a39e30271a5fe9270db68bdd829;
    stim[34] = 166'h38c6d6753c3ec7acaf865f2e13920e9a1ddf2e0c6f;
    stim[35] = 166'h08a48f1e6ed919a16025b96244a2ef9c34da85abd4;
    stim[36] = 166'h322c266f00d04b6ea7be27c2fa92ff6bbd4c1efb21;
    stim[37] = 166'h30ad1fbeba414c5d20e8fc1881928582f5dbcf3a72;
    stim[38] = 166'h26785a6059716f661fda055272ed1b5b1655417651;
    stim[39] = 166'h0cb88c41af0b4f627b6b7a7939df9ccef3d59be61f;
    stim[40] = 166'h1874c93bad3c53970e85a387178d9a2930415661d0;
    stim[41] = 166'h3cfec7ea016d799f67fb615329a0c5709e72a22509;
    stim[42] = 166'h2ec6e61661b2e39cdbbf93b58558badeeca4529ab1;
    stim[43] = 166'h38dc7a5626daae5c60becb98d91b21a2e52f88d123;
    stim[44] = 166'h10ffe460198dc6bcd9f2db505869b3e617dc785610;
    stim[45] = 166'h16781080b0f09b60db3ab1ae710981b29825b70c1d;
    stim[46] = 166'h10b9d4e5345a19083b45fcc59e7da801b4dcdf689f;
    stim[47] = 166'h061c624bd645685ed507a80fdcc7501a395009ef2b;
    stim[48] = 166'h24f6a0b62d15b2a19fad02009b22e025fffd9eaa79;
    stim[49] = 166'h275928ec752de74d04ed53260983d9fa554080e311;
    stim[50] = 166'h25be36023d0ab217a1d2f1298a3488d52da27733ad;
    stim[51] = 166'h31c89340962a68a86c1daf0327b2ca8ebcbd5580da;
    stim[52] = 166'h3c95e8084c293810b6091fa396f9426e796f8f4f38;
    stim[53] = 166'h04ea53159d782addf8695423074139874c9a91a1b7;
    stim[54] = 166'h3cf53337904fbf47011ed63c4bdd218a1349ed1929;
    stim[55] = 166'h12a875028a2651f0d08c150765037555b6b6933935;
    stim[56] = 166'h2f3a9e645d2b6f589c0771445706ab25a197dc5f41;
    stim[57] = 166'h0374bbb838b3097f4c1cbddcd3ccb08acd7667ef8b;
    stim[58] = 166'h381ce558fc6413ac8644a411784636f92bb2ad50aa;
    stim[59] = 166'h008faadacb5d1c1f6b9ad84baf804048acb6b6bca8;
    stim[60] = 166'h0bfa4e268abaffb458298e6976e675f2a3671985c5;
    stim[61] = 166'h375240e6f20def2cf08b46cd3e2f9e3d0e388d8c8b;
    stim[62] = 166'h0d2c5fb6bb0d08a7dec23d59fa8752d811e13c0ba0;
    stim[63] = 166'h0fb6d33fb72b31fbffee6c5b1c419c6a65b5ddb207;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'hxxxxxxxx00000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'hxxxxxxxx00000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'hxxxxxxxx00000000;
      expv[6] = 64'hxxxxxxxx00000000;
      expv[7] = 64'hxxxxxxxx00000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'hxxxxxxxx00000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'hxxxxxxxx00000000;
      expv[14] = 64'hxxxxxxxx00000000;
      expv[15] = 64'hxxxxxxxx00000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'hxxxxxxxx00000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'hxxxxxxxx00000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'hxxxxxxxx00000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'hxxxxxxxx00000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'hxxxxxxxx00000000;
      expv[30] = 64'hxxxxxxxx00000000;
      expv[31] = 64'hxxxxxxxx00000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'hxxxxxxxx00000000;
      expv[34] = 64'hxxxxxxxx00000000;
      expv[35] = 64'hxxxxxxxx00000000;
      expv[36] = 64'hxxxxxxxx00000000;
      expv[37] = 64'hxxxxxxxx00000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'hxxxxxxxx00000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'hxxxxxxxx00000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'hxxxxxxxx00000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'hxxxxxxxx00000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'hxxxxxxxx00000000;
      expv[51] = 64'hxxxxxxxx00000000;
      expv[52] = 64'hxxxxxxxx00000000;
      expv[53] = 64'hxxxxxxxx00000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'hxxxxxxxx00000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'hxxxxxxxx00000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'hxxxxxxxx00000000;
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
