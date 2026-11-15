// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00693 dut (
    .clk(clk),
    .i_wreg(in_vec[71:71]),
    .i_m2reg(in_vec[70:70]),
    .i_mo(in_vec[69:38]),
    .i_alu(in_vec[37:6]),
    .i_rn(in_vec[5:1]),
    .rst(in_vec[0:0]),
    .o_wreg(out_vec[70:70]),
    .o_m2reg(out_vec[69:69]),
    .o_mo(out_vec[68:37]),
    .o_alu(out_vec[36:5]),
    .o_rn(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h1e5fb314e49f0e56a9;
    stim[1] = 72'h59820a51f9cd42abab;
    stim[2] = 72'h2d3bc5dc022be8ada0;
    stim[3] = 72'hb473f769a43ea28afe;
    stim[4] = 72'hb7a8eca4f9608557ee;
    stim[5] = 72'h0f8b7c71fa04fc9366;
    stim[6] = 72'hc9d48fa4ec27364dae;
    stim[7] = 72'h37c0f1b9accdfa46ba;
    stim[8] = 72'h6ff1ed88f1690d7848;
    stim[9] = 72'h80a7065de92f83519c;
    stim[10] = 72'hf9508812900f6c88be;
    stim[11] = 72'h7e8b6011e0dfccb51c;
    stim[12] = 72'h7fb0633b2a95076938;
    stim[13] = 72'hb0eb48c4d6db7102ae;
    stim[14] = 72'hfa46b5bdd4be8a9a1e;
    stim[15] = 72'hb7474af79806f8cc36;
    stim[16] = 72'hef183c953505515522;
    stim[17] = 72'h881dbb532b7145fc6c;
    stim[18] = 72'hd6eaea365986f1273e;
    stim[19] = 72'heca8f4dd5772a04412;
    stim[20] = 72'h8e5bb09fecb089115e;
    stim[21] = 72'h5ae76a7abf9f55bfa6;
    stim[22] = 72'h1705e3c2a7cb28d826;
    stim[23] = 72'hae9355a9e0c039f0f8;
    stim[24] = 72'h069e0219a0653458c0;
    stim[25] = 72'h4e36064988aebd5a0e;
    stim[26] = 72'h5927e39c87a9b906aa;
    stim[27] = 72'hf60b87980e73b6c11c;
    stim[28] = 72'h87522c8e5a9e5d8e9d;
    stim[29] = 72'h86177f0d8c108552e8;
    stim[30] = 72'h70af47476c5dc84d47;
    stim[31] = 72'hcea9e840f46d353570;
    stim[32] = 72'h093e42d87153a0b692;
    stim[33] = 72'h74d393d3d83ceeafbe;
    stim[34] = 72'h29fdee10e4a5e64cac;
    stim[35] = 72'h16d8f74a060be10f6e;
    stim[36] = 72'hbbc1c88ad6e312b940;
    stim[37] = 72'h561b76640c567b2f88;
    stim[38] = 72'h0cf62661b1147167dc;
    stim[39] = 72'h15d924c8ed48d2ea88;
    stim[40] = 72'hd9a294645ba9d69f36;
    stim[41] = 72'hef6ea1e01e4fe15eb2;
    stim[42] = 72'h19ecb979ffc3755418;
    stim[43] = 72'h1893c881bd82423ba2;
    stim[44] = 72'hc231908dce29dd3c22;
    stim[45] = 72'h1942e03bbae89f61aa;
    stim[46] = 72'h5a584272817fe9f05e;
    stim[47] = 72'h59d261de439253330a;
    stim[48] = 72'h7215bed647e278c7d2;
    stim[49] = 72'he1d6d86096970cd708;
    stim[50] = 72'hae921d42684cbd7aca;
    stim[51] = 72'h36bdd4e672def62e4e;
    stim[52] = 72'hf84388ff3b07838f5a;
    stim[53] = 72'h20896782f009a16894;
    stim[54] = 72'h3a2c20b2381a364dc2;
    stim[55] = 72'hed440f07eb35e356ac;
    stim[56] = 72'he001afb7194fcf35d4;
    stim[57] = 72'h3fa265497b01cc6da4;
    stim[58] = 72'h52f9d9509cded41df0;
    stim[59] = 72'h135f323987371de1dc;
    stim[60] = 72'hfffc88919092488ad0;
    stim[61] = 72'h98040db040d9692ca8;
    stim[62] = 72'h2e59b3b89ab3f88ea8;
    stim[63] = 72'h1d200d58cc177faffe;
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
      expv[0] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h169de2ee0115f456d0;
      expv[4] = 71'h5a39fbb4d21f51457f;
      expv[5] = 71'h5bd476527cb042abf7;
      expv[6] = 71'h07c5be38fd027e49b3;
      expv[7] = 71'h64ea47d276139b26d7;
      expv[8] = 71'h1be078dcd666fd235d;
      expv[9] = 71'h37f8f6c478b486bc24;
      expv[10] = 71'h4053832ef497c1a8ce;
      expv[11] = 71'h7ca844094807b6445f;
      expv[12] = 71'h3f45b008f06fe65a8e;
      expv[13] = 71'h3fd8319d954a83b49c;
      expv[14] = 71'h5875a4626b6db88157;
      expv[15] = 71'h7d235adeea5f454d0f;
      expv[16] = 71'h5ba3a57bcc037c661b;
      expv[17] = 71'h778c1e4a9a82a8aa91;
      expv[18] = 71'h440edda995b8a2fe36;
      expv[19] = 71'h6b75751b2cc378939f;
      expv[20] = 71'h76547a6eabb9502209;
      expv[21] = 71'h472dd84ff6584488af;
      expv[22] = 71'h2d73b53d5fcfaadfd3;
      expv[23] = 71'h0b82f1e153e5946c13;
      expv[24] = 71'h5749aad4f0601cf87c;
      expv[25] = 71'h034f010cd0329a2c60;
      expv[26] = 71'h271b0324c4575ead07;
      expv[27] = 71'h2c93f1ce43d4dc8355;
      expv[28] = 71'h7b05c3cc0739db608e;
      expv[29] = 71'h000000000000000000;
      expv[30] = 71'h430bbf86c60842a974;
      expv[31] = 71'h000000000000000000;
      expv[32] = 71'h6754f4207a369a9ab8;
      expv[33] = 71'h049f216c38a9d05b49;
      expv[34] = 71'h3a69c9e9ec1e7757df;
      expv[35] = 71'h14fef7087252f32656;
      expv[36] = 71'h0b6c7ba50305f087b7;
      expv[37] = 71'h5de0e4456b71895ca0;
      expv[38] = 71'h2b0dbb32062b3d97c4;
      expv[39] = 71'h067b1330d88a38b3ee;
      expv[40] = 71'h0aec926476a4697544;
      expv[41] = 71'h6cd14a322dd4eb4f9b;
      expv[42] = 71'h77b750f00f27f0af59;
      expv[43] = 71'h0cf65cbcffe1baaa0c;
      expv[44] = 71'h0c49e440dec1211dd1;
      expv[45] = 71'h6118c846e714ee9e11;
      expv[46] = 71'h0ca1701ddd744fb0d5;
      expv[47] = 71'h2d2c213940bff4f82f;
      expv[48] = 71'h2ce930ef21c9299985;
      expv[49] = 71'h390adf6b23f13c63e9;
      expv[50] = 71'h70eb6c304b4b866b84;
      expv[51] = 71'h57490ea134265ebd65;
      expv[52] = 71'h1b5eea73396f7b1727;
      expv[53] = 71'h7c21c47f9d83c1c7ad;
      expv[54] = 71'h1044b3c17804d0b44a;
      expv[55] = 71'h1d1610591c0d1b26e1;
      expv[56] = 71'h76a20783f59af1ab56;
      expv[57] = 71'h7000d7db8ca7e79aea;
      expv[58] = 71'h1fd132a4bd80e636d2;
      expv[59] = 71'h297ceca84e6f6a0ef8;
      expv[60] = 71'h09af991cc39b8ef0ee;
      expv[61] = 71'h7ffe4448c849244568;
      expv[62] = 71'h4c0206d8206cb49654;
      expv[63] = 71'h172cd9dc4d59fc4754;
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
