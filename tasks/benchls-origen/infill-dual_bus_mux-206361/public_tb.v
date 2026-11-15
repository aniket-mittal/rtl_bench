// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 143;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_206361 dut (
    .reset(in_vec[142:142]),
    .data_A(in_vec[141:110]),
    .data_B(in_vec[109:78]),
    .data_D_prime(in_vec[77:46]),
    .PC_1(in_vec[45:36]),
    .const_unit(in_vec[35:4]),
    .MA_MB(in_vec[3:2]),
    .HA_HB(in_vec[1:0]),
    .bus_A(out_vec[63:32]),
    .bus_B(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 143'h4d63305555926123eef50be92058dc9a9c87;
    stim[1] = 143'h5acbbf9681434a68da88b34f3c06c88a9661;
    stim[2] = 143'h297cce487d90ab6df466daa80689773cfa35;
    stim[3] = 143'h34d753b5609033d79d1626a93160a28abd94;
    stim[4] = 143'h32970ff034700a3394ad5ae9405d951464a4;
    stim[5] = 143'h272ec23da5ae40d16e898bf9c911507715dd;
    stim[6] = 143'h29fe6242bf5fcc9293acaa4f0d9d0dbe2228;
    stim[7] = 143'h3decbb219cf7e4976f2fb2311aa273ce68cc;
    stim[8] = 143'h2f2f828d0be5cdbf95cf6508c021545dc860;
    stim[9] = 143'h05c064dbf0a0cfcc5e55b8c582b13918d2da;
    stim[10] = 143'h2d2cd5e70e5368d94841b38f19d4dc8eefed;
    stim[11] = 143'h34aa2cc7466e366d59b2812387be9694d01b;
    stim[12] = 143'h2b33c9e0a25d3c15637de069b6b65ddf7cfb;
    stim[13] = 143'h2cb7c1dd42e51a4ffab15d1be640ea905800;
    stim[14] = 143'h23c8f278a87392ff4ca83484ee8d491b7faa;
    stim[15] = 143'h20857ad6e4d1393f29ab98c08be7d3d43ab4;
    stim[16] = 143'h1dd152734023b05fdd257fc48b808b22d291;
    stim[17] = 143'h392c9f88fdfdac84ab753f18ae00336a3372;
    stim[18] = 143'h1e8fde0d55b34942c2c0e84ce5b034997d1b;
    stim[19] = 143'h3f4a471a272658288eb38e3b6e662d9d6e4e;
    stim[20] = 143'h086e03dddac105a5e96686315b6e7071f3e3;
    stim[21] = 143'h3da7edcb9a3c05af5d3e9a276829f052b2a8;
    stim[22] = 143'h0ee44f09548ee25babd1a70d88c781e079b5;
    stim[23] = 143'h1158923fddd99b3a5016a707269daf8c0bf3;
    stim[24] = 143'h2978b21e85f8822f87d628c330f68c69e3d4;
    stim[25] = 143'h01a6042dfbf64a75773ee7f42b445df889f0;
    stim[26] = 143'h017f8418a53cbb958094edd5ae4ce4cd895d;
    stim[27] = 143'h0b2827f5eaadb53ad1db75f79063515826e7;
    stim[28] = 143'h33acfe31d5e54c8be1fabd5d190d05c950ec;
    stim[29] = 143'h024cd90a6cce6da9d2aa6b9c66a4273b1c2d;
    stim[30] = 143'h2b1959c9f80056c601375370c1318d65abec;
    stim[31] = 143'h3e1bb27199b4f7ce3ddda552bc0b7455a987;
    stim[32] = 143'h2f2f2b092a387d32c8cb96c00081df614810;
    stim[33] = 143'h1fc805ab59d928b73f7f3245edcf057ed3cb;
    stim[34] = 143'h1bb0734e1ad76da0fc5bcf6364e40541cb05;
    stim[35] = 143'h0151caaf099f6cd35fa28e6dedb306df6b77;
    stim[36] = 143'h3aacb2ff1eb542f4c697da9a7e2d4a89645b;
    stim[37] = 143'h26c74ea3adcbc3d00e84298621ee80e48286;
    stim[38] = 143'h17acd85149f06cb9a1ee3722cc79baad20fc;
    stim[39] = 143'h3c182095c4d46995d776e8fdfbacfb07c098;
    stim[40] = 143'h323887676be1ec21156b128242fa00708dab;
    stim[41] = 143'h3684fdacaa624e990b62ba76fe3198399f38;
    stim[42] = 143'h07dcaea90022877d5e971490231c9fc50f66;
    stim[43] = 143'h0aa3eedfc14104f589b6f061abd93ff5c369;
    stim[44] = 143'h3830c7abde0a0d0054cf7ad320325dc01c28;
    stim[45] = 143'h0703e149303bc729b41db97be7433a4b8e86;
    stim[46] = 143'h2152ff89787ea0c5fc27d3f39ff704b531d2;
    stim[47] = 143'h25d0c3f1200594fe5eec459cba45bd76771c;
    stim[48] = 143'h23535e944874c21d2596bcfdc68238e10543;
    stim[49] = 143'h1643052db9886ecff0f6c6f577f9d3e65e7f;
    stim[50] = 143'h02e593cff204d7b2cfeebeb5f94004d29e22;
    stim[51] = 143'h0792eb39ea503c5bd8f35d2c8840a676132c;
    stim[52] = 143'h2d6f5a31e0a648ae0815a275a7a6597fc297;
    stim[53] = 143'h11f17b333decb7b823049fc5054e4de9e9ef;
    stim[54] = 143'h1efe85d688c188e35703d544f700e201ec48;
    stim[55] = 143'h06192b48bb7165e59397f3d09f22e0fed428;
    stim[56] = 143'h1df7ad109adc17519dbe1058b2f4ddd59167;
    stim[57] = 143'h1a96f3493d2a164715c078b471fd348f6aa0;
    stim[58] = 143'h1b842e627e4a31a9e9181877ff74690fdfac;
    stim[59] = 143'h071c3b23af6009c0fb8e890fb6b3f4c59a30;
    stim[60] = 143'h0788bbd46b635dfa9d425f2e45114be9ce06;
    stim[61] = 143'h2760c21e3a4c551395c66ba1539aaf6d6af6;
    stim[62] = 143'h1f1d56bbb274826e2ccdb5cf115e647b9b4d;
    stim[63] = 143'h2b985b8ae4211e38032ff22752b780a1f9eb;
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
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'hf642adb7a5f33921;
      expv[3] = 64'h8240cf5e8240cf5e;
      expv[4] = 64'hd1c028ced1c028ce;
      expv[5] = 64'hba262fe71507715d;
      expv[6] = 64'h000000d9d0dbe222;
      expv[7] = 64'hbcbec8c4000001aa;
      expv[8] = 64'hbcbe0a34bcbe0a34;
      expv[9] = 64'h0000002b1701936f;
      expv[10] = 64'h2106ce3c4dc8eefe;
      expv[11] = 64'h0000007b19b8d9b5;
      expv[12] = 64'h0000036b8974f055;
      expv[13] = 64'hb2df0775b2df0775;
      expv[14] = 64'h000002e88f23c9e2;
      expv[15] = 64'h9344e4fc9344e4fc;
      expv[16] = 64'h774549cd008ec17f;
      expv[17] = 64'he4b27e230336a337;
      expv[18] = 64'h0000025b56cd250b;
      expv[19] = 64'h3ace38ed9c9960a2;
      expv[20] = 64'h21b80f77000001b6;
      expv[21] = 64'h000002829f052b2a;
      expv[22] = 64'h523b896e3b913c25;
      expv[23] = 64'h456248ff00000269;
      expv[24] = 64'h17e208be17e208be;
      expv[25] = 64'h069810b7069810b7;
      expv[26] = 64'h0253b756ce4cd895;
      expv[27] = 64'haab6d4eb3515826e;
      expv[28] = 64'h87eaf57400000190;
      expv[29] = 64'h4aa9ae714273b1c2;
      expv[30] = 64'h04dd4dc300000013;
      expv[31] = 64'h66d3df38b7455a98;
      expv[32] = 64'hbcbcac24bcbcac24;
      expv[33] = 64'h000002dc6764a2dc;
      expv[34] = 64'h6b5db6836ec1cd38;
      expv[35] = 64'h267db34d306df6b7;
      expv[36] = 64'h000003e27ad50bd3;
      expv[37] = 64'hb72f0f400000021e;
      expv[38] = 64'h87b8dc8b000000c7;
      expv[39] = 64'h000003bacfb07c09;
      expv[40] = 64'h0000002faf87b084;
      expv[41] = 64'h000003e3198399f3;
      expv[42] = 64'h008a1df500000231;
      expv[43] = 64'h000002bd000002bd;
      expv[44] = 64'h0000020325dc01c2;
      expv[45] = 64'hc0ef1ca600000274;
      expv[46] = 64'h854bfe25704b531d;
      expv[47] = 64'h7bb11672000003a4;
      expv[48] = 64'h8d4d7a5100000068;
      expv[49] = 64'hc3db1bd5590c14b6;
      expv[50] = 64'h0b964f3f004d29e2;
      expv[51] = 64'h63cd74b200000084;
      expv[52] = 64'h829922b86597fc29;
      expv[53] = 64'h8c127f1447c5eccc;
      expv[54] = 64'h000003700e201ec4;
      expv[55] = 64'h000001f22e0fed42;
      expv[56] = 64'h6b705d464ddd5916;
      expv[57] = 64'h6a5bcd246a5bcd24;
      expv[58] = 64'ha46061df000003f7;
      expv[59] = 64'h1c70ec8e1c70ec8e;
      expv[60] = 64'had8d77ea00000051;
      expv[61] = 64'he931544e00000139;
      expv[62] = 64'hb336d73ce647b9b4;
      expv[63] = 64'h0000012b908478e0;
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
