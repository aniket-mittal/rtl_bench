// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09677 dut (
    .clock(clk),
    .enable(in_vec[128:128]),
    .dataa(in_vec[127:64]),
    .datab(in_vec[63:0]),
    .result(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h123408fb404c2023ae31223f687bb3ce4;
    stim[1] = 129'h13ca12b5e810e6a77dfbd39eab608a26a;
    stim[2] = 129'h171bf80f49ed011224f77370629c0c66a;
    stim[3] = 129'h0b31f7bbb14b5c9ad6db94ca616523544;
    stim[4] = 129'h1ec27dd55bd906e48f7ae9bc8378e9a12;
    stim[5] = 129'h16b37d07a4408d2a6b46234fddf5db437;
    stim[6] = 129'h054c31ca01374632fdd1fb907a0a601ad;
    stim[7] = 129'h050a044a69abad410899bbd83b1da29ab;
    stim[8] = 129'h0dfaa1a10c280a2683807019c27752012;
    stim[9] = 129'h1970f3b233f7880b3b6511069f351aa37;
    stim[10] = 129'h183a211fa02176b92e60f004a98aeb5c6;
    stim[11] = 129'h1f318e43f4716a1e7fc4645a75b6ec99d;
    stim[12] = 129'h0f6bc7b6aea6ccf76ed54da508f27ea59;
    stim[13] = 129'h1818a6e82db6689632f22c435a5dbb9b1;
    stim[14] = 129'h1f3e25d779266c117b6ad5a9b1f9e3076;
    stim[15] = 129'h01dbe766f1481d103a97a2d26b0dd1940;
    stim[16] = 129'h05411822b05eb696242af7b59d8e8bba1;
    stim[17] = 129'h06ae6433c953af6e283a103b2336a7d4b;
    stim[18] = 129'h11e79156abd6d41e6f07116fbc798c2e3;
    stim[19] = 129'h1217cfdc146b981cea629a686ff1a8f09;
    stim[20] = 129'h1bb60ae5531a461e6899f0b1f8cfca804;
    stim[21] = 129'h0394dc709276aa90e32333b4e17a98acc;
    stim[22] = 129'h0a019b0e249f76d0d4056b2a2c2162c7a;
    stim[23] = 129'h027f060d351bd4bef813d24ea0e7e8bb4;
    stim[24] = 129'h12a25ea9e4f0071d5c30714961ada9e77;
    stim[25] = 129'h0182ae3886b8d74eb2c85606670a6a1b1;
    stim[26] = 129'h0f3a916fe0f7da0ca14d4ebd037214e13;
    stim[27] = 129'h1336b39f1a53304669607d98b0ca509cd;
    stim[28] = 129'h0c1678ee0e410c77d4ceed3a74d7dc37f;
    stim[29] = 129'h0364ebabfdd54fd80600c570b7ae17a7e;
    stim[30] = 129'h1318a122e43714d08017a9ba01c2cd8c2;
    stim[31] = 129'h09d62ea830372155c99246e6af43ccce8;
    stim[32] = 129'h0b371e1fb133089721330fb576511c91c;
    stim[33] = 129'h131df27473c67510e99abf455dbda4652;
    stim[34] = 129'h0d31eebf7d135add7492c977f4989372e;
    stim[35] = 129'h1543b7fb6169a89a96932a45b09aa6389;
    stim[36] = 129'h03bc73a5c31a5ebe17acb414c17820e6b;
    stim[37] = 129'h0ff339c630ea9f148b2fbf75ed376c58c;
    stim[38] = 129'h1d680e3908b4c56281382e1dc2beda928;
    stim[39] = 129'h193a4dc752720a261e5b2802b5eac17b6;
    stim[40] = 129'h1635264af69548e970091984f2b49429c;
    stim[41] = 129'h1d4cab515aa906cebd04c44dfbda53fe9;
    stim[42] = 129'h1fcb07dd0826a8f1c801491df7a86cebb;
    stim[43] = 129'h09acec440c4b7eae5826031c12f7ce901;
    stim[44] = 129'h1f93a8d901f83b7a31c83f676a0f4900a;
    stim[45] = 129'h1b4aebfdb50345ab1b5b680cf7b1a42cb;
    stim[46] = 129'h097f6c46bba98a61756377800dffa82b8;
    stim[47] = 129'h020a502cda82fd51b4cb378fa8c204b62;
    stim[48] = 129'h023cf35c0af0fb43e7e0e8c1dc602bc04;
    stim[49] = 129'h17dca7fb14bb04358c89cdf9f362255ca;
    stim[50] = 129'h1f0baeca351b3fc7e14f5ead7b9bc6944;
    stim[51] = 129'h003e486de4fb1a850b21492cee8b2f78d;
    stim[52] = 129'h11ec432afa6af327f030b835bb8b02629;
    stim[53] = 129'h0671dfb740e4e9f1233d41ed70dac1060;
    stim[54] = 129'h0d38de24a4d1130374f3d616103f7fbfe;
    stim[55] = 129'h1588ac693c79bc0ec577d4af37ade1f79;
    stim[56] = 129'h1ee1f2dd330382eece741d6e2e0507f8e;
    stim[57] = 129'h1f941ba07d787afbee96b672679cf5ab1;
    stim[58] = 129'h03ef482812a37452543600bde087af858;
    stim[59] = 129'h0a17fddd38e227df746736553ff28ad87;
    stim[60] = 129'h12eacf21982574d4c4c1ec7f08f6427fb;
    stim[61] = 129'h1284b0c2c98e9195991f796b656d2608e;
    stim[62] = 129'h0f16a11e6a21699b0702ac3958ef73981;
    stim[63] = 129'h0c38bade03ea404778ad9c94eacb4c70a;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'h1d000811ebad93a8;
      expv[4] = 64'h1d000811ebad93a8;
      expv[5] = 64'h129edab67d0f6346;
      expv[6] = 64'hfd4bbbb5fae76414;
      expv[7] = 64'hfd4bbbb5fae76414;
      expv[8] = 64'hfd4bbbb5fae76414;
      expv[9] = 64'hfd4bbbb5fae76414;
      expv[10] = 64'hbfc8121eda6f1110;
      expv[11] = 64'he8500edbf24ff9aa;
      expv[12] = 64'h480c8d6e49fd8475;
      expv[13] = 64'h480c8d6e49fd8475;
      expv[14] = 64'h238e16d5fa676cec;
      expv[15] = 64'h558021970c41a9ab;
      expv[16] = 64'h558021970c41a9ab;
      expv[17] = 64'h558021970c41a9ab;
      expv[18] = 64'h558021970c41a9ab;
      expv[19] = 64'hd57dfdca21de8873;
      expv[20] = 64'ha1084c4ab4c3509a;
      expv[21] = 64'h4c88a8cdae61baf2;
      expv[22] = 64'h4c88a8cdae61baf2;
      expv[23] = 64'h4c88a8cdae61baf2;
      expv[24] = 64'h4c88a8cdae61baf2;
      expv[25] = 64'hf77b5f447cf3a23e;
      expv[26] = 64'hf77b5f447cf3a23e;
      expv[27] = 64'hf77b5f447cf3a23e;
      expv[28] = 64'h89e4221ccd387798;
      expv[29] = 64'h89e4221ccd387798;
      expv[30] = 64'h89e4221ccd387798;
      expv[31] = 64'h8c3d6d1790d86003;
      expv[32] = 64'h8c3d6d1790d86003;
      expv[33] = 64'h8c3d6d1790d86003;
      expv[34] = 64'h729c9cc8b2c01bae;
      expv[35] = 64'h729c9cc8b2c01bae;
      expv[36] = 64'hb790c8dcd23b2010;
      expv[37] = 64'hb790c8dcd23b2010;
      expv[38] = 64'hb790c8dcd23b2010;
      expv[39] = 64'h6b77234d992dca7c;
      expv[40] = 64'h891267b9372a0671;
      expv[41] = 64'h1437f50fa3d5de40;
      expv[42] = 64'h7a354da576f627f6;
      expv[43] = 64'h6a2979b50258d204;
      expv[44] = 64'h6a2979b50258d204;
      expv[45] = 64'h7b7401e67ab7f6e3;
      expv[46] = 64'hf786419f43a71174;
      expv[47] = 64'hf786419f43a71174;
      expv[48] = 64'hf786419f43a71174;
      expv[49] = 64'hf786419f43a71174;
      expv[50] = 64'h92913cce39ccdc5e;
      expv[51] = 64'hd65bcf9959df8c5b;
      expv[52] = 64'hd65bcf9959df8c5b;
      expv[53] = 64'h3075574cc1215b70;
      expv[54] = 64'h3075574cc1215b70;
      expv[55] = 64'h3075574cc1215b70;
      expv[56] = 64'h0a3b235b00e6bf78;
      expv[57] = 64'hb515a5c2b2ddf057;
      expv[58] = 64'h2ec36c0af9a2c38c;
      expv[59] = 64'h2ec36c0af9a2c38c;
      expv[60] = 64'h2ec36c0af9a2c38c;
      expv[61] = 64'h0ff61f05c8311ae8;
      expv[62] = 64'h8b52522da13b4e5e;
      expv[63] = 64'h8b52522da13b4e5e;
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
