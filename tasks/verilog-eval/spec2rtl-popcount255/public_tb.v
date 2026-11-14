// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 255;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[254:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 255'h1940995d689e44ca2653ef3a7df39e89b04e76eef5a50fb2035975b30cca7f74;
    stim[1] = 255'h428f3bd550357772a970bf9d6bccc006dd530be0d6900bf9788ce8a797ff9341;
    stim[2] = 255'h600810312909b9f2bda60fadbb54de231459aba22c5c1af0eff40c09dfa2b865;
    stim[3] = 255'h5ce24aefde6960309bf156c7e6b979dc5caa88b752f0e9ab02a069535578312d;
    stim[4] = 255'h2ad12b45555bf65f69118f3642b594438740ecaedc4b489097242d3d0630d660;
    stim[5] = 255'h3be030a52e1277358229fdde26533a086c1cbb6d1904ae7950c84e24d745c381;
    stim[6] = 255'h43c8c9e458985fab54bb07c2ec954dc5c664b18a0253eaed9076d411ff2dc2b3;
    stim[7] = 255'h6d16b5d76fc4a699c19a23133e5bfe55f07dada1ef58ce943406d200b1dab506;
    stim[8] = 255'h2cde5b3c019af84e183e7e2b38b653b2a5b2c86d581c55dd421423c0498c59c1;
    stim[9] = 255'h49f220ad685349e77f9430e59d5b8c3699aaf123a02cb7cbf3651f22db250e7c;
    stim[10] = 255'h412656f5368acb43687a8f761b5d962e4770dcf0af7aedc984dab9ef7f4bf3a5;
    stim[11] = 255'h6387dc55474dbbd0688bfa5410026128323c7d8f0455a5890c4a659c7b6a6bea;
    stim[12] = 255'h2e20fa830ea37824716857c4dcceb68826453ae3f65711148527fd4af83c37d9;
    stim[13] = 255'h7a50adb227d4eb6d55a919cae69567f17a2346425ea5553335bcf15bec9a97b0;
    stim[14] = 255'h185d02d92c469c68e7254059f50bda56542a54a6212aa729eb963b5ed9f7142b;
    stim[15] = 255'h53bf63a35f4a6bb5a12f19d031a0ced52aefe786e708c4322eea5d9c1e71a94a;
    stim[16] = 255'h2e13e18eab3479ff5f7a8177e9610fcca2e0111987dfeb98d1417c307b703722;
    stim[17] = 255'h7786f3ca5fb6444636c58bf3932d9fe10492c3b4725cdb872fea4832a6ff97be;
    stim[18] = 255'h2fb639f973751f6a0bc890e6397de80b705f11d944375ff06246401badc59806;
    stim[19] = 255'h3ba82a9a7ed16de4d32704f2bf12caa13577353034588fbf322ce0fbc59c1278;
    stim[20] = 255'h495e7c59c2a1e4ded19f87b6085bb610b8512cbb5f633536a2935227ed81daac;
    stim[21] = 255'h7c736fe42be72e11a915f25939f03ade39caad25653d313fba81f0b86374a38d;
    stim[22] = 255'h3557a2fa249b894afff31e51b73b2ff7b9112762d3f694b0dc12a03f77b4e4e4;
    stim[23] = 255'h63f83d15a09de9e9f0894853a9747d0e92cecbc9ffb1f2589ce6ba1918314ad2;
    stim[24] = 255'h1d088161b5a66cd3dfcf06449006a1ae9564077720500ef621f7cf688b13d755;
    stim[25] = 255'h18fd175a257b0cdb522140ec00682da7d245952746fb4c47512957a2cb604deb;
    stim[26] = 255'h1131b78fd21d3c469590902b0abbfa1e0f92649fb2a035b2407e3533ddca35dc;
    stim[27] = 255'h59751cb29fd545d22532ff1fe8386a8538c5ab56c842b83058fb5ba36b215848;
    stim[28] = 255'h70109830760f238305ba86a39b313b928c54dce4e55a66d367d77c1be2bef008;
    stim[29] = 255'h29ac84af957642ae193b8c4a70693e1bb98572113bd8f60f3c028974f0af34f4;
    stim[30] = 255'h45f8ea725d59013e10b55203fe5f98edc8bedaf975c4d86f29d1c9303007d874;
    stim[31] = 255'h6f46a93c3bb565257285ce625461760aa3b2735534702b0008d8d89906eba89e;
    stim[32] = 255'h3fa6e8223712c745d4ba0f064b2e8a3d0832269f12ba2071c80c2597aee68413;
    stim[33] = 255'h7b3e494161b530d54f609a92f72d0bc40db7e05f611cd23b29c5e2b36794552f;
    stim[34] = 255'h1cbebe196450f857c8bd6f8624c6dfeba147aebe8815af68d3cda17de83e65f1;
    stim[35] = 255'h6e309c2c9bc19f7c2a4bdfcb495d717e1a896c8441c9f963e895dd6b475a56fa;
    stim[36] = 255'h43ddce2db6ca3fc988e42bad4e44b9d474cbfdcf398f148249e06e09f10df30f;
    stim[37] = 255'h74180ca4304ae01dbbdf91a6fcf5cee4d521733021ed366cfe98b4c3b7e8b24f;
    stim[38] = 255'h74e28ce6876324d841dec304470faa2fad4443451bfc120e8f1f3187d6301aa6;
    stim[39] = 255'h2ffd44002e5e93069647ffaa67746d93d9371dd21ec53d401fef9090f63b848d;
    stim[40] = 255'h52fa4e79cbb6e3468ad5a2794bbf9b89f4d73981a94353d4c8e949aa0d647f1d;
    stim[41] = 255'h005832bc965927426aa0f85f6e930064ef9d75bda3a69044c75159f77cf04d76;
    stim[42] = 255'h64dfdef0dbad824c5d668b657639d683997f17335721862e6923909100468787;
    stim[43] = 255'h41060692a35c9fa43f1058e620cb6f4d6f94ad4d05519535835fecb6644b9d4e;
    stim[44] = 255'h44b094dfab37ad57ba60fd0ebf3636144e7612a6f3c7545673d5dcf4c80e6114;
    stim[45] = 255'h6fff9759ffcf96201a7db1db5d7938b4dfa1961ad2918f221e427daf7e701d03;
    stim[46] = 255'h2441ca9fe7c5a5acdd8854645fb2dcafe3e2abe9c1654f965525779d3e889fd3;
    stim[47] = 255'h2f98fe7f2c2d8b14ccfa64ed07f4a72ec03aa1715878e0b40504fdcecd18856f;
    stim[48] = 255'h48b93f82af68b9c1579b01c261b11c490f324fe65d293cc4e9860dc6115678eb;
    stim[49] = 255'h59392459e28723210955d0d585b744b08223a6759c6c971499838f7e7a706b79;
    stim[50] = 255'h47ce4bf4ee73967f2bed00b105aafea5b82ac08a5ab8eafddda5e084e2607114;
    stim[51] = 255'h0860de3b1eadb29fd47cd4ea748d93c2460394ce1507cd46234cc0ff93d50253;
    stim[52] = 255'h26a0c1474eafe4f78bf0e2d826cd8a9967b3a4ceca5d2e4d3131e747bc0c83a5;
    stim[53] = 255'h0fec5b5c06fd85dff3ef0f7df3f121c6709e49438568631a05a9d389029ca4e0;
    stim[54] = 255'h16d256fe9015f87bccd1642f1352124eb201d6b09f98d744f0322ab7fc7667fb;
    stim[55] = 255'h1c2ddeb572c3d5843a2d9371d2b5e7fc6c4bb519d5c7956c348427c4dab4c849;
    stim[56] = 255'h54efb2888bd977e156aa06db5ccb19e2e52674144805d22a886d5bdd24d32301;
    stim[57] = 255'h124db6ff858ed71f58243b36b32fdfe7c13397d92cc2bec9bd7027b3ad6db984;
    stim[58] = 255'h7b875e7c86137a724beb0843e4d1b3a0395cd0f4a3a97a9f5f4836c5b0a5386f;
    stim[59] = 255'h139328fdf754dcd66c1c6a7d5e4db608c41de340ac2bdd2ce9d05a74412af180;
    stim[60] = 255'h20671c1ee774262dfddb37a2b6bdc0d0346b06668df39e241f816dffb9217c7b;
    stim[61] = 255'h6ab1addb0a63e5f8a3745d77b415b512a2dad0db83fe1749141ede1339df768d;
    stim[62] = 255'h06264c59d210e8ccecd81c411bca8850bee63b2877f9baddd608458dc243d28a;
    stim[63] = 255'h7aeafeaffa55c6979383a10e6512159ff8fa1c68f7e1ef2e400b1c4930fd452c;
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
      expv[0] = 8'h86;
      expv[1] = 8'h84;
      expv[2] = 8'h79;
      expv[3] = 8'h82;
      expv[4] = 8'h76;
      expv[5] = 8'h76;
      expv[6] = 8'h7e;
      expv[7] = 8'h83;
      expv[8] = 8'h77;
      expv[9] = 8'h82;
      expv[10] = 8'h8e;
      expv[11] = 8'h78;
      expv[12] = 8'h7d;
      expv[13] = 8'h87;
      expv[14] = 8'h7a;
      expv[15] = 8'h84;
      expv[16] = 8'h83;
      expv[17] = 8'h8b;
      expv[18] = 8'h7f;
      expv[19] = 8'h81;
      expv[20] = 8'h81;
      expv[21] = 8'h87;
      expv[22] = 8'h8b;
      expv[23] = 8'h82;
      expv[24] = 8'h78;
      expv[25] = 8'h78;
      expv[26] = 8'h7d;
      expv[27] = 8'h7d;
      expv[28] = 8'h7a;
      expv[29] = 8'h7c;
      expv[30] = 8'h81;
      expv[31] = 8'h76;
      expv[32] = 8'h73;
      expv[33] = 8'h80;
      expv[34] = 8'h8b;
      expv[35] = 8'h87;
      expv[36] = 8'h85;
      expv[37] = 8'h83;
      expv[38] = 8'h77;
      expv[39] = 8'h84;
      expv[40] = 8'h87;
      expv[41] = 8'h7e;
      expv[42] = 8'h7e;
      expv[43] = 8'h7b;
      expv[44] = 8'h85;
      expv[45] = 8'h8e;
      expv[46] = 8'h8a;
      expv[47] = 8'h81;
      expv[48] = 8'h7a;
      expv[49] = 8'h78;
      expv[50] = 8'h82;
      expv[51] = 8'h7b;
      expv[52] = 8'h81;
      expv[53] = 8'h81;
      expv[54] = 8'h83;
      expv[55] = 8'h83;
      expv[56] = 8'h79;
      expv[57] = 8'h8e;
      expv[58] = 8'h83;
      expv[59] = 8'h7d;
      expv[60] = 8'h88;
      expv[61] = 8'h89;
      expv[62] = 8'h76;
      expv[63] = 8'h86;
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
