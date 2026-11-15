// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 205;
  localparam OW = 138;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_156844 dut (
    .aluout(in_vec[204:173]),
    .Memdata(in_vec[172:141]),
    .WritetoRFaddrin(in_vec[140:136]),
    .MemtoRegW(in_vec[135:135]),
    .RegWriteW(in_vec[134:134]),
    .HILO_data(in_vec[133:70]),
    .PCin(in_vec[69:38]),
    .MemReadTypeW(in_vec[37:36]),
    .EPCD(in_vec[35:4]),
    .HI_LO_writeenablein(in_vec[3:3]),
    .exception_in(in_vec[2:2]),
    .MemWriteW(in_vec[1:1]),
    .is_ds_in(in_vec[0:0]),
    .WriteinRF_HI_LO_data(out_vec[137:74]),
    .WritetoRFaddrout(out_vec[73:69]),
    .HI_LO_writeenableout(out_vec[68:68]),
    .WritetoRFdata(out_vec[67:36]),
    .RegWrite(out_vec[35:35]),
    .PCout(out_vec[34:3]),
    .exception_out(out_vec[2:2]),
    .MemWrite(out_vec[1:1]),
    .is_ds_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 205'h1bf73447b3b81d601c0bb7907c861b5e85554e29ca0b2f661420;
    stim[1] = 205'h0e0ec4eb561ae80e6c5af4693307dfdec6ea44afdcf66f250051;
    stim[2] = 205'h03d60cb79c2de591469df4d97c0156773c8122ed85781e0ade8a;
    stim[3] = 205'h045346299a3d7981a489b087da71283f47e52f5638bb9b534c55;
    stim[4] = 205'h0952493ede0e197762a92fb2cac6fbc3f8292380af4d6a3cc40b;
    stim[5] = 205'h1b2aba737c383248b99c4d4f63091841a529ba9ac9c7240e5555;
    stim[6] = 205'h100f60caaf014c9550e81dbc95143cd87cb3a7a09e403062021a;
    stim[7] = 205'h0919fc2ab3d84cfe562b7d4956355d1e7bc997411400cc0fa081;
    stim[8] = 205'h1412ff0fd3837ffc0e6d3e9075677ce3120b992f762bbadce34d;
    stim[9] = 205'h1512e3e8e2996e285d7e25c85581f32d8608c16147e3d44b77d6;
    stim[10] = 205'h0c949feaeb8c7d9151cfc2b23ac6de72e3a00214b99b0ad1375e;
    stim[11] = 205'h065d4df3a8317db48427d969cfc9ceae219461b5ccdcab797fc6;
    stim[12] = 205'h1205ac364f7ed8378bb952eacc6013301d74359957be888839a4;
    stim[13] = 205'h1432b7958a8d1d746fe43e88ebc5dbef19a4fcb5d23bad65ff9b;
    stim[14] = 205'h0d13df142c813533479fa42ab88bd0df09bc83196d8ac5d82f50;
    stim[15] = 205'h08cf7ab39ef6e285bf793d2ec043fb98b5c2b6692f32108eac42;
    stim[16] = 205'h02908b20aa191ed978be17917b428edac73d093f0aa552279693;
    stim[17] = 205'h0490e605cd400e283cb45463417b594d8b09519110933126bf85;
    stim[18] = 205'h1ded6f5e9a485859d7f995458006aba342a6a87d6d18fca53b29;
    stim[19] = 205'h01376739257a1153ce8304d57a34569cce5eed6e5da85d914c9a;
    stim[20] = 205'h0358b715eba6d63e22f58b882641c72b0a7aecea1b6156b66370;
    stim[21] = 205'h0d25ff8558d4c1beaec528f2c9c32a59f6821f0e1e4c3189aec9;
    stim[22] = 205'h1dad723f3b6bf6b4c43966d243b69359332c4a4f764ea9c36f0c;
    stim[23] = 205'h1772e64cb9bb5eb06254c03974091149368c23f9cc8c7d91e50a;
    stim[24] = 205'h10b9ff6dd5620e3bf9ee39d6faccebc817372318d6e529ab9ea3;
    stim[25] = 205'h10ba4d2e9a5b6eb869dbf29a55ce3904a72d2087aeb81408cc89;
    stim[26] = 205'h072c13188caa007462f868f2ab3e975fa1f5a54c19b4854ed5ba;
    stim[27] = 205'h05a90da9e06368925776245877266e4b3e765edd94882a21503e;
    stim[28] = 205'h00eedc2ae9b035bb6d6628431005338c91ff6610210c3291aa55;
    stim[29] = 205'h06a40d8b76b8af0f7e718b15f11f1bbdfb9736a28c2e56529581;
    stim[30] = 205'h0e5b0553487ba9366eac17d70007903143c3f4867bd4e1c517d4;
    stim[31] = 205'h030d4edde992ad2c576822997ed1843ac92cb3617f70f0380a2d;
    stim[32] = 205'h1820cf9d2c47e2b73602b8ba684a99e9b6c33ded1c2b8bae043d;
    stim[33] = 205'h197cd81c391944b51d67d3602accb05c75406c11b4c65fd0c224;
    stim[34] = 205'h178eefed06790bdde86326215a1a7fb81dbf2fcf7a82b42309bc;
    stim[35] = 205'h1fad82e279108abfc3ba4a80411f0028f26fc5455318f9971901;
    stim[36] = 205'h1aaf20893080a5daca691f55d4f9a3dadc45cb3c39a4efee23df;
    stim[37] = 205'h12e11da3cd8ea791e161c3bd3303d4b11c08750698db3ac24293;
    stim[38] = 205'h16d01c8aecf5d6700f9dbaf2412492f253fec20dfed98cbed75f;
    stim[39] = 205'h0fc0089dc37a93f3c113b5ecc445e83e2b54c828d9c0a98a3f46;
    stim[40] = 205'h0dc0879e5c769f29481940927a1b78f70526570b0b3023cf3355;
    stim[41] = 205'h1ad0949525a4b1f2894e9445f8be5077bb9c381029843677785b;
    stim[42] = 205'h1d2808d565e8ec5a20bc696e8df92d3196d08ac59dcd77bd31d5;
    stim[43] = 205'h046b2e8135298163be2dd32fb97d7b2c120b0c9c61cde22ac269;
    stim[44] = 205'h0e3f083a87ee8b48a9d7789396320700b5ae5e46bebcb1499a6a;
    stim[45] = 205'h0948b6cbd9b49d41d9aa33ad692c445ac08573a3aa31428e28d4;
    stim[46] = 205'h0a7b6dfca0681234fa05073960a23a194b76934ef834ab7e0bf3;
    stim[47] = 205'h1344fdd623a6813463985d29b5273cc604a17cb7fa61d48b55bd;
    stim[48] = 205'h09efffdd4dcab577d5f3f44395bcd0a4dff07cf6b731a42386c1;
    stim[49] = 205'h1904ac25e95b314adecff251b1b19d92256ca50da24122a7b89e;
    stim[50] = 205'h18d55e4b4ee37704a16024bce9936b315fa3109762ba771f5347;
    stim[51] = 205'h1a661649becae09834eb2e32b36762719b6c202fbc2587271ec3;
    stim[52] = 205'h1739f935358ca33db874206a2f7c26486ce01351723e54bb3c2d;
    stim[53] = 205'h1de56b6a0f821768b0be46f235759c2cb5a97311993da195d2f4;
    stim[54] = 205'h14db90b44e68c953c69c7fd937f93bec9a890193a7652d7410ab;
    stim[55] = 205'h13854804fefc8eca8c40a561a0067f5c17f6706a98e890643cf8;
    stim[56] = 205'h0e786cefb4e4d8620e427e06c1b8de4dd026b02eab890cf6bc91;
    stim[57] = 205'h0771bc3f87d9abab31ed3abddcf709c4a6479c36828649c445ae;
    stim[58] = 205'h182b6b35a381f21774adc265835431a731f6da401643f81a34fb;
    stim[59] = 205'h1c48be84b8ffbbf9a88c4f32e5193b5297cd99f2ade496249607;
    stim[60] = 205'h1698eb9a5e102364b57bacfba36c89e58e5a7c3d179f98da0777;
    stim[61] = 205'h1c4b6c11fe34e15b4e5099397a890d7cf7cbe0e082e4493f2467;
    stim[62] = 205'h0ca1a012487ea5308d3a7e246bce512e505b8f843a8d2d44a44f;
    stim[63] = 205'h089538234908adc1287d566e58eb7dba8da3dd010fa8b02faf2b;
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
      expv[0] = 138'h0bb7907c861b5e8578dfb9a23d2a9c53940;
      expv[1] = 138'h1af4693307dfdec6d87076275ad4895fb99;
      expv[2] = 138'h1df4d97c0156773c8d000000000245db0aa;
      expv[3] = 138'h09b087da71283f47c8000000004a5eac715;
      expv[4] = 138'h292fb2cac6fbc3f805ffffffbb5247015eb;
      expv[5] = 138'h1c4d4f63091841a5320000004553753593d;
      expv[6] = 138'h281dbc95143cd87ca1ffffffaae74f413ca;
      expv[7] = 138'h2b7d4956355d1e7bec48cfe155132e82281;
      expv[8] = 138'h2d3e9075677ce3121da097f87e17325eec5;
      expv[9] = 138'h3e25c85581f32d863aa8971f471182c28fe;
      expv[10] = 138'h0fc2b23ac6de72e3a3ffffec8a400429736;
      expv[11] = 138'h27d969cfc9ceae218832ea6f9d28c36b99e;
      expv[12] = 138'h3952eacc6013301d5600000000686b32af4;
      expv[13] = 138'h243e88ebc5dbef199f00000000c9f96ba43;
      expv[14] = 138'h1fa42ab88bd0df098effffff9a790632db0;
      expv[15] = 138'h393d2ec043fb98b5fe467bd59c856cd25e2;
      expv[16] = 138'h3e17917b428edac73050c8f6cb7a127e153;
      expv[17] = 138'h345463417b594d8b380000714112a322215;
      expv[18] = 138'h3995458006aba342afffffc2cecd50fada1;
      expv[19] = 138'h0304d57a34569cce5d2bd08a9e3ddadcbb2;
      expv[20] = 138'h358b882641c72b0a445d36b1f1f5d9d4368;
      expv[21] = 138'h0528f2c9c32a59f69dfffffff5843e1c3c9;
      expv[22] = 138'h3966d243b693593309ed6b91f958949eecc;
      expv[23] = 138'h14c039740911493685bb9732659847f3992;
      expv[24] = 138'h2e39d6faccebc81732ab1071dfee4631adb;
      expv[25] = 138'h1bf29a55ce3904a71300000000da410f5d1;
      expv[26] = 138'h3868f2ab3e975fa1c500000000eb4a98332;
      expv[27] = 138'h36245877266e4b3e6f2d486d4f6cbdbb296;
      expv[28] = 138'h2628431005338c91da0776e1577ecc20425;
      expv[29] = 138'h318b15f11f1bbdfbbc35206c5bae6d45181;
      expv[30] = 138'h2c17d70007903143dc000049b307e90cf7c;
      expv[31] = 138'h2822997ed1843ac92f186a76ef5966c2fed;
      expv[32] = 138'h02b8ba684a99e9b6edc1067ce9067bda385;
      expv[33] = 138'h27d3602accb05c757acbe6c0e100d82369c;
      expv[34] = 138'h2326215a1a7fb81d91bc777f687e5f9ef54;
      expv[35] = 138'h3a4a80411f0028f246000055fe5f8a8aa61;
      expv[36] = 138'h291f55d4f9a3dadc55d57904490b9678737;
      expv[37] = 138'h21c3bd3303d4b11c029708ed1e90ea0d31b;
      expv[38] = 138'h1dbaf2412492f253dfffffb3807d841bfdf;
      expv[39] = 138'h13b5ecc445e83e2b427e0044ee299051b3e;
      expv[40] = 138'h1940927a1b78f705106e043cf24cae16165;
      expv[41] = 138'h0e9445f8be5077bb93d684a4a9b87020533;
      expv[42] = 138'h3c696e8df92d3196c0ffffffd121158b3bd;
      expv[43] = 138'h2dd32fb97d7b2c123d23597409161938c39;
      expv[44] = 138'h17789396320700b59300000000dcbc8d7d2;
      expv[45] = 138'h2a33ad692c445ac0b2000000000ae747544;
      expv[46] = 138'h05073960a23a194b7453db6fe56d269df03;
      expv[47] = 138'h185d29b5273cc604871d3409a342f96ff4d;
      expv[48] = 138'h33f44395bcd0a4dfea00000000e0f9ed6e1;
      expv[49] = 138'h0ff251b1b19d92257d00000056594a1b44e;
      expv[50] = 138'h2024bce9936b315f82c6aaf25a46212ec57;
      expv[51] = 138'h2b2e32b36762719b68f65704c1d8405f783;
      expv[52] = 138'h34206a2f7c26486cf1b9cfc9a94026a2e45;
      expv[53] = 138'h3e46f235759c2cb5a00000000052e623324;
      expv[54] = 138'h1c7fd937f93bec9a8d73464a9e1203274eb;
      expv[55] = 138'h00a561a0067f5c17d99c2a4027ece0d5318;
      expv[56] = 138'h027e06c1b8de4dd01c73c3677dcd605d571;
      expv[57] = 138'h2d3abddcf709c4a663000000590f386d056;
      expv[58] = 138'h2dc265835431a731e9ffffffbb6db4802cb;
      expv[59] = 138'h0c4f32e5193b5297d0c7fddfcd1b33e55bf;
      expv[60] = 138'h3bacfba36c89e58e6ab4c75cd234f87a2f7;
      expv[61] = 138'h1099397a890d7cf7dce25b608f17c1c105f;
      expv[62] = 138'h3a7e246bce512e505b650d0092371f08757;
      expv[63] = 138'h3d566e58eb7dba8d9144a9c11ac7ba021f3;
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
