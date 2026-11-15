// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 257;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_218538 dut (
    .LCDCLK(clk),
    .PRESETn(in_vec[256:256]),
    .data(in_vec[255:0]),
    .LCD_RW(out_vec[10:10]),
    .LCD_RS(out_vec[9:9]),
    .LCD_EN(out_vec[8:8]),
    .LCD_DATA(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 257'h09184a5d381905bb2179c06b4cc48728fd1946ebd6126a702cef16e18d21f798d;
    stim[1] = 257'h09214109b79c5815a62b9880867504002c69d440368a09238d3d3396ec24473a5;
    stim[2] = 257'h1dd245746b5bf27e0f4c0b63bb01dd9d670ae8cadcc8724014bd541d62b01c6d5;
    stim[3] = 257'h135d16a0940256b8da690ad57aa2fec9de8df3fda26ade74dac5db79f34517ec1;
    stim[4] = 257'h1d5dddebb1f6f86e3557881c484f6bc6e241fabd2ad74c64ea41db4dfede32f50;
    stim[5] = 257'h1e847a1c98ce022a55014abee5bcdce17889fa6febb8981fae3d85be312a658af;
    stim[6] = 257'h1a9c8564c64c4925909dbbb4c1cd89ccf59e47facaad89b9e2e31aa81a6a3c06b;
    stim[7] = 257'h1db707d2af4389f5141d1f5c93c58a33e63378f5e2946d75e7b4149c58d12b0c6;
    stim[8] = 257'h155987626e3236b81059d73d8938e07e61b1e28143f4980c6cad5322d1a4d2ff3;
    stim[9] = 257'h117e31373202e04422eeace4445fd4f2dc8aae1b4e32cf6c8fe40b958397e1fb4;
    stim[10] = 257'h124334ef13902ada0ad4024a50bc18114c329241866d933492a22fe1fe61df9fa;
    stim[11] = 257'h1c42e68ac1c6a4c40d3c7dfab08ca541a58645a869ff606fc065b3eb41b6ee2bc;
    stim[12] = 257'h1aae073a12ef23bd10c20d57e29d67ed01370213d4ef2fa9e5ccaff0b0a83cbdb;
    stim[13] = 257'h16dad1a9176ad661cbfb4fabb750a55cd961a3eae1db7248b3754b4a7c7a4ea04;
    stim[14] = 257'h1c910f5a8983c12038e57fc75e1c4e98a7613dac6bdd36e6f61d688179d6e01fd;
    stim[15] = 257'h11d859c4e4137a4a69eed47fc7b9fbdedaba0e9218b5a06df4b687768e9594de6;
    stim[16] = 257'h11b0aa347b459713c8dc148d9a5450897fa0b7bc4a0d069322277b923515debb1;
    stim[17] = 257'h155bb0edb950fcefcb3a860ba242f8a7cd480bc0c4dfedfc07b16114433c2a08d;
    stim[18] = 257'h1f5c83f05ad87938a7fc26b619f0f4aef4a9d8f042c6d48e3906692a7599bd799;
    stim[19] = 257'h153e0f480613cf929c106432866f0760c79261cbc505332a1f5b583160cabf014;
    stim[20] = 257'h028aa7f8c33df73b732877cdc4ee7377047d9b0d47aced002ecfc13f1ab3f6f27;
    stim[21] = 257'h135223ab9286cefbb8e55272299e9e375205d88cab0b6141bbfd552c3f874e79d;
    stim[22] = 257'h10e09020f5bf4483380570972104b8bacd3e576463ffb4692d90670b11f74793a;
    stim[23] = 257'h1631d39f17296a45f1e44f3d8944a0cc5cf071dd98fc59c5e9c53957bef8ac7bc;
    stim[24] = 257'h1b105b519daf85f9e7d4bde8f2dac1aabd8d32556cd4b987e4d00e2f0c93df761;
    stim[25] = 257'h1ea91c2bdc1f3ca308e885cc1d019544b477dbd72145b8612c0d30c34e8511962;
    stim[26] = 257'h19788b47a3da05f77f0888390bbafe376cd1022db16430835555cb4a6b2e54df0;
    stim[27] = 257'h1d11b9699b8bd1d8e813ee3e90f56a7ef0c5f5ae866676cefdd0aeb66ca5b2ff8;
    stim[28] = 257'h12283a048fb5b058ae9e5108e24f5348aa6744ff3755de894cd604288fb8831d6;
    stim[29] = 257'h18783f9ba75ba3ac0d82109719fafbf7939f73d655d5fc46f9c475128fe4fa030;
    stim[30] = 257'h1c3179ae590b5981aed653bd593fd0ce0133bb6387fe307898d3c17392cb395d7;
    stim[31] = 257'h1ada995af79d81d4a7c824f3d264cba4c7a4152a354de962a16706133b6d2be67;
    stim[32] = 257'h1643eef1717169fc0ee18e7e7a840db01b5cc034f0bcce2d5771f8b0a61ab2ed3;
    stim[33] = 257'h1007a5f756a3cdec78fff7bc0e23cbcf51e450536ae05f2bb4b1b0c6facbfd40a;
    stim[34] = 257'h1c9be3d69c4bd6dbda0d1be0b8d18069ace1a7c3a654c980ff836b4b20dd1ff17;
    stim[35] = 257'h19b933b810e8cb2406baf2f05e3670ac6c71a98ef87865d3bfd1360caec5873e1;
    stim[36] = 257'h142daf47869933f740a99a11f4ac19de19ce5d1a57e85e43bbf37f5c3a3de91c0;
    stim[37] = 257'h17e220ce7de8b0bece29174008e7533317147c5a868ffa87e35db1024246b7da4;
    stim[38] = 257'h117ef51d3be9e6019e0f50cd3938c7bda1342c12885f1b7fe753f8b113f67d5ea;
    stim[39] = 257'h195effce0144c5e576bbb1d629b42426e4077dd7998bed57288f54d7a309d784b;
    stim[40] = 257'h1818d442b78b21fb748eb1309eaccc92c8a4b52877d41640ef25bfbaaf52faee0;
    stim[41] = 257'h18289cd1d2d0db0be4eac88600217d55d7f814b684be6713cf48d58a75d715206;
    stim[42] = 257'h1b7c21677eb76ef8efcf0cc01c780c04aede6af86a6202824bb0e5ae413d11445;
    stim[43] = 257'h1cfa431bc1abe83d54a6c4d6998eca0dcc58b9500d185a5e5f97368ed079728b2;
    stim[44] = 257'h1175f83fef1399153c519b74002e2b9e420a64d4cd059ba5569b0e079d106d649;
    stim[45] = 257'h157c008cb3fe5ddb32f507fdd96be263849310f9208f96fd2602f37e0dee7337a;
    stim[46] = 257'h183cf88d5cb4570fcda1819b40da3cf4298b3afed46f73573dc582599da87db94;
    stim[47] = 257'h1dfba367d05293f1adba01785d9c43c2acaba21128336fef01ee6bb40cc6f561a;
    stim[48] = 257'h12e3eccf7a936168ccd9cc502e39e19e7f6278c9f0418dd1594ed1b3948c61580;
    stim[49] = 257'h1cd61b9d0faddfdc09925b28b4fe735ae2d119dde8b33ba9dc8d28d8a4c3aee20;
    stim[50] = 257'h1961bfda3a3fbc8aeead42c9dd086786fa1e33bdce66b01fe51614e4c5d0e3ac0;
    stim[51] = 257'h1f927d3f0df3e077f3397ebb255780e3de1225902844cb793221a59e7095621cd;
    stim[52] = 257'h1ef70318836654de5dc5a72c1de12ebb9922bc823836d825cc6fa2b5223e361a1;
    stim[53] = 257'h14f3f00bc5a441ce219de6c8b125a1a3edf571d9a721dfa1242aea5392a5723b8;
    stim[54] = 257'h16c4758192f36e7612f0bfc973dcdca5b1ffb33281d6b4619b392be4c3052ec35;
    stim[55] = 257'h1fc7345f14762850fafea8c0bdbf7e54577a4bb906992e0e4384e544d5693d66b;
    stim[56] = 257'h13d70a094f5e9220c2c59b8f648ec8c109e8ebfbe08a10b344176a8fbb884ead3;
    stim[57] = 257'h16a8726c521d0d3d29ec3e55660be32d7d3f7aed5aa4fcc1a5a67afa2bb8948f7;
    stim[58] = 257'h12473595402a68b9604deff553761d0d3e5eacdefd4da22c986a687f0039f7c11;
    stim[59] = 257'h140990566228498934c8310607f99ca927d471d44b247e487d48ef683e6daa3b6;
    stim[60] = 257'h1d08ecc742dacf97a6f9b67cfd82d34b06878556e3727a26a1316949c81ba1ffa;
    stim[61] = 257'h1708bb5a42daa90644ef71396c9eada289752d83b0c54b75d873bd199b1dea6b5;
    stim[62] = 257'h1a646955f31f0cca5bd27e2d22e90ccda4f65876294571e22863be7648f35d7d3;
    stim[63] = 257'h1ed21f23041379ef801e1ceaaf00d6f4f861a99ce8beadad94b6ba92ed646e5a4;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h138;
      expv[4] = 11'h038;
      expv[5] = 11'h10c;
      expv[6] = 11'h00c;
      expv[7] = 11'h101;
      expv[8] = 11'h001;
      expv[9] = 11'h180;
      expv[10] = 11'h100;
      expv[11] = 11'h100;
      expv[12] = 11'h100;
      expv[13] = 11'h100;
      expv[14] = 11'h100;
      expv[15] = 11'h100;
      expv[16] = 11'h100;
      expv[17] = 11'h100;
      expv[18] = 11'h100;
      expv[19] = 11'h100;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h138;
      expv[23] = 11'h038;
      expv[24] = 11'h10c;
      expv[25] = 11'h00c;
      expv[26] = 11'h101;
      expv[27] = 11'h001;
      expv[28] = 11'h180;
      expv[29] = 11'h100;
      expv[30] = 11'h100;
      expv[31] = 11'h100;
      expv[32] = 11'h100;
      expv[33] = 11'h100;
      expv[34] = 11'h100;
      expv[35] = 11'h100;
      expv[36] = 11'h100;
      expv[37] = 11'h100;
      expv[38] = 11'h100;
      expv[39] = 11'h100;
      expv[40] = 11'h100;
      expv[41] = 11'h100;
      expv[42] = 11'h100;
      expv[43] = 11'h100;
      expv[44] = 11'h100;
      expv[45] = 11'h100;
      expv[46] = 11'h100;
      expv[47] = 11'h100;
      expv[48] = 11'h100;
      expv[49] = 11'h100;
      expv[50] = 11'h100;
      expv[51] = 11'h100;
      expv[52] = 11'h100;
      expv[53] = 11'h100;
      expv[54] = 11'h100;
      expv[55] = 11'h100;
      expv[56] = 11'h100;
      expv[57] = 11'h100;
      expv[58] = 11'h100;
      expv[59] = 11'h100;
      expv[60] = 11'h100;
      expv[61] = 11'h100;
      expv[62] = 11'h100;
      expv[63] = 11'h100;
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
