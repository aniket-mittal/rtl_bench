// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03324 dut (
    .CLK(clk),
    .X(in_vec[107:60]),
    .Y(in_vec[59:0]),
    .Dout(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h5a8a51b56cb2fa71616cc3c7869;
    stim[1] = 108'hd15b7ac5606167af3a9d8ebf16d;
    stim[2] = 108'h167504acc9be43dd295800a0a45;
    stim[3] = 108'hd2c7c8df979f3ac0549677c9383;
    stim[4] = 108'h8b073f2ec9cc4ba14519408d284;
    stim[5] = 108'ha0e62b8b337d9b4af9fc69e5cf0;
    stim[6] = 108'hbf309a76f6865eb30fce7b55d2b;
    stim[7] = 108'h67d484c5f6b2f4a2e7a2b7e9fd2;
    stim[8] = 108'he19528dd76540f6bf20b4823cf8;
    stim[9] = 108'h6e07d786ae5b3fa7e4209a13e6c;
    stim[10] = 108'h4f6265aaa0167256e04fa5301a0;
    stim[11] = 108'hc20b91483cef9fddf3e9cc500b1;
    stim[12] = 108'hcec085b89653102b4c1c30b8581;
    stim[13] = 108'h9ec58b2cf4b5500bb3d889da346;
    stim[14] = 108'hfe0c1be5cd1a6240a14db945574;
    stim[15] = 108'hd5901e16f8e54cb6a5f84caebf0;
    stim[16] = 108'h15cfdc1e2d636b1e601fcfe752e;
    stim[17] = 108'h843f01a23c9194d0d21247c63fc;
    stim[18] = 108'h923bfdd9fb9058ad8dfffda15b7;
    stim[19] = 108'h16c5a6ba5f24799a3cfabadb3b6;
    stim[20] = 108'h34e02c03b60f2e537d2d782b4b9;
    stim[21] = 108'h3c42894707ec739044a32f98488;
    stim[22] = 108'hfa7e76ac098f93b45914b3f5a33;
    stim[23] = 108'hc938e0c9b46550642f7b251df46;
    stim[24] = 108'h65993c606f6c8fa2013aab1bb52;
    stim[25] = 108'h9adc4c9848e1efe717958e7e95d;
    stim[26] = 108'h1313cb50e9f4764169a1e154d70;
    stim[27] = 108'h76be013ee00c1b1296812492c4a;
    stim[28] = 108'h5b7e8498e121acfbe5f73a7a1b1;
    stim[29] = 108'h12e0374077d09d5ff61fc2529dc;
    stim[30] = 108'h6c40da8c4159e71ff03f1343281;
    stim[31] = 108'h3f91f76a479631087f64984ca5b;
    stim[32] = 108'hda65e959cf18aec4d793093db85;
    stim[33] = 108'ha9b840ba532059a2079ce6cb42a;
    stim[34] = 108'he508c7101c897f1023cf1b33eed;
    stim[35] = 108'h8a9cd485131e63fc0c0c0ebb40e;
    stim[36] = 108'h7ec2206624870ecaf683e37585d;
    stim[37] = 108'h6852e4cec3c28af05c44f52b30d;
    stim[38] = 108'h91eb50807287dc4be9879a3cc1a;
    stim[39] = 108'hd21a0e3af2cfcc025736cd4dc15;
    stim[40] = 108'h6373e3d6fa5249266723e6a74c4;
    stim[41] = 108'hffaddb6f191ee2bddc524af6ae7;
    stim[42] = 108'hec1985fcfd8f630534d012bf8c5;
    stim[43] = 108'h4f88f127fb294c5ead6d25be3dd;
    stim[44] = 108'h73a9b883c0fb691d255afc65cd7;
    stim[45] = 108'had7a216714122b276a148970eac;
    stim[46] = 108'haa161d84c612567f717873c2765;
    stim[47] = 108'h6be017a5ea2701e287202522b1a;
    stim[48] = 108'hba5deacf732a5c39db2c8ccb433;
    stim[49] = 108'h2b7f7b98833f9c14284cc23779b;
    stim[50] = 108'h9cda5c85a4ef85bb137f2497583;
    stim[51] = 108'ha0a542e7efa16747e8d747c9bf9;
    stim[52] = 108'h9020143769369b1c2b3ff9c1081;
    stim[53] = 108'heb6fe8564f41112383da54a06ad;
    stim[54] = 108'h2c1615c28486b97751dbb6bbc2f;
    stim[55] = 108'h02b0aabfcd050d81c69764fe6df;
    stim[56] = 108'hdf6033f6d40e8f497c1f59251fb;
    stim[57] = 108'h205be4b7f9b6f56e46b3b5fd0c6;
    stim[58] = 108'h27b261238ddcdc1075e9473c3aa;
    stim[59] = 108'h89651b3c01c7e32c9d6cd37059f;
    stim[60] = 108'h794ad51f02815e77742b4a40ebd;
    stim[61] = 108'h341a3b81783c5745322e86855d9;
    stim[62] = 108'h9b06223a262bf7fb630418cc3b0;
    stim[63] = 108'h11cfd9830a9490181f1dcb82213;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'ha6fc9d6374db;
      expv[2] = 48'h26d2a22ab10c;
      expv[3] = 48'hc67084a453fb;
      expv[4] = 48'hdfceafab441c;
      expv[5] = 48'h9ed6ab279b48;
      expv[6] = 48'h0439ed1e2f8d;
      expv[7] = 48'hc74c7d8b2bad;
      expv[8] = 48'he98eaf1b4960;
      expv[9] = 48'h52d59c532aac;
      expv[10] = 48'h38e5de0f3037;
      expv[11] = 48'h41269f99e1b6;
      expv[12] = 48'h97250d072c5e;
      expv[13] = 48'h6a0146a313d2;
      expv[14] = 48'h35f803a157f3;
      expv[15] = 48'hf658c073d86e;
      expv[16] = 48'hffef9a9c3315;
      expv[17] = 48'hf8ce20eb584d;
      expv[18] = 48'h8d1e25da5f6d;
      expv[19] = 48'h0264024b6e27;
      expv[20] = 48'h9d9a0d3f7c92;
      expv[21] = 48'h2562fba752b6;
      expv[22] = 48'h4b08bbcd8364;
      expv[23] = 48'haddf3d8163bc;
      expv[24] = 48'h8bcf52986b23;
      expv[25] = 48'h402a96d4743e;
      expv[26] = 48'he925147d21bc;
      expv[27] = 48'h47c9d507e484;
      expv[28] = 48'h57c6137fdc46;
      expv[29] = 48'h65b1f7bfd090;
      expv[30] = 48'hfd91cb754e0c;
      expv[31] = 48'h73432b5873d8;
      expv[32] = 48'ha967beff8dcd;
      expv[33] = 48'h159cd948949d;
      expv[34] = 48'h98618ec7470a;
      expv[35] = 48'h922436d63264;
      expv[36] = 48'h49dc146d2710;
      expv[37] = 48'hd96a1e59bcda;
      expv[38] = 48'hef06ab1ee0cf;
      expv[39] = 48'h3f732933be9d;
      expv[40] = 48'h3f6962262eda;
      expv[41] = 48'h0401ddbd8e96;
      expv[42] = 48'ha2d8ff40c3f9;
      expv[43] = 48'hbf5484d7054a;
      expv[44] = 48'hed0e233448f4;
      expv[45] = 48'hc1fc17259c2c;
      expv[46] = 48'hd1fb69fa3abe;
      expv[47] = 48'h5b519abeb177;
      expv[48] = 48'h439215f7c13d;
      expv[49] = 48'h73cf2257e719;
      expv[50] = 48'hf9ebb72be4a4;
      expv[51] = 48'h2cddaecde16c;
      expv[52] = 48'h996836dc3458;
      expv[53] = 48'hd193eb2879b7;
      expv[54] = 48'hc2724d0d69ec;
      expv[55] = 48'hf11bae0128a9;
      expv[56] = 48'h13d9dcfd2bda;
      expv[57] = 48'h41a1c66d85f5;
      expv[58] = 48'h5110df7d0970;
      expv[59] = 48'h24fcf5545e76;
      expv[60] = 48'he193d6aa2458;
      expv[61] = 48'h484861fd4c3c;
      expv[62] = 48'h7278d3fc6de5;
      expv[63] = 48'h8c166317c59b;
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
