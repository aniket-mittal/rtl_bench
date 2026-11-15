// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06176 dut (
    .clock(clk),
    .resetn(in_vec[67:67]),
    .data(in_vec[66:3]),
    .valid_in(in_vec[2:2]),
    .stall_in(in_vec[1:1]),
    .enable(in_vec[0:0]),
    .mantissa(out_vec[70:15]),
    .exponent(out_vec[14:3]),
    .sign(out_vec[2:2]),
    .valid_out(out_vec[1:1]),
    .stall_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h0f2692d73dd7c79d1;
    stim[1] = 68'h3cf548f5a8e71d608;
    stim[2] = 68'hb373976a02c43d5b8;
    stim[3] = 68'hc9d5408a06aeca43d;
    stim[4] = 68'he05086f8fcef94bae;
    stim[5] = 68'h93ac2d669d7840400;
    stim[6] = 68'h88747e7892093edd7;
    stim[7] = 68'hf115c62a88571d44e;
    stim[8] = 68'hd1900324c6fa1d213;
    stim[9] = 68'hb774e3c41fb4e56b1;
    stim[10] = 68'h8506a8260ca34fd61;
    stim[11] = 68'hbf600ce01380aeccf;
    stim[12] = 68'hf82b089ef1709f887;
    stim[13] = 68'ha0bccf52d22b546a8;
    stim[14] = 68'hab0e102a9c5a2c8d6;
    stim[15] = 68'hedd8c2ebc523c3f2c;
    stim[16] = 68'h9b870948429dbb4e4;
    stim[17] = 68'hb9e475b33ad7ea4e3;
    stim[18] = 68'he53677ad8733856e4;
    stim[19] = 68'h9a086de2d3b4d1eac;
    stim[20] = 68'h900ef117286d30388;
    stim[21] = 68'ha490ceae1997b925d;
    stim[22] = 68'hcb6692d2a338d76f3;
    stim[23] = 68'hec631f3e49c6d4e6b;
    stim[24] = 68'hf7e82a3d8c4ecf970;
    stim[25] = 68'hd249c1460fc4f62ee;
    stim[26] = 68'hd0ae03e0db9a4631d;
    stim[27] = 68'hb79fa8e511a83aa38;
    stim[28] = 68'hbb069075cbc60a33a;
    stim[29] = 68'hc7b9afde3d07cf26f;
    stim[30] = 68'hdef655e51b0f6bb4f;
    stim[31] = 68'haaec9d718ed8e0b66;
    stim[32] = 68'h86f2aa68e6c8f6314;
    stim[33] = 68'hdcd7151a11f828df6;
    stim[34] = 68'hffa4b04d67012d9b2;
    stim[35] = 68'hbc214753106c2f1bd;
    stim[36] = 68'h80baba95676e6f177;
    stim[37] = 68'hd1058f1cb24e64d38;
    stim[38] = 68'hfd7756dc678ad05a4;
    stim[39] = 68'hb891254f0dc9503e1;
    stim[40] = 68'hb533a69a85019b970;
    stim[41] = 68'h85edba8495bb792c6;
    stim[42] = 68'ha4c211fa3bff903cc;
    stim[43] = 68'hf7b0b9667baed4fb9;
    stim[44] = 68'he60da0370ca9f7d46;
    stim[45] = 68'hfe077fc6bc88823dc;
    stim[46] = 68'he1583af9330449e67;
    stim[47] = 68'hf722049f77e172d4f;
    stim[48] = 68'h875a32416a9f539f3;
    stim[49] = 68'hb3f1eb850d3262d95;
    stim[50] = 68'hb40fa6578c5a28b96;
    stim[51] = 68'hbc0871229e2c7c9fe;
    stim[52] = 68'hef4c44010d47d26f1;
    stim[53] = 68'hdfbac8ef3282fd9a0;
    stim[54] = 68'h981fe67dd3851bf5f;
    stim[55] = 68'ha66ef141d19369667;
    stim[56] = 68'h901eacb166d003d75;
    stim[57] = 68'h812fccae872f9dada;
    stim[58] = 68'hb85bd7badb8ee188d;
    stim[59] = 68'hbbb559af1fb3c840e;
    stim[60] = 68'hbc670e253bd6ace60;
    stim[61] = 68'hb55478f532d4ef76e;
    stim[62] = 68'ha4429f9938196d09d;
    stim[63] = 68'hb1be5f1e2fac013c5;
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
      expv[1] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[2] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[3] = 71'h5cbb501621eadc3370;
      expv[4] = 71'h6a04503576521c09d7;
      expv[5] = 71'h6a04503576521c09d6;
      expv[6] = 71'h616b34ebc2020013a8;
      expv[7] = 71'h63f3c49049f6e80873;
      expv[8] = 71'h63f3c49049f6e80873;
      expv[9] = 71'h63f3c49049f6e80872;
      expv[10] = 71'h671e20fda72b583770;
      expv[11] = 71'h754130651a7eb00500;
      expv[12] = 71'h4067009c0576643f63;
      expv[13] = 71'h4067009c0576643f62;
      expv[14] = 71'h667a96915aa35420b8;
      expv[15] = 71'h708154e2d164682b0a;
      expv[16] = 71'h46175e291e1f942dde;
      expv[17] = 71'h784a4214edda701b83;
      expv[18] = 71'h784a4214edda701b82;
      expv[19] = 71'h73bd6c399c2b702536;
      expv[20] = 71'h436f169da68f541a0a;
      expv[21] = 71'h7788b9436981c41008;
      expv[22] = 71'h467570ccbdc92c2493;
      expv[23] = 71'h467570ccbdc92c2493;
      expv[24] = 71'h467570ccbdc92c2492;
      expv[25] = 71'h4151ec62767cb837ec;
      expv[26] = 71'h4e0a307e27b174124e;
      expv[27] = 71'h701f06dcd2318c10ae;
      expv[28] = 71'h7d47288d41d51c3798;
      expv[29] = 71'h7483ae5e30519c3b00;
      expv[30] = 71'h4d7ef1e83e793407bf;
      expv[31] = 71'h4d7ef1e83e793407bf;
      expv[32] = 71'h4d7ef1e83e793407be;
      expv[33] = 71'h5553473647b18806f3;
      expv[34] = 71'h5553473647b18806f3;
      expv[35] = 71'h5553473647b18806f2;
      expv[36] = 71'h4a3a98836178dc3c23;
      expv[37] = 71'h4a3a98836178dc3c22;
      expv[38] = 71'h6c78e59273269c1104;
      expv[39] = 71'h7ab6e33c5682d03d76;
      expv[40] = 71'h492a786e4a81f03890;
      expv[41] = 71'h5d34d4280cdcb83530;
      expv[42] = 71'h6dd424addbc96005ea;
      expv[43] = 71'h508fd1dffc81e424c2;
      expv[44] = 71'h45cb33dd76a7dc37b4;
      expv[45] = 71'h6d01b8654fbea0260e;
      expv[46] = 71'h7bfe35e44411ec3e07;
      expv[47] = 71'h7bfe35e44411ec3e07;
      expv[48] = 71'h7bfe35e44411ec3e07;
      expv[49] = 71'h7bfe35e44411ec3e06;
      expv[50] = 71'h4f5c28699316c833f3;
      expv[51] = 71'h4f5c28699316c833f3;
      expv[52] = 71'h4f5c28699316c833f2;
      expv[53] = 71'h6220086a3e93782f4c;
      expv[54] = 71'h5647799417ecd01fbc;
      expv[55] = 71'h7f33ee9c28dfac181b;
      expv[56] = 71'h7f33ee9c28dfac181a;
      expv[57] = 71'h75658b36801eb8101b;
      expv[58] = 71'h75658b36801eb8101a;
      expv[59] = 71'h5ebdd6dc770c44385b;
      expv[60] = 71'h5ebdd6dc770c44385a;
      expv[61] = 71'h787129deb567303c60;
      expv[62] = 71'h63c7a996a77bb43552;
      expv[63] = 71'h54fcc9c0cb684c2442;
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
