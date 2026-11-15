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

  origen_116070 dut (
    .clk(clk),
    .rst(in_vec[152:152]),
    .A(in_vec[151:120]),
    .B(in_vec[119:88]),
    .C(in_vec[87:56]),
    .ext(in_vec[55:24]),
    .WA3(in_vec[23:20]),
    .ALUControl(in_vec[19:16]),
    .flags(in_vec[15:12]),
    .Cond(in_vec[11:8]),
    .RegWrite(in_vec[7:7]),
    .PlusOne(in_vec[6:6]),
    .Branch(in_vec[5:5]),
    .PCSource(in_vec[4:4]),
    .ALUSrc(in_vec[3:3]),
    .MemtoReg(in_vec[2:2]),
    .FlagW(in_vec[1:0]),
    .AE(out_vec[151:120]),
    .BE(out_vec[119:88]),
    .CE(out_vec[87:56]),
    .extE(out_vec[55:24]),
    .WA3E(out_vec[23:20]),
    .ALUControlE(out_vec[19:16]),
    .flagsE(out_vec[15:12]),
    .CondE(out_vec[11:8]),
    .RegWriteE(out_vec[7:7]),
    .PlusOneE(out_vec[6:6]),
    .BranchE(out_vec[5:5]),
    .PCSourceE(out_vec[4:4]),
    .ALUSrcE(out_vec[3:3]),
    .MemtoRegE(out_vec[2:2]),
    .FlagWE(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 153'h1a864478bedf66fd2ff36715ca36fa4900ae674;
    stim[1] = 153'h11d82cd36c5c918e7862bfa8a49cd6216029a1b;
    stim[2] = 153'h0922ed698c6f4837b96aaea39f95b63d9a677a1;
    stim[3] = 153'h075d3695a02d2d4086e8d1edd1edf43570e08d5;
    stim[4] = 153'h0eaba2c09360e4a05da5532e0c382c958448984;
    stim[5] = 153'h0f861dc09d98c3974bbbff183f9bbf887a163f5;
    stim[6] = 153'h0839a545c9e72197039ba54ff6325253ddce8c4;
    stim[7] = 153'h17124872c2d0899cae8e2f7da1bef3dd8337fdc;
    stim[8] = 153'h0bedda4f262a7d1d89118855f23ce18942bf9ce;
    stim[9] = 153'h080f0004e1f2853cf8b720aa4661e76655ef984;
    stim[10] = 153'h03b8da87cd05818592b6cd7733a2ac8ebec8504;
    stim[11] = 153'h07df40eb845151c40886ed7c4e4ff8b4fa70fcf;
    stim[12] = 153'h0cc91f1b7e4a11017ff5e086d84afb57c3b16d8;
    stim[13] = 153'h00263f5a2b6aafe28e712ce69138cebe0792a94;
    stim[14] = 153'h0ec7bbee0a6ece53db03289017e45e136305e46;
    stim[15] = 153'h014b4f6ded5e28a627076e2770cee59cdd12314;
    stim[16] = 153'h0967b36b864491e0fc464abb9e17f523f665041;
    stim[17] = 153'h0875f64a1661de420a75770342ed90024f4689a;
    stim[18] = 153'h0509c0b4a9815d16236ea5c08c503f75eb39d59;
    stim[19] = 153'h010bb46cf722ed2bd63ffa129910be3c87149b4;
    stim[20] = 153'h07c6d78d0e579cfb69a6dc52563be3b8f771f0c;
    stim[21] = 153'h02a04b5a0eccf568c543267be84416bd4246072;
    stim[22] = 153'h0948321932c8ea0bcd316f6fc13fa4fba81f6f6;
    stim[23] = 153'h041cadb8f72ce5d4d195f022bd7eb94cfa3449f;
    stim[24] = 153'h06b8d1784177899cc1ceb169dc2ad5d8e8162ea;
    stim[25] = 153'h0aafee0bfa4b54eb542e8e9faf8f6309c93b385;
    stim[26] = 153'h0362a262d2b6f48b455bd360622eb9c836230f9;
    stim[27] = 153'h09aace409463709422f2ae7a2d5e499f934cf19;
    stim[28] = 153'h0b875b11fa86858be08361eb020f64618452ea8;
    stim[29] = 153'h075ddbb0bbf915c44dc90477305f926b2665090;
    stim[30] = 153'h0cb87d0677212f482f156ddb4a96e6174db29a9;
    stim[31] = 153'h08f21e46a7aab91984f4b355fbc57febf55b191;
    stim[32] = 153'h01e5e03cb2578ab73b07894738ed03dcaf3ec86;
    stim[33] = 153'h03be2eeca5217a753e831b2b91570454c65be4f;
    stim[34] = 153'h00bac7f0496f6dc71d7828c12872321ffe92f49;
    stim[35] = 153'h06b16f69075dba53bf870fc845f09eceff83a6e;
    stim[36] = 153'h0f1bb116df5e05f560669bc7ac70d8c6a46f6c2;
    stim[37] = 153'h0d91b949808a3a9446fedefb9a4b8a50d609cfd;
    stim[38] = 153'h07829a515416f95fc3a5bec00253f3dee9e31d9;
    stim[39] = 153'h070e30e11eb63d1490fed73aa404e2224cf8745;
    stim[40] = 153'h0f55f750a57558f34689a9aa3248be268f35ac0;
    stim[41] = 153'h02b47b4cba233f7e601beec885dd4ca8b1c4b03;
    stim[42] = 153'h038b67e40eecf3deb4a3999f8d5009596441f49;
    stim[43] = 153'h0bcde88310a240d2af294fac2849b9a0857ca68;
    stim[44] = 153'h09ba0c761657b9d369d4b7dfcea1360bd324e3d;
    stim[45] = 153'h0a4c91f95969e6317bdad1adaa129d24be3c53c;
    stim[46] = 153'h074d37d7dc400470cf3b83e6ceadd4207d8ca90;
    stim[47] = 153'h023a4c05c1d9e7086037696226d2bfb93430295;
    stim[48] = 153'h0d0b3d1d194ac4699bdd630b15601e9681dfc39;
    stim[49] = 153'h08ac38230eef1f1f310b12b3379cfcfd9b93903;
    stim[50] = 153'h092157e5f8211a6b074d233cf15d678f70a245c;
    stim[51] = 153'h06f2b54d5de8f4c9256240d6065fb5184ff1430;
    stim[52] = 153'h00609b0602cd87c77233531a5a78e1fdb95805e;
    stim[53] = 153'h0e17d0fff48b6869529c8ead14b0825dc2ff5d7;
    stim[54] = 153'h0c484f08856d321bc38d5d8119111d7267620bf;
    stim[55] = 153'h0b9156789849d895f969c8b76283274547ec9be;
    stim[56] = 153'h0db6b2ad962688ee7240194b953d901eda9b605;
    stim[57] = 153'h04a98fdbaae58feff5168b77a17ddd7fe424f0c;
    stim[58] = 153'h0edc8cf074efe056b49b78cea4c3a14400f27c6;
    stim[59] = 153'h06f934bbc319975d05431cd21ba30338a4028b4;
    stim[60] = 153'h0bdccbfd234d1524043768c31e306421b40d195;
    stim[61] = 153'h0c54f316f1aa18706bbf7a5050ebacecab37639;
    stim[62] = 153'h03b7971d608f499e997a3e635127754e21e64fa;
    stim[63] = 153'h064637f9c34fb56a81d3f03f21fcbe35950f9b0;
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
      expv[0] = 152'h00000000000000000000000000000000000000;
      expv[1] = 152'h00000000000000000000000000000000000000;
      expv[2] = 152'h00000000000000000000000000000000000000;
      expv[3] = 152'h922ed698c6f4837b96aaea39f95b63d9a677a1;
      expv[4] = 152'h75d3695a02d2d4086e8d1edd1edf43570e08d5;
      expv[5] = 152'heaba2c09360e4a05da5532e0c382c958448984;
      expv[6] = 152'hf861dc09d98c3974bbbff183f9bbf887a163f5;
      expv[7] = 152'h00000000000000000000000000000000000000;
      expv[8] = 152'h00000000000000000000000000000000000000;
      expv[9] = 152'hbedda4f262a7d1d89118855f23ce18942bf9ce;
      expv[10] = 152'h80f0004e1f2853cf8b720aa4661e76655ef984;
      expv[11] = 152'h3b8da87cd05818592b6cd7733a2ac8ebec8504;
      expv[12] = 152'h7df40eb845151c40886ed7c4e4ff8b4fa70fcf;
      expv[13] = 152'hcc91f1b7e4a11017ff5e086d84afb57c3b16d8;
      expv[14] = 152'h0263f5a2b6aafe28e712ce69138cebe0792a94;
      expv[15] = 152'hec7bbee0a6ece53db03289017e45e136305e46;
      expv[16] = 152'h14b4f6ded5e28a627076e2770cee59cdd12314;
      expv[17] = 152'h967b36b864491e0fc464abb9e17f523f665041;
      expv[18] = 152'h875f64a1661de420a75770342ed90024f4689a;
      expv[19] = 152'h509c0b4a9815d16236ea5c08c503f75eb39d59;
      expv[20] = 152'h10bb46cf722ed2bd63ffa129910be3c87149b4;
      expv[21] = 152'h7c6d78d0e579cfb69a6dc52563be3b8f771f0c;
      expv[22] = 152'h2a04b5a0eccf568c543267be84416bd4246072;
      expv[23] = 152'h948321932c8ea0bcd316f6fc13fa4fba81f6f6;
      expv[24] = 152'h41cadb8f72ce5d4d195f022bd7eb94cfa3449f;
      expv[25] = 152'h6b8d1784177899cc1ceb169dc2ad5d8e8162ea;
      expv[26] = 152'haafee0bfa4b54eb542e8e9faf8f6309c93b385;
      expv[27] = 152'h362a262d2b6f48b455bd360622eb9c836230f9;
      expv[28] = 152'h9aace409463709422f2ae7a2d5e499f934cf19;
      expv[29] = 152'hb875b11fa86858be08361eb020f64618452ea8;
      expv[30] = 152'h75ddbb0bbf915c44dc90477305f926b2665090;
      expv[31] = 152'hcb87d0677212f482f156ddb4a96e6174db29a9;
      expv[32] = 152'h8f21e46a7aab91984f4b355fbc57febf55b191;
      expv[33] = 152'h1e5e03cb2578ab73b07894738ed03dcaf3ec86;
      expv[34] = 152'h3be2eeca5217a753e831b2b91570454c65be4f;
      expv[35] = 152'h0bac7f0496f6dc71d7828c12872321ffe92f49;
      expv[36] = 152'h6b16f69075dba53bf870fc845f09eceff83a6e;
      expv[37] = 152'hf1bb116df5e05f560669bc7ac70d8c6a46f6c2;
      expv[38] = 152'hd91b949808a3a9446fedefb9a4b8a50d609cfd;
      expv[39] = 152'h7829a515416f95fc3a5bec00253f3dee9e31d9;
      expv[40] = 152'h70e30e11eb63d1490fed73aa404e2224cf8745;
      expv[41] = 152'hf55f750a57558f34689a9aa3248be268f35ac0;
      expv[42] = 152'h2b47b4cba233f7e601beec885dd4ca8b1c4b03;
      expv[43] = 152'h38b67e40eecf3deb4a3999f8d5009596441f49;
      expv[44] = 152'hbcde88310a240d2af294fac2849b9a0857ca68;
      expv[45] = 152'h9ba0c761657b9d369d4b7dfcea1360bd324e3d;
      expv[46] = 152'ha4c91f95969e6317bdad1adaa129d24be3c53c;
      expv[47] = 152'h74d37d7dc400470cf3b83e6ceadd4207d8ca90;
      expv[48] = 152'h23a4c05c1d9e7086037696226d2bfb93430295;
      expv[49] = 152'hd0b3d1d194ac4699bdd630b15601e9681dfc39;
      expv[50] = 152'h8ac38230eef1f1f310b12b3379cfcfd9b93903;
      expv[51] = 152'h92157e5f8211a6b074d233cf15d678f70a245c;
      expv[52] = 152'h6f2b54d5de8f4c9256240d6065fb5184ff1430;
      expv[53] = 152'h0609b0602cd87c77233531a5a78e1fdb95805e;
      expv[54] = 152'he17d0fff48b6869529c8ead14b0825dc2ff5d7;
      expv[55] = 152'hc484f08856d321bc38d5d8119111d7267620bf;
      expv[56] = 152'hb9156789849d895f969c8b76283274547ec9be;
      expv[57] = 152'hdb6b2ad962688ee7240194b953d901eda9b605;
      expv[58] = 152'h4a98fdbaae58feff5168b77a17ddd7fe424f0c;
      expv[59] = 152'hedc8cf074efe056b49b78cea4c3a14400f27c6;
      expv[60] = 152'h6f934bbc319975d05431cd21ba30338a4028b4;
      expv[61] = 152'hbdccbfd234d1524043768c31e306421b40d195;
      expv[62] = 152'hc54f316f1aa18706bbf7a5050ebacecab37639;
      expv[63] = 152'h3b7971d608f499e997a3e635127754e21e64fa;
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
