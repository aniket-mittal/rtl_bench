// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 210;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_175589 dut (
    .i_clk(clk),
    .i_rst(in_vec[209:209]),
    .i_start_en(in_vec[208:208]),
    .iic_data_bus(in_vec[207:24]),
    .iic_done(in_vec[23:1]),
    .usb_done(in_vec[0:0]),
    .o_iic_en(out_vec[10:10]),
    .usb_en(out_vec[9:9]),
    .usb_data(out_vec[8:1]),
    .o_led(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 210'h2947126bc97bf346c3a12aaa4a724265ea8e8ecd16bf358020443;
    stim[1] = 210'h217de2645a08328c209f5fa2de7f1bc21759b1e4a950860815509;
    stim[2] = 210'h0244f1bb2555184a7e906bd263ba020a7c188e429b1d4e3b879a5;
    stim[3] = 210'h1cffc63244cbf602c296e92ec5a3bcab3ddb953452eb90fe0867b;
    stim[4] = 210'h06561fb3e940cf46a8c75aca7f082a619d4d03483e773943d33a3;
    stim[5] = 210'h09687fbb633be3276a6b373405be4730a60e8df73f9eadd7925b0;
    stim[6] = 210'h1be14dd0bce4a4e3e1d89ee89065f502d6ef0d0d27d28e22de081;
    stim[7] = 210'h1e609caafe1009553a95d3555da8fe3607ba8e434be184df65f00;
    stim[8] = 210'h069a5d49a4ec4f70e64cb51187bd91246fd92d72f36bc7fccf6e6;
    stim[9] = 210'h0af402788e10c9778b08d207ecbd9b2b5c5d22dc1843cbd9782aa;
    stim[10] = 210'h08e883fa3d586d7df7200e9c4b45cdf6f692031004e76be0c956c;
    stim[11] = 210'h11e59af9975a975f307f2aa2effe642cc60245bc59590079b36fd;
    stim[12] = 210'h0bb88502aed79297bb3b3c7434c7034ad25c2596f71b78e06ede1;
    stim[13] = 210'h0c1e5e70fd946b8bb211b228579bd3a825674bf12a665574fb185;
    stim[14] = 210'h14385cb368798a16d6293b036d841f841c6e8b82712188ed751f7;
    stim[15] = 210'h0bdeaf07481a3e1232f4ced9752ffae711353716ffcac596c993a;
    stim[16] = 210'h0c83d847d1c9c6a476da3b6b2f810c29c24f8e28fba41d57f6a7a;
    stim[17] = 210'h001189eb3914231f57dc960e361b0f0523f2fba3bca33a06c9568;
    stim[18] = 210'h139addfaecc3c7674f692587bf89895f19c814828192097e6e171;
    stim[19] = 210'h1e33daf16620338e530abe72c6a9b9d64c15a4c7a811a67f25cdc;
    stim[20] = 210'h0947dcd9caaeb245c69f571544fb7e783287028dfd6c8d34e3d89;
    stim[21] = 210'h177c5e4136f911903ade1dd94565418c8acdf9ca87e8acd964b1c;
    stim[22] = 210'h068c0c85061b545ee196031525fd160bfb485836b388bf7a14608;
    stim[23] = 210'h047e7f049802a13c6bd97e1388c537512e9da84a096bf863d3dbb;
    stim[24] = 210'h032e62d07df0a8afe2501d1170dc6ef98d7587ce1d03f6002ad77;
    stim[25] = 210'h16993512e6ddf28d0ffabf168d37ac568df073f87c14e69172fef;
    stim[26] = 210'h1733f94bb843f2c1a4ec47f6ff53d6644faf481ec6dced579ec18;
    stim[27] = 210'h1134b162757862c5104149c6fd071cf2c409f9cc1b548acdd4839;
    stim[28] = 210'h112cf0c39e4ae551412011100a3dbc249186d2600033bdb6f1958;
    stim[29] = 210'h03b4a9c895ad08774fd94c8b7ca0ca7429388531e7788776dd847;
    stim[30] = 210'h065c7b182327483105fc7073da6137e41437222e52dacc5eed9fa;
    stim[31] = 210'h08a278746fe8ca36205afc7a1af62e2fcda0a60c523a4e51962c8;
    stim[32] = 210'h0f17cd3e3c101d52c81f6eef28d6fa6ead00733b27596085df82b;
    stim[33] = 210'h16d8e933561263de76839d5b52a9aa22dc1db887e00deac76fe89;
    stim[34] = 210'h02da4e4dd04f7ee772bda6c63c9267d285b6ece8e7c63be8e3a85;
    stim[35] = 210'h017387d9d34a300fd32c62295845070a01cd403acdf15d82c487d;
    stim[36] = 210'h160bd8a6a0084ad61e3644f8a7338a4fbffd254fa3ab592989cf2;
    stim[37] = 210'h1f13744fede54fd13aa958a981c341ee32e883ca735cf3d8a9abc;
    stim[38] = 210'h257f606fcfd2b4ea40dbb1115a1c36061691e8fa637d1fa54375a;
    stim[39] = 210'h1c20eb6f50aa276264ec27308ee973a8775cc090f1bb5eeab4216;
    stim[40] = 210'h1e10e8430f3e0c648065d019e87e89fa538357bebad64f4aa59c9;
    stim[41] = 210'h05b34aacb6ab3d26600fa34f9cddd099c0f6f8c67126e88ed8048;
    stim[42] = 210'h18eaf654f74ed543be42a6e2cd351ccc564981c7a49e590241a94;
    stim[43] = 210'h10fc9a3a8dbc82d9cb030d9d1fac0c5ab7fd02c4ae35a19cb205d;
    stim[44] = 210'h08e72c34fa7846a9ce9899fcfa5e5e635f02015679fada4dc9cb0;
    stim[45] = 210'h1e2ea199eca351861663ef791c4575183e65bc2496edcd06ecd0c;
    stim[46] = 210'h1c48c07faf4202a18acf4fc462dd26fb0b81aec89b50e556219d3;
    stim[47] = 210'h154a4d36fb7064558cd85c47d9244cdb006c51e8a03c0fd9dbdad;
    stim[48] = 210'h090c61de2e7a4532436ff59993068e658891d75adfd453369d672;
    stim[49] = 210'h0d8cbfc979c6870c050572188b6e9a53707a6d49930bbe1ee9b4e;
    stim[50] = 210'h0af1e4ebd3f61b68f926dfe3aa2cfcc55f20196cc128bc3b43ed4;
    stim[51] = 210'h16b614f0fabf9b5c67b3da803dc0c7d755fd2394e8344ee4c6df2;
    stim[52] = 210'h10041c22068c92940c3f9149457ffe28e36fc24875aba05fc16cd;
    stim[53] = 210'h154620110745833f401de907aac51bf0c6fae917109b8b597ef15;
    stim[54] = 210'h0ea3851e3d625f85e5fe276e16b6819d95ba35b4831fbf6ba2d01;
    stim[55] = 210'h161702d7bd80d5959427a17bd084e2fc5ae327d521dd59093d66b;
    stim[56] = 210'h063950ecc95388a65077e06d77602ac13aeed7a0b356aa361c2a4;
    stim[57] = 210'h0f5542fe7bbf4f033cf940abdfcc2a46313e76099805f0af3b47c;
    stim[58] = 210'h0c794728742bb6de845e8a53e73556c20ebe0ead62e07e165825c;
    stim[59] = 210'h1d87f1a7d675a3c2db7fbc58d08a1a00164b708374616211aa8f5;
    stim[60] = 210'h04058505a57500387601337fabc6fb95f7261353250f4596cf496;
    stim[61] = 210'h186f78e69ed8e875bed08fe49f9e7da3a318ed17e3253d7f5467c;
    stim[62] = 210'h1a4f28c3468234853aa6dd01e248740d0fd4fb1dd39c75044b92c;
    stim[63] = 210'h1f134826d39091bf0367afd80671c83d4bc1311d92ce1dc8361b6;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'h29b;
      expv[9] = 11'h379;
      expv[10] = 11'h309;
      expv[11] = 11'h201;
      expv[12] = 11'h2b7;
      expv[13] = 11'h2b7;
      expv[14] = 11'h2b7;
      expv[15] = 11'h2b7;
      expv[16] = 11'h6b7;
      expv[17] = 11'h2b7;
      expv[18] = 11'h2b7;
      expv[19] = 11'h32f;
      expv[20] = 11'h235;
      expv[21] = 11'h3ad;
      expv[22] = 11'h351;
      expv[23] = 11'h307;
      expv[24] = 11'h307;
      expv[25] = 11'h307;
      expv[26] = 11'h307;
      expv[27] = 11'h707;
      expv[28] = 11'h307;
      expv[29] = 11'h307;
      expv[30] = 11'h2ef;
      expv[31] = 11'h359;
      expv[32] = 11'h247;
      expv[33] = 11'h365;
      expv[34] = 11'h311;
      expv[35] = 11'h311;
      expv[36] = 11'h311;
      expv[37] = 11'h311;
      expv[38] = 11'h110;
      expv[39] = 11'h110;
      expv[40] = 11'h111;
      expv[41] = 11'h511;
      expv[42] = 11'h111;
      expv[43] = 11'h111;
      expv[44] = 11'h233;
      expv[45] = 11'h35b;
      expv[46] = 11'h2dd;
      expv[47] = 11'h313;
      expv[48] = 11'h23d;
      expv[49] = 11'h23d;
      expv[50] = 11'h23d;
      expv[51] = 11'h23d;
      expv[52] = 11'h23d;
      expv[53] = 11'h63d;
      expv[54] = 11'h23d;
      expv[55] = 11'h23d;
      expv[56] = 11'h321;
      expv[57] = 11'h2d5;
      expv[58] = 11'h301;
      expv[59] = 11'h3ad;
      expv[60] = 11'h211;
      expv[61] = 11'h211;
      expv[62] = 11'h211;
      expv[63] = 11'h611;
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
