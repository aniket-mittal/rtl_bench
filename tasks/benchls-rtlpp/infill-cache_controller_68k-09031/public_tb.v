// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 91;
  localparam OW = 110;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09031 dut (
    .Clock(clk),
    .Reset_L(in_vec[90:90]),
    .CacheHit_H(in_vec[89:89]),
    .ValidBitIn_H(in_vec[88:88]),
    .DramSelect68k_H(in_vec[87:87]),
    .AddressBusInFrom68k(in_vec[86:55]),
    .DataBusInFrom68k(in_vec[54:39]),
    .UDS_L(in_vec[38:38]),
    .LDS_L(in_vec[37:37]),
    .WE_L(in_vec[36:36]),
    .AS_L(in_vec[35:35]),
    .DtackFromDram_L(in_vec[34:34]),
    .CAS_Dram_L(in_vec[33:33]),
    .RAS_Dram_L(in_vec[32:32]),
    .DataBusInFromDram(in_vec[31:16]),
    .DataBusInFromCache(in_vec[15:0]),
    .DataBusOutTo68k(out_vec[109:94]),
    .DataBusOutToDramController(out_vec[93:78]),
    .UDS_DramController_L(out_vec[77:77]),
    .LDS_DramController_L(out_vec[76:76]),
    .DramSelectFromCache_L(out_vec[75:75]),
    .WE_DramController_L(out_vec[74:74]),
    .AS_DramController_L(out_vec[73:73]),
    .DtackTo68k_L(out_vec[72:72]),
    .TagCache_WE_L(out_vec[71:71]),
    .DataCache_WE_L(out_vec[70:70]),
    .ValidBit_WE_L(out_vec[69:69]),
    .AddressBusOutToDramController(out_vec[68:37]),
    .TagDataOut(out_vec[36:14]),
    .WordAddress(out_vec[13:11]),
    .ValidBitOut_H(out_vec[10:10]),
    .Index(out_vec[9:5]),
    .CacheState(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 91'h4df165f4b69718540331385;
    stim[1] = 91'h4db75bb38f8bfe440bfb39a;
    stim[2] = 91'h184e0331318772addb2df24;
    stim[3] = 91'h0671ba9be0070b904023e71;
    stim[4] = 91'h1ba11127b6c70e15bb05984;
    stim[5] = 91'h088750b5c97e1e1baaf39d0;
    stim[6] = 91'h39d3343637316713700a930;
    stim[7] = 91'h36562cac5c638a40af3e4cf;
    stim[8] = 91'h18d1faa07b3990ccbbbf2ec;
    stim[9] = 91'h0cca820aca9ff0d2e1bd1df;
    stim[10] = 91'h21187a519cff3b3af9f7fde;
    stim[11] = 91'h1c9fbffb5782a620a6b1d66;
    stim[12] = 91'h12b88c3d89ec5a2bbf3a8a2;
    stim[13] = 91'h64c24f2a3fc8731aab0be08;
    stim[14] = 91'h09b89117d01c912fe6540db;
    stim[15] = 91'h0d3e6eaf39b206c77ee9a84;
    stim[16] = 91'h3051ba5376b1fe03713412c;
    stim[17] = 91'h17bc60bc32fcc3ff658af9d;
    stim[18] = 91'h11d34a312e81bc135ba7ecb;
    stim[19] = 91'h25456519efbd1dfb8f5d593;
    stim[20] = 91'h2ca0479bc9a105ee7c71fc4;
    stim[21] = 91'h24695fb515580cae5f1512f;
    stim[22] = 91'h2708c5f14919e58fd10673c;
    stim[23] = 91'h2658c02cf28dcebf2b22cd0;
    stim[24] = 91'h38d17461aa4d736d00aa3ca;
    stim[25] = 91'h3b53b13eea5ea64f3b90f56;
    stim[26] = 91'h2dbbc7fc4cbe1e7f926206b;
    stim[27] = 91'h03fb4c1395cd67b028deb4e;
    stim[28] = 91'h348036e54b9cc88df67cd3b;
    stim[29] = 91'h1d4c8d9c6901d4ed225eb60;
    stim[30] = 91'h1b0fb0ca17283cb45ed6bb3;
    stim[31] = 91'h2c640e11607f23f696d11ad;
    stim[32] = 91'h0413abc41ccd40efa178d0d;
    stim[33] = 91'h1af5dd02ba971c0d18e7203;
    stim[34] = 91'h048ace5ee3132cb453d77f2;
    stim[35] = 91'h2daf1066ba1065b817652d4;
    stim[36] = 91'h394c0242e20879fdab0b394;
    stim[37] = 91'h349fdc054fd7ec8885cbc3b;
    stim[38] = 91'h150cbd244e310ebca596627;
    stim[39] = 91'h285c531e92a927d2b021c25;
    stim[40] = 91'h23e584addd43849d88ee6bb;
    stim[41] = 91'h14b8ad7a8f62d5e13a04b62;
    stim[42] = 91'h3c39f09d93090442cd8ecb7;
    stim[43] = 91'h0f50ffa80a2c4c053cece17;
    stim[44] = 91'h37a15482d238dcc20344f45;
    stim[45] = 91'h0f893848c1ae3b0ebe505d1;
    stim[46] = 91'h1c5d38590ff55c7417cfb0c;
    stim[47] = 91'h021c25e3e25d7a1425745f4;
    stim[48] = 91'h043e007d62f63768f411eaa;
    stim[49] = 91'h12530777b2d37d90e69135d;
    stim[50] = 91'h0edb27ef639f3aef1746757;
    stim[51] = 91'h1647faac677cb0502a08952;
    stim[52] = 91'h296a7430ac6e00daf05a403;
    stim[53] = 91'h3610bafd09fc1adcfecb8e0;
    stim[54] = 91'h33c6095981dd70f99b9b6d7;
    stim[55] = 91'h14d0adad1fa6bc70042ea91;
    stim[56] = 91'h2a8a8111f8ece9af163744e;
    stim[57] = 91'h1e6eae3f320e21ba24a374c;
    stim[58] = 91'h0451315e9ca1519b862ca44;
    stim[59] = 91'h1baadb038a678327ced4fdc;
    stim[60] = 91'h15e53855f19da178a9df3ec;
    stim[61] = 91'h253e4620745f211afaeac7b;
    stim[62] = 91'h3c1d8f6bd7210d8ce4e43e3;
    stim[63] = 91'h064415b38e54f1cb7a17eb2;
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
      expv[0] = 110'h04e174b8c9f7c597d217c597c120;
      expv[1] = 110'h2ce6bc5ff9d6dd6ece16dd6ec001;
      expv[2] = 110'h37c90c3b9be1380cc401380cc040;
      expv[3] = 110'h0f9c40385ff9c6ea6e19c6ea42e0;
      expv[4] = 110'h1661363879ee84449e0e844481e0;
      expv[5] = 110'h0e740bf0f9e21d42d6021d42c160;
      expv[6] = 110'h2a4c398b3de74cd0d8074cd0c180;
      expv[7] = 110'h3933e31c59f958b2b01958b28300;
      expv[8] = 110'h3cbb19cc8be347ea800347ea8000;
      expv[9] = 110'h3477d4ff8bf32a082a132a0802a0;
      expv[10] = 110'h1ff7a7f9dde461e9460461e94060;
      expv[11] = 110'h0759bc1539f27effec127effc2c0;
      expv[12] = 110'h2a288f62d9eae230f60ae230c360;
      expv[13] = 110'h2f823e439df3093ca813093c8280;
      expv[14] = 110'h1036c0e48de6e2445e06e24441e0;
      expv[15] = 110'h26a10d903bf4f9babc14f9ba83c0;
      expv[16] = 110'h104b358ff9e146e94c0146e940c0;
      expv[17] = 110'h2be757e61ffef182f01ef182c300;
      expv[18] = 110'h1fb2f40de9e74d28c4074d28c040;
      expv[19] = 110'h3564fde8eff51594661515944260;
      expv[20] = 110'h07f10d082ff2811e6e12811e42e0;
      expv[21] = 110'h144beac06bf1a57ed411a57ec140;
      expv[22] = 110'h19cf08cf2ffc2317c41c2317c040;
      expv[23] = 110'h0b34146e7bf96300b21963008320;
      expv[24] = 110'h28f2926b9de345d1860345d18060;
      expv[25] = 110'h03d592f539ed4ec4fa0d4ec4c3a0;
      expv[26] = 110'h081ae5f0f9f6ef1ff016ef1fc300;
      expv[27] = 110'h3ad3ae6b3fefed304e0fed3040e0;
      expv[28] = 110'h334edce64bf200db941200db8140;
      expv[29] = 110'h3ad8080eabf53236701532364300;
      expv[30] = 110'h1aecf941ebec3ec3280c3ec30280;
      expv[31] = 110'h046b43f91ff19038441190384040;
      expv[32] = 110'h2343666a0bf04eaf10104eaf0100;
      expv[33] = 110'h1c80d4b8e9ebd7740a0bd77400a0;
      expv[34] = 110'h1dfc98996bf22b397a122b3943a0;
      expv[35] = 110'h14b510832ff6bc419a16bc4181a0;
      expv[36] = 110'h2ce51043cfe530090a05300900a0;
      expv[37] = 110'h2f0efebf6bf27f7014127f700140;
      expv[38] = 110'h1989f1887bf432f4901432f48100;
      expv[39] = 110'h070955493fe1714c7a01714c43a0;
      expv[40] = 110'h39aeea1c2bef9612b60f96128360;
      expv[41] = 110'h12d8bb16aff2e2b5ea12e2b5c2a0;
      expv[42] = 110'h3b2dd84829f0e7c27610e7c24360;
      expv[43] = 110'h3385d16269fd43fea01d43fe8200;
      expv[44] = 110'h13d151c6ebfe85520a1e855200a0;
      expv[45] = 110'h01744d71ddfe24e1221e24e10220;
      expv[46] = 110'h3ec33faae9f174e1641174e14240;
      expv[47] = 110'h117d12ebd9e870978e08709780e0;
      expv[48] = 110'h07aa97b1bdf0f801f410f801c340;
      expv[49] = 110'h04d7569befe94c1dde094c1dc1e0;
      expv[50] = 110'h19d5dcf9dbfb6c9fbc1b6c9f83c0;
      expv[51] = 110'h2254bbe589f91feab0191fea8300;
      expv[52] = 110'h2900e3700be5a9d0c205a9d0c020;
      expv[53] = 110'h2e380fe0dbf842ebf41842ebc340;
      expv[54] = 110'h2db5ceeb8bef1825660f18254260;
      expv[55] = 110'h3aa47d35e9f342b6b41342b68340;
      expv[56] = 110'h1d1387674fea2a04460a2a044060;
      expv[57] = 110'h0dd310710ff9bab8fc19bab8c3c0;
      expv[58] = 110'h3291250a8ff144c57a1144c543a0;
      expv[59] = 110'h13f7133c1deeab6c0e0eab6c00e0;
      expv[60] = 110'h3cfb0ced0df794e1561794e14160;
      expv[61] = 110'h2b1ee2f90df4f9188014f9188000;
      expv[62] = 110'h10f8f9086ff0763dae10763d82e0;
      expv[63] = 110'h1facb2a78ff91056ce191056c0e0;
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
