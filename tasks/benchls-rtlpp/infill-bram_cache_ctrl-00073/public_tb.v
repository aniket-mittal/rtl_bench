// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 148;
  localparam OW = 81;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00073 dut (
    .clk_memory(clk),
    .bram_dout(in_vec[147:84]),
    .addr(in_vec[83:66]),
    .cache(in_vec[65:2]),
    .cready(in_vec[1:1]),
    .aresetn(in_vec[0:0]),
    .bram_addr(out_vec[80:68]),
    .bram_clk(out_vec[67:67]),
    .bram_rst(out_vec[66:66]),
    .bram_din(out_vec[65:2]),
    .bram_en(out_vec[1:1]),
    .bram_we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 148'hc20793625b6f701d9258e2cb5601893233264;
    stim[1] = 148'hd1f0610cf2e6fb631358269e2f8bdbd892004;
    stim[2] = 148'h443c20748542f628280abc58213aa00b4a25f;
    stim[3] = 148'h981583cca56899d7c34c8b8c1ca95433aaf9d;
    stim[4] = 148'h0ea543d86a596175adb4f78a72fc88b7adf79;
    stim[5] = 148'he2d6465402a497e774f608c72037e18ad9197;
    stim[6] = 148'h9ab9ac9a5902f4e19d6587ef880abd4c873ed;
    stim[7] = 148'hd478ebcdbf9f47ab9ab17343eaa3478872713;
    stim[8] = 148'h1ae18ec663129c974533b0835150f150734b9;
    stim[9] = 148'h5a352ac66a77291c9095fee1dd2222af80a7b;
    stim[10] = 148'hf4fae32f98e0cd1defe4617909e52ecbae829;
    stim[11] = 148'h7ba57e6d94711d8c5d0d0bda581f1fa8a39cb;
    stim[12] = 148'h1208fb0f75b7d7de7020c216fd0cc5adba4f9;
    stim[13] = 148'h72012e4fc031168ddb6dd2fe418bc24248ef9;
    stim[14] = 148'h94604d96b9af0fbbd2622f45fbc8ebdb99439;
    stim[15] = 148'hc4cc5b98fda8a0467a87b2d0f5b223fe79f61;
    stim[16] = 148'h323a37717afba4f60d4eb3b9c6ccfe5b3451b;
    stim[17] = 148'h1185649e4ae5e7d414f9de9ab518fb28b71c5;
    stim[18] = 148'he20e792ad0d7e01b941db9c1b3aedae7e17b3;
    stim[19] = 148'h5199e84c0fde518bed9804b7a5499b17744a3;
    stim[20] = 148'h135018610ee78f7baa530123a83b3ab02a811;
    stim[21] = 148'hd9d079da1de71560b8e4a4cdf007f6d4efd11;
    stim[22] = 148'hdb23a8d0cc4394dd4acf2b889cdf7b94c3b0d;
    stim[23] = 148'h33a29483a7ca6a49f5107198a909279b3a859;
    stim[24] = 148'h75d11fffdab8306fc1007a730099b92e62377;
    stim[25] = 148'h376004a11e1b905dc24c2a0d00c1464a774d5;
    stim[26] = 148'h96f8cfd7f754e9e4b434d391103d247b05361;
    stim[27] = 148'h8dd7d9d7794520b5d05801706a063e0ec80fd;
    stim[28] = 148'he09e57bcd8922c444c4fd0c21ebf6d312ec05;
    stim[29] = 148'had3d8fdbbf45aac799e4d92b59e8a9f167fe5;
    stim[30] = 148'h48b7559fbe3d9e3832755939d4b4ef4539ab1;
    stim[31] = 148'hddd7bcf0196ee339b08d12d580de51f5d2937;
    stim[32] = 148'h530bfc836cb1bee5e6d86f87ccdc9206ff985;
    stim[33] = 148'h03e0ed895d83de0d072a35c7d976060766aeb;
    stim[34] = 148'hbf475b78a06e114870fb12248f833b227565d;
    stim[35] = 148'haeff5c2590f0d5c81a950d795f78c37ba2d23;
    stim[36] = 148'hc842d455d146877ebc4287fd2baa590da2143;
    stim[37] = 148'he3da8edd21d016481004b198fda5df68cf1f1;
    stim[38] = 148'h83c062b8b92cfacc71e6a71dacb69b4465b99;
    stim[39] = 148'h82255f5dd0d37675d6547ad821ed4726f1c09;
    stim[40] = 148'h0125fc1f4c8f296d42fcf50d2a922109a759d;
    stim[41] = 148'hd35f98affb329dee732b023d05a70ba3471ab;
    stim[42] = 148'h96c97d022a188215261cdd1391d381be754f5;
    stim[43] = 148'hf43bcf459d6ac7981ecb26faec9690133ec5f;
    stim[44] = 148'h527bacb7cd1983bc5f1ba7c8449fb5226cc4d;
    stim[45] = 148'h65a8b9c3e0b51ff7e49546a718fa97bea8065;
    stim[46] = 148'h2ef69b57f2beab8966f5f425b1934c1ff83c3;
    stim[47] = 148'haf3f28055af0d4c3fbf245dc1d37ccf377a5d;
    stim[48] = 148'h0d36ab1a16d60f1308dcaed30ddc8ef74ef6f;
    stim[49] = 148'ha1678b987d8f56b0b28d94e4dfe69d0002f75;
    stim[50] = 148'h33509234fd0f23a7b46b9e1c2b168b6891649;
    stim[51] = 148'h302fe42bb945f3b11ffa9a5df031ed7cd95f9;
    stim[52] = 148'hef6d9e3acad1496acfcf3feb34493e3c465ad;
    stim[53] = 148'h8b462b77a3ff6ada2a16d60543e8417f0b305;
    stim[54] = 148'h8b223d7d00aa01e38f765d1781e9e4dd89c65;
    stim[55] = 148'hb97a4307f59b1c1045ae620ff0b6f11a3b665;
    stim[56] = 148'h91e4af6b2fc8d4116ea68f1fca61a0e0f7777;
    stim[57] = 148'hf86328aeb9083334540ebdb896e566a6f744b;
    stim[58] = 148'h2b9c34afba841f1406c05cb23ed44fdabf2c1;
    stim[59] = 148'h08362e770c6722c9fcad224a71e8fdbab9545;
    stim[60] = 148'h6d93e8b93bce6b828f79d1c2fd286adb9b687;
    stim[61] = 148'h1f5e9fa386ddb99fdf4fbc10000c723767d23;
    stim[62] = 148'h2fce81daa11d5d4a00495beba78df1d3406d9;
    stim[63] = 148'h003e0aff13d79873df2975adb8a06eb0f94d7;
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
      expv[0] = 81'h000040000000000000000;
      expv[1] = 81'h000040000000000000000;
      expv[2] = 81'h000040000000000000000;
      expv[3] = 81'h0501bc58213aa00b4a25f;
      expv[4] = 81'h0501bc58213aa00b4a25c;
      expv[5] = 81'h0501bc58213aa00b4a25c;
      expv[6] = 81'h0e9e88c72037e18ad9197;
      expv[7] = 81'h0e9e88c72037e18ad9194;
      expv[8] = 81'h1356b343eaa3478872713;
      expv[9] = 81'h1356b343eaa3478872710;
      expv[10] = 81'h1212bee1dd2222af80a7b;
      expv[11] = 81'h1212bee1dd2222af80a78;
      expv[12] = 81'h0ba18bda581f1fa8a39cb;
      expv[13] = 81'h0ba18bda581f1fa8a39c8;
      expv[14] = 81'h0ba18bda581f1fa8a39c8;
      expv[15] = 81'h0ba18bda581f1fa8a39c8;
      expv[16] = 81'h0ba18bda581f1fa8a39c8;
      expv[17] = 81'h01a9b3b9c6ccfe5b3451b;
      expv[18] = 81'h01a9b3b9c6ccfe5b34518;
      expv[19] = 81'h1283b9c1b3aedae7e17b3;
      expv[20] = 81'h1db384b7a5499b17744a3;
      expv[21] = 81'h1db384b7a5499b17744a0;
      expv[22] = 81'h1db384b7a5499b17744a0;
      expv[23] = 81'h1db384b7a5499b17744a0;
      expv[24] = 81'h1db384b7a5499b17744a0;
      expv[25] = 81'h1820ba730099b92e62377;
      expv[26] = 81'h1820ba730099b92e62374;
      expv[27] = 81'h1820ba730099b92e62374;
      expv[28] = 81'h1820ba730099b92e62374;
      expv[29] = 81'h1820ba730099b92e62374;
      expv[30] = 81'h1820ba730099b92e62374;
      expv[31] = 81'h1820ba730099b92e62374;
      expv[32] = 81'h161192d580de51f5d2937;
      expv[33] = 81'h161192d580de51f5d2934;
      expv[34] = 81'h00e5b5c7d976060766aeb;
      expv[35] = 81'h00e5b5c7d976060766ae8;
      expv[36] = 81'h03528d795f78c37ba2d23;
      expv[37] = 81'h178887fd2baa590da2143;
      expv[38] = 81'h178887fd2baa590da2140;
      expv[39] = 81'h178887fd2baa590da2140;
      expv[40] = 81'h178887fd2baa590da2140;
      expv[41] = 81'h178887fd2baa590da2140;
      expv[42] = 81'h0e65823d05a70ba3471ab;
      expv[43] = 81'h0e65823d05a70ba3471a8;
      expv[44] = 81'h03d9a6faec9690133ec5f;
      expv[45] = 81'h03d9a6faec9690133ec5c;
      expv[46] = 81'h03d9a6faec9690133ec5c;
      expv[47] = 81'h0cdeb425b1934c1ff83c3;
      expv[48] = 81'h0cdeb425b1934c1ff83c0;
      expv[49] = 81'h011baed30ddc8ef74ef6f;
      expv[50] = 81'h011baed30ddc8ef74ef6c;
      expv[51] = 81'h011baed30ddc8ef74ef6c;
      expv[52] = 81'h011baed30ddc8ef74ef6c;
      expv[53] = 81'h011baed30ddc8ef74ef6c;
      expv[54] = 81'h011baed30ddc8ef74ef6c;
      expv[55] = 81'h011baed30ddc8ef74ef6c;
      expv[56] = 81'h011baed30ddc8ef74ef6c;
      expv[57] = 81'h0dd48f1fca61a0e0f7777;
      expv[58] = 81'h0a81bdb896e566a6f744b;
      expv[59] = 81'h0a81bdb896e566a6f7448;
      expv[60] = 81'h0a81bdb896e566a6f7448;
      expv[61] = 81'h11ef91c2fd286adb9b687;
      expv[62] = 81'h1be9bc10000c723767d23;
      expv[63] = 81'h1be9bc10000c723767d20;
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
