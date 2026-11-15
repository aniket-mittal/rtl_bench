// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 118;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_spsram_256x54 dut (
    .CLK(clk),
    .A(in_vec[117:110]),
    .CEN(in_vec[109:109]),
    .D(in_vec[108:55]),
    .GWEN(in_vec[54:54]),
    .WEN(in_vec[53:0]),
    .Q(out_vec[53:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 118'h2e901919d7c82013baaa5c69eea129;
    stim[1] = 118'h210b815df66221439118289d644a5d;
    stim[2] = 118'h0608e07eb93b0780126c679f75b166;
    stim[3] = 118'h26ee7e4e0af78919c0cd8d5fefde93;
    stim[4] = 118'h0181cfc449491ee4c362f50b7cea57;
    stim[5] = 118'h106d22e0f33a00812c6a4df6dd82e9;
    stim[6] = 118'h3c17acf5285bb987284d82b2ad4173;
    stim[7] = 118'h15ce94abc07b8950ac180a88c82d40;
    stim[8] = 118'h1d696d5bd6af356cb285dcf99981a0;
    stim[9] = 118'h34aef1f83ed3a83cb2a97ccb84cc81;
    stim[10] = 118'h1a145a2b803dd4735d712e7bcc3da5;
    stim[11] = 118'h374114294be677ee08d2a1972741a1;
    stim[12] = 118'h15c35678aff72858307ecf7cd51dbc;
    stim[13] = 118'h1b15c4d9d8c08f71dd74753b752f65;
    stim[14] = 118'h2ac3d5a8dfca984808f6f61e0249ee;
    stim[15] = 118'h227a80165423ba0361ddfba24800ad;
    stim[16] = 118'h34bf12c7b957f1c9f84a2b58069f3b;
    stim[17] = 118'h21050403618797259585aa052e2c99;
    stim[18] = 118'h09a12144092a8111bea6e1f6d98d56;
    stim[19] = 118'h2442a9ab9c79d01f9909ef1a070f6b;
    stim[20] = 118'h0ad8a5480bd2f720880112272b7c64;
    stim[21] = 118'h37a7f924b5a7889d34dde1f562d00e;
    stim[22] = 118'h3a521351475ecf2f6f6b348330ad64;
    stim[23] = 118'h15480412e43dc565cd7547372aaaac;
    stim[24] = 118'h27a29c94a47e8a29053348b4b668b9;
    stim[25] = 118'h3df3d6a3ca3f276f10a765ec16cc2e;
    stim[26] = 118'h3554a35b61d53ec517c897acd8142c;
    stim[27] = 118'h22f38d3b781a7075a30d468e968a23;
    stim[28] = 118'h03274e483fe10ff410551b451b1d4d;
    stim[29] = 118'h3955fe78ea2e10acb9b46120837c69;
    stim[30] = 118'h0ede87030c97a270fa3c35a1a2c27d;
    stim[31] = 118'h0df3e109ac52fe9702ff79efa64f2d;
    stim[32] = 118'h2f3fafc290bc6f1b7e6995fa8e16cf;
    stim[33] = 118'h3893305c612f3f6eb58507d2c41591;
    stim[34] = 118'h341af06054d4ed68f1dad8ffa3e2ec;
    stim[35] = 118'h3252130c565e9633ba11a286f5af1b;
    stim[36] = 118'h372ecfaa00eddaf02f7150764812c7;
    stim[37] = 118'h2c9d41d7cabab29687673f05806471;
    stim[38] = 118'h11cff470facf4b2eba93561fcc564c;
    stim[39] = 118'h2d01ebbee3ed8599d4b87d666fa25f;
    stim[40] = 118'h00f98d35216df81a9a18de497e8541;
    stim[41] = 118'h18d8680c3c2723046b00f637b93856;
    stim[42] = 118'h2d28216e7c0d64caf16bc93b182f45;
    stim[43] = 118'h1be8f7e109500c192c799039df95dc;
    stim[44] = 118'h0d047785aaca788c3f10116702279e;
    stim[45] = 118'h24fd8dc793dd6375f538d449da7e9b;
    stim[46] = 118'h327d1c787010b235ece29a49372f0b;
    stim[47] = 118'h02cc1a1f19c804867b3711f703f239;
    stim[48] = 118'h2e9521b549d6382cf30b39a6c96259;
    stim[49] = 118'h02c6e091565b6ce4c17c45b9833fd8;
    stim[50] = 118'h01aba4c9f1e020488c93be3ef126a1;
    stim[51] = 118'h30100475fd0d443a6553849a46f800;
    stim[52] = 118'h1b3cf1b827ac76c30cc08b3a879858;
    stim[53] = 118'h36097c6d1bece49f57e9cde815ecf6;
    stim[54] = 118'h22f25ce5db995e166f62264bc57e68;
    stim[55] = 118'h0c21f7a28b1814cf877b24e1bde576;
    stim[56] = 118'h09c27f346651dd27c8e3c637b1fba7;
    stim[57] = 118'h2c3a9f05ab3dc74362c51b50f913f1;
    stim[58] = 118'h22d4cf7b5de01aaf167b63c6a54523;
    stim[59] = 118'h2a45eec83ee7585b87381f5bc0d917;
    stim[60] = 118'h31b36e1558859b9ebab27a93c28aa0;
    stim[61] = 118'h0196dc3bd1ccd97340414aef9865ca;
    stim[62] = 118'h264401ae213a192cae8da83b76a18e;
    stim[63] = 118'h307a60a3d3aed9e5e92bb80d49b33b;
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
      expv[0] = 54'hxxxxxxxxxxxxxx;
      expv[1] = 54'hxxxxxxxx904027;
      expv[2] = 54'h1702bbexxxxxxx;
      expv[3] = 54'h11c0fd7xxxxxxx;
      expv[4] = 54'h11c0fd7xxxxxxx;
      expv[5] = 54'hxxxxxxxxxxxxxx;
      expv[6] = 54'hxxxxxxxxxxxxxx;
      expv[7] = 54'hxxxxxxxxb7730e;
      expv[8] = 54'hxxxxxxxxf712a1;
      expv[9] = 54'hxxxxxxxxf712a1;
      expv[10] = 54'hxxxxxxxxf712a1;
      expv[11] = 54'hxxxxxxxxxxxxxx;
      expv[12] = 54'h0228529xxxxxxx;
      expv[13] = 54'hxxxxxxxxf712a1;
      expv[14] = 54'hxxxxxxxxxxxxxx;
      expv[15] = 54'h07ab51bxxxxxxx;
      expv[16] = 54'h07ab51bxxxxxxx;
      expv[17] = 54'h07ab51bxxxxxxx;
      expv[18] = 54'h0a0806cxxxxxxx;
      expv[19] = 54'h0a0806cxxxxxxx;
      expv[20] = 54'h05535738f3a03f;
      expv[21] = 54'h314a901xxxxxxx;
      expv[22] = 54'h314a901xxxxxxx;
      expv[23] = 54'hxxxxxxxxxxxxxx;
      expv[24] = 54'hxxxxxxxxxxxxxx;
      expv[25] = 54'hxxxxxxxxxxxxxx;
      expv[26] = 54'hxxxxxxxxxxxxxx;
      expv[27] = 54'h2946b6cxxxxxxx;
      expv[28] = 54'h2946b6cxxxxxxx;
      expv[29] = 54'h2946b6cxxxxxxx;
      expv[30] = 54'hxxxxxxxx5c2159;
      expv[31] = 54'hxxxxxxxxxxxxxx;
      expv[32] = 54'hxxxxxxxxxxxxxx;
      expv[33] = 54'hxxxxxxxxxxxxxx;
      expv[34] = 54'hxxxxxxxx5e7edd;
      expv[35] = 54'hxxxxxxxxxxxxxx;
      expv[36] = 54'hxxxxxxxxxxxxxx;
      expv[37] = 54'hxxxxxxxxxxxxxx;
      expv[38] = 54'h3a83af9xxxxxxx;
      expv[39] = 54'hxxxxxxxxxxxxxx;
      expv[40] = 54'hxxxxxxxxxxxxxx;
      expv[41] = 54'hxxxxxxxxxxxxxx;
      expv[42] = 54'hxxxxxxxxxxxxxx;
      expv[43] = 54'hxxxxxxxxxxxxxx;
      expv[44] = 54'hxxxxxxxxxxxxxx;
      expv[45] = 54'hxxxxxxxxxxxxxx;
      expv[46] = 54'hxxxxxxxxxxxxxx;
      expv[47] = 54'hxxxxxxxxxxxxxx;
      expv[48] = 54'hxxxxxxxxxxxxxx;
      expv[49] = 54'hxxxxxxxx904027;
      expv[50] = 54'hxxxxxxxxxxxxxx;
      expv[51] = 54'hxxxxxxxxxxxxxx;
      expv[52] = 54'hxxxxxxxxxxxxxx;
      expv[53] = 54'hxxxxxxxxxxxxxx;
      expv[54] = 54'hxxxxxxxxxxxxxx;
      expv[55] = 54'hxxxxxxxxxxxxxx;
      expv[56] = 54'hxxxxxxxxxxxxxx;
      expv[57] = 54'hxxxxxxxxxxxxxx;
      expv[58] = 54'hxxxxxxxxxxxxxx;
      expv[59] = 54'h299ef6bxxxxxxx;
      expv[60] = 54'h0bdd907dceb0b7;
      expv[61] = 54'h0bdd907dceb0b7;
      expv[62] = 54'hxxxxxxxxxxxxxx;
      expv[63] = 54'hxxxxxxxx743259;
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
