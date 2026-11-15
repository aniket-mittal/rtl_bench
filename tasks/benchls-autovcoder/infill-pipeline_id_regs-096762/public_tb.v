// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 153;
  localparam OW = 152;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096762 dut (
    .clk(clk),
    .clr(in_vec[152:152]),
    .newPC(in_vec[151:120]),
    .busA(in_vec[119:88]),
    .busB(in_vec[87:56]),
    .Inst(in_vec[55:24]),
    .ExtOp(in_vec[23:23]),
    .ALUSrc(in_vec[22:22]),
    .ALUop(in_vec[21:18]),
    .RegDst(in_vec[17:17]),
    .MemWr(in_vec[16:16]),
    .RegWr(in_vec[15:15]),
    .RegWr_4(in_vec[14:14]),
    .RegWr_3(in_vec[13:13]),
    .RegWr_2(in_vec[12:12]),
    .RegWr_1(in_vec[11:11]),
    .MemtoReg(in_vec[10:10]),
    .Branch(in_vec[9:9]),
    .Jump(in_vec[8:8]),
    .l_r(in_vec[7:7]),
    .lorr(in_vec[6:6]),
    .shift(in_vec[5:1]),
    .OVSel(in_vec[0:0]),
    .newPC_f(out_vec[151:120]),
    .busA_f(out_vec[119:88]),
    .busB_f(out_vec[87:56]),
    .Inst_f(out_vec[55:24]),
    .ExtOp_f(out_vec[23:23]),
    .ALUSrc_f(out_vec[22:22]),
    .ALUop_f(out_vec[21:18]),
    .RegDst_f(out_vec[17:17]),
    .MemWr_f(out_vec[16:16]),
    .RegWr_f(out_vec[15:15]),
    .RegWr_4f(out_vec[14:14]),
    .RegWr_3f(out_vec[13:13]),
    .RegWr_2f(out_vec[12:12]),
    .RegWr_1f(out_vec[11:11]),
    .MemtoReg_f(out_vec[10:10]),
    .Branch_f(out_vec[9:9]),
    .Jump_f(out_vec[8:8]),
    .l_rf(out_vec[7:7]),
    .lorr_f(out_vec[6:6]),
    .shift_f(out_vec[5:1]),
    .OVSel_f(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 153'h12c6b7078142a2256dd28b270f065b41261a705;
    stim[1] = 153'h06ccaed79bef07c33494849a2892bf931e66cfb;
    stim[2] = 153'h00a4b2a7c3a82322a059a390d0a21488ef6d791;
    stim[3] = 153'h016c3f16760d6591538b9e0cd04f3b49fa713f5;
    stim[4] = 153'h1f4750a6b624bba51babe9ea28d1a20dacf4bb5;
    stim[5] = 153'h0e60cb87ace4aefe9b038111f5048b0e33bb29d;
    stim[6] = 153'h14e0d2352e76c8c952c3a1d2eb26df090c1bc84;
    stim[7] = 153'h0bf18fc9d9a5826d01d8e31efeb70b320ba7338;
    stim[8] = 153'h150c437232346b7b33360b7ea5e7eb7ddfb3ea4;
    stim[9] = 153'h1751869b2fadf19156c7faa59e767604403f613;
    stim[10] = 153'h0fab656dccd0745f31f1a122e0a2d8965bb1965;
    stim[11] = 153'h19c9799bddba311cffa0b558800fec3957ade94;
    stim[12] = 153'h1b3aa6cf90124f3ad962c35089ecd43ab30043f;
    stim[13] = 153'h14bf7ad7494a33257f82c892d1dbb62107411c2;
    stim[14] = 153'h04ea206363e5b01c66b3fe0545d71e08c17e827;
    stim[15] = 153'h0f5c3f1dfe1653029fb69ead4d93aaa32417f3c;
    stim[16] = 153'h193a298aad5a6369ffe1ec7c6f3fe594300fada;
    stim[17] = 153'h0db5b73fe3374e2382bc012c5dac3122392df30;
    stim[18] = 153'h071ca845d1f9b1df06137789e6ef963b01621db;
    stim[19] = 153'h01e2c401117d997e1497f06b85e32ff934ed07b;
    stim[20] = 153'h043a25d37976e0856ba103604d6d50f8b863a10;
    stim[21] = 153'h0f5ed49f7ab40a5df2f38f5345cac296d6430f9;
    stim[22] = 153'h15aadd0723654721a40425fccd8825fa4ee1c11;
    stim[23] = 153'h0de358dba760bf47ac08019a2c9ef85aa261ed7;
    stim[24] = 153'h0fbc0ea73e806887918cf449a3a53b5d0fa0744;
    stim[25] = 153'h0866c2a9be871e7c952168c2c5405259ef9cd1b;
    stim[26] = 153'h107188104d16a5b0bc4b9422bc6058f9228df3c;
    stim[27] = 153'h017e5dfe63894ce35fbc5ef0607c9e684433226;
    stim[28] = 153'h0e0c00aebb963b4c3d7406637c89199ff13c9ca;
    stim[29] = 153'h0c1881dafc7f0f87a22637372f690fddc49dd22;
    stim[30] = 153'h145a6107cc9d9586d2b285f5b95e2ffc5b800bc;
    stim[31] = 153'h025bd0068f8070b25d17de722ec753b6b594ad7;
    stim[32] = 153'h03e2f17dd00d54e5406323470f31dd5d3333114;
    stim[33] = 153'h1e05dc06e54087a07b1f43acddddcad7f8c5301;
    stim[34] = 153'h156295f922a42e6d81242d6c2287e69522d4e99;
    stim[35] = 153'h10011655179e0c0f6857745029572fd7a366f50;
    stim[36] = 153'h0fcfc3280bb9f2f5f915ebc8787b8dc725a1002;
    stim[37] = 153'h09ef9dd0b9610a3ba4800ab35a0e20965e77620;
    stim[38] = 153'h1bee2fd155d28759d4d572288d56b8a8582e596;
    stim[39] = 153'h05b504147b30c21be4eaab5174937725ae28610;
    stim[40] = 153'h06289cd63b350220fe6bc3f1c3eea0d643faf07;
    stim[41] = 153'h1ae633dff65aa1cfb87938b71a3512c2577842a;
    stim[42] = 153'h0317ede80cb74a62b991ce11796547f7417854d;
    stim[43] = 153'h14ba97952346ac5a7b396f00436c12ba004e72d;
    stim[44] = 153'h1886d8353601055a988de2771724755d4113be5;
    stim[45] = 153'h07fa230d0ff4e65aa3379c62c3b57cd56915d40;
    stim[46] = 153'h1026fd472fa5bb42b760320884d789e53e95d67;
    stim[47] = 153'h1145dbc49201e4175c9a680892e8b261fd139af;
    stim[48] = 153'h169aa3a8e12a085f8a4202a5fbfb83c884ce1cf;
    stim[49] = 153'h0426277de9036bff7612fc9e8799e19c1015843;
    stim[50] = 153'h018ee359fb76bf7261bdd2e808b9aab4628970b;
    stim[51] = 153'h10c95622d3d7663ba97d19a2be05f316892be92;
    stim[52] = 153'h029cd64f08ab90f96ec5783678e75f4a53e9b09;
    stim[53] = 153'h1bc04e29efc64fc808732732862a39229de699c;
    stim[54] = 153'h17e1dbff74cd0050802115f38af47ddd86f85b5;
    stim[55] = 153'h0f2c176e4d0f0583a1008121a975369c6d797de;
    stim[56] = 153'h06bf205052e847e1db2ed8be111c2b2c5c2e65a;
    stim[57] = 153'h1d9fe73ce5433051290547cb9ebeb39862378ea;
    stim[58] = 153'h0c8a9061280b86578e4b3cc9ebad3c354cffb61;
    stim[59] = 153'h018ede05fb07aeeef47da06e3b3343716d69d2c;
    stim[60] = 153'h17f15730c1d122d7ff26c9ed73d3c2b34b98b1b;
    stim[61] = 153'h1f868c25af3ce6561b084002c678dbee8067132;
    stim[62] = 153'h1aaf306405cec8f2d2b8c856486abcc96187786;
    stim[63] = 153'h1de6844d36e902107df482d28c2954190103411;
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
      expv[0] = 152'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 152'h00000000000000000000000000000000000000;
      expv[2] = 152'h6ccaed79bef07c33494849a2892bf931e66cfb;
      expv[3] = 152'h0a4b2a7c3a82322a059a390d0a21488ef6d791;
      expv[4] = 152'h16c3f16760d6591538b9e0cd04f3b49fa713f5;
      expv[5] = 152'h00000000000000000000000000000000000000;
      expv[6] = 152'he60cb87ace4aefe9b038111f5048b0e33bb29d;
      expv[7] = 152'h00000000000000000000000000000000000000;
      expv[8] = 152'hbf18fc9d9a5826d01d8e31efeb70b320ba7338;
      expv[9] = 152'h00000000000000000000000000000000000000;
      expv[10] = 152'h00000000000000000000000000000000000000;
      expv[11] = 152'hfab656dccd0745f31f1a122e0a2d8965bb1965;
      expv[12] = 152'h00000000000000000000000000000000000000;
      expv[13] = 152'h00000000000000000000000000000000000000;
      expv[14] = 152'h00000000000000000000000000000000000000;
      expv[15] = 152'h4ea206363e5b01c66b3fe0545d71e08c17e827;
      expv[16] = 152'hf5c3f1dfe1653029fb69ead4d93aaa32417f3c;
      expv[17] = 152'h00000000000000000000000000000000000000;
      expv[18] = 152'hdb5b73fe3374e2382bc012c5dac3122392df30;
      expv[19] = 152'h71ca845d1f9b1df06137789e6ef963b01621db;
      expv[20] = 152'h1e2c401117d997e1497f06b85e32ff934ed07b;
      expv[21] = 152'h43a25d37976e0856ba103604d6d50f8b863a10;
      expv[22] = 152'hf5ed49f7ab40a5df2f38f5345cac296d6430f9;
      expv[23] = 152'h00000000000000000000000000000000000000;
      expv[24] = 152'hde358dba760bf47ac08019a2c9ef85aa261ed7;
      expv[25] = 152'hfbc0ea73e806887918cf449a3a53b5d0fa0744;
      expv[26] = 152'h866c2a9be871e7c952168c2c5405259ef9cd1b;
      expv[27] = 152'h00000000000000000000000000000000000000;
      expv[28] = 152'h17e5dfe63894ce35fbc5ef0607c9e684433226;
      expv[29] = 152'he0c00aebb963b4c3d7406637c89199ff13c9ca;
      expv[30] = 152'hc1881dafc7f0f87a22637372f690fddc49dd22;
      expv[31] = 152'h00000000000000000000000000000000000000;
      expv[32] = 152'h25bd0068f8070b25d17de722ec753b6b594ad7;
      expv[33] = 152'h3e2f17dd00d54e5406323470f31dd5d3333114;
      expv[34] = 152'h00000000000000000000000000000000000000;
      expv[35] = 152'h00000000000000000000000000000000000000;
      expv[36] = 152'h00000000000000000000000000000000000000;
      expv[37] = 152'hfcfc3280bb9f2f5f915ebc8787b8dc725a1002;
      expv[38] = 152'h9ef9dd0b9610a3ba4800ab35a0e20965e77620;
      expv[39] = 152'h00000000000000000000000000000000000000;
      expv[40] = 152'h5b504147b30c21be4eaab5174937725ae28610;
      expv[41] = 152'h6289cd63b350220fe6bc3f1c3eea0d643faf07;
      expv[42] = 152'h00000000000000000000000000000000000000;
      expv[43] = 152'h317ede80cb74a62b991ce11796547f7417854d;
      expv[44] = 152'h00000000000000000000000000000000000000;
      expv[45] = 152'h00000000000000000000000000000000000000;
      expv[46] = 152'h7fa230d0ff4e65aa3379c62c3b57cd56915d40;
      expv[47] = 152'h00000000000000000000000000000000000000;
      expv[48] = 152'h00000000000000000000000000000000000000;
      expv[49] = 152'h00000000000000000000000000000000000000;
      expv[50] = 152'h426277de9036bff7612fc9e8799e19c1015843;
      expv[51] = 152'h18ee359fb76bf7261bdd2e808b9aab4628970b;
      expv[52] = 152'h00000000000000000000000000000000000000;
      expv[53] = 152'h29cd64f08ab90f96ec5783678e75f4a53e9b09;
      expv[54] = 152'h00000000000000000000000000000000000000;
      expv[55] = 152'h00000000000000000000000000000000000000;
      expv[56] = 152'hf2c176e4d0f0583a1008121a975369c6d797de;
      expv[57] = 152'h6bf205052e847e1db2ed8be111c2b2c5c2e65a;
      expv[58] = 152'h00000000000000000000000000000000000000;
      expv[59] = 152'hc8a9061280b86578e4b3cc9ebad3c354cffb61;
      expv[60] = 152'h18ede05fb07aeeef47da06e3b3343716d69d2c;
      expv[61] = 152'h00000000000000000000000000000000000000;
      expv[62] = 152'h00000000000000000000000000000000000000;
      expv[63] = 152'h00000000000000000000000000000000000000;
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
